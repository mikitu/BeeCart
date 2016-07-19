package controllers

type SystemLocalisationStockStatusesController struct {
	AdminController
}

func (this *SystemLocalisationStockStatusesController) Index() {
    this.TplName = "admin/system/localisation_stock_statuses.tpl"
    this.Data["PageTitle"] = "Stock Statuses"
}

