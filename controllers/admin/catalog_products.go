package controllers

type CatalogProductsController struct {
	AdminController
}

func (this *CatalogProductsController) Index() {
    this.TplName = "admin/catalog/products.tpl"
    this.Data["PageTitle"] = "Products"
}

