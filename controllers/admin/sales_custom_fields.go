package controllers

type SalesCustomFieldsController struct {
	AdminController
}

func (this *SalesCustomFieldsController) Index() {
    this.TplName = "admin/sales/custom_fields.tpl"
    this.Data["PageTitle"] = "Custom Fields"
}

