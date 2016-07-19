package controllers

type SystemLocalisationZonesController struct {
	AdminController
}

func (this *SystemLocalisationZonesController) Index() {
    this.TplName = "admin/system/localisation_zones.tpl"
    this.Data["PageTitle"] = "Zones"
}

