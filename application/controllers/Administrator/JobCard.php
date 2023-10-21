<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class JobCard extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->sbrunch = $this->session->userdata('BRANCHid');
        $access = $this->session->userdata('userId');
        if ($access == '') {
            redirect("Login");
        }
        $this->load->model('Billing_model');
        $this->load->library('cart');
        $this->load->model('Model_table', "mt", TRUE);
        $this->load->helper('form');
        $this->load->model('SMS_model', 'sms', true);
    }

    public function index()
    {
        $access = $this->mt->userAccess();
        if (!$access) {
            redirect(base_url());
        }
        $data['title'] = "JobCard Entry";

        $invoice = $this->mt->generateJobCardInvoice();

        $data['jobcardId'] = 0;
        $data['invoice'] = $invoice;
        $data['content'] = $this->load->view('Administrator/jobcard/jobcard_entry', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }

    public function addJobCard()
    {
        $res = ['success' => false, 'message' => ''];
        try {
            $data = json_decode($this->input->raw_input_stream);

            $invoice = $data->sales->invoiceNo;
            $invoiceCount = $this->db->query("select * from tbl_jobcardmaster where JobcardNo = ?", $invoice)->num_rows();
            if ($invoiceCount != 0) {
                $invoice = $this->mt->generateSalesInvoice();
            }

            $customerId = $data->sales->customerId;

            $sales = array(
                'JobcardNo'          => $invoice,
                'Customer_Id'        => $customerId,
                'WorkOrderId'        => $customerId,
                'employeeId'         => $data->sales->employeeId,
                'JobDate'            => $data->sales->salesDate,
                'totalAmount'        => $data->sales->total,
                'discount'           => $data->sales->discount,
                'Job_Freight'        => $data->sales->transportCost,
                'subTotal'           => $data->sales->subTotal,
                'JobCard_PaidAmount' => $data->sales->paid,
                'due'                => $data->sales->due,
                'Previous_Due'       => $data->sales->previousDue,
                'note'               => $data->sales->note,
                'Status'             => 'a',
                "AddBy"              => $this->session->userdata("FullName"),
                'AddTime'            => date("Y-m-d H:i:s"),
                'Job_branchId'       => $this->session->userdata("BRANCHid"),
            );

            $this->db->insert('tbl_jobcardmaster', $sales);

            $jobcardId = $this->db->insert_id();

            foreach ($data->cart as $cartProduct) {
                $saleDetails = array(
                    'JobCardMaster_IDNo'        => $jobcardId,
                    'Product_IDNo'              => $cartProduct->productId,
                    'SaleDetails_TotalQuantity' => $cartProduct->quantity,
                    'Purchase_Rate'             => $cartProduct->purchaseRate,
                    'SaleDetails_Rate'          => $cartProduct->salesRate,
                    'SaleDetails_Tax'           => $cartProduct->vat,
                    'SaleDetails_TotalAmount'   => $cartProduct->total,
                    'Status'                    => 'a',
                    'AddBy'                     => $this->session->userdata("FullName"),
                    'AddTime'                   => date('Y-m-d H:i:s'),
                    'SaleDetails_BranchId'      => $this->session->userdata('BRANCHid')
                );

                $this->db->insert('tbl_jobcarddetails', $saleDetails);

                //update stock
                // $this->db->query("
                //     update tbl_currentinventory 
                //     set sales_quantity = sales_quantity + ? 
                //     where product_id = ?
                //     and branch_id = ?
                // ", [$cartProduct->quantity, $cartProduct->productId, $this->session->userdata('BRANCHid')]);
            }
            //Send sms
            // $currentDue = $data->sales->previousDue + ($data->sales->total - $data->sales->paid);
            // $customerInfo = $this->db->query("select * from tbl_customer where Customer_SlNo = ?", $customerId)->row();
            // $sendToName = $customerInfo->owner_name != '' ? $customerInfo->owner_name : $customerInfo->Customer_Name;
            // $currency = $this->session->userdata('Currency_Name');

            // $message = "Dear {$sendToName},\nYour bill is {$currency} {$data->sales->total}. Received {$currency} {$data->sales->paid} and current due is {$currency} {$currentDue} for invoice {$invoice}";
            // $recipient = $customerInfo->Customer_Mobile;
            // $this->sms->sendSms($recipient, $message);

            $res = ['success' => true, 'message' => 'Jobcard add Success', 'jobcardId' => $jobcardId];
        } catch (Exception $ex) {
            $res = ['success' => false, 'message' => $ex->getMessage()];
        }

        echo json_encode($res);
    }

    public function jobcardEdit($jobcardId)
    {
        $data['title'] = "Jobcard update";
        $sales = $this->db->query("select * from tbl_jobcardmaster where id = ?", $jobcardId)->row();
        $data['jobcardId'] = $jobcardId;
        $data['invoice'] = $sales->JobcardNo;
        $data['content'] = $this->load->view('Administrator/jobcard/jobcard_entry', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }

    public function getJobCardRecord()
    {
        $data = json_decode($this->input->raw_input_stream);
        $branchId = $this->session->userdata("BRANCHid");
        $clauses = "";
        if (isset($data->dateFrom) && $data->dateFrom != '' && isset($data->dateTo) && $data->dateTo != '') {
            $clauses .= " and sm.JobDate between '$data->dateFrom' and '$data->dateTo'";
        }

        if (isset($data->userFullName) && $data->userFullName != '') {
            $clauses .= " and sm.AddBy = '$data->userFullName'";
        }

        if (isset($data->customerId) && $data->customerId != '') {
            $clauses .= " and sm.Customer_Id = '$data->customerId'";
        }

        if (isset($data->employeeId) && $data->employeeId != '') {
            $clauses .= " and sm.employeeId = '$data->employeeId'";
        }

        $sales = $this->db->query("
            select 
                sm.*,
                c.Customer_Code,
                c.Customer_Name,
                c.Customer_Mobile,
                c.Customer_Address,
                e.Employee_Name,
                br.Brunch_name
            from tbl_jobcardmaster sm
            left join tbl_customer c on c.Customer_SlNo = sm.Customer_Id
            left join tbl_employee e on e.Employee_SlNo = sm.employeeId
            left join tbl_brunch br on br.brunch_id = sm.Job_branchId
            where sm.Job_branchId = '$branchId'
            and sm.Status != 'd'
            $clauses
            order by sm.id desc
        ")->result();

        foreach ($sales as $sale) {
            $sale->saleDetails = $this->db->query("
                select 
                    sd.*,
                    p.Product_Name,
                    pc.ProductCategory_Name
                from tbl_jobcarddetails sd
                join tbl_product p on p.Product_SlNo = sd.Product_IDNo
                join tbl_productcategory pc on pc.ProductCategory_SlNo = p.ProductCategory_ID
                where sd.JobCardMaster_IDNo = ?
                and sd.Status != 'd'
            ", $sale->id)->result();
        }

        echo json_encode($sales);
    }

    public function getJobCard()
    {
        $data = json_decode($this->input->raw_input_stream);
        $branchId = $this->session->userdata("BRANCHid");

        $clauses = "";
        if (isset($data->dateFrom) && $data->dateFrom != '' && isset($data->dateTo) && $data->dateTo != '') {
            $clauses .= " and sm.JobDate between '$data->dateFrom' and '$data->dateTo'";
        }

        if (isset($data->userFullName) && $data->userFullName != '') {
            $clauses .= " and sm.AddBy = '$data->userFullName'";
        }

        if (isset($data->customerId) && $data->customerId != '') {
            $clauses .= " and sm.Customer_Id = '$data->customerId'";
        }

        if (isset($data->employeeId) && $data->employeeId != '') {
            $clauses .= " and sm.employeeId = '$data->employeeId'";
        }

        if (isset($data->salesId) && $data->salesId != 0 && $data->salesId != '') {
            $clauses .= " and id = '$data->salesId'";
            $jobDetails = $this->db->query("
                select 
                    sd.*,
                    p.Product_Code,
                    p.Product_Name,
                    pc.ProductCategory_Name,
                    u.Unit_Name
                from tbl_jobcarddetails sd
                join tbl_product p on p.Product_SlNo = sd.Product_IDNo
                join tbl_productcategory pc on pc.ProductCategory_SlNo = p.ProductCategory_ID
                join tbl_unit u on u.Unit_SlNo = p.Unit_ID
                where sd.JobCardMaster_IDNo = ?
            ", $data->salesId)->result();

            $res['jobDetails'] = $jobDetails;
        }
        $jobcard = $this->db->query("
            select 
            concat(sm.JobcardNo, ' - ', c.Customer_Name) as invoice_text,
            sm.*,
            c.Customer_Code,
            c.Customer_Name,
            c.Customer_Mobile,
            c.Customer_Address,
            c.Customer_Type,
            e.Employee_Name,
            br.Brunch_name,
            cm.Company_SlNo,
            cm.Company_Code,
            cm.Company_Name,
            cm.Company_Mobile,
            cm.Company_Address
            from tbl_jobcardmaster sm
            left join tbl_customer c on c.Customer_SlNo = sm.Customer_Id
            left join tbl_companies cm on cm.Company_SlNo = c.Company_Id
            left join tbl_employee e on e.Employee_SlNo = sm.employeeId
            left join tbl_brunch br on br.brunch_id = sm.Job_branchId
            where sm.Job_branchId = '$branchId'
            and sm.Status != 'd'
            $clauses
            order by sm.id desc
        ")->result();

        $res['jobcard'] = $jobcard;

        echo json_encode($res);
    }

    public function updateJobCard()
    {
        $res = ['success' => false, 'message' => ''];
        try {
            $data = json_decode($this->input->raw_input_stream);
            $jobcardId = $data->sales->salesId;

            $sales = array(
                'Customer_Id'        => $data->sales->customerId,
                'WorkOrderId'        => $data->sales->salesId,
                'employeeId'         => $data->sales->employeeId,
                'JobDate'            => $data->sales->salesDate,
                'totalAmount'        => $data->sales->total,
                'discount'           => $data->sales->discount,
                'Job_Freight'        => $data->sales->transportCost,
                'subTotal'           => $data->sales->subTotal,
                'JobCard_PaidAmount' => $data->sales->paid,
                'due'                => $data->sales->due,
                'Previous_Due'       => $data->sales->previousDue,
                'note'               => $data->sales->note,
                'Status'             => 'a',
                "UpdateBy"           => $this->session->userdata("FullName"),
                'UpdateTime'         => date("Y-m-d H:i:s"),
                "Job_branchId"       => $this->session->userdata("BRANCHid"),
            );

            $this->db->where('id', $jobcardId);
            $this->db->update('tbl_jobcardmaster', $sales);

            $this->db->query("delete from tbl_jobcarddetails where JobCardMaster_IDNo = ?", $jobcardId);

            foreach ($data->cart as $cartProduct) {
                $saleDetails = array(
                    'JobCardMaster_IDNo'        => $jobcardId,
                    'Product_IDNo'              => $cartProduct->productId,
                    'SaleDetails_TotalQuantity' => $cartProduct->quantity,
                    'Purchase_Rate'             => $cartProduct->purchaseRate,
                    'SaleDetails_Rate'          => $cartProduct->salesRate,
                    'SaleDetails_Tax'           => $cartProduct->vat,
                    'SaleDetails_TotalAmount'   => $cartProduct->total,
                    'Status'                    => 'a',
                    'AddBy'                     => $this->session->userdata("FullName"),
                    'AddTime'                   => date('Y-m-d H:i:s'),
                    'SaleDetails_BranchId'      => $this->session->userdata('BRANCHid')
                );

                $this->db->insert('tbl_jobcarddetails', $saleDetails);
            }

            $res = ['success' => true, 'message' => 'Jobcart Updated', 'salesId' => $jobcardId];
        } catch (Exception $ex) {
            $res = ['success' => false, 'message' => $ex->getMessage()];
        }

        echo json_encode($res);
    }

    function jobcard_record()
    {
        $access = $this->mt->userAccess();
        if (!$access) {
            redirect(base_url());
        }
        $data['title'] = "Jobcard Record";
        $data['content'] = $this->load->view('Administrator/jobcard/jobcard_record', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }

    public function JobcardInvoicePrint($jobcardId)
    {
        $data['title'] = "Jobcard Invoice";
        $data['jobcardId'] = $jobcardId;
        $data['content'] = $this->load->view('Administrator/jobcard/jobcardAndreport', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }
}
