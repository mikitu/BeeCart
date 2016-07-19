package controllers

type SystemSettingsController struct {
	AdminController
}

func (this *SystemSettingsController) Index() {
    this.TplName = "admin/system/settings.tpl"
    this.Data["PageTitle"] = "Settings"
}

