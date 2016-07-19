package controllers

type SystemLocalisationOrderStatusesController struct {
	AdminController
}

func (this *SystemLocalisationOrderStatusesController) Index() {
    this.TplName = "admin/system/localisation_order_statuses.tpl"
    this.Data["PageTitle"] = "Order Statuses"
}

