package controllers

type MarketingMailController struct {
	AdminController
}

func (this *MarketingMailController) Index() {
    this.TplName = "admin/marketing/mail.tpl"
    this.Data["PageTitle"] = "Mail"
}

