package controllers

type ToolsErrorLogsController struct {
	AdminController
}

func (this *ToolsErrorLogsController) Index() {
    this.TplName = "admin/tools/error_logs.tpl"
    this.Data["PageTitle"] = "Error Logs"
}

