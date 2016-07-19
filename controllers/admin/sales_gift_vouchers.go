package controllers

type SalesGiftVouchersController struct {
	AdminController
}

func (this *SalesGiftVouchersController) Index() {
    this.TplName = "admin/sales/gift_vouchers.tpl"
    this.Data["PageTitle"] = "Gift Vouchers"
}

