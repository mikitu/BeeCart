package controllers

import (
    "BeeCart/helpers"
    "log"
)

type IndexController struct {
	AdminController
}

func (this *IndexController) Get() {
    this.InitDefaults()
    this.TplName = "admin/index.tpl"
    menuItems := this.Data["admin_menu"].(helpers.AdminMenuStruct).Items

    for i, _ := range menuItems {
        if i == 0 {
            menuItems[i].SetActive()
            log.Printf("\n%+v\n\n", menuItems[i])
        }
        break
    }
    this.GetWidgets()
    log.Printf("\n%+v\n\n", this.Data["Widgets"])

}

func (this *IndexController) GetWidgets() {
    w := new(helpers.Widgets)
    w.Add(
        helpers.Widget{
            Title: "Views Today",
            Template: "admin/widgets/views-today.tpl",
        })
    w.Add(
        helpers.Widget{
            Title: "Today's Sales",
            Template: "admin/widgets/today-sales.tpl",
        })
    w.Add(
        helpers.Widget{
            Title: "Subscribers",
            Template: "admin/widgets/subscribers.tpl",
        })
    w.Add(
        helpers.Widget{
            Title: "Registered Users",
            Template: "admin/widgets/registered-users.tpl",
        })
    this.Data["Widgets"] = w
}