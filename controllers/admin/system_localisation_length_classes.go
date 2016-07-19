package controllers

type SystemLocalisationLengthClassesController struct {
	AdminController
}

func (this *SystemLocalisationLengthClassesController) Index() {
    this.TplName = "admin/system/localisation_length_classes.tpl"
    this.Data["PageTitle"] = "Length Classes"
}

