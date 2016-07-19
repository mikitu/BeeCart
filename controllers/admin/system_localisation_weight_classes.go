package controllers

type SystemLocalisationWeightClassesController struct {
	AdminController
}

func (this *SystemLocalisationWeightClassesController) Index() {
    this.TplName = "admin/system/localisation_weight_classes.tpl"
    this.Data["PageTitle"] = "Weight Classes"
}

