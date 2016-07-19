package controllers

type SalesRecuringOrdersController struct {
	AdminController
}

func (this *SalesRecuringOrdersController) Index() {
    this.TplName = "admin/sales/recuring_orders.tpl"
    this.Data["PageTitle"] = "Recuring Orders"
}

