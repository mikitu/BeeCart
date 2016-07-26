package controllers

type SalesCustomerGroupsController struct {
	AdminController
}

func (this *SalesCustomerGroupsController) Index() {
    this.TplName = "admin/sales/customer_groups.tpl"
    this.Data["PageTitle"] = "Customer Groups"
}

