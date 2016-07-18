package controllers

type ExtensionsShippingController struct {
	AdminController
}

func (this *ExtensionsShippingController) Index() {
    this.TplName = "admin/extensions/shipping.tpl"
    this.Data["PageTitle"] = "Shipping"
}

