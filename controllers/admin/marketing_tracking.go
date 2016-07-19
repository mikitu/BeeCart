package controllers

type MarketingTrackingController struct {
	AdminController
}

func (this *MarketingTrackingController) Index() {
    this.TplName = "admin/marketing/tracking.tpl"
    this.Data["PageTitle"] = "Tracking"
}

