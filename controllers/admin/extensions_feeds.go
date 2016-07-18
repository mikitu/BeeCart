package controllers

type ExtensionsFeedsController struct {
	AdminController
}

func (this *ExtensionsFeedsController) Index() {
    this.TplName = "admin/extensions/feeds.tpl"
    this.Data["PageTitle"] = "Feeds"
}

