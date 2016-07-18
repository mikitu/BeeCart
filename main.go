package main

import (
	_ "BeeCart/routers"
	"github.com/astaxie/beego"
    "github.com/astaxie/beego/orm"
    _ "github.com/go-sql-driver/mysql"
    "os"
    "path/filepath"
    "html/template"
    "BeeCart/helpers"
)

func init() {
    orm.RegisterDriver("mysql", orm.DRMySQL)
    orm.RegisterDataBase("default", "mysql", "root:@/piesebeta?charset=utf8")
    orm.Debug = true
    cwd, _ := os.Getwd()

    fpath := filepath.Join( cwd, beego.BConfig.WebConfig.ViewsPath, "admin/widgets" )
    var paths []string

    walk := func(path string, info os.FileInfo, err error) (error) {
        if err == nil && !info.IsDir() && filepath.Ext(path) == ".tpl" {
            paths = append(paths, path)
        }
        return err
    }
    err := filepath.Walk(fpath, walk)
    if (err != nil) {
        panic(err)
    }
    helpers.WidgetTemplates, _ = template.ParseFiles(paths...)

}

func main() {
    beego.Run()
}

