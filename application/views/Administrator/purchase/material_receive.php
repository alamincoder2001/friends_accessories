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
				<strong>Supplier Name: </strong>{{ selectedInvoice.supplier_name }}<br>
				<strong>Address: </strong>{{ selectedInvoice.supplier_address }}<br>
				<strong>Mobile: </strong>{{ selectedInvoice.supplier_mobile }}<br>
			</div>
			<div class="col-md-6">
				<div class="row">
					<label class="col-md-3" style="font-weight:bold">Purchase Date:</label>
					<label class="col-md-6" for="">{{ selectedInvoice.purchase_date }}</label>
				</div>
				<div class="row">
					<label class="col-md-3" style="font-weight:bold">MRR:</label>
					<label class="col-md-6" for="">
						<input v-model="selectedInvoice.MRR_No" placeholder="MRR No" type="text" style="width:140px;height: 25px;">
					</label>
				</div>
				<div class="row">
					<label class="col-md-3" style="font-weight:bold">Receive Date:</label>
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
						<th>Already Received quantity</th>
						<th>Receive Quantity</th>
						<th>purchase Rate</th>
						<th>Receive Total</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(product, sl) in cart">
						<td>{{ sl + 1 }}</td>
						<td>{{ product.code }}</td>
						<td>{{ product.name }}</td>
						<td>{{ product.category_name }}</td>
						<td>{{ product.quantity }} {{ product.unit_name}}</td>
						<td>{{ product.total }}</td>
						<td>{{ product.already_received_quantity }}</td>
						<td v-if="product.due_qty > 0">
							<input style="text-align: center;" type="text" :id="sl" v-model="product.receive_quantity" v-on:input="productTotalQty(sl)">
						</td>
						<td v-else>
							<input style="text-align: center;" type="text" readonly>
						</td>
						<td>{{ product.purchase_rate }}</td>
						<td>{{ product.total_amount }}</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<!-- <td colspan="5" style="text-align:right;padding-top:15px;">Note</td>
						<td colspan="2">
							<textarea style="width: 100%" v-model="purchaseReturn.note"></textarea>
						</td> -->
						<td colspan="6"></td>
						<td>
							<button class="btn btn-success" style="width:120px;" v-on:click.prevent="savePurchaseQty">Save</button>
						</td>
						<td style="font-size: 20px;font-weight:600">Total: {{ totalQty }}</td>
						<td></td>
						<td style="font-size: 20px;font-weight:600">Total: {{ totalTaka }}</td>
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
				totalTaka: 0,
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
				axios.get('/get_material_challan').then(res => {
					this.invoices = res.data;
				})
			},
			async getPurchaseDetails() {
				if (this.selectedInvoice == null) {
					alert('Select invoice');
					return;
				}
				await axios.post('/get_material_challan_details', {
					// purchaseId: this.selectedInvoice.purchase_id,
					purchaseInvoice: this.selectedInvoice.invoice_no
				}).then(res => {
					this.cart = res.data;
					this.cart = res.data.map(p => {
						p.receive_quantity = '';
						p.total_amount = 0;
						return p;
					});
				})
			},
			async productTotalQty(ind) {

				if (parseInt(this.cart[ind].receive_quantity) > parseInt(this.cart[ind].due_qty)) {
					alert('received quantity exceed');
					this.cart[ind].receive_quantity = this.cart[ind].due_qty;
					$("#" + [ind]).val(this.cart[ind].due_qty)
					return
				}
				this.cart[ind].total_amount = parseFloat(+this.cart[ind].purchase_rate * +this.cart[ind].receive_quantity).toFixed(2);

				this.totalQty = this.cart.reduce((prev, curr) => {
					return +prev + +curr.receive_quantity
				}, 0)

				this.totalTaka = this.cart.reduce((prev, curr) => {
					return +prev + +curr.total_amount
				}, 0)
			},
			savePurchaseQty() {
				// let filteredCart = this.cart.filter(product => product.receive_quantity > 0);

				if (this.cart.length == 0) {
					alert('No products to return');
					return;
				}

				if (this.receiveDate == null || this.receiveDate == '') {
					alert('Enter receive date');
					return;
				}
				if (this.selectedInvoice.MRR_No == '' || this.selectedInvoice.MRR_No == null) {
					alert('Enter MRR No');
					return;
				}

				let data = {
					invoice: this.selectedInvoice,
					date: this.receiveDate,
					totalTaka: this.totalTaka,
					cart: this.cart
				}

				// console.log(data);
				// return
				axios.post('receive_material_challan', data).then(async res => {
					let r = res.data;
					alert(r.message);
					if (r.success) {
						window.location = '/material_receive';
					}
				})
			},


		}
	})
</script>