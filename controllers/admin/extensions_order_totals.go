package controllers

type ExtensionsOrderTotalsController struct {
	AdminController
}

func (this *ExtensionsOrderTotalsController) Index() {
    this.TplName = "admin/extensions/order_totals.tpl"
    this.Data["PageTitle"] = "Order Totals"
}

