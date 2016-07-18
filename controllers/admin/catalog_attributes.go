package controllers

type CatalogAttributesController struct {
	AdminController
}

func (this *CatalogAttributesController) Index() {
    this.TplName = "admin/catalog/attributes.tpl"
    this.Data["PageTitle"] = "Attributes"
}

