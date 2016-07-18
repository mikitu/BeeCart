package controllers

type CatalogReviewsController struct {
	AdminController
}

func (this *CatalogReviewsController) Index() {
    this.TplName = "admin/catalog/reviews.tpl"
    this.Data["PageTitle"] = "Reviews"
}

