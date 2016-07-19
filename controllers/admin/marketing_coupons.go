package controllers

type MarketingCouponsController struct {
	AdminController
}

func (this *MarketingCouponsController) Index() {
    this.TplName = "admin/marketing/coupons.tpl"
    this.Data["PageTitle"] = "Coupons"
}

