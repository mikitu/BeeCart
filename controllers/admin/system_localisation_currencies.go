package controllers

type SystemLocalisationCurrenciesController struct {
	AdminController
}

func (this *SystemLocalisationCurrenciesController) Index() {
    this.TplName = "admin/system/localisation_currencies.tpl"
    this.Data["PageTitle"] = "Currencies"
}

