package controllers

type SystemBannersController struct {
	AdminController
}

func (this *SystemBannersController) Index() {
    this.TplName = "admin/system/banners.tpl"
    this.Data["PageTitle"] = "Banners"
}

