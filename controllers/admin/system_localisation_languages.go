package controllers

type SystemLocalisationLanguagesController struct {
	AdminController
}

func (this *SystemLocalisationLanguagesController) Index() {
    this.TplName = "admin/system/localisation_languages.tpl"
    this.Data["PageTitle"] = "Languages"
}

