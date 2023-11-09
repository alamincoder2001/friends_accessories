const jobcardInvoice = Vue.component("jobcard-invoice", {
  template: `
        <div>
            <div class="row">
                <div class="col-xs-12">
                    <a href="" v-on:click.prevent="print"><i class="fa fa-print"></i> Print</a>
                </div>
            </div>
            
            <div id="invoiceContent">
                <table _a584de style="width: 100%;">
                    <tbody>
                        <tr>
                            <td>Job Card No:</td>
                            <td colspan="3" style="width: 350px;">{{sales.JobcardNo}}</td>
                            <td>Date:</td>
                            <td colspan="4" style="width: 350px;">{{sales.JobDate}}</td>
                        </tr>
            
                        <tr>
                            <td>Mail Ref No:</td>
                            <td colspan="8"></td>
                        </tr>
                        <tr>
                            <td>Comp. Name:</td>
                            <td colspan="8">{{sales.Company_Name}}</td>
                        </tr>
                        <tr>
                            <td>Buyer:</td>
                            <td colspan="8">{{sales.Customer_Name}}</td>
                        </tr>
                        <tr>
                            <td colspan="9" class="p-3"></td>
                        </tr>
                        <tr>
                            <td style="width: 15%;">PO/Booking No:</td>
                            <td style="width: 35%;"> {{sales.PONo}} </td>
                            <td style="width: 5%;"></td>
                            <td style="width: 5%;"></td>
                            <td style="width: 5%;"></td>
                            <td style="width: 5%;"></td>
                            <td style="width: 40%;" colspan="3"></td>
                        </tr>
                        <tr>
                            <td style="width: 15%;">Product Name</td>
                            <td style="width: 10%;"></td>
                            <td style="width: 75%;" colspan="7">
                                <span v-for="(item, sl) in cart">
                                    {{item.Product_Name}},
                                </span>
                            </td>
                        </tr>
            
                        <tr>
                            <td colspan="2">PO Sheet/Customer Details:</td>
                            <td colspan="7">{{sales.Customer_Name}}</td>
                        </tr>
                        <tr>
                            <td colspan="9" class="p-3"></td>
                        </tr>
                        <tr>
                            <td colspan="2">Goods Details:</td>
                            <td colspan="7">300 GSM ART CARD:</td>
                        </tr>
                        <tr>
                            <td colspan="2">Worker Order:</td>
                            <td colspan="7"></td>
                        </tr>
                        <tr>
                            <td colspan="9" class="p-3"></td>
                        </tr>
                        <tr>
                            <td colspan="2">Order/Style:</td>
                            <td colspan="7">E183999</td>
                        </tr>
                        <tr>
                            <td colspan="9" class="p-3"></td>
                        </tr>
            
                        <tr>
                            <td rowspan="2" class="text-center pt-4">Order Quantity</td>
                            <td>QTY</td>
                            <td>UNIT</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>{{cart.reduce((pre, curr) => {return pre +parseFloat(curr.SaleDetails_TotalQuantity)},0).toFixed(2)}}</td>
                            <td>PCS</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td colspan="3"></td>
                        </tr>
            
            
                        <tr>
                            <td class="text-center" rowspan="1">Settings</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
            
                        <tr>
                            <td>Paper cutting size</td>
                            <td colspan="4"></td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td>RAW Materials</td>
                            <td></td>
                            <td>SHEET</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Wastage</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">TOTAL REQUIRED QTY</td>
                            <td></td>
                            <td>SHEET</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
            
                        <!--=========== row span 4 =================================== -->
                        <tr>
                            <td rowspan="4" class="text-center pt-4">Printed colour</td>
                            <td colspan="3"></td>
                            <td></td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="3"></td>
                            <td></td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="3"></td>
                            <td></td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="3"></td>
                            <td></td>
                            <td colspan="4"></td>
                        </tr>
                        <!--=========== end row span 4 =================================== -->
                        <tr>
                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <td colspan="9"></td>
                        </tr>
            
                        <tr>
                            <td colspan="2">Purchaged Price: Unit Rate:</td>
                            <td> </td>
                            <td> Qty: </td>
                            <td></td>
                            <td colspan="4">TOTAL PRICE: </td>
                        </tr>
            
                        <tr>
                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <td colspan="9"></td>
                        </tr>
            
                        <tr>
                            <td>Note/Remarks:</td>
                            <td></td>
                            <td colspan="7"></td>
                        </tr>
                        <tr>
                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <td colspan="9"></td>
                        </tr>
                        <tr style="border-bottom: 1px solid white;">
                            <td style="border-right: 1px solid white;">Supervised By</td>
                            <td colspan="5" style="border-right: 1px solid white;"></td>
                            <td colspan="2" style="border-right: 1px solid white;">
                                <p style="margin: 0;">Demanded By</p>
                                <p style="margin: 0;">Production Team</p>
                            </td>
                            <td style="padding-right: 45px;">APPROVED</td>
                        </tr>
                        <tr>
                            <td colspan="6" class="pb-4" style="text-align: end; border-right: 1px solid white;">Sign:
                            </td>
                            <td colspan="3"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    `,
  props: ["jobcard_id"],
  data() {
    return {
      sales: {
        SaleMaster_InvoiceNo: null,
        SalseCustomer_IDNo: null,
        SaleMaster_SaleDate: null,
        Customer_Name: null,
        Customer_Address: null,
        Customer_Mobile: null,
        SaleMaster_TotalSaleAmount: null,
        SaleMaster_TotalDiscountAmount: null,
        SaleMaster_TaxAmount: null,
        SaleMaster_Freight: null,
        SaleMaster_SubTotalAmount: null,
        SaleMaster_PaidAmount: null,
        SaleMaster_DueAmount: null,
        SaleMaster_Previous_Due: null,
        SaleMaster_Description: null,
        AddBy: null,
      },
      cart: [],
      style: null,
      companyProfile: null,
      currentBranch: null,
    };
  },
  filters: {
    formatDateTime(dt, format) {
      return dt == "" || dt == null ? "" : moment(dt).format(format);
    },
  },
  created() {
    this.setStyle();
    this.getSales();
    this.getCurrentBranch();
  },
  methods: {
    getSales() {
      axios.post("/get_jobcard", { salesId: this.jobcard_id }).then((res) => {
        this.sales = res.data.jobcard[0];
        this.cart = res.data.jobDetails;
      });
    },
    getCurrentBranch() {
      axios.get("/get_current_branch").then((res) => {
        this.currentBranch = res.data;
      });
    },
    setStyle() {
      this.style = document.createElement("style");
      this.style.innerHTML = `
                table[_a584de]{
                    width: 100%;
                }
                table[_a584de]>tbody>tr>td{
                    padding: 0.8rem 0.3rem;
                    border: 1px solid black;
                    font-size: 9px;
                    line-height:0.7;
                }
                
            `;
      document.head.appendChild(this.style);
    },
    async print() {
      let invoiceContent = document.querySelector("#invoiceContent").innerHTML;
      let printWindow = window.open(
        "",
        "PRINT",
        `width=${screen.width}, height=${screen.height}, left=0, top=0`
      );

      printWindow.document.write(`
                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <meta http-equiv="X-UA-Compatible" content="ie=edge">
                        <title>Invoice</title>
                        <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
                        <style>
                            @media print {
                                table>:not(caption)>*>* {
                                    line-height: 1 !important;
                                }
                            }
                        </style>
                    </head>
                    <body>
                        <div class="container">
                            <table style="width:100%;">
                                <thead>
                                    <tr>
                                        <td>
                                            <div class="row">
                                                <div class="col-xs-12" style="padding-top:20px;text-align:center;">
                                                    <img src="/uploads/company_profile_org/${this.currentBranch.Company_Logo_org}" alt="Logo" style="height:80px;width:auto" /><br />
                                                    <strong style="font-size:18px;">${this.currentBranch.Company_Name}</strong><br>
                                                    <p style="white-space:pre-line;">${this.currentBranch.Repot_Heading}</p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    ${invoiceContent}
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                    </body>
                    </html>
				`);
      let invoiceStyle = printWindow.document.createElement("style");
      invoiceStyle.innerHTML = this.style.innerHTML;
      printWindow.document.head.appendChild(invoiceStyle);
      printWindow.moveTo(0, 0);

      printWindow.focus();
      await new Promise((resolve) => setTimeout(resolve, 1000));
      printWindow.print();
      printWindow.close();
    },
  },
});
