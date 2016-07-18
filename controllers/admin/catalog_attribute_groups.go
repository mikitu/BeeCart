package controllers

type CatalogAttributeGroupsController struct {
	AdminController
}

func (this *CatalogAttributeGroupsController) Index() {
    this.TplName = "admin/catalog/attribute_groups.tpl"
    this.Data["PageTitle"] = "Attribute Groups"
}

