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
    log.Printf("\n%+v\n\n", this.Data["admin_menu"])
}

