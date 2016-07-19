package controllers

type MarketingAffiliatesController struct {
	AdminController
}

func (this *MarketingAffiliatesController) Index() {
    this.TplName = "admin/marketing/affiliates.tpl"
    this.Data["PageTitle"] = "Affiliates"
}

