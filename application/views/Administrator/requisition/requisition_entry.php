<style>
    .v-select {
        margin-bottom: 5px;
        background: #fff;
    }

    .v-select .dropdown-toggle {
        padding: 0px;
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

    #branchDropdown .vs__actions button {
        display: none;
    }

    #branchDropdown .vs__actions .open-indicator {
        height: 15px;
        margin-top: 7px;
    }

    @media(min-width:320px) and (max-width:440px) {
        h4.widget-title {
            font-size: 17px;
        }
    }

    @media screen and (max-width: 600px) and (min-width: 320px) {
        .paddingMobile {
            padding-left: 12px !important;
            padding-right: 12px !important;
        }

    }

    .widget-body {
        background: #d5d2d2;
    }
</style>

<div class="row" id="requisition" style="background:#d5d2d2;padding-bottom:50px;">
    <div class="col-xs-12 col-md-12 col-lg-12">
        <div class="widget-box" style="border: 2px solid gray;">
            <div class="widget-main">
                <div class="widget-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group row">
                                <label class="col-xs-4 col-md-3 control-label no-padding-right"> Employee </label>
                                <div class="col-xs-7 col-md-8 no-padding-right">
                                    <v-select v-bind:options="employees" v-model="selectedEmployee" label="display_name"></v-select>
                                </div>
                                <div class="col-xs-1 col-md-1">
                                    <a href="<?= base_url('employee') ?>" title="Add New Emplyee" class="btn btn-xs btn-danger" style="height: 25px; border: 0; width: 27px; margin-left: -10px;" target="_blank"><i class="fa fa-plus" aria-hidden="true" style="margin-top: 5px;"></i></a>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-4 col-md-3 control-label no-padding-right"> Description </label>
                                <div class="col-xs-8 col-md-9">
                                    <textarea class="form-control" v-model="requisition.note"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="form-group row">
                                <label class="col-xs-4 col-md-4 control-label no-padding-right"> Requisition Invoice </label>
                                <div class="col-xs-8 col-md-8">
                                    <input type="text" id="invoice" name="invoice" class="form-control" v-model="requisition.requisition_invoice" readonly />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-4 col-md-4 control-label no-padding-right"> Requisition For </label>
                                <div class="col-xs-8 col-md-8">
                                    <v-select id="branchDropdown" v-bind:options="branches" v-model="selectedBranch" label="Brunch_name" disabled></v-select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-4 col-md-4 control-label no-padding-right"> Requisition Date </label>
                                <div class="col-xs-8 col-md-8">
                                    <input class="form-control" id="requisition_date" name="requisition_date" class="form-control" type="date" v-model="requisition.requisition_date" v-bind:disabled="userType == 'u' ? true : false" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="widget-box" style="border: 2px solid gray;">
            <div class="widget-main" style="padding: 5px;">
                <div class="widget-body">
                    <form @submit.prevent="addToCart">
                        <div class="row">
                            <div class="col-xs-12 col-md-1 no-padding-right paddingMobile">
                                <div class="form-group">
                                    <label for="">Item No</label>
                                    <input type="text" id="code" readonly v-model="selectedMaterial.code" name="code" class="form-control" style="border-radius:0 !important;height:27px;">
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-4 no-padding paddingMobile">
                                <div class="form-group">
                                    <label for="">Material Name</label>
                                    <v-select :options="materials" id="materials" v-model="selectedMaterial" label="display_text" @input="setFocus"></v-select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-2 no-padding paddingMobile">
                                <div class="form-group">
                                    <label for="">Category</label>
                                    <input type="text" readonly v-model="selectedMaterial.category_name" class="form-control" style="border-radius:0 !important;height:27px;">
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-1 no-padding paddingMobile">
                                <div class="form-group">
                                    <label for="">Quantity</label>
                                    <input type="text" id="quantity" ref="quantity" v-model="selectedMaterial.quantity" class="form-control" style="border-radius:0 !important;height:27px;">
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-1" style="margin-top: 25px;">
                                <div class="form-group">
                                    <button id="addToCart" style="width: 100%;" type="submit">Add</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered" style="color:#000;margin-bottom: 5px;">
                                    <thead>
                                        <tr style="background: #d5d2d2;">
                                            <th style="width:5%;color:#000;">Sl</th>
                                            <th style="width:20%;color:#000;">Material Name</th>
                                            <th style="width:15%;color:#000;">Category</th>
                                            <th style="width:17%;color:#000;">Quantity</th>
                                            <th style="width:8%;color:#000;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody style="display:none;background:#fff;" v-bind:style="{display: cart.length > 0 ? '' : 'none'}">
                                        <tr v-for="(product, sl) in cart" style="background: #6fffff;">
                                            <td>{{ sl + 1 }}</td>
                                            <td>{{ product.name }}</td>
                                            <td>{{ product.category_name }}</td>
                                            <td>{{product.quantity}}</td>
                                            <td><a href="" v-on:click.prevent="removeFromCart(product)"><i class="fa fa-trash"></i></a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-8">
    </div>
    <div class="col-xs-6 col-md-4">
        <div class="widget-box" style="border: 2px solid gray;">
            <div class="widget-main" style="padding: 5px;">
                <div class="widget-body">
                    <div class="row">
                        <div class="col-xs-12 no-padding paddingMobile">
                            <div class="table-responsive">
                                <table style="color:#000;margin-bottom: 0px;border-collapse: collapse;width:100%;">
                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <div class="col-xs-6">
                                                    <button type="button" @click="saveRequisition" class="btn btn-success" v-bind:disabled="requisitionInProgress == true ? true : false" style="background:#000;color:#fff;padding:3px;width:100%;">Requisition</button>
                                                </div>
                                                <div class="col-xs-6">
                                                    <button type="button" class="btn btn-info" onclick="window.location = '<?php echo base_url(); ?>material_requisition'" style="background:#000;color:#fff;padding:3px;width:100%;">New Requisition</button>
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
        el: '#requisition',
        data() {
            return {
                requisition: {
                    requisition_id: parseInt("<?php echo $requisition_id; ?>"),
                    employee_id: '',
                    requisition_invoice: '<?php echo $requisitionInvoice; ?>',
                    requisition_date: moment().format("YYYY-MM-DD"),
                    requisition_for: parseInt("<?php echo $this->session->userdata('BRANCHid'); ?>"),
                    note: ''
                },
                cart: [],
                employees: [],
                selectedEmployee: null,
                materials: [],
                selectedMaterial: {
                    material_id: '',
                    name: '',
                    purchase_rate: 0,
                    display_text: 'Select Material'
                },
                branches: [],
                selectedBranch: {
                    brunch_id: "<?php echo $this->session->userdata('BRANCHid'); ?>",
                    Brunch_name: "<?php echo $this->session->userdata('Brunch_name'); ?>"
                },
                userType: '<?php echo $this->session->userdata("accountType"); ?>',
                requisitionInProgress: false
            }
        },
        async created() {
            this.getBranches();
            this.getEmployees();
            this.getMaterials();
            if (this.requisition.requisition_id != 0) {
                await this.getRequisition();
            }
        },
        methods: {
            getBranches() {
                axios.get('/get_branches').then(res => {
                    this.branches = res.data;
                })
            },
            getEmployees() {
                axios.get('/get_employees').then(res => {
                    this.employees = res.data;
                })
            },
            getMaterials() {
                axios.get('/get_materials')
                    .then(res => {
                        this.materials = res.data.filter(m => m.status == 1);
                    })
            },

            setFocus() {
                if (this.selectedMaterial.material_id == '') {
                    document.querySelector("#code").focus();
                    return
                }
                this.$refs.quantity.focus();
            },

            addToCart() {
                if (this.selectedMaterial.material_id == '') {
                    document.querySelector("#materials [type='search']").focus()
                    return
                }
                if (this.selectedMaterial.quantity == undefined || this.selectedMaterial.quantity == 0) {
                    this.$refs.quantity.focus();
                    return
                }
                let ind = this.cart.findIndex(m => m.material_id == this.selectedMaterial.material_id);
                if (ind > -1) {
                    this.cart.splice(ind, 1);
                }
                this.cart.push(this.selectedMaterial);
                this.clearMaterial();
                document.querySelector("#code").focus();
            },
            removeFromCart(material) {
                let ind = this.cart.findIndex(m => m.material_id == material.material_id);
                if (ind > -1) {
                    this.cart.splice(ind, 1);
                }
            },
            clearMaterial() {
                this.selectedMaterial = {
                    material_id: '',
                    name: '',
                    purchase_rate: 0,
                    display_text: 'Select Material'
                }
            },

            saveRequisition() {
                this.requisition.employee_id = this.selectedEmployee == null ? null : this.selectedEmployee.Employee_SlNo;
                if (this.requisition.employee_id == 0 || this.requisition.employee_id == null) {
                    alert('Select Employee');
                    return;
                }

                if (this.cart.length == 0) {
                    alert('Cart is empty');
                    return;
                }

                let url = '/add_material_requisition';
                if (this.requisition.requisition_id != 0) {
                    url = '/update_material_requisition';
                }

                let data = {
                    requisition: this.requisition,
                    cart: this.cart
                }

                this.requisitionInProgress = true;
                axios.post(url, data)
                    .then(async res => {
                        let r = res.data;
                        alert(r.message);
                        if (r.success) {
                            let invoiceConf = confirm('Do you want to view invoice?');
                            if (invoiceConf) {
                                window.open(`/material_requisition_invoice/${r.requisition_id}`, '_blank');
                                await new Promise(resolve => setTimeout(resolve, 1000));
                            }
                            window.location = '<?php echo base_url(); ?>material_requisition';
                        }
                    })
            },

            async getRequisition() {
                let options = {
                    requisition_id: this.requisition.requisition_id
                }
                await axios.post('/get_material_requisition', options)
                    .then(res => {
                        this.requisition = res.data.requisitions[0];
                        this.selectedEmployee = {
                            display_name: `${this.requisition.employee_name} - ${this.requisition.employee_code}`,
                            Employee_SlNo: this.requisition.employee_id,
                            Employee_Name: this.requisition.employee_name,
                        }
                    });

                await axios.post('/get_material_requisition_details', {
                        requisition_id: this.requisition.requisition_id
                    })
                    .then(res => {
                        this.cart = res.data;
                    })

            }
        },
        mounted() {
			window.addEventListener('keydown', (e) => {
				if (e.key == 'Insert') {
					this.saveRequisition();
				}
			});
		},
    })
</script>