package controllers

type ExtensionsModulesController struct {
	AdminController
}

func (this *ExtensionsModulesController) Index() {
    this.TplName = "admin/extensions/modules.tpl"
    this.Data["PageTitle"] = "Modules"
}

