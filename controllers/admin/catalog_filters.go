package controllers

type CatalogFiltersController struct {
	AdminController
}

func (this *CatalogFiltersController) Index() {
    this.TplName = "admin/catalog/filters.tpl"
    this.Data["PageTitle"] = "Filters"
}

