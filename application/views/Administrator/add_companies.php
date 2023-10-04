<style>
	.v-select {
		margin-bottom: 5px;
	}

	.v-select.open .dropdown-toggle {
		border-bottom: 1px solid #ccc;
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

	#companies label {
		font-size: 13px;
	}

	#companies select {
		border-radius: 3px;
	}

	#companies .add-button {
		padding: 2.5px;
		width: 28px;
		background-color: #298db4;
		display: block;
		text-align: center;
		color: white;
	}

	#companies .add-button:hover {
		background-color: #41add6;
		color: white;
	}

	#companies input[type="file"] {
		display: none;
	}

	#companies .custom-file-upload {
		border: 1px solid #ccc;
		display: inline-block;
		padding: 5px 12px;
		cursor: pointer;
		margin-top: 5px;
		background-color: #298db4;
		border: none;
		color: white;
	}

	#companies .custom-file-upload:hover {
		background-color: #41add6;
	}
</style>
<div id="companies">
	<form @submit.prevent="saveCompanies">
		<div class="row" style="margin-top: 10px;margin-bottom:15px;border-bottom: 1px solid #ccc;padding-bottom:15px;">
			<div class="col-md-5">
				<div class="form-group clearfix">
					<label class="control-label col-md-4">Company Id:</label>
					<div class="col-md-7">
						<input type="text" class="form-control" v-model="company.Company_Code" required readonly>
					</div>
				</div>

				<div class="form-group clearfix">
					<label class="control-label col-md-4">Company Name:</label>
					<div class="col-md-7">
						<input type="text" class="form-control" v-model="company.Company_Name" required>
					</div>
				</div>

				<div class="form-group clearfix">
					<label class="control-label col-md-4">Address:</label>
					<div class="col-md-7">
						<input type="text" class="form-control" v-model="company.Company_Address">
					</div>
				</div>

				<div class="form-group clearfix">
					<label class="control-label col-md-4">Area:</label>
					<div class="col-md-7">
						<select class="form-control" v-if="districts.length == 0"></select>
						<v-select v-bind:options="districts" v-model="selectedDistrict" label="District_Name" v-if="districts.length > 0"></v-select>
					</div>
					<div class="col-md-1" style="padding:0;margin-left: -15px;"><a href="/area" target="_blank" class="add-button"><i class="fa fa-plus"></i></a></div>
				</div>
			</div>

			<div class="col-md-5">
				<div class="form-group clearfix">
					<label class="control-label col-md-4">Mobile:</label>
					<div class="col-md-7">
						<input type="text" class="form-control" v-model="company.Company_Mobile" required>
					</div>
				</div>

				<div class="form-group clearfix">
					<label class="control-label col-md-4">Office Phone:</label>
					<div class="col-md-7">
						<input type="text" class="form-control" v-model="company.Company_OfficePhone">
					</div>
				</div>

				<div class="form-group clearfix">
					<label class="control-label col-md-4">Previous Due:</label>
					<div class="col-md-7">
						<input type="number" class="form-control" v-model="company.previous_due" required>
					</div>
				</div>

				<div class="form-group clearfix">
					<label class="control-label col-md-4">Credit Limit:</label>
					<div class="col-md-7">
						<input type="number" class="form-control" v-model="company.Company_Credit_Limit" required>
					</div>
				</div>

				<div class="form-group clearfix">
					<div class="col-md-7 col-md-offset-4">
						<input type="submit" class="btn btn-success btn-sm" value="Save">
					</div>
				</div>
			</div>
		</div>
	</form>

	<div class="row">
		<div class="col-sm-12 form-inline">
			<div class="form-group">
				<label for="filter" class="sr-only">Filter</label>
				<input type="text" class="form-control" v-model="filter" placeholder="Filter">
			</div>
		</div>
		<div class="col-md-12">
			<div class="table-responsive">
				<datatable :columns="columns" :data="companies" :filter-by="filter" style="margin-bottom: 5px;">
					<template scope="{ row }">
						<tr>
							<td>{{ row.Company_Code }}</td>
							<td>{{ row.AddTime | dateOnly('DD-MM-YYYY') }}</td>
							<td>{{ row.Company_Name }}</td>
							<td>{{ row.District_Name }}</td>
							<td>{{ row.Company_Mobile }}</td>
							<td>{{ row.Company_Credit_Limit }}</td>
							<td>
								<?php if ($this->session->userdata('accountType') != 'u') { ?>
									<button type="button" class="button edit" @click="editCompany(row)">
										<i class="fa fa-pencil"></i>
									</button>
									<button type="button" class="button" @click="deleteCompany(row.Company_SlNo)">
										<i class="fa fa-trash"></i>
									</button>
								<?php } ?>
							</td>
						</tr>
					</template>
				</datatable>
				<datatable-pager v-model="page" type="abbreviated" :per-page="per_page" style="margin-bottom: 50px;"></datatable-pager>
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
		el: '#companies',
		data() {
			return {
				company: {
					Company_SlNo: 0,
					Company_Code: '<?php echo $companyCode; ?>',
					Company_Name: '',
					Company_Phone: '',
					Company_Mobile: '',
					Company_Email: '',
					Company_OfficePhone: '',
					Company_Address: '',
					area_ID: '',
					Company_Credit_Limit: 0,
					previous_due: 0
				},
				companies: [],
				districts: [],
				selectedDistrict: null,

				columns: [
					{label: 'Company Id',field: 'Company_Code',align: 'center',filterable: false},
					{label: 'Added Date',field: 'AddTime',align: 'center',filterable: false},
					{label: 'Company Name',field: 'Company_Name',align: 'center'},
					{label: 'Area',field: 'District_Name',align: 'center'},
					{label: 'Contact Number',field: 'Company_Mobile',align: 'center'},
					{label: 'Credit Limit',field: 'Company_Credit_Limit',align: 'center'},
					{label: 'Action',align: 'center',filterable: false}
				],
				page: 1,
				per_page: 10,
				filter: ''
			}
		},
		filters: {
			dateOnly(datetime, format) {
				return moment(datetime).format(format);
			}
		},
		created() {
			this.getDistricts();
			this.getCompanies();
		},
		methods: {
			getDistricts() {
				axios.get('/get_districts').then(res => {
					this.districts = res.data;
				})
			},
			getCompanies() {
				axios.get('/get_companies').then(res => {
					this.companies = res.data;
				})
			},
			saveCompanies() {
				if (this.selectedDistrict == null) {
					alert('Select area');
					return;
				}

				this.company.area_ID = this.selectedDistrict.District_SlNo;

				let fd = new FormData();
				fd.append('data', JSON.stringify(this.company));

				let url = '/add_company';
				if (this.company.Company_SlNo != 0) {
					url = '/update_company';
				}

				axios.post(url, fd).then(res => {
					let r = res.data;
					alert(r.message);
					if (r.success) {
						this.resetForm();
						this.company.Company_Code = r.companyCode;
						this.getCompanies();
					}
				})
			},
			editCompany(company) {
				let keys = Object.keys(this.company);
				keys.forEach(key => {
					this.company[key] = company[key];
				})

				this.selectedDistrict = {
					District_SlNo: company.area_ID,
					District_Name: company.District_Name
				}

				if (company.image_name == null || company.image_name == '') {
					this.imageUrl = null;
				} else {
					this.imageUrl = '/uploads/companies/' + company.image_name;
				}
			},
			deleteCompany(companyId) {
				let deleteConfirm = confirm('Are you sure?');
				if (deleteConfirm == false) {
					return;
				}
				axios.post('/delete_company', {
					companyId: companyId
				}).then(res => {
					let r = res.data;
					alert(r.message);
					if (r.success) {
						this.getCompanies();
					}
				})
			},
			resetForm() {
				let keys = Object.keys(this.company);
				keys.forEach(key => {
					if (typeof(this.company[key]) == 'string') {
						this.company[key] = '';
					} else if (typeof(this.company[key]) == 'number') {
						this.company[key] = 0;
					}
				})

				this.selectedDistrict = null
			}
		}
	})
</script>