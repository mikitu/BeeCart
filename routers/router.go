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
            beego.NSRouter("/categories", &adminControllers.CatalogCategoriesController{}, "*:Index"),
            beego.NSRouter("/products", &adminControllers.CatalogProductsController{}, "*:Index"),
            beego.NSRouter("/recuring-profiles", &adminControllers.CatalogRecuringProfilesController{}, "*:Index"),
            beego.NSRouter("/filters", &adminControllers.CatalogFiltersController{}, "*:Index"),
            beego.NSRouter("/attributes", &adminControllers.CatalogAttributesController{}, "*:Index"),
            beego.NSRouter("/attribute-groups", &adminControllers.CatalogAttributeGroupsController{}, "*:Index"),
            beego.NSRouter("/options", &adminControllers.CatalogOptionsController{}, "*:Index"),
            beego.NSRouter("/manufacturers", &adminControllers.CatalogManufacturersController{}, "*:Index"),
            beego.NSRouter("/downloads", &adminControllers.CatalogDownloadsController{}, "*:Index"),
            beego.NSRouter("/reviews", &adminControllers.CatalogReviewsController{}, "*:Index"),
        ),
        beego.NSNamespace("/extensions",
            beego.NSRouter("/modules", &adminControllers.ExtensionsModulesController{}, "*:Index"),
            beego.NSRouter("/shipping", &adminControllers.ExtensionsShippingController{}, "*:Index"),
            beego.NSRouter("/payments", &adminControllers.ExtensionsPaymentsController{}, "*:Index"),
            beego.NSRouter("/order-totals", &adminControllers.ExtensionsOrderTotalsController{}, "*:Index"),
            beego.NSRouter("/feeds", &adminControllers.ExtensionsFeedsController{}, "*:Index"),
        ),
        beego.NSNamespace("/sales",
            beego.NSRouter("/orders", &adminControllers.SalesOrdersController{}, "*:Index"),
            beego.NSRouter("/recuring_orders", &adminControllers.SalesRecuringOrdersController{}, "*:Index"),
            beego.NSRouter("/returns", &adminControllers.SalesReturnsController{}, "*:Index"),
            beego.NSRouter("/customers", &adminControllers.SalesCustomersController{}, "*:Index"),
            beego.NSRouter("/customer-groups", &adminControllers.SalesCustomersGroupsController{}, "*:Index"),
            beego.NSRouter("/custom-fields", &adminControllers.SalesCustomFieldsController{}, "*:Index"),
            beego.NSRouter("/banned-ip", &adminControllers.SalesBannedIpController{}, "*:Index"),
            beego.NSRouter("/gift-vouchers", &adminControllers.SalesGiftVouchersController{}, "*:Index"),

        ),
        //beego.NSNamespace("/marketing",
        //),
        //beego.NSNamespace("/system",
        //),
        //beego.NSNamespace("/tools",
        //),
        //beego.NSNamespace("/reports",
        //),
    )
    beego.AddNamespace(ns)

    //beego.Router("/admin", &adminControllers.IndexController{})
    //beego.Router("/admin/login", &adminControllers.UserController{}, "*:Login")
    //beego.Router("/admin/logout", &adminControllers.UserController{}, "*:Logout")
    beego.Router("/", &controllers.MainController{})
}
