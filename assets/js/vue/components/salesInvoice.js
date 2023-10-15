const salesInvoice = Vue.component("sales-invoice", {
  template: `
        <div>
            <div class="row">
                <div class="col-xs-12">
                    <a href="" v-on:click.prevent="print"><i class="fa fa-print"></i> Print</a>
                </div>
            </div>
            
            <div id="invoiceContent">
                <div class="row">
                    <div class="col-xs-12 text-center">
                        <div _h098asdh>
                            Purchase Order Invoice
                        </div>
                    </div>
                </div>
                <div class="row companyDetail">
                    <div class="col-xs-2">
                        <strong>Supplier:</strong> {{currentBranch.Company_Name}}
                    </div>
                    <div class="col-xs-3">
                        <ul style="margin: 0;list-style: none;position: relative;">
                            <li style="margin-left:55px;"><strong style="position: absolute;top: 0;left: 0;">Delivery:</strong> {{sales.Company_Name}} {{sales.Company_Mobile}}
                            <br/>{{sales.Company_Address}}</li>
                        </ul>
                    </div>
                    <div class="col-xs-3">
                        <ul style="margin: 0;list-style: none;position: relative;">
                            <li style="margin-left:25px;">
                                <strong style="position: absolute;top: 0;left: 0;">Bill:</strong>
                                {{sales.Customer_Name}} {{sales.Customer_Mobile}}
                                <br/>{{sales.Customer_Address}}
                            </li>
                        </ul>
                    </div>
                    <div class="col-xs-2" style="padding-right:0;">
                        <strong>Contract No:</strong> {{sales.contract_no}}<br/>
                    </div>
                    <div class="col-xs-2">
                        <strong>PO No:</strong> {{sales.PONo}}<br />
                        <strong>PO Date:</strong> {{moment(sales.SaleMaster_SaleDate).format('DD-MM-YYYY')}}
                    </div>
                </div>
                <div v-for="(item, index) in cart" v-if="cart.length > 0">
                    <div class="row" style="margin-top:10px;">
                        <div class="col-xs-3">
                            <div class="row">
                                <div class="col-xs-6" style="padding-right:0;">
                                    <strong>Supp Mat Code:</strong>
                                </div>
                                <div class="col-xs-6" :style="{borderBottom: item.Item_Code ? '1px solid gray': ''}">
                                    <span>{{item.Item_Code}}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="row">
                                <div class="col-xs-5" style="padding-right:0;">
                                    <strong>Ship Date:</strong>
                                </div>
                                <div class="col-xs-7" :style="{borderBottom: item.ship_date ? '1px solid gray': ''}">
                                    <span>{{item.ship_date}}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="row">
                                <div class="col-xs-5" style="padding-right:0;">
                                    <strong>Prod/Subprocess:</strong>
                                </div>
                                <div class="col-xs-7" :style="{borderBottom: item.ProductCategory_Name ? '1px solid gray': ''}">
                                    <span>{{item.ProductCategory_Name}}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class="row">
                                <div class="col-xs-6" style="padding-right:0;">
                                    <strong>Unit/Price:</strong>
                                </div>
                                <div class="col-xs-6" :style="{borderBottom: item.SaleDetails_Rate ? '1px solid gray': ''}">
                                    <span>{{item.SaleDetails_Rate}}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px;">
                        <div class="col-xs-2">
                            <div class="row">
                                <div class="col-xs-6" style="padding-right:0;">
                                    <strong>Amount:</strong>
                                </div>
                                <div class="col-xs-6" :style="{borderBottom: item.SaleDetails_TotalAmount ? '1px solid gray': ''}">
                                    <span>{{item.SaleDetails_TotalAmount}}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="row">
                                <div class="col-xs-5" style="padding-right:0;">
                                    <strong>Contract No:</strong>
                                </div>
                                <div class="col-xs-7" :style="{borderBottom: item.contract_no ? '1px solid gray': ''}">
                                    <span>{{item.contract_no}}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="row">
                                <div class="col-xs-4" style="padding-right:0;">
                                    <strong>Description:</strong>
                                </div>
                                <div class="col-xs-8" :style="{borderBottom: item.Product_Name ? '1px solid gray': ''}">
                                    <span>{{item.Product_Name}}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="row">
                                <div class="col-xs-4">
                                    <strong>Remark:</strong>
                                </div>
                                <div class="col-xs-8" style="padding-left:0;"  :style="{borderBottom: item.remark ? '1px solid gray': ''}">
                                    <span>{{item.remark}}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px;">
                        <div class="col-xs-12">
                            <table style="width:100%;" border="1" cellspacing="0" cellspadding="0">
                                <tr style="text-align:center;">
                                    <td style="width:10%;height:20px;"></td>
                                    <td style="width:10%;height:20px;"></td>
                                    <td style="width:10%;height:20px;"></td>
                                    <td style="width:10%;height:20px;"></td>
                                    <td style="width:10%;height:20px;"></td>
                                    <td style="width:10%;height:20px;"></td>
                                    <td style="width:10%;height:20px;"></td>
                                    <td style="width:10%;height:20px;"></td>
                                    <td style="width:10%;height:20px;"></td>
                                    <td style="width:10%;height:20px;"></td>
                                </tr>
                                <tr>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                </tr>
                                <tr>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                </tr>
                                <tr>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                </tr>
                                <tr>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                </tr>
                                <tr>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                    <td style="height:20px;"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `,
  props: ["sales_id"],
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
      axios.post("/get_sales", { salesId: this.sales_id }).then((res) => {
        this.sales = res.data.sales[0];
        this.cart = res.data.saleDetails;
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
                #invoiceContent{
                    font-size:12px;
                }
                div[_h098asdh]{
                    /*background-color:#e0e0e0;*/
                    font-weight: bold;
                    font-size:15px;
                    margin-bottom:15px;
                    padding: 5px;
                    border-top: 1px dotted black;
                    border-bottom: 1px dotted black;
                }
                div[_d9283dsc]{
                    padding-bottom:25px;
                    border-bottom: 1px solid black;
                    margin-bottom: 15px;
                }
                table[_a584de]{
                    width: 100%;
                    text-align:center;
                }
                table[_a584de] thead{
                    font-weight:bold;
                }
                table[_a584de] td{
                    padding: 3px;
                    border: 1px solid black;
                }
                table[_t92sadbc2]{
                    width: 100%;
                }
                table[_t92sadbc2] td{
                    padding: 2px;
                }
            `;
      document.head.appendChild(this.style);
    },
    convertNumberToWords(amountToWord) {
      var words = new Array();
      words[0] = "";
      words[1] = "One";
      words[2] = "Two";
      words[3] = "Three";
      words[4] = "Four";
      words[5] = "Five";
      words[6] = "Six";
      words[7] = "Seven";
      words[8] = "Eight";
      words[9] = "Nine";
      words[10] = "Ten";
      words[11] = "Eleven";
      words[12] = "Twelve";
      words[13] = "Thirteen";
      words[14] = "Fourteen";
      words[15] = "Fifteen";
      words[16] = "Sixteen";
      words[17] = "Seventeen";
      words[18] = "Eighteen";
      words[19] = "Nineteen";
      words[20] = "Twenty";
      words[30] = "Thirty";
      words[40] = "Forty";
      words[50] = "Fifty";
      words[60] = "Sixty";
      words[70] = "Seventy";
      words[80] = "Eighty";
      words[90] = "Ninety";
      amount = amountToWord == null ? "0.00" : amountToWord.toString();
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
          if (
            (i == 1 && value != 0) ||
            (i == 0 && value != 0 && n_array[i + 1] == 0)
          ) {
            words_string += "Crores ";
          }
          if (
            (i == 3 && value != 0) ||
            (i == 2 && value != 0 && n_array[i + 1] == 0)
          ) {
            words_string += "Lakhs ";
          }
          if (
            (i == 5 && value != 0) ||
            (i == 4 && value != 0 && n_array[i + 1] == 0)
          ) {
            words_string += "Thousand ";
          }
          if (
            i == 6 &&
            value != 0 &&
            n_array[i + 1] != 0 &&
            n_array[i + 2] != 0
          ) {
            words_string += "Hundred and ";
          } else if (i == 6 && value != 0) {
            words_string += "Hundred ";
          }
        }
        words_string = words_string.split("  ").join(" ");
      }
      return words_string + " only";
    },
    async print() {
      let invoiceContent = document.querySelector("#invoiceContent").innerHTML;
      let printWindow = window.open(
        "",
        "PRINT",
        `width=${screen.width}, height=${screen.height}, left=0, top=0`
      );
      if (this.currentBranch.print_type == "3") {
        printWindow.document.write(`
                    <html>
                        <head>
                            <title>Invoice</title>
                            <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
                            <style>
                                body, table{
                                    font-size:11px;
                                }
                            </style>
                        </head>
                        <body>
                            <div style="text-align:center;">
                                <img src="/uploads/company_profile_org/${this.currentBranch.Company_Logo_org}" alt="Logo" style="height:80px;margin:0px;" /><br>
                                <strong style="font-size:18px;">${this.currentBranch.Company_Name}</strong><br>
                                <p style="white-space:pre-line;">${this.currentBranch.Repot_Heading}</p>
                            </div>
                            ${invoiceContent}
                        </body>
                    </html>
                `);
      } else if (this.currentBranch.print_type == "2") {
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
                            html, body{
                                width:500px!important;
                            }
                            body, table{
                                font-size: 13px;
                            }
                        </style>
                    </head>
                    <body>
                        <div class="row">
                            <div class="col-xs-5"><img src="/uploads/company_profile_org/${this.currentBranch.Company_Logo_org}" alt="Logo" style="height:80px;width:auto" /></div>
                            <div class="col-xs-7" style="padding-top:20px;">
                                <strong style="font-size:18px;">${this.currentBranch.Company_Name}</strong><br>
                                <p style="white-space:pre-line;">${this.currentBranch.Repot_Heading}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div style="border-bottom: 4px double #454545;margin-top:7px;margin-bottom:7px;"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                ${invoiceContent}
                            </div>
                        </div>
                    </body>
                    </html>
				`);
      } else {
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
                            body, table{
                                font-size: 13px;
                            }
                            @page {
                                size: A4 landscape;
                            }
                        </style>
                    </head>
                    <body>
                        <table style="width:100%;">
                            <thead>
                                <tr>
                                    <td style="height:85px;">
                                        <div style="position:absolute;top:0;width:100%;display:flex;align-items:center;" class="row">
                                            <div class="col-xs-1" style="padding-right:0;">
                                                <img src="/uploads/company_profile_org/${
                                                    this.currentBranch.Company_Logo_org}" alt="Logo" style="height:80px;width:auto" />
                                            </div>
                                            <div class="col-xs-11">
                                                <strong style="font-size:18px;">${
                                                    this.currentBranch
                                                    .Company_Name
                                                }</strong><br>
                                                <p style="white-space:pre-line;">${
                                                    this.currentBranch
                                                    .Repot_Heading
                                                }</p>
                                            </div>
                                        </div>
                                        <!--<div class="row">
                                            <div class="col-xs-12">
                                                <div style="border-bottom: 4px double #454545;margin-top:7px;margin-bottom:7px;"></div>
                                            </div>
                                        </div>-->
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
                            <tfoot>
                                <tr>
                                    <td>
                                        <div style="width:100%;height:50px;">&nbsp;</div>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>                        
                    </body>
                    </html>
				`);
      }
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
