package controllers

type CatalogCategoriesController struct {
	AdminController
}

func (this *CatalogCategoriesController) Index() {
    this.TplName = "admin/catalog/categories.tpl"
    this.Data["PageTitle"] = "Categories"
}

