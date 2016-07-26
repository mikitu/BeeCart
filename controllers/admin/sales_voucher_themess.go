package controllers

type SalesVouchersThemesController struct {
	AdminController
}

func (this *SalesVouchersThemesController) Index() {
    this.TplName = "admin/sales/voucher_themes.tpl"
    this.Data["PageTitle"] = "Voucher Themes"
}

