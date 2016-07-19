package controllers

type SalesBannedIpController struct {
	AdminController
}

func (this *SalesBannedIpController) Index() {
    this.TplName = "admin/sales/banned_ip.tpl"
    this.Data["PageTitle"] = "Banned Ip"
}

