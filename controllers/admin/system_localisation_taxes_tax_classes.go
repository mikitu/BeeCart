package controllers

type SystemLocalisationTaxesTaxClassesController struct {
	AdminController
}

func (this *SystemLocalisationTaxesTaxClassesController) Index() {
    this.TplName = "admin/system/localisation_taxes_tax_classes.tpl"
    this.Data["PageTitle"] = "Tax Classes"
}

