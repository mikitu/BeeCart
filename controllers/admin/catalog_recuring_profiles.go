package controllers

type CatalogRecuringProfilesController struct {
	AdminController
}

func (this *CatalogRecuringProfilesController) Index() {
    this.TplName = "admin/catalog/recuring_profiles.tpl"
    this.Data["PageTitle"] = "Recuring Profiles"
}

