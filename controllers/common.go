package controllers

import (
    "BeeCart/models"
)

type Cfg struct {
    Data []interface{}
}

func NewCfg() Cfg {
    cfg := new(Cfg)
    cfg.init()
    return *cfg
}

func (cfg *Cfg) Get(key string) interface{} {
    if key == "" {
        return cfg.Data
    }
    for _, model := range cfg.Data {
        if mdl := model.(models.Setting); mdl.Key == key {
            return mdl.Value
        }
    }
    return nil
}

func (cfg *Cfg) init() {
    query := make(map[string]string)
    query["code"] = "config"
    query["store_id"] = "1"
    res, err := models.GetAllSetting(query, nil, nil, nil, 0, 0)
    if err == nil {
        cfg.Data = res
    }

}

func GetCommon(controller *MainController) {
    cfg := NewCfg()
    controller.Data["cfg"] = cfg

    controller.Data["maintenance_mode"] = false
    if cfg.Get("config_maintenance") == "1" {
        controller.Data["maintenance_mode"] = true
    }

    admin_access := getAdminAccess(controller)
    admin_access = true
    if admin_access {
        controller.TplName = "templates/default/homepage/index.tpl"
        controller.Layout = "templates/default/layout/layout.tpl"
    } else {
        controller.TplName = "templates/default/maintenance/maintenance.tpl"
    }
}

func getAdminAccess(controller * MainController) bool {
    aa := controller.Input().Get("aa")
    admin_access := false
    admin_access_sess := controller.GetSession("admin_access")
    if admin_access_sess == nil {
        admin_access = false
    } else {
        admin_access = admin_access_sess.(bool)
    }
    if  aa == "true" {
        admin_access = true
        controller.SetSession("admin_access", true)
    } else  if aa != "" {
        admin_access = false
        controller.SetSession("admin_access", false)
    }
    return admin_access
}