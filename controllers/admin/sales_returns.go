package controllers

type SalesReturnsController struct {
	AdminController
}

func (this *SalesReturnsController) Index() {
    this.TplName = "admin/sales/returns.tpl"
    this.Data["PageTitle"] = "Returns"
}

