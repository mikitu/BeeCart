package routers

import (
	"BeeCart/controllers"
    adminControllers "BeeCart/controllers/admin"
	"github.com/astaxie/beego"
    "github.com/astaxie/beego/context"
    //"github.com/astaxie/beego/plugins/auth"
)

func init() {
    ns :=
    beego.NewNamespace("/admin",
        //beego.NSCond(func(ctx *context.Context) bool {
        //    if ctx.Input.Domain() == "api.beego.me" {
        //        return true
        //    }
        //    return false
        //}),
        //beego.NSBefore(auth),
        beego.NSGet("/notallowed", func(ctx *context.Context) {
            ctx.Output.Body([]byte("notAllowed"))
        }),
        beego.NSRouter("/", &adminControllers.IndexController{}),
        beego.NSRouter("/login", &adminControllers.UserController{}, "*:Login"),
        beego.NSRouter("/logout", &adminControllers.UserController{}, "*:Logout"),
        beego.NSNamespace("/catalog",
            beego.NSRouter("/categories", &adminControllers.CategoriesController{}, "*:Index"),
        ),
    )
    beego.AddNamespace(ns)

    //beego.Router("/admin", &adminControllers.IndexController{})
    //beego.Router("/admin/login", &adminControllers.UserController{}, "*:Login")
    //beego.Router("/admin/logout", &adminControllers.UserController{}, "*:Logout")
    beego.Router("/", &controllers.MainController{})
}
