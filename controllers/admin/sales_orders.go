package controllers

type SalesOrdersController struct {
	AdminController
}

func (this *SalesOrdersController) Index() {
    this.TplName = "admin/sales/orders.tpl"
    this.Data["PageTitle"] = "Orders"
}

