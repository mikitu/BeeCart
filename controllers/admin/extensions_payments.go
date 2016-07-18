package controllers

type ExtensionsPaymentsController struct {
	AdminController
}

func (this *ExtensionsPaymentsController) Index() {
    this.TplName = "admin/extensions/payments.tpl"
    this.Data["PageTitle"] = "Payments"
}

