package controllers

type SalesCustomersGroupsController struct {
	AdminController
}

func (this *SalesCustomersGroupsController) Index() {
    this.TplName = "admin/sales/customers_groups.tpl"
    this.Data["PageTitle"] = "Customers Groups"
}

