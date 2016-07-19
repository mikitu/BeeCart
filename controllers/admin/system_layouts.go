package controllers

type SystemLayoutsController struct {
	AdminController
}

func (this *SystemLayoutsController) Index() {
    this.TplName = "admin/system/layouts.tpl"
    this.Data["PageTitle"] = "Layouts"
}

