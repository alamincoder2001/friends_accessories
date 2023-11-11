<style>
    .v-select {
        margin-top: -2.5px;
        float: right;
        min-width: 180px;
        margin-left: 5px;
    }

    .v-select .dropdown-toggle {
        padding: 0px;
        height: 25px;
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

    #searchForm select {
        padding: 0;
        border-radius: 4px;
    }

    #searchForm .form-group {
        margin-right: 5px;
    }

    #searchForm * {
        font-size: 13px;
    }

    .record-table {
        width: 100%;
        border-collapse: collapse;
    }

    .record-table thead {
        background-color: #0097df;
        color: white;
    }

    .record-table th,
    .record-table td {
        padding: 3px;
        border: 1px solid #454545;
    }

    .record-table th {
        text-align: center;
    }
</style>
<div id="salesRecord">
    <div class="row" style="border-bottom: 1px solid #ccc;padding: 3px 0;">
        <div class="col-md-12">
            <form class="form-inline" id="searchForm" @submit.prevent="getSearchResult">
                <div class="form-group">
                    <label>Search Type</label>
                    <select class="form-control" v-model="searchType" @change="onChangeSearchType">
                        <option value="">All</option>
                        <option value="customer">By Buyer</option>
                        <option value="employee">By Employee</option>
                        <option value="user">By User</option>
                    </select>
                </div>

                <div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'customer' && customers.length > 0 ? '' : 'none'}">
                    <label>Buyer</label>
                    <v-select v-bind:options="customers" v-model="selectedCustomer" label="display_name"></v-select>
                </div>

                <div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'employee' && employees.length > 0 ? '' : 'none'}">
                    <label>Employee</label>
                    <v-select v-bind:options="employees" v-model="selectedEmployee" label="Employee_Name"></v-select>
                </div>

                <div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'quantity' && products.length > 0 ? '' : 'none'}">
                    <label>Product</label>
                    <v-select v-bind:options="products" v-model="selectedProduct" label="display_text" @input="sales = []"></v-select>
                </div>

                <div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'category' && categories.length > 0 ? '' : 'none'}">
                    <label>Category</label>
                    <v-select v-bind:options="categories" v-model="selectedCategory" label="ProductCategory_Name"></v-select>
                </div>

                <div class="form-group" style="display:none;" v-bind:style="{display: searchType == 'user' && users.length > 0 ? '' : 'none'}">
                    <label>User</label>
                    <v-select v-bind:options="users" v-model="selectedUser" label="FullName"></v-select>
                </div>

                <div class="form-group">
                    <input type="date" class="form-control" v-model="dateFrom">
                </div>

                <div class="form-group">
                    <input type="date" class="form-control" v-model="dateTo">
                </div>

                <div class="form-group" style="margin-top: -5px;">
                    <input type="submit" value="Search">
                </div>
            </form>
        </div>
    </div>

    <div class="row" style="margin-top:15px;display:none;" v-bind:style="{display: sales.length > 0 ? '' : 'none'}">
        <div class="col-md-12" style="margin-bottom: 10px;">
            <a href="" @click.prevent="print"><i class="fa fa-print"></i> Print</a>
        </div>
        <div class="col-md-12">
            <div class="table-responsive" id="reportContent">
                <table class="record-table" v-if="(searchTypesForRecord.includes(searchType)) && recordType == 'with_details'" style="display:none" v-bind:style="{display: (searchTypesForRecord.includes(searchType)) && recordType == 'with_details' ? '' : 'none'}">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Invoice No.</th>
                            <th>Date</th>
                            <th>Buyer Name</th>
                            <th>Employee Name</th>
                            <th>Saved By</th>
                            <th>##</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th style="width: 12%;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <template v-for="(sale, index) in sales">
                            <tr :class="sale.SaleMaster_InvoiceNo">
                                <td>
                                    <input type="checkbox" v-model="sale.allCheck" @change="checkAllGroup(event, sale, index)" />
                                </td>
                                <td>{{ sale.SaleMaster_InvoiceNo }}</td>
                                <td>{{ sale.SaleMaster_SaleDate }}</td>
                                <td>{{ sale.Customer_Name }}</td>
                                <td>{{ sale.Employee_Name }}</td>
                                <td>{{ sale.AddBy }}</td>
                                <td>
                                    <input type="checkbox" @change="onChangeJobcard(sale, index)" v-model="sale.saleDetails[0].checkStatus" />
                                </td>
                                <td>{{ sale.saleDetails[0].Product_Name }}</td>
                                <td style="text-align:right;">{{ sale.saleDetails[0].SaleDetails_Rate }}</td>
                                <td style="text-align:center;">{{ sale.saleDetails[0].SaleDetails_TotalQuantity }}</td>
                                <td style="text-align:right;">{{ sale.saleDetails[0].SaleDetails_TotalAmount }}</td>
                                <td style="text-align:center;">
                                    <?php if ($this->session->userdata('accountType') != 'u') { ?>
                                        <a v-if="jobcard.saleId == sale.SaleMaster_SlNo && jobcard.saleDetails.length > 0" href="" title="Go To Jobcard" @click.prevent="gotoJobcard" target="_blank">
                                            <i class="fa fa-credit-card" style="background: #727272;padding: 3px 4px;border-radius: 5px;color: white;"></i>
                                        </a>
                                    <?php } ?>
                                </td>
                            </tr>
                            <tr v-for="(product, sl) in sale.saleDetails.slice(1)" :class="sale.SaleMaster_InvoiceNo">
                                <td colspan="6" v-bind:rowspan="sale.saleDetails.length - 1" v-if="sl == 0"></td>
                                <td>
                                    <input type="checkbox" @change="onChangeJobcard(sale, index)" v-model="product.checkStatus" />
                                </td>
                                <td>{{ product.Product_Name }}</td>
                                <td style="text-align:right;">{{ product.SaleDetails_Rate }}</td>
                                <td style="text-align:center;">{{ product.SaleDetails_TotalQuantity }}</td>
                                <td style="text-align:right;">{{ product.SaleDetails_TotalAmount }}</td>
                                <td></td>
                            </tr>
                            <tr style="font-weight:bold;">
                                <td colspan="9" style="font-weight:normal;"><strong>Note: </strong>{{ sale.SaleMaster_Description }}</td>
                                <td style="text-align:center;">Total Quantity<br>{{ sale.saleDetails.reduce((prev, curr) => {return prev + parseFloat(curr.SaleDetails_TotalQuantity)}, 0) }}</td>
                                <td style="text-align:right;">
                                    Total: {{ sale.SaleMaster_TotalSaleAmount }}<br>
                                    Paid: {{ sale.SaleMaster_PaidAmount }}<br>
                                    Due: {{ sale.SaleMaster_DueAmount }}
                                </td>
                                <td></td>
                            </tr>
                        </template>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/lodash.min.js"></script>

<script>
    Vue.component('v-select', VueSelect.VueSelect);
    new Vue({
        el: '#salesRecord',
        data() {
            return {
                searchType: '',
                recordType: 'with_details',
                dateFrom: moment().format('YYYY-MM-DD'),
                dateTo: moment().format('YYYY-MM-DD'),
                customers: [],
                selectedCustomer: null,
                employees: [],
                selectedEmployee: null,
                products: [],
                selectedProduct: null,
                users: [],
                selectedUser: null,
                categories: [],
                selectedCategory: null,
                sales: [],
                searchTypesForRecord: ['', 'user', 'customer', 'employee'],
                jobcard: {
                    sale: "",
                    saleId: "",
                    saleDetails: []
                }
            }
        },
        methods: {
            gotoJobcard(){
                window.open("/jobcard/", "_blank");
                location.reload();
            },
            checkAllGroup(event, sale, index) {
                if (event.target.checked) {
                    this.jobcard = {
                        saleId: sale.SaleMaster_SlNo,
                        saleDetails: sale.saleDetails,
                        sale: sale,
                    }
                    localStorage.setItem('sales', JSON.stringify(this.jobcard));
                    this.sales = this.sales.map((sal, ind) => {
                        if (ind == index) {
                            sal.saleDetails.map(de => {
                                if (de.checkStatus == undefined) {
                                    de.checkStatus = true;
                                } else {
                                    de.checkStatus = true;
                                }
                                return de;
                            })
                        } else {
                            sal.saleDetails.map(de => {
                                if (de.checkStatus == undefined) {
                                    de.checkStatus = false;
                                } else {
                                    de.checkStatus = false;
                                }
                                return de;
                            })
                            if (sal.allCheck == undefined) {
                                sal.allCheck = false
                            } else {
                                sal.allCheck = false
                            }
                        }
                        return sal;
                    })

                } else {
                    this.sales = this.sales.map((sal, ind) => {
                        sal.saleDetails.map(de => {
                            if (de.checkStatus == undefined) {
                                de.checkStatus = false;
                            } else {
                                de.checkStatus = false;
                            }
                            return de;
                        })
                        return sal;
                    })
                    this.jobcard = {
                        sale: "",
                        saleId: "",
                        saleDetails: []
                    }
                    localStorage.removeItem('sales');
                    $('.' + sale.SaleMaster_InvoiceNo + '-' + index).prop('checked', false)
                }
            },
            onChangeJobcard(sale, index) {
                let detail = sale.saleDetails.filter(saled => saled.checkStatus == true);
                if (detail.length > 0) {
                    this.jobcard = {
                        saleId: sale.SaleMaster_SlNo,
                        saleDetails: sale.saleDetails.filter(saled => saled.checkStatus == true),
                        sale: sale,
                    }
                    localStorage.setItem('sales', JSON.stringify(this.jobcard));
                } else {
                    this.jobcard = {
                        sale: "",
                        saleId: "",
                        saleDetails: []
                    }
                    localStorage.removeItem('sales');
                }
                this.sales = this.sales.map((sal, ind) => {
                    if (ind != index) {
                        sal.saleDetails.map(de => {
                            if (de.checkStatus == undefined) {
                                de.checkStatus = false;
                            } else {
                                de.checkStatus = false;
                            }
                            return de;
                        })
                        if (sal.allCheck == undefined) {
                            sal.allCheck = false;
                        } else {
                            sal.allCheck = false;
                        }
                    } else {
                        if (sal.saleDetails.length == detail.length) {
                            sal.allCheck = true;
                        } else {
                            sal.allCheck = false;
                        }
                    }
                    return sal;
                })
            },
            onChangeSearchType() {
                this.sales = [];
                if (this.searchType == 'user') {
                    this.getUsers();
                } else if (this.searchType == 'customer') {
                    this.getCustomers();
                } else if (this.searchType == 'employee') {
                    this.getEmployees();
                }
            },
            getProducts() {
                axios.get('/get_products').then(res => {
                    this.products = res.data;
                })
            },
            getCustomers() {
                axios.get('/get_customers').then(res => {
                    this.customers = res.data;
                })
            },
            getEmployees() {
                axios.get('/get_employees').then(res => {
                    this.employees = res.data;
                })
            },
            getUsers() {
                axios.get('/get_users').then(res => {
                    this.users = res.data;
                })
            },
            getCategories() {
                axios.get('/get_categories').then(res => {
                    this.categories = res.data;
                })
            },
            getSearchResult() {
                if (this.searchType != 'customer') {
                    this.selectedCustomer = null;
                }

                if (this.searchType != 'employee') {
                    this.selectedEmployee = null;
                }

                if (this.searchTypesForRecord.includes(this.searchType)) {
                    this.getSalesRecord();
                }
            },
            getSalesRecord() {
                let filter = {
                    userFullName: this.selectedUser == null || this.selectedUser.FullName == '' ? '' : this.selectedUser.FullName,
                    customerId: this.selectedCustomer == null || this.selectedCustomer.Customer_SlNo == '' ? '' : this.selectedCustomer.Customer_SlNo,
                    employeeId: this.selectedEmployee == null || this.selectedEmployee.Employee_SlNo == '' ? '' : this.selectedEmployee.Employee_SlNo,
                    dateFrom: this.dateFrom,
                    dateTo: this.dateTo,
                    fromJobcard: "yes",
                }

                axios.post('/get_sales_record', filter)
                    .then(res => {
                        this.jobcard = {
                            sale: "",
                            saleId: "",
                            saleDetails: []
                        }
                        localStorage.removeItem('sales');
                        this.sales = res.data.filter(sale => sale.saleDetails.length > 0);
                    })
            },
            async print() {
                let dateText = '';
                if (this.dateFrom != '' && this.dateTo != '') {
                    dateText = `Statement from <strong>${this.dateFrom}</strong> to <strong>${this.dateTo}</strong>`;
                }

                let userText = '';
                if (this.selectedUser != null && this.selectedUser.FullName != '' && this.searchType == 'user') {
                    userText = `<strong>Sold by: </strong> ${this.selectedUser.FullName}`;
                }

                let customerText = '';
                if (this.selectedCustomer != null && this.selectedCustomer.Customer_SlNo != '' && this.searchType == 'customer') {
                    customerText = `<strong>Buyer: </strong> ${this.selectedCustomer.Customer_Name}<br>`;
                }

                let employeeText = '';
                if (this.selectedEmployee != null && this.selectedEmployee.Employee_SlNo != '' && this.searchType == 'employee') {
                    employeeText = `<strong>Employee: </strong> ${this.selectedEmployee.Employee_Name}<br>`;
                }


                let reportContent = `
					<div class="container">
						<div class="row">
							<div class="col-xs-12 text-center">
								<h3>Sales Record</h3>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6">
								${userText} ${customerText} ${employeeText} ${productText} ${categoryText}
							</div>
							<div class="col-xs-6 text-right">
								${dateText}
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								${document.querySelector('#reportContent').innerHTML}
							</div>
						</div>
					</div>
				`;

                var reportWindow = window.open('', 'PRINT', `height=${screen.height}, width=${screen.width}`);
                reportWindow.document.write(`
					<?php $this->load->view('Administrator/reports/reportHeader.php'); ?>
				`);

                reportWindow.document.head.innerHTML += `
					<style>
						.record-table{
							width: 100%;
							border-collapse: collapse;
						}
						.record-table thead{
							background-color: #0097df;
							color:white;
						}
						.record-table th, .record-table td{
							padding: 3px;
							border: 1px solid #454545;
						}
						.record-table th{
							text-align: center;
						}
					</style>
				`;
                reportWindow.document.body.innerHTML += reportContent;

                if (this.searchType == '' || this.searchType == 'user') {
                    let rows = reportWindow.document.querySelectorAll('.record-table tr');
                    rows.forEach(row => {
                        row.lastChild.remove();
                    })
                }


                reportWindow.focus();
                await new Promise(resolve => setTimeout(resolve, 1000));
                reportWindow.print();
                reportWindow.close();
            }
        }
    })
</script>