<div id="delivery">
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="col-xs-12 col-md-8 col-md-offset-2">
                <div class="row" style="margin-bottom: 5px;">
                    <div class="col-xs-4" style="height: 60px;display: flex;align-items: center;">
                        <input type="date" class="form-control" v-model="sales.date">
                    </div>
                    <div class="col-xs-8 text-right" style="border: 1px solid gray;">
                        <strong>InvoiceNo: </strong> {{sales.SaleMaster_InvoiceNo}} <br />
                        <strong>Buyer Name: </strong> {{sales.Customer_Name}}<br />
                        <strong>Buyer Name: </strong> {{sales.Customer_Name}}
                    </div>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th>Sl</th>
                        <th>Product</th>
                        <th>Order Qty</th>
                        <th>Already Delivered Qty</th>
                        <th>Remaining Qty</th>
                        <th>
                            <input type="checkbox" id="checkAll" @change="checkAll(event)">
                        </th>
                        <th>DeliveryQty</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, ind) in cart">
                        <td>{{ind + 1}}</td>
                        <td>{{item.Product_Name}}</td>
                        <td>{{item.SaleDetails_TotalQuantity}}</td>
                        <td>{{item.delivery_quantity}}</td>
                        <td>{{item.SaleDetails_TotalQuantity - item.delivery_quantity}}</td>
                        <td>
                            <input class="single" type="checkbox" v-model="item.deliveryStatus" @change="singleStatusChange">
                        </td>
                        <td>
                            <input type="number" :disabled="item.deliveryStatus != undefined && item.deliveryStatus ? false:true" @input="calculateTotal(ind, item)" step="0.01" min="0" class="form-control text-center" v-model="item.delivery_qty">
                        </td>
                    </tr>
                    <tr style="background: gray;color:white;">
                        <th colspan="6" style="text-align:right;">Total Quantity</th>
                        <th>{{cart.reduce((prev, curr) => {return prev + parseFloat(curr.delivery_qty == undefined ? 0 : curr.delivery_qty)},0).toFixed(2)}}</th>
                    </tr>
                </tbody>
            </table>
            <div class="col-xs-12">
                <div class="form-gorup text-right">
                    <button type="button" @click="saveOrder" :disabled="onProgress" class="btn btn-success">Save Order</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>

<script>
    Vue.component('v-select', VueSelect.VueSelect);
    new Vue({
        el: '#delivery',
        data() {
            return {
                sales: {
                    salesId: "<?php echo $salesId; ?>",
                    subtotal: 0,
                    total: 0,
                },
                cart: [],
                productStock: '',
                productStockText: '',
                onProgress:false,
            }
        },
        created() {
            this.getSales();
        },
        methods: {
            getSales() {
                axios.post('/get_saledetails_for_delivery', {
                        salesId: this.sales.salesId
                    })
                    .then(res => {
                        this.cart = res.data.saleDetails;
                        this.sales = res.data.sales
                        this.sales.date = moment().format("YYYY-MM-DD")
                    })
            },

            async calculateTotal(sl, product) {
                if (parseFloat(product.SaleDetails_TotalQuantity) == parseFloat(product.delivery_quantity)) {
                    product.deliveryStatus = false;
                }
                product.total = product.delivery_rate * product.delivery_qty;
                if (parseFloat(product.delivery_qty) > (parseFloat(product.SaleDetails_TotalQuantity) - parseFloat(product.delivery_quantity))) {
                    alert("The quantity has exceeded the order quantity");
                    product.delivery_qty = 0;
                    product.total = 0
                    return;
                }
                this.productStock = await axios.post('/get_product_stock', {
                    productId: product.Product_IDNo
                }).then(res => {
                    return res.data;
                })
                if (parseFloat(this.productStock) < parseFloat(product.delivery_qty)) {
                    alert('Stock Unavailable');
                    product.delivery_qty = 0;
                    product.total = 0
                    return;
                }
                this.totalCalculate();
            },

            totalCalculate() {
                this.sales.subtotal = this.cart.reduce((prev, curr) => {
                    return prev + parseFloat(curr.total == undefined ? 0 : curr.total)
                }, 0).toFixed(2);
                this.sales.total = this.sales.subtotal;
            },

            saveOrder() {
                var checkCart = this.cart.filter(item => item.deliveryStatus != undefined && item.deliveryStatus != false);
                if (checkCart.length == 0) {
                    alert("At least one product select")
                    return
                }
                checkCart = checkCart.filter(item => item.delivery_qty > 0);
                if (checkCart.length == 0) {
                    alert('Quantity is empty');
                    return
                }
                let filter = {
                    order: this.sales,
                    carts: checkCart
                }
                this.onProgress = true;
                axios.post('/partial_order_delivery', filter)
                    .then(async res => {
                        let r = res.data;
                        if (r.status) {
                            let conf = confirm(`${r.message} Sale success, Do you want to view invoice?`);
                            if (conf) {
                                window.open('/partial_chalan/' + r.orderId, '_blank');
                                await new Promise(r => setTimeout(r, 1000));
                                window.location = "/partial_order_record";
                            }else{
                                window.location = "/partial_order_record";
                            }
                        } else {
                            this.onProgress = false;
                            console.log(r.message);
                        }
                    })
            },

            checkAll(event) {
                if (event.target.checked) {
                    this.cart = this.cart.map((item, ind) => {
                        if (item.deliveryStatus == undefined) {
                            item.deliveryStatus = true;
                        } else {
                            item.deliveryStatus = true;
                        }
                        return item;
                    })
                } else {
                    this.cart = this.cart.map((item, ind) => {
                        if (item.deliveryStatus == undefined) {
                            item.deliveryStatus = false;
                        } else {
                            item.deliveryStatus = false;
                        }
                        return item;
                    })
                }
            },
            singleStatusChange() {
                let uncheckInp = $(".single").length
                let checkInp = $(".single:checked").length
                if (uncheckInp == checkInp) {
                    $("#checkAll").prop('checked', true)
                } else {
                    $("#checkAll").prop('checked', false)
                }
            },
        }
    })
</script>