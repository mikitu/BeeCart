package controllers

type SystemLocalisationReturnsReturnStatusesController struct {
	AdminController
}

func (this *SystemLocalisationReturnsReturnStatusesController) Index() {
    this.TplName = "admin/system/localisation_returns_return_statuses.tpl"
    this.Data["PageTitle"] = "Return Statuses"
}

