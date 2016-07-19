package controllers

type SystemLocalisationCountriesController struct {
	AdminController
}

func (this *SystemLocalisationCountriesController) Index() {
    this.TplName = "admin/system/localisation_countries.tpl"
    this.Data["PageTitle"] = "Countries"
}

