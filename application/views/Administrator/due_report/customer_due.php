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
</style>

<div class="row" id="customerDueList">
	<div class="col-xs-12 col-md-12 col-lg-12" style="border-bottom:1px #ccc solid;">
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control" v-model="searchType" v-on:change="onChangeSearchType" style="padding:0px;width:150px;">
					<option value="all">All</option>
					<option value="customer">By Buyer</option>
					<option value="area">By Area</option>
				</select>
			</div>
			<div class="form-group" style="display: none" v-bind:style="{display: searchType == 'customer' ? '' : 'none'}">
				<v-select v-bind:options="customers" v-model="selectedCustomer" label="display_name" placeholder="Select Buyer"></v-select>
			</div>
			<div class="form-group" style="display: none" v-bind:style="{display: searchType == 'area' ? '' : 'none'}">
				<v-select v-bind:options="areas" v-model="selectedArea" label="District_Name" placeholder="Select area"></v-select>
			</div>

			<div class="form-group" style="margin-bottom: 3px;">
				<input type="button" style="padding: 1px 5px !important;line-height: 1;" class="btn btn-primary" value="Show Report" v-on:click="getDues">
			</div>
		</form>
	</div>

	<div class="col-md-12" style="display: none" v-bind:style="{display: dues.length > 0 ? '' : 'none'}">
		<a href="" style="margin: 7px 0;display:block;width:50px;" v-on:click.prevent="print">
			<i class="fa fa-print"></i> Print
		</a>
		<div class="table-responsive" id="reportTable">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Buyer Id</th>
						<th>Buyer Name</th>
						<th>Owner Name</th>
						<th>Address</th>
						<th>Buyer Mobile</th>
						<th>Due Amount</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="data in dues">
						<td>{{ data.Customer_Code }}</td>
						<td>{{ data.Customer_Name }}</td>
						<td>{{ data.owner_name }}</td>
						<td>{{ data.Customer_Address }}</td>
						<td>{{ data.Customer_Mobile }}</td>
						<td style="text-align:right">{{ parseFloat(data.dueAmount).toFixed(2) }}</td>
					</tr>
				</tbody>
				<tfoot>
					<tr style="font-weight:bold;">
						<td colspan="5" style="text-align:right">Total Due</td>
						<td style="text-align:right">{{ parseFloat(totalDue).toFixed(2) }}</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vue-select.min.js"></script>

<script>
	Vue.component('v-select', VueSelect.VueSelect);
	new Vue({
		el: '#customerDueList',
		data() {
			return {
				searchType: 'all',
				customers: [],
				selectedCustomer: null,
				areas: [],
				selectedArea: null,
				dues: [],
				totalDue: 0.00
			}
		},
		created() {

		},
		methods: {
			onChangeSearchType() {
				this.selectedCustomer = null;
				this.selectedArea = null;
				if (this.searchType == 'customer' && this.customers.length == 0) {
					this.getCustomers();
				} else if (this.searchType == 'area' && this.areas.length == 0) {
					this.getAreas();
				}
			},
			getCustomers() {
				axios.get('/get_customers').then(res => {
					this.customers = res.data;
				})
			},
			getAreas() {
				axios.get('/get_districts').then(res => {
					this.areas = res.data;
				})
			},
			getDues() {
				// if (this.searchType == 'customer' && this.selectedCustomer == null) {
				// 	alert('Select customer');
				// 	return;
				// }

				let customerId = this.selectedCustomer == null ? null : this.selectedCustomer.Customer_SlNo;
				let districtId = this.selectedArea == null ? null : this.selectedArea.District_SlNo;
				axios.post('/get_customer_due', {
					customerId: customerId,
					districtId: districtId
				}).then(res => {
					if (this.searchType == 'customer') {
						this.dues = res.data;
					} else {
						this.dues = res.data.filter(d => parseFloat(d.dueAmount) != 0);
					}
					this.totalDue = this.dues.reduce((prev, cur) => {
						return prev + parseFloat(cur.dueAmount)
					}, 0);
				})
			},
			async print() {
				let reportContent = `
					<div class="container">
						<h4 style="text-align:center">Buyer due report</h4 style="text-align:center">
						<div class="row">
							<div class="col-xs-12">
								${document.querySelector('#reportTable').innerHTML}
							</div>
						</div>
					</div>
				`;

				var mywindow = window.open('', 'PRINT', `width=${screen.width}, height=${screen.height}`);
				mywindow.document.write(`
					<?php $this->load->view('Administrator/reports/reportHeader.php'); ?>
				`);

				mywindow.document.body.innerHTML += reportContent;

				mywindow.focus();
				await new Promise(resolve => setTimeout(resolve, 1000));
				mywindow.print();
				mywindow.close();
			}
		}
	})
</script>