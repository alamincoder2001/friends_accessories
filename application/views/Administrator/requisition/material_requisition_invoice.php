<div id="materialRequisitionInvoice">
    <div style="display:none;" v-bind:style="{display: requisition.requisition_id == 'undefined' ? 'none' : ''}">
        <div class="row">
            <div class="col-md-12" style="margin-bottom: 10px;">
                <a href="" @click.prevent="print"><i class="fa fa-print"></i> Print</a>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div id="invoiceContent">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="heading">Requisition Invoice</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-6">
                            <table class="info-table">
                                <tr>
                                    <td>Employee Id</td>
                                    <td>&nbsp;:&nbsp;</td>
                                    <td>{{ requisition.employee_code }}</td>
                                </tr>
                                <tr>
                                    <td>Employee Name</td>
                                    <td>&nbsp;:&nbsp;</td>
                                    <td>{{ requisition.employee_name }}</td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td>&nbsp;:&nbsp;</td>
                                    <td>{{ requisition.employee_address }}</td>
                                </tr>
                                <tr>
                                    <td>Mobile</td>
                                    <td>&nbsp;:&nbsp;</td>
                                    <td>{{ requisition.employee_mobile }}</td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-xs-4 col-xs-offset-2">
                            <table class="info-table">
                                <tr>
                                    <td>Invoice</td>
                                    <td>&nbsp;:&nbsp;</td>
                                    <td>{{ requisition.requisition_invoice }}</td>
                                </tr>
                                <tr>
                                    <td>Date</td>
                                    <td>&nbsp;:&nbsp;</td>
                                    <td>{{ requisition.requisition_date }}</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-12">
                            <table class="details-table">
                                <tr>
                                    <td>Sl</td>
                                    <td>Code</td>
                                    <td>Material Name</td>
                                    <td>Quantity</td>
                                </tr>
                                <tr v-for="(material, sl) in requisitionDetails">
                                    <td style="text-align:center;">{{ sl + 1 }}</td>
                                    <td style="text-align:left;">{{ material.code }}</td>
                                    <td style="text-align:left;">{{ material.name }}</td>
                                    <td style="text-align:right;">{{ material.quantity }} {{ material.unit_name }}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <strong>Note: </strong>{{ requisition.note }}
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

<script>
    new Vue({
        el: '#materialRequisitionInvoice',
        data() {
            return {
                requisitionId: parseInt("<?php echo $requisitionId; ?>"),
                requisition: {},
                requisitionDetails: [],
                style: null
            }
        },
        created() {
            this.setStyle();
            this.getPurchase();
            this.getPurchaseDetails();
        },
        methods: {
            setStyle() {
                this.style = `
                    <style>
                    .heading {
                        padding: 5px;
                        font-weight: bold;
                        font-size: 16px;
                        text-align: center;
                        border-top: 1px dotted #454545;
                        border-bottom: 1px dotted #454545;
                    }
                    .info-table, .details-table, .bottom-table {
                        margin:5px 0!important;
                        width: 100%;
                    }
                    .info-table tr td:first-child {
                        font-weight: bold;
                    }
                    .line {
                        border-bottom: 1px dotted #454545;
                    }
                    .details-table td {
                        border: 1px solid #a0a0a0;
                        padding: 3px 8px;
                    }
                    .details-table tr:first-child td{
                        font-weight:bold;
                        text-align:center;
                    }
                    .bottom-table td {
                        padding: 2px 0;
                    }
                    .bottom-table td:last-child {
                        text-align: right;
                        padding-right: 9px;
                    }
                    </style>
                `;

                document.head.innerHTML += this.style;
            },

            getPurchase() {
                axios.post('/get_material_requisition', {
                    requisition_id: this.requisitionId
                }).then(res => {
                    this.requisition = res.data.requisitions[0];
                })
            },

            getPurchaseDetails() {
                axios.post('/get_material_requisition_details', {
                    requisition_id: this.requisitionId
                }).then(res => {
                    this.requisitionDetails = res.data;
                })
            },

            async print() {
                let invoiceContent = `
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								${document.querySelector('#invoiceContent').innerHTML}
							</div>
						</div>
					</div>
				`;

                var reportWindow = window.open('', 'PRINT', `height=${screen.height}, width=${screen.width}`);
                reportWindow.document.write(`
					<?php $this->load->view('Administrator/reports/reportHeader.php'); ?>
				`);

                reportWindow.document.head.innerHTML += this.style;

                reportWindow.document.body.innerHTML += invoiceContent;

                reportWindow.focus();
                await new Promise(resolve => setTimeout(resolve, 1000));
                reportWindow.print();
                reportWindow.close();
            },

            convertNumberToWords(amountToWord) {
                var words = new Array();
                words[0] = '';
                words[1] = 'One';
                words[2] = 'Two';
                words[3] = 'Three';
                words[4] = 'Four';
                words[5] = 'Five';
                words[6] = 'Six';
                words[7] = 'Seven';
                words[8] = 'Eight';
                words[9] = 'Nine';
                words[10] = 'Ten';
                words[11] = 'Eleven';
                words[12] = 'Twelve';
                words[13] = 'Thirteen';
                words[14] = 'Fourteen';
                words[15] = 'Fifteen';
                words[16] = 'Sixteen';
                words[17] = 'Seventeen';
                words[18] = 'Eighteen';
                words[19] = 'Nineteen';
                words[20] = 'Twenty';
                words[30] = 'Thirty';
                words[40] = 'Forty';
                words[50] = 'Fifty';
                words[60] = 'Sixty';
                words[70] = 'Seventy';
                words[80] = 'Eighty';
                words[90] = 'Ninety';
                amount = amountToWord == null ? '0.00' : amountToWord.toString();
                var atemp = amount.split(".");
                var number = atemp[0].split(",").join("");
                var n_length = number.length;
                var words_string = "";
                if (n_length <= 9) {
                    var n_array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
                    var received_n_array = new Array();
                    for (var i = 0; i < n_length; i++) {
                        received_n_array[i] = number.substr(i, 1);
                    }
                    for (var i = 9 - n_length, j = 0; i < 9; i++, j++) {
                        n_array[i] = received_n_array[j];
                    }
                    for (var i = 0, j = 1; i < 9; i++, j++) {
                        if (i == 0 || i == 2 || i == 4 || i == 7) {
                            if (n_array[i] == 1) {
                                n_array[j] = 10 + parseInt(n_array[j]);
                                n_array[i] = 0;
                            }
                        }
                    }
                    value = "";
                    for (var i = 0; i < 9; i++) {
                        if (i == 0 || i == 2 || i == 4 || i == 7) {
                            value = n_array[i] * 10;
                        } else {
                            value = n_array[i];
                        }
                        if (value != 0) {
                            words_string += words[value] + " ";
                        }
                        if ((i == 1 && value != 0) || (i == 0 && value != 0 && n_array[i + 1] == 0)) {
                            words_string += "Crores ";
                        }
                        if ((i == 3 && value != 0) || (i == 2 && value != 0 && n_array[i + 1] == 0)) {
                            words_string += "Lakhs ";
                        }
                        if ((i == 5 && value != 0) || (i == 4 && value != 0 && n_array[i + 1] == 0)) {
                            words_string += "Thousand ";
                        }
                        if (i == 6 && value != 0 && (n_array[i + 1] != 0 && n_array[i + 2] != 0)) {
                            words_string += "Hundred and ";
                        } else if (i == 6 && value != 0) {
                            words_string += "Hundred ";
                        }
                    }
                    words_string = words_string.split("  ").join(" ");
                }
                return words_string + ' only';
            }
        }
    })
</script>