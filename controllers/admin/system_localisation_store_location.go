package controllers

type SystemLocalisationStoreLocationController struct {
	AdminController
}

func (this *SystemLocalisationStoreLocationController) Index() {
    this.TplName = "admin/system/localisation_store_location.tpl"
    this.Data["PageTitle"] = "Store Location"
}

