package controllers

import (
    "github.com/mikitu/BeeCart/helpers"
    "fmt"
)

type CatalogCategoriesController struct {
	AdminController
}

func (this *CatalogCategoriesController) Index() {
    this.TplName = "admin/catalog/categories.tpl"
    this.Data["PageTitle"] = "Categories"
    bc := *this.Data["Breadcrumbs"].(*helpers.Breadcrumbs)
    bc.Add("Categories", "")
    this.Data["Breadcrumbs"] = bc
    fmt.Printf("\n\n\n%+v\n\n\n", bc)
}

