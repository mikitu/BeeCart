package controllers

type CatalogDownloadsController struct {
	AdminController
}

func (this *CatalogDownloadsController) Index() {
    this.TplName = "admin/catalog/downloads.tpl"
    this.Data["PageTitle"] = "Downloads"
}

