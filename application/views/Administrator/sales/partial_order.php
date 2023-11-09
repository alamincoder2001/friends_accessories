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
                        <th>Order Quantity</th>
                        <th>Already Delivered Qty</th>
                        <th>Already Delivered Total</th>
                        <th>
                            <input type="checkbox" id="checkAll" @change="checkAll(event)">
                        </th>
                        <th>DeliveryQty</th>
                        <th>Unit Price</th>
                        <th style="width: 20%;">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, ind) in cart">
                        <td>{{ind + 1}}</td>
                        <td>{{item.Product_Name}}</td>
                        <td>{{item.SaleDetails_TotalQuantity}}</td>
                        <td>{{item.delivered_quantity}}</td>
                        <td>{{item.delivered_amount}}</td>
                        <td>
                            <input class="single" type="checkbox" v-model="item.deliveryStatus" @change="singleStatusChange">
                        </td>
                        <td>
                            <input type="number" @input="calculateTotal(ind)" step="0.01" min="0" class="form-control text-center" v-model="item.delivery_qty">
                        </td>
                        <td>
                            <input type="number" @input="calculateTotal(ind)" step="0.01" min="0" class="form-control text-center" v-model="item.delivery_rate">
                        </td>
                        <td>
                            {{item.total}}
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="col-xs-12">
                <div class="form-gorup text-right">
                    <button type="button" class="btn btn-success">Save Order</button>
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
                    SaleMaster_InvoiceNo: "",
                },
                cart: [],
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

            calculateTotal(sl){
                let total = this.cart[sl].delivery_rate * this.cart[sl].delivery_qty;
                this.cart[sl].total = total;
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
                }else{
                    $("#checkAll").prop('checked', false)
                }
            },
        }
    })
</script>