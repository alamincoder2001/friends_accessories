<style>
    .form-group {
        margin-right: 15px;
    }

    .v-select {
        margin-top: -2.5px;
        float: right;
        min-width: 180px;
        margin-left: 5px;
    }

    .v-select .dropdown-toggle {
        padding: 0px;
        height: 30px;
        border-radius: 0;
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

    input[type="date"] {
        border-radius: 0 !important;
        height: 29px;
        margin-top: 2px;
    }
</style>
<div id="requisitionRecord">
    <div class="row" style="padding: 15px;border-bottom: 1px solid #ccc;">
        <div class="col-sm-12">
            <form class="form-inline" v-on:submit.prevent="getResult">
                <div class="form-group">
                    <label>Search Type</label><br>
                    <select class="form-conrol" v-model="searchType" @change="onChangeSearchType">
                        <option value="p">Pending</option>
                        <option value="all">All</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Date From</label><br>
                    <input type="date" class="form-control" v-model="dateFrom">
                </div>
                <div class="form-group">
                    <label>Date To</label><br>
                    <input type="date" class="form-control" v-model="dateTo">
                </div>
                <div class="form-group">
                    <label>&nbsp;</label><br>
                    <button type="submit" class="btn btn-info btn-xs">Search</button>
                </div>
            </form>
        </div>
    </div>

    <div class="row" style="padding: 15px;display:none;" v-bind:style="{display: requisitions.length > 0 ? '' : 'none'}">
        <div class="col-sm-12" style="margin-bottom: 10px;">
            <a href="" @click.prevent="print"><i class="fa fa-print"></i> Print</a>
        </div>
        <div class="col-sm-12">
            <div class="table-responsive" id="reportContent">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Invoice No.</th>
                            <th>Date</th>
                            <th>Employee Id</th>
                            <th>Employee Name</th>
                            <th>Note</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- <tr v-for="requisition in requisitions" :style="{background: requisition.status == 'p' ? '#ffb74c' : ''}"> -->
                        <tr v-for="requisition in requisitions">
                            <td>{{ requisition.requisition_invoice }}</td>
                            <td>{{ requisition.requisition_date }}</td>
                            <td>{{ requisition.employee_code }}</td>
                            <td>{{ requisition.employee_name }}</td>
                            <td>{{ requisition.note }}</td>
                            <td>
                                <?php if ($this->session->userdata('accountType') != 'u') { ?>
                                    <!-- <a href="" v-if="requisition.status == 'p'" v-bind:href="`material_purchase/0/${requisition.requisition_id}`" target="_blank"><i class="fa fa-shopping-cart" style="font-size: 16px;"></i></a> -->
                                    <a href="" v-if="requisition.status == 'p'" v-bind:href="`material_requisition/${requisition.requisition_id}`"><i class="fa fa-pencil-square" style="font-size: 16px;"></i></a>
                                    <a href="" v-bind:href="`material_requisition_invoice/${requisition.requisition_id}`" target="_blank"><i class="fa fa-file-text" style="font-size: 16px;"></i></a>
                                    <a href="" v-if="requisition.status == 'p'" v-on:click.prevent="deleteRequisition(requisition.requisition_id, requisition.invoice_no)"><i class="fa fa-trash" style="font-size: 16px;"></i></a>
                                <?php } ?>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vuejs-datatable.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>

<script>
    Vue.component('v-select', VueSelect.VueSelect);
    new Vue({
        el: '#requisitionRecord',
        data() {
            return {
                employees: [],
                selectedEmployee: null,
                materials: [],
                selectedMaterial: null,
                categories: [],
                selectedCategory: null,
                dateFrom: moment().format('YYYY-MM-DD'),
                dateTo: moment().format('YYYY-MM-DD'),
                requisitions: [],
                searchType: 'p',
            }
        },
        created() {
            this.getPurchase();
        },
        methods: {
            getSuppliers() {
                axios.get('get_suppliers')
                    .then(res => {
                        this.suppliers = res.data;
                    })
            },
            getMaterials() {
                axios.get('/get_materials').then(res => {
                    this.materials = res.data;
                })
            },
            getCategories() {
                axios.get('/get_categories').then(res => {
                    this.categories = res.data;
                })
            },
            onChangeSearchType() {
                this.requisitions = [];
            },
            getResult() {
                this.getPurchase();
            },
            getPurchase() {
                let options = {
                    dateFrom: this.dateFrom,
                    dateTo: this.dateTo,
                    Status: this.searchType
                }
                axios.post('get_material_requisition', options)
                    .then(res => {
                        this.requisitions = res.data.requisitions;
                    })
            },
            getPurchaseDetails() {
                let options = {
                    dateFrom: this.dateFrom,
                    dateTo: this.dateTo,
                    Status: this.searchType
                }
                if (this.selectedCategory != null && this.searchType == 'byCategory') {
                    options.categoryId = this.selectedCategory.ProductCategory_SlNo;
                }
                if (this.selectedMaterial != null && this.searchType == 'byMaterial') {
                    options.materialId = this.selectedMaterial.material_id;
                }

                axios.post('/get_material_requisition_details', options)
                    .then(res => {
                        this.requisitions = res.data;
                    })
            },
            deletePurchase(requisition_id, invoice_no) {
                let conf = confirm('Are you sure?');
                if (conf == false) {
                    return;
                }
                let options = {
                    requisition_id,
                    invoice_no
                }
                axios.post('/delete_material_requisition', options)
                    .then(res => {
                        let r = res.data;
                        alert(r.message);
                        if (r.success) {
                            this.getPurchase();
                        }
                    })
            },
            async print() {
                let dateText = '';
                if (this.dateFrom != '' && this.dateTo != '') {
                    dateText = `Statement from <strong>${this.dateFrom}</strong> to <strong>${this.dateTo}</strong>`;
                }

                let reportContent = `
					<div class="container">
						<div class="row">
							<div class="col-xs-12 text-center">
								<h3>Material Purchase Record</h3>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6">
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
						.container{
							width: 100%;
						}
					</style>
				`;
                reportWindow.document.body.innerHTML += reportContent;

                if (this.searchType == 'all' || this.searchType == 'byEmployee') {
                    let rows = reportWindow.document.querySelectorAll('.table tr');
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