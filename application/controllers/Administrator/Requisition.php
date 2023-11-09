<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Requisition extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->brunch = $this->session->userdata('BRANCHid');
        $access = $this->session->userdata('userId');
        if ($access == '') {
            redirect("Login");
        }
        $this->load->model('Billing_model');
        $this->load->library('cart');
        $this->load->model('Model_table', "mt", TRUE);
        $this->load->helper('form');
    }

    public function index($requisition_id = 0, $salesId = 0)
    {
        $access = $this->mt->userAccess();
        if (!$access) {
            redirect(base_url());
        }

        $data['title'] = "Requistion Entry";
        $data['requisition_id'] = $requisition_id;
        $data['work_order'] = empty($salesId) ? 0 : $salesId;
        $data['requisitionInvoice'] = $this->mt->generateRequisitionInvoice();
        $data['content'] = $this->load->view('Administrator/requisition/requisition_entry', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }

    public function MaterialRequisitionRecord()
    {
        $access = $this->mt->userAccess();
        if (!$access) {
            redirect(base_url());
        }
        $data['title'] = "Material Requisition Record";
        $data['content'] = $this->load->view('Administrator/requisition/material_requisition_record', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }

    public function getMaterialRequisition()
    {
        $options = json_decode($this->input->raw_input_stream);
        $clauses = "";

        if (isset($options->requisition_id)) {
            $clauses .= " and p.requisition_id = '$options->requisition_id'";
        }
        if (isset($options->Status) && $options->Status == 'p') {
            $clauses .= " and p.status = '$options->Status'";
        }

        if (isset($options->employee_id) && $options->employee_id != null) {
            $clauses .= " and p.employee_id = '$options->employee_id'";
        }

        if (isset($options->dateFrom) && isset($options->dateTo) && $options->dateFrom != null && $options->dateTo != null) {
            $clauses .= " and p.requisition_date between '$options->dateFrom' and '$options->dateTo'";
        }
        $requisitions = $this->db->query("
            select 
                p.*,
                e.Employee_Name as employee_name,
                e.Employee_ID as employee_code,
                e.Employee_ContactNo as employee_mobile,
                e.Employee_PrasentAddress as employee_address
            from tbl_material_requisition p
            left join tbl_employee e on e.Employee_SlNo = p.employee_id
            where p.branch_id = '$this->brunch'
            and p.status != 'd'
            $clauses
        ")->result();

        $data['requisitions'] = $requisitions;

        echo json_encode($data);
    }

    public function getMaterialRequisitionDetails()
    {
        $options = json_decode($this->input->raw_input_stream);
        $clauses = "";
        if (isset($options->requisition_id) && $options->requisition_id != '') {
            $clauses .= " and pd.requisition_id = '$options->requisition_id'";
        }
        if (isset($options->materialId) && $options->materialId != '') {
            $clauses .= " and pd.material_id = '$options->materialId'";
        }
        if (isset($options->categoryId) && $options->categoryId != '') {
            $clauses .= " and m.category_id = '$options->categoryId'";
        }
        $requisitionDetails = $this->db->query("
            select
                pd.*,
                m.code,
                m.name,
                c.ProductCategory_Name as category_name,
                u.Unit_Name as unit_name,
                mp.requisition_invoice,
                mp.requisition_date,
                e.Employee_Name as employee_name,
                e.Employee_ID as employee_code
            from tbl_material_requisition_details pd
            join tbl_material_requisition mp on mp.requisition_id = pd.requisition_id
            left join tbl_employee e on e.Employee_SlNo = mp.employee_id
            left join tbl_materials m on m.material_id = pd.material_id
            left join tbl_materialcategory c on c.ProductCategory_SlNo = m.category_id
            left join tbl_unit u on u.Unit_SlNo = m.unit_id
            where pd.branch_id = '$this->brunch'
            and pd.status != 'd'
            $clauses
        ")->result();

        echo json_encode($requisitionDetails);
    }

    public function addMaterialRequisition()
    {
        $res = ['success' => false, 'message' => ''];
        try {
            $data = json_decode($this->input->raw_input_stream);

            $saleInv = $data->requisition->work_order;

            $countRequisitionCode = $this->db->query("select * from tbl_material_requisition where requisition_invoice = ?", $data->requisition->requisition_invoice)->num_rows();
            if ($countRequisitionCode > 0) {
                $data->requisition->requisition_invoice = $this->mt->generateRequisitionInvoice();
            }

            $requisition = array(
                "employee_id"         => $data->requisition->employee_id,
                "requisition_invoice" => $data->requisition->requisition_invoice,
                "work_order"          => $data->requisition->work_order,
                "requisition_date"    => $data->requisition->requisition_date,
                "requisition_for"     => $data->requisition->requisition_for,
                "note"                => $data->requisition->note,
                "status"              => 'a',
                "branch_id"           => $this->brunch,
            );
            $this->db->insert('tbl_material_requisition', $requisition);
            $lastId = $this->db->insert_id();

            foreach ($data->cart as $requisitiondMaterial) {
                $pm = array(
                    "requisition_id" => $lastId,
                    "material_id"    => $requisitiondMaterial->material_id,
                    "purchase_rate"  => $requisitiondMaterial->purchase_rate,
                    "quantity"       => $requisitiondMaterial->quantity,
                    "total"          => $requisitiondMaterial->quantity * $requisitiondMaterial->purchase_rate,
                    "status"         => 'a',
                    "branch_id"      => $this->brunch,
                );
                $this->db->insert('tbl_material_requisition_details', $pm);
            }
            $res = ['success' => true, 'message' => 'Material Requisition Success', 'requisition_id' => $lastId];
        } catch (Exception $ex) {
            $res = ['success' => false, 'message' => $ex->getMessage()];
        }

        echo json_encode($res);
    }

    public function updateMaterialRequisition()
    {
        $res = ['success' => false, 'message' => ''];
        try {
            $data = json_decode($this->input->raw_input_stream);

            $requisition = array(
                "employee_id"         => $data->requisition->employee_id,
                "requisition_invoice" => $data->requisition->requisition_invoice,
                "work_order"          => $data->requisition->work_order,
                "requisition_date"    => $data->requisition->requisition_date,
                "requisition_for"     => $data->requisition->requisition_for,
                "note"                => $data->requisition->note
            );
            $this->db->where('requisition_id', $data->requisition->requisition_id);
            $this->db->set($requisition);
            $this->db->update('tbl_material_requisition');

            $this->db->delete('tbl_material_requisition_details', array('requisition_id' => $data->requisition->requisition_id));
            foreach ($data->cart as $requisitionMaterial) {
                $pm = array(
                    "requisition_id" => $data->requisition->requisition_id,
                    "material_id"    => $requisitionMaterial->material_id,
                    "purchase_rate"  => $requisitionMaterial->purchase_rate,
                    "quantity"       => $requisitionMaterial->quantity,
                    "total"          => $requisitionMaterial->quantity * $requisitionMaterial->purchase_rate,
                    "status"         => 'a',
                    "branch_id"      => $this->brunch,
                );
                $this->db->insert('tbl_material_requisition_details', $pm);
            }

            $res = ['success' => true, 'message' => 'Updated Successfully', 'requisition_id' => $data->requisition->requisition_id];
        } catch (Exception $ex) {
            $res = ['success' => false, 'message' => $ex->getMessage()];
        }

        echo json_encode($res);
    }

    public function deleteMaterialRequisition()
    {
        $data = json_decode($this->input->raw_input_stream);
        $res = ['success' => false, 'message' => ''];
        try {
            $this->db->query("update tbl_material_requisition p set p.status = 'd' where p.requisition_id = ?", $data->requisition_id);
            $this->db->query("update tbl_material_requisition_details pd set pd.status = 'd' where pd.requisition_id = ?", $data->requisition_id);
            $res = ['success' => true, 'message' => 'Requisition deleted'];
        } catch (Exception $ex) {
            $res = ['success' => false, 'message' => $ex->getMessage()];
        }

        echo json_encode($res);
    }

    public function materialRequisitionInvoice($requisitionId)
    {
        $data['title'] = "Material Requisition Invoice";
        $data['requisitionId'] = $requisitionId;
        $data['content'] = $this->load->view("Administrator/requisition/material_requisition_invoice", $data, true);
        $this->load->view("Administrator/index", $data);
    }
}
