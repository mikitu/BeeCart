package controllers

import (
    "github.com/astaxie/beego"
    "github.com/mikitu/BeeCart/helpers"
    "html/template"
    "path"
    "bytes"
)

type AdminController struct {
    beego.Controller
}

func IncludeTemplate(name string, data interface{})(out interface{}) {
    base := path.Base(name)
    tpl := helpers.WidgetTemplates.Lookup(base)
    var buffer bytes.Buffer
    tpl.Execute(&buffer, data)
    return template.HTML(buffer.String())
}

func IsActiveMenuItem() bool {

    return true
}

func (adminCtrl *AdminController) Prepare() {
    beego.SetStaticPath("/static", "static")
    adminCtrl.Layout = "admin/layout.tpl"
    admin_menu := helpers.AdminMenu
    admin_menu.SetCurrentUrl(adminCtrl.Ctx.Input.URL())
    admin_menu.BuildCurrentPath()
    adminCtrl.Data["admin_menu"] = *admin_menu
    beego.AddFuncMap("IncludeTemplate", IncludeTemplate)
    bc := helpers.NewBreadcrumbs()
    bc.Add("<i class=\"livicon\" data-name=\"home\" data-size=\"16\" data-color=\"#333\" data-hovercolor=\"#333\"></i>Dashboard", "/admin")
    println(bc)
    adminCtrl.Data["Breadcrumbs"] = bc
}
