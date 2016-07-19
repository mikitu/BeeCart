package controllers

type SalesCustomersController struct {
	AdminController
}

func (this *SalesCustomersController) Index() {
    this.TplName = "admin/sales/customers.tpl"
    this.Data["PageTitle"] = "Customers"
}

