package controllers

type SystemLocalisationGeoZonesController struct {
	AdminController
}

func (this *SystemLocalisationGeoZonesController) Index() {
    this.TplName = "admin/system/localisation_geo_zones.tpl"
    this.Data["PageTitle"] = "Geo Zones"
}

