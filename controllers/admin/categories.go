package controllers

type CategoriesController struct {
	AdminController
}

func (this *CategoriesController) Index() {
    this.TplName = "admin/catalog/categories.tpl"
    this.Data["PageTitle"] = "Categories"
}

