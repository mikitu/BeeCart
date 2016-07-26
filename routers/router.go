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
            beego.NSRouter("/recuring-orders", &adminControllers.SalesRecuringOrdersController{}, "*:Index"),
            beego.NSRouter("/returns", &adminControllers.SalesReturnsController{}, "*:Index"),
            beego.NSRouter("/customers", &adminControllers.SalesCustomersController{}, "*:Index"),
            beego.NSRouter("/customer-groups", &adminControllers.SalesCustomerGroupsController{}, "*:Index"),
            beego.NSRouter("/custom-fields", &adminControllers.SalesCustomFieldsController{}, "*:Index"),
            beego.NSRouter("/banned-ip", &adminControllers.SalesBannedIpController{}, "*:Index"),
            beego.NSRouter("/gift-vouchers", &adminControllers.SalesGiftVouchersController{}, "*:Index"),
            beego.NSRouter("/voucher-themes", &adminControllers.SalesVouchersThemesController{}, "*:Index"),
            beego.NSRouter("/paypal-search", &adminControllers.SalesPaypalSearchController{}, "*:Index"),
        ),
        beego.NSNamespace("/marketing",
            beego.NSRouter("/tracking", &adminControllers.MarketingTrackingController{}, "*:Index"),
            beego.NSRouter("/affiliates", &adminControllers.MarketingAffiliatesController{}, "*:Index"),
            beego.NSRouter("/coupons", &adminControllers.MarketingCouponsController{}, "*:Index"),
            beego.NSRouter("/mail", &adminControllers.MarketingMailController{}, "*:Index"),

        ),
        beego.NSNamespace("/system",
            beego.NSRouter("/settings", &adminControllers.SystemSettingsController{}, "*:Index"),
            beego.NSRouter("/design/layouts", &adminControllers.SystemLayoutsController{}, "*:Index"),
            beego.NSRouter("/design/banners", &adminControllers.SystemBannersController{}, "*:Index"),

            beego.NSRouter("/users", &adminControllers.SystemUsersController{}, "*:Index"),
            beego.NSRouter("/users/groups", &adminControllers.SystemUserGroupsController{}, "*:Index"),

            beego.NSRouter("/localisation/store-location", &adminControllers.SystemLocalisationStoreLocationController{}, "*:Index"),
            beego.NSRouter("/localisation/languages", &adminControllers.SystemLocalisationLanguagesController{}, "*:Index"),
            beego.NSRouter("/localisation/currencies", &adminControllers.SystemLocalisationCurrenciesController{}, "*:Index"),
            beego.NSRouter("/localisation/stock-statuses", &adminControllers.SystemLocalisationStockStatusesController{}, "*:Index"),
            beego.NSRouter("/localisation/order-statuses", &adminControllers.SystemLocalisationOrderStatusesController{}, "*:Index"),

            beego.NSRouter("/localisation/returns/return-statuses", &adminControllers.SystemLocalisationReturnsReturnStatusesController{}, "*:Index"),
            beego.NSRouter("/localisation/returns/return-actions", &adminControllers.SystemLocalisationReturnsReturnActionsController{}, "*:Index"),
            beego.NSRouter("/localisation/returns/return-reasons", &adminControllers.SystemLocalisationReturnsReturnReasonsController{}, "*:Index"),
            beego.NSRouter("/localisation/countries", &adminControllers.SystemLocalisationCountriesController{}, "*:Index"),

            beego.NSRouter("/localisation/zones", &adminControllers.SystemLocalisationZonesController{}, "*:Index"),
            beego.NSRouter("/localisation/geo-zones", &adminControllers.SystemLocalisationGeoZonesController{}, "*:Index"),

            beego.NSRouter("/localisation/taxes/tax-classes", &adminControllers.SystemLocalisationTaxesTaxClassesController{}, "*:Index"),
            beego.NSRouter("/localisation/taxes/tax-rates", &adminControllers.SystemLocalisationTaxesTaxRatesController{}, "*:Index"),

            beego.NSRouter("/localisation/length-classes", &adminControllers.SystemLocalisationLengthClassesController{}, "*:Index"),
            beego.NSRouter("/localisation/weight-classes", &adminControllers.SystemLocalisationWeightClassesController{}, "*:Index"),

        ),
        beego.NSNamespace("/tools",
            beego.NSRouter("/uploads", &adminControllers.ToolsUploadsController{}, "*:Index"),
            beego.NSRouter("/backup-restore", &adminControllers.ToolsBackupRestoreController{}, "*:Index"),
            beego.NSRouter("/error-logs", &adminControllers.ToolsErrorLogsController{}, "*:Index"),
        ),
        //beego.NSNamespace("/reports",
        //),
    )
    beego.AddNamespace(ns)

    //beego.Router("/admin", &adminControllers.IndexController{})
    //beego.Router("/admin/login", &adminControllers.UserController{}, "*:Login")
    //beego.Router("/admin/logout", &adminControllers.UserController{}, "*:Logout")
    beego.Router("/", &controllers.MainController{})
}
