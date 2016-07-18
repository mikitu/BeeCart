package controllers

type CatalogOptionsController struct {
	AdminController
}

func (this *CatalogOptionsController) Index() {
    this.TplName = "admin/catalog/options.tpl"
    this.Data["PageTitle"] = "Options"
}

