package controllers

type SystemLocalisationReturnsReturnActionsController struct {
	AdminController
}

func (this *SystemLocalisationReturnsReturnActionsController) Index() {
    this.TplName = "admin/system/localisation_returns_return_actions.tpl"
    this.Data["PageTitle"] = "Return Actions"
}

