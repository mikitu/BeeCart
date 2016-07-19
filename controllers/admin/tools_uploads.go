package controllers

type ToolsUploadsController struct {
	AdminController
}

func (this *ToolsUploadsController) Index() {
    this.TplName = "admin/tools/uploads.tpl"
    this.Data["PageTitle"] = "Uploads"
}

