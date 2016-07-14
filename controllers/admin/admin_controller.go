package controllers

import (
    "github.com/astaxie/beego"
    "BeeCart/helpers"
)

type AdminController struct {
    beego.Controller
}
func (adminCtrl *AdminController) Prepare() {
    beego.SetStaticPath("/static", "static/admin")
    adminCtrl.Layout = "admin/layout.tpl"
    adminCtrl.Data["admin_menu"] = helpers.AdminMenu
}
