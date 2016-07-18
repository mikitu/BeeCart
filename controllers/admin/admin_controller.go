package controllers

import (
    "github.com/astaxie/beego"
    "BeeCart/helpers"
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

func (adminCtrl *AdminController) Prepare() {
    beego.SetStaticPath("/static", "static/admin")
    adminCtrl.Layout = "admin/layout.tpl"
    adminCtrl.Data["admin_menu"] = helpers.AdminMenu
    beego.AddFuncMap("IncludeTemplate", IncludeTemplate)
}
