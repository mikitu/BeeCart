package controllers

type SystemLocalisationTaxesTaxRatesController struct {
	AdminController
}

func (this *SystemLocalisationTaxesTaxRatesController) Index() {
    this.TplName = "admin/system/localisation_taxes_tax_rates.tpl"
    this.Data["PageTitle"] = "Tax Rates"
}

