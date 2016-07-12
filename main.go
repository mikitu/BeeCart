package main

import (
	_ "BeeCart/routers"
	"github.com/astaxie/beego"
    "github.com/astaxie/beego/orm"
    _ "github.com/go-sql-driver/mysql"
)

func init() {
    orm.RegisterDriver("mysql", orm.DRMySQL)
    orm.RegisterDataBase("default", "mysql", "root:@/piesebeta?charset=utf8")
    orm.Debug = true
}

func main() {
    beego.Run()
}

