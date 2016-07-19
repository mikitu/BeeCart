package controllers

type SalesPaypalSearchController struct {
	AdminController
}

func (this *SalesPaypalSearchController) Index() {
    this.TplName = "admin/sales/paypal_search.tpl"
    this.Data["PageTitle"] = "Paypal Search"
}

