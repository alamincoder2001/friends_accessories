<style>
	.v-select {
		margin-bottom: 5px;
		width: 250px;
	}

	.v-select .dropdown-toggle {
		padding: 0px;
	}

	.v-select input[type=search],
	.v-select input[type=search]:focus {
		margin: 0px;
	}

	.v-select .selected-tag {
		margin: 0px;
	}
</style>

<div class="row" id="purchaseReturn">
	<div class="col-xs-12 col-md-12 col-lg-12" style="border-bottom:1px #ccc solid;">
		<div class="form-group" style="margin-top:10px;">
			<label class="col-sm-1 col-sm-offset-1 control-label no-padding-right" for="purchaseInvoiceno"> Invoice no </label>
			<div class="col-sm-3">
				<v-select v-bind:options="invoices" label="invoice_no" v-model="selectedInvoice" v-on:input="onChangeInvoice"></v-select>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-info btn-xs" style="width: 100px;" @click="getPurchaseDetails">View</button>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-md-12 col-lg-12" v-if="cart.length > 0" style="display:none" v-bind:style="{display: cart.length > 0 ? '' : 'none'}">
		<br>
		<div class="table-responsive">
			<div class="col-md-6">
				<strong>Supplier Name: </strong>{{ selectedInvoice.Supplier_Name }}<br>
				<strong>Address: </strong>{{ selectedInvoice.Supplier_Address }}<br>
				<strong>Mobile: </strong>{{ selectedInvoice.Supplier_Mobile }}<br>
			</div>
			<div class="col-md-6">
				<div class="row">
					<label class="col-md-3" style="font-weight:bold">Purchase Date:</label>
					<label class="col-md-6" for="">{{ selectedInvoice.purchase_date }}</label>
				</div>
				<div class="row">
					<label class="col-md-3" style="font-weight:bold">MRR Number:</label>
					<label class="col-md-6" for="">{{ selectedInvoice.MRR_No }}</label>
					<!-- <label class="col-md-6" for="">
						<input v-model="selectedInvoice.MRR_No" placeholder="MRR No" type="text" style="width:140px;height: 25px;">
					</label> -->
				</div>
				<div class="row">
					<label class="col-md-3" style="font-weight:bold">Date:</label>
					<label class="col-md-6" for=""><input v-model="receiveDate" type="date" style="width:140px;height: 25px;"></label>
				</div>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Sl</th>
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Category</th>
						<th>Quantity</th>
						<th>Amount</th>
						<th>Net Weight</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(product, sl) in cart">
						<td>{{ sl + 1 }}</td>
						<td>{{ product.code }}</td>
						<td>{{ product.name }}</td>
						<td>{{ product.ProductCategory_Name }}</td>
						<td>{{ product.quantity }} {{ product.Unit_Name}}</td>
						<td>{{ product.total }}</td>
						<td>
							<input style="text-align: center;" type="text" :id="sl" v-model="product.net_weight" v-on:input="productTotalQty(sl)">
						</td>
						<!-- <td v-if="product.net_weight  == product.quantity">
							<input style="text-align: center;" type="text" v-model="product.net_weight" disabled>
						</td>
						<td v-else>
							<input style="text-align: center;" type="text" :id="sl" v-model="product.net_weight" v-on:input="productTotalQty(sl)">
						</td> -->
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<!-- <td colspan="5" style="text-align:right;padding-top:15px;">Note</td>
						<td colspan="2">
							<textarea style="width: 100%" v-model="purchaseReturn.note"></textarea>
						</td> -->
						<td colspan="5"></td>
						<td>
							<button class="btn btn-success" style="width:120px;" v-on:click.prevent="saveNetWeightQty">Save</button>
						</td>
						<td style="font-size: 20px;font-weight:600">Total: {{ totalQty }}</td>

					</tr>
				</tfoot>
			</table>
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
		el: '#purchaseReturn',
		data() {
			return {
				invoices: [],
				selectedInvoice: null,
				cart: [],
				totalQty: 0,
				receiveDate: moment().format('YYYY-MM-DD'),
				// purchaseReturn: {
				// 	returnId: 0,
				// 	returnDate: moment().format('YYYY-MM-DD'),
				// 	total: 0.00,
				// 	note: ''
				// },
				// userType: '<?php echo $this->session->userdata("accountType"); ?>',
				// returnDetails: [],
				// checkStock: true,
			}
		},
		created() {
			this.getPurchases();
		},
		methods: {
			onChangeInvoice() {
				this.cart = [];
			},
			getPurchases() {
				axios.get('/get_material_purchase').then(res => {
					this.invoices = res.data;
					// this.invoices = res.data.filter(mp => mp.net_weight == 0);
				})
			},
			async getPurchaseDetails() {
				if (this.selectedInvoice == null) {
					alert('Select invoice');
					return;
				}
				await axios.post('/get_material_purchase_details', {
					purchase_id: this.selectedInvoice.purchase_id,
					// purchaseInvoice: this.selectedInvoice.invoice_no
				}).then(res => {
					this.cart = res.data;
					this.totalQty = this.cart.reduce((prev, curr) => {
						return +prev + +curr.net_weight
					}, 0)
					// this.cart = res.data.map(p => {
					// 	p.receive_quantity = '';
					// 	p.total_amount = 0;
					// 	return p;
					// });
				})
			},
			async productTotalQty(ind) {

				if (parseInt(this.cart[ind].net_weight) > parseInt(this.cart[ind].quantity)) {
					alert('quantity exceed');
					this.cart[ind].net_weight = this.cart[ind].quantity;
					$("#" + [ind]).val(this.cart[ind].quantity)
					return
				}

				this.totalQty = this.cart.reduce((prev, curr) => {
					return +prev + +curr.net_weight
				}, 0)
			},
			saveNetWeightQty() {

				if (this.cart.length == 0) {
					alert('No products to return');
					return;
				}

				if (this.receiveDate == null || this.receiveDate == '') {
					alert('Enter date');
					return;
				}

				let data = {
					date: this.receiveDate,
					cart: this.cart
				}

				// console.log(data);
				// return
				axios.post('save_material_purchase_net_weight', data).then(async res => {
					let r = res.data;
					alert(r.message);
					if (r.success) {
						this.getPurchases();
						this.selectedInvoice = null;
						this.cart = [];
						this.totalQty = 0;
						// window.location = '/material_net_weight';
					}
				})
			},


		}
	})
</script>