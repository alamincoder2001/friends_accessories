<style>
    .v-select {
        margin-bottom: 5px;
    }

    #employees.v-select {
        margin-bottom: 0px !important;
        background: white;
        border-radius: 4px;
    }

    .v-select .dropdown-toggle {
        padding: 0px;
    }

    .v-select input[type=search],
    .v-select input[type=search]:focus {
        margin: 0px;
    }

    .v-select .vs__selected-options {
        overflow: hidden;
        flex-wrap: nowrap;
    }

    .v-select .selected-tag {
        margin: 2px 0px;
        white-space: nowrap;
        position: absolute;
        left: 0px;
    }

    .v-select .vs__actions {
        margin-top: -5px;
    }

    .v-select .dropdown-menu {
        width: auto;
        overflow-y: auto;
    }

    #branchDropdown .vs__actions button {
        display: none;
    }

    #branchDropdown .vs__actions .open-indicator {
        height: 15px;
        margin-top: 7px;
    }
</style>

<div id="sales" class="row">
    <div class="col-xs-12 col-md-12 col-lg-12" style="margin-bottom:3px;">
        <div class="row" style="border: 1px solid #b5b1b1a8;margin:0;padding:5px 0;background: #b7b7b759;">
            <div class="form-group">
                <label class="col-md-2 col-xs-4 control-label"> TransactionId: </label>
                <div class="col-md-2 col-xs-8">
                    <input type="text" style="margin: 0;" id="invoiceNo" class="form-control" v-model="sales.invoiceNo" readonly />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-1 col-xs-4 control-label no-padding-right">AddBy: </label>
                <div class="col-md-3 col-xs-8">
                    <v-select v-bind:options="employees" id="employees" v-model="selectedEmployee" label="Employee_Name" placeholder="Select Employee"></v-select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-1 col-xs-4 control-label no-padding-right">Date:</label>
                <div class="col-md-3 col-xs-8">
                    <input class="form-control" style="margin: 0;" id="salesDate" type="date" v-model="sales.salesDate" v-bind:disabled="userType == 'u' ? true : false" />
                </div>
            </div>
        </div>
    </div>


    <div class="col-xs-12 col-md-9 col-lg-9">
        <div class="widget-box">
            <div class="widget-header">
                <h4 class="widget-title">JobCard Information</h4>
                <div class="widget-toolbar">
                    <a href="#" data-action="collapse">
                        <i class="ace-icon fa fa-chevron-up"></i>
                    </a>

                    <a href="#" data-action="close">
                        <i class="ace-icon fa fa-times"></i>
                    </a>
                </div>
            </div>

            <div class="widget-body">
                <div class="widget-main">

                    <div class="row">
                        <div class="col-md-5 col-xs-12">
                            <div class="form-group">
                                <label class="col-xs-4 control-label no-padding-right"> Company </label>
                                <div class="col-xs-7">
                                    <v-select :options="companies" label="display_name" v-model="selectedCompany" @input="companyOnChange" placeholder="Select Company"></v-select>
                                </div>
                                <div class="col-xs-1" style="padding: 0;">
                                    <a href="<?= base_url('company') ?>" class="btn btn-xs btn-danger" style="height: 25px; border: 0; width: 27px; margin-left: -10px;" target="_blank" title="Add New Customer"><i class="fa fa-plus" aria-hidden="true" style="margin-top: 5px;"></i></a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-4 control-label no-padding-right"> Buyer </label>
                                <div class="col-xs-7">
                                    <v-select v-bind:options="customers" label="display_name" v-model="selectedCustomer" v-on:input="customerOnChange"></v-select>
                                </div>
                                <div class="col-xs-1" style="padding: 0;">
                                    <a href="<?= base_url('customer') ?>" class="btn btn-xs btn-danger" style="height: 25px; border: 0; width: 27px; margin-left: -10px;" target="_blank" title="Add New Customer"><i class="fa fa-plus" aria-hidden="true" style="margin-top: 5px;"></i></a>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-4 control-label no-padding-right"> Mobile No </label>
                                <div class="col-xs-8">
                                    <input type="text" id="mobileNo" placeholder="Mobile No" class="form-control" v-model="selectedCustomer.Customer_Mobile" v-bind:disabled="selectedCustomer.Customer_Type == 'G' ? false : true" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-4 control-label no-padding-right"> Address </label>
                                <div class="col-xs-8">
                                    <textarea id="address" placeholder="Address" class="form-control" v-model="selectedCustomer.Customer_Address" v-bind:disabled="selectedCustomer.Customer_Type == 'G' ? false : true"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-5 col-xs-12">
                            <form v-on:submit.prevent="addToCart">
                                <div class="form-group">
                                    <label class="col-xs-3 control-label no-padding"> Product </label>
                                    <div class="col-xs-8">
                                        <v-select id="product" v-bind:options="products" v-model="selectedProduct" label="display_text" v-on:input="productOnChange"></v-select>
                                    </div>
                                    <div class="col-xs-1" style="padding: 0;">
                                        <a href="<?= base_url('product') ?>" class="btn btn-xs btn-danger" style="height: 25px; border: 0; width: 27px; margin-left: -10px;" target="_blank" title="Add New Product"><i class="fa fa-plus" aria-hidden="true" style="margin-top: 5px;"></i></a>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3 control-label no-padding"> Rate </label>
                                    <div class="col-xs-9">
                                        <input type="number" id="salesRate" placeholder="Rate" min="0" step="0.01" class="form-control" v-model="selectedProduct.Product_SellingPrice" v-on:input="productTotal" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3 control-label no-padding"> Quantity </label>
                                    <div class="col-xs-9">
                                        <input type="number" min="0" step="0.01" id="quantity" placeholder="Qty" class="form-control" ref="quantity" v-model="selectedProduct.quantity" v-on:input="productTotal" autocomplete="off" required />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3 control-label no-padding"> Amount </label>
                                    <div class="col-xs-9">
                                        <input type="text" id="productTotal" placeholder="Amount" class="form-control" v-model="selectedProduct.total" readonly />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3 control-label no-padding"> </label>
                                    <div class="col-xs-9">
                                        <button type="submit" class="btn btn-default pull-right">Add to Cart</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                        <div class="col-md-2 col-xs-12">
                            <div>
                                <div class="text-center" style="display:none;" v-bind:style="{color: productStock > 0 ? 'green' : 'red', display: selectedProduct.Product_SlNo == '' ? 'none' : ''}">{{ productStockText }}</div class="text-center">

                                <input type="text" id="productStock" v-model="productStock" readonly style="border:none;font-size:20px;width:100%;text-align:center;color:green"><br>
                                <input type="text" id="stockUnit" v-model="selectedProduct.Unit_Name" readonly style="border:none;font-size:12px;width:100%;text-align: center;"><br><br>
                            </div>
                            <input type="password" ref="productPurchaseRate" v-model="selectedProduct.Product_Purchase_Rate" v-on:mousedown="toggleProductPurchaseRate" v-on:mouseup="toggleProductPurchaseRate" readonly title="Purchase rate (click & hold)" style="font-size:12px;width:100%;text-align: center;">

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-xs-12 col-md-12 col-lg-12" style="padding-left: 0px;padding-right: 0px;">
            <div class="table-responsive">
                <table class="table table-bordered" style="color:#000;margin-bottom: 5px;">
                    <thead>
                        <tr class="">
                            <th style="width:10%;color:#000;">Sl</th>
                            <th style="width:20%;color:#000;">Product Name</th>
                            <th style="width:15%;color:#000;">Category</th>
                            <th style="width:7%;color:#000;">Qty</th>
                            <th style="width:8%;color:#000;">Rate</th>
                            <th style="width:15%;color:#000;">Total</th>
                            <th style="width:10%;color:#000;">Action</th>
                        </tr>
                    </thead>
                    <tbody style="display:none;" v-bind:style="{display: cart.length > 0 ? '' : 'none'}">
                        <tr v-for="(product, sl) in cart">
                            <td>{{ sl + 1 }}</td>
                            <td>{{ product.name }}</td>
                            <td>{{ product.categoryName }}</td>
                            <td>{{ product.quantity }}</td>
                            <td>{{ product.salesRate }}</td>
                            <td>{{ product.total }}</td>
                            <td><a href="" v-on:click.prevent="removeFromCart(sl)"><i class="fa fa-trash"></i></a></td>
                        </tr>

                        <tr>
                            <td colspan="7"></td>
                        </tr>

                        <tr style="font-weight: bold;">
                            <td colspan="4">Note</td>
                            <td colspan="3">Total</td>
                        </tr>

                        <tr>
                            <td colspan="4"><textarea style="width: 100%;font-size:13px;" placeholder="Note" v-model="sales.note"></textarea></td>
                            <td colspan="3" style="padding-top: 15px;font-size:18px;">{{ sales.total }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div class="col-xs-12 col-md-3 col-lg-3">
        <div class="widget-box">
            <div class="widget-header">
                <h4 class="widget-title">Amount Details</h4>
                <div class="widget-toolbar">
                    <a href="#" data-action="collapse">
                        <i class="ace-icon fa fa-chevron-up"></i>
                    </a>

                    <a href="#" data-action="close">
                        <i class="ace-icon fa fa-times"></i>
                    </a>
                </div>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <table style="color:#000;margin-bottom: 0px;border-collapse: collapse;">
                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <label class="col-xs-12 control-label no-padding-right">Work Order</label>
                                                <div class="col-xs-12">
                                                    <input type="text" id="work_order" class="form-control" v-model="sales.work_order" readonly />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <label class="col-xs-12 control-label no-padding-right">Sub Total</label>
                                                <div class="col-xs-12">
                                                    <input type="number" id="subTotal" class="form-control" v-model="sales.subTotal" readonly />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <label class="col-xs-12 control-label no-padding-right">Discount Persent</label>

                                                <div class="col-xs-4 no-padding-right">
                                                    <input type="number" id="discountPercent" class="form-control" v-model="discountPercent" v-on:input="calculateTotal" />
                                                </div>

                                                <label class="col-xs-1 control-label no-padding-left">%</label>

                                                <div class="col-xs-7">
                                                    <input type="number" id="discount" class="form-control" v-model="sales.discount" v-on:input="calculateTotal" />
                                                </div>

                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <label class="col-xs-12 control-label no-padding-right">Transport Cost</label>
                                                <div class="col-xs-12">
                                                    <input type="number" class="form-control" v-model="sales.transportCost" v-on:input="calculateTotal" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr style="display:none;">
                                        <td>
                                            <div class="form-group">
                                                <label class="col-xs-12 control-label no-padding-right">Round Of</label>
                                                <div class="col-xs-12">
                                                    <input type="number" id="roundOf" class="form-control" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <label class="col-xs-12 control-label no-padding-right">Total</label>
                                                <div class="col-xs-12">
                                                    <input type="number" id="total" class="form-control" v-model="sales.total" readonly />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr style="display: none;">
                                        <td>
                                            <div class="form-group">
                                                <label class="col-xs-12 control-label no-padding-right">Paid</label>
                                                <div class="col-xs-12">
                                                    <input type="number" id="paid" class="form-control" v-model="sales.paid" v-on:input="calculateTotal" v-bind:disabled="selectedCustomer.Customer_Type == 'G' ? true : false" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr style="display: none;">
                                        <td>
                                            <div class="form-group">
                                                <label class="col-xs-12 control-label">Due</label>
                                                <div class="col-xs-6">
                                                    <input type="number" id="due" class="form-control" v-model="sales.due" readonly />
                                                </div>
                                                <div class="col-xs-6">
                                                    <input type="number" id="previousDue" class="form-control" v-model="sales.previousDue" readonly style="color:red;" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <div class="col-xs-6">
                                                    <input type="button" class="btn btn-default btn-sm" value="Save" v-on:click="saveSales" v-bind:disabled="saleOnProgress ? true : false" style="color: black!important;margin-top: 0px;width:100%;padding:5px;font-weight:bold;">
                                                </div>
                                                <div class="col-xs-6">
                                                    <a class="btn btn-info btn-sm" style="color: black!important;margin-top: 0px;width:100%;padding:5px;font-weight:bold;">New JobCard</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                </table>
                            </div>
                        </div>
                    </div>
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
        el: '#sales',
        data() {
            return {
                sales: {
                    workId: '',
                    work_order: '',
                    salesId: parseInt('<?php echo $jobcardId; ?>'),
                    invoiceNo: '<?php echo $invoice; ?>',
                    salesBy: '<?php echo $this->session->userdata("FullName"); ?>',
                    salesType: 'retail',
                    salesFrom: '',
                    salesDate: moment().format('YYYY-MM-DD'),
                    customerId: '',
                    employeeId: null,
                    subTotal: 0.00,
                    discount: 0.00,
                    transportCost: 0.00,
                    total: 0.00,
                    paid: 0.00,
                    due: 0.00,
                    previousDue: 0.00,
                    note: '',
                },
                cart: [],
                employees: [],
                selectedEmployee: null,
                branches: [],
                selectedBranch: {
                    brunch_id: "<?php echo $this->session->userdata('BRANCHid'); ?>",
                    Brunch_name: "<?php echo $this->session->userdata('Brunch_name'); ?>"
                },
                companies: [],
                selectedCompany: null,
                customers: [],
                selectedCustomer: {
                    Customer_SlNo: '',
                    Customer_Code: '',
                    Customer_Name: '',
                    display_name: 'Select Buyer',
                    Customer_Mobile: '',
                    Customer_Address: '',
                    Customer_Type: ''
                },
                oldCustomerId: null,
                oldPreviousDue: 0,
                products: [],
                selectedProduct: {
                    Product_SlNo: '',
                    display_text: 'Select Product',
                    Item_Code: '',
                    Product_Name: '',
                    Unit_Name: '',
                    quantity: 0,
                    Product_Purchase_Rate: '',
                    Product_SellingPrice: 0.00,
                    vat: 0.00,
                    total: 0.00,
                },
                productStockText: '',
                productStock: '',
                saleOnProgress: false,
                sales_due_on_update: 0,
                userType: '<?php echo $this->session->userdata("accountType"); ?>'
            }
        },
        async created() {
            let sales = JSON.parse(localStorage.getItem('sales'));
            if (sales == null && this.sales.salesId == 0) {
                location.href = '/order-details'
            }
            await this.getEmployees();
            await this.getBranches();
            this.getCompanies();
            this.getProducts();
            this.getSales()
            if (this.sales.salesId != 0) {
                await this.getJobCards();
            }
        },
        methods: {
            getEmployees() {
                axios.get('/get_employees').then(res => {
                    this.employees = res.data;
                })
            },
            getBranches() {
                axios.get('/get_branches').then(res => {
                    this.branches = res.data;
                })
            },
            getCompanies() {
                axios.get('/get_companies').then(res => {
                    this.companies = res.data.map(com => {
                        com.display_name = toCapitalize(com.display_name)
                        return com;
                    });
                })
            },
            companyOnChange() {
                this.getCustomers();
            },
            async getCustomers() {
                await axios.post('/get_customers', {
                    customerType: this.sales.salesType
                }).then(res => {
                    if (this.selectedCompany != null) {
                        this.customers = res.data.filter(cust => cust.Company_Id == this.selectedCompany.Company_SlNo);
                    } else {
                        this.customers = [];
                    }
                })
            },
            getProducts() {
                axios.post('/get_products', {
                    isService: 'false'
                }).then(res => {
                    this.products = res.data.map(pro => {
                        pro.display_text = toCapitalize(pro.display_text)
                        return pro;
                    });
                })
            },
            productTotal() {
                this.selectedProduct.total = (parseFloat(this.selectedProduct.quantity) * parseFloat(this.selectedProduct.Product_SellingPrice)).toFixed(2);
            },
            onSalesTypeChange() {
                this.selectedCustomer = {
                    Customer_SlNo: '',
                    Customer_Code: '',
                    Customer_Name: '',
                    display_name: 'Select Buyer',
                    Customer_Mobile: '',
                    Customer_Address: '',
                    Customer_Type: ''
                }
                this.getCustomers();

                this.clearProduct();
                this.getProducts();
            },
            async customerOnChange() {
                if (this.selectedCustomer.Customer_SlNo == '') {
                    return;
                }
                if (event.type == 'readystatechange') {
                    return;
                }

                if (this.sales.salesId != 0 && this.oldCustomerId != parseInt(this.selectedCustomer.Customer_SlNo)) {
                    let changeConfirm = confirm('Changing customer will set previous due to current due amount. Do you really want to change customer?');
                    if (changeConfirm == false) {
                        return;
                    }
                } else if (this.sales.salesId != 0 && this.oldCustomerId == parseInt(this.selectedCustomer.Customer_SlNo)) {
                    this.sales.previousDue = this.oldPreviousDue;
                    return;
                }

                await this.getCustomerDue();
                this.calculateTotal();
            },
            async getCustomerDue() {
                await axios.post('/get_customer_due', {
                    customerId: this.selectedCustomer.Customer_SlNo
                }).then(res => {
                    if (res.data.length > 0) {
                        this.sales.previousDue = res.data[0].dueAmount;
                    } else {
                        this.sales.previousDue = 0;
                    }
                })
            },
            async productOnChange() {
                if (this.selectedProduct.Product_SlNo == '') {
                    return;
                }
                if ((this.selectedProduct.Product_SlNo != '' || this.selectedProduct.Product_SlNo != 0)) {
                    this.productStock = await axios.post('/get_product_stock', {
                        productId: this.selectedProduct.Product_SlNo
                    }).then(res => {
                        return res.data;
                    })
                    this.productStockText = this.productStock > 0 ? "Available Stock" : "Stock Unavailable";
                }
                this.$refs.quantity.focus();
            },
            toggleProductPurchaseRate() {
                this.$refs.productPurchaseRate.type = this.$refs.productPurchaseRate.type == 'text' ? 'password' : 'text';
            },
            addToCart() {
                if (this.sales.contract_no == '') {
                    alert("Contract no empty");
                    return
                }
                if (this.selectedProduct.Product_SlNo == '') {
                    document.querySelector("#product [type='search']").focus();
                    return
                }
                let product = {
                    productId: this.selectedProduct.Product_SlNo,
                    productCode: this.selectedProduct.Product_Code,
                    categoryName: this.selectedProduct.ProductCategory_Name,
                    name: this.selectedProduct.Product_Name,
                    salesRate: this.selectedProduct.Product_SellingPrice,
                    vat: this.selectedProduct.vat,
                    quantity: this.selectedProduct.quantity,
                    total: this.selectedProduct.total,
                    purchaseRate: this.selectedProduct.Product_Purchase_Rate
                }

                if (product.quantity == 0 || product.quantity == '') {
                    alert('Enter quantity');
                    return;
                }

                if (product.salesRate == 0 || product.salesRate == '') {
                    alert('Enter sales rate');
                    return;
                }

                let cartInd = this.cart.findIndex(p => p.productId == product.productId);
                if (cartInd > -1) {
                    this.cart.splice(cartInd, 1);
                }

                this.cart.unshift(product);
                this.clearProduct();
                this.calculateTotal();
                document.querySelector("form button[type='submit']").focus();
            },
            removeFromCart(ind) {
                this.cart.splice(ind, 1);
                this.calculateTotal();
            },
            clearProduct() {
                this.selectedProduct = {
                    Product_SlNo: '',
                    display_text: 'Select Product',
                    Product_Name: '',
                    Unit_Name: '',
                    quantity: 0,
                    Product_Purchase_Rate: '',
                    Product_SellingPrice: 0.00,
                    vat: 0.00,
                    total: 0.00,
                    contract_no: '',
                }
                this.productStock = '';
                this.productStockText = '';
            },
            calculateTotal() {
                this.sales.subTotal = this.cart.reduce((prev, curr) => {
                    return prev + parseFloat(curr.total)
                }, 0).toFixed(2);
                this.sales.vat = this.cart.reduce((prev, curr) => {
                    return +prev + +(curr.total * (curr.vat / 100))
                }, 0);
                if (event.target.id == 'discountPercent') {
                    this.sales.discount = ((parseFloat(this.sales.subTotal) * parseFloat(this.discountPercent)) / 100).toFixed(2);
                } else {
                    this.discountPercent = (parseFloat(this.sales.discount) / parseFloat(this.sales.subTotal) * 100).toFixed(2);
                }
                this.sales.total = ((parseFloat(this.sales.subTotal) + parseFloat(this.sales.vat) + parseFloat(this.sales.transportCost)) - parseFloat(this.sales.discount)).toFixed(2);
                if (this.selectedCustomer.Customer_Type == 'G') {
                    this.sales.paid = this.sales.total;
                    this.sales.due = 0;
                } else {
                    if (event.target.id != 'paid') {
                        this.sales.paid = 0;
                    }
                    this.sales.due = (parseFloat(this.sales.total) - parseFloat(this.sales.paid)).toFixed(2);
                }
            },
            async saveSales() {
                if (this.selectedCustomer.Customer_SlNo == '') {
                    alert('Select Buyer');
                    return;
                }
                if (this.cart.length == 0) {
                    alert('Cart is empty');
                    return;
                }

                this.saleOnProgress = true;

                await this.getCustomerDue();

                let url = "/add_jobcard";
                if (this.sales.salesId != 0) {
                    url = "/update_jobcard";
                }

                if (this.selectedEmployee != null && this.selectedEmployee.Employee_SlNo != null) {
                    this.sales.employeeId = this.selectedEmployee.Employee_SlNo;
                } else {
                    this.sales.employeeId = null;
                }

                this.sales.customerId = this.selectedCustomer.Customer_SlNo;
                this.sales.salesFrom = this.selectedBranch.brunch_id;

                let data = {
                    sales: this.sales,
                    cart: this.cart
                }

                if (this.selectedCustomer.Customer_Type == 'G') {
                    data.customer = this.selectedCustomer;
                }
                axios.post(url, data).then(async res => {
                    let r = res.data;
                    localStorage.removeItem('sales');
                    if (r.success) {
                        alert(r.message)
                        location.href = '/jobcard_record'
                    } else {
                        alert(r.message);
                        this.saleOnProgress = false;
                    }
                })
            },
            async getJobCards() {
                await axios.post('/get_jobcard', {
                    salesId: this.sales.salesId
                }).then(res => {
                    let r = res.data;
                    let sales = r.jobcard[0];
                    this.sales.salesBy = sales.AddBy;
                    this.sales.work_order = sales.WorkOrderId;
                    this.sales.salesFrom = sales.Job_branchId;
                    this.sales.salesDate = sales.JobDate;
                    this.sales.customerId = sales.Customer_Id;
                    this.sales.employeeId = sales.Employee_SlNo;
                    this.sales.subTotal = sales.subTotal;
                    this.sales.discount = sales.discount;
                    this.sales.transportCost = sales.Job_Freight;
                    this.sales.total = sales.totalAmount;
                    this.sales.paid = sales.JobCard_PaidAmount;
                    this.sales.previousDue = sales.Previous_Due;
                    this.sales.due = sales.due;
                    this.sales.note = sales.note;

                    this.oldCustomerId = sales.Customer_Id;
                    this.oldPreviousDue = sales.Previous_Due;
                    this.sales_due_on_update = sales.due;

                    this.vatPercent = parseFloat(this.sales.vat) * 100 / parseFloat(this.sales.subTotal);
                    this.discountPercent = parseFloat(this.sales.discount) * 100 / parseFloat(this.sales.subTotal);

                    this.selectedEmployee = {
                        Employee_SlNo: sales.employee_id,
                        Employee_Name: sales.Employee_Name
                    }

                    this.selectedCompany = {
                        Company_SlNo: sales.Company_SlNo,
                        display_name: `${sales.Company_Code} - ${sales.Company_Name} - ${sales.Company_Mobile}`,
                    }

                    this.selectedCustomer = {
                        Customer_SlNo: sales.Customer_Id,
                        Customer_Code: sales.Customer_Code,
                        Customer_Name: sales.Customer_Name,
                        display_name: `${sales.Customer_Code} - ${sales.Customer_Name}`,
                        Customer_Mobile: sales.Customer_Mobile,
                        Customer_Address: sales.Customer_Address,
                        Customer_Type: sales.Customer_Type
                    }

                    r.jobDetails.forEach(product => {
                        let cartProduct = {
                            productCode: product.Product_Code,
                            productId: product.Product_IDNo,
                            categoryName: product.ProductCategory_Name,
                            name: product.Product_Name,
                            salesRate: product.SaleDetails_Rate,
                            vat: product.SaleDetails_Tax,
                            quantity: product.SaleDetails_TotalQuantity,
                            total: product.SaleDetails_TotalAmount,
                            purchaseRate: product.Purchase_Rate,
                        }

                        this.cart.push(cartProduct);
                    })

                    let gCustomerInd = this.customers.findIndex(c => c.Customer_Type == 'G');
                    this.customers.splice(gCustomerInd, 1);
                })
            },
            async getSales() {
                var storageSales = JSON.parse(localStorage.getItem('sales'));
                await axios.post('/get_sales', {
                    salesId: storageSales.salesId
                }).then(res => {
                    let r = res.data;
                    let sales = r.sales[0];
                    this.sales.customerId = sales.SalseCustomer_IDNo;
                    this.sales.work_order = sales.SaleMaster_InvoiceNo;

                    this.selectedCompany = {
                        Company_SlNo: sales.Company_SlNo,
                        display_name: `${sales.Company_Code} - ${sales.Company_Name} - ${sales.Company_Mobile}`,
                    }

                    this.selectedCustomer = {
                        Customer_SlNo: sales.SalseCustomer_IDNo,
                        Customer_Code: sales.Customer_Code,
                        Customer_Name: sales.Customer_Name,
                        display_name: `${sales.Customer_Code} - ${sales.Customer_Name}`,
                        Customer_Mobile: sales.Customer_Mobile,
                        Customer_Address: sales.Customer_Address,
                        Customer_Type: sales.Customer_Type
                    }

                    storageSales.saleDetails.forEach(product => {
                        let cartProduct = {
                            SaleDetails_SlNo: product.SaleDetails_SlNo,
                            productCode: product.Product_Code,
                            productId: product.Product_IDNo,
                            categoryName: product.ProductCategory_Name,
                            name: product.Product_Name,
                            salesRate: product.SaleDetails_Rate,
                            vat: product.SaleDetails_Tax,
                            quantity: product.SaleDetails_TotalQuantity,
                            total: product.SaleDetails_TotalAmount,
                            purchaseRate: product.Purchase_Rate,
                        }

                        this.cart.push(cartProduct);
                    })

                    this.calculateTotal();
                })
            }
        }
    })

    var toCapitalize = Array.prototype.toCapitalize = (d) => {
        return d.toUpperCase().trim('');
    }
</script>