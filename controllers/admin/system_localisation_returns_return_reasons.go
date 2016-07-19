package controllers

type SystemLocalisationReturnsReturnReasonsController struct {
	AdminController
}

func (this *SystemLocalisationReturnsReturnReasonsController) Index() {
    this.TplName = "admin/system/localisation_returns_return_reasons.tpl"
    this.Data["PageTitle"] = "Return Reasons"
}

