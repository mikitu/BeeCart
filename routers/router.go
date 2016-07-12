package routers

import (
	"BeeCart/controllers"
    adminControllers "BeeCart/controllers/admin"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/admin", &adminControllers.IndexController{})
    beego.Router("/admin/login", &adminControllers.UserController{}, "*:Login")
    beego.Router("/admin/logout", &adminControllers.UserController{}, "*:Logout")
    //beego.Router("/admin/lockscreen", &adminControllers.UserController{}, "*:Lockscreen")
    beego.Router("/", &controllers.MainController{})
}
