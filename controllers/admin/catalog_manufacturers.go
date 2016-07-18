package controllers

type CatalogManufacturersController struct {
	AdminController
}

func (this *CatalogManufacturersController) Index() {
    this.TplName = "admin/catalog/manufacturers.tpl"
    this.Data["PageTitle"] = "Manufacturers"
}

