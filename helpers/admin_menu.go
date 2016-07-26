package helpers

import "fmt"

type Paths [][]*AdminMenuItemStruct

type AdminMenuStruct struct {
	Items       []*AdminMenuItemStruct
	CurrentUrl  string
	CurrentPath []*AdminMenuItemStruct
	AllPaths    Paths
}

type AdminMenuItemStruct struct {
	Icon     string
	Title    string
	Url      string
	Active   string
	Color    string
	HColor   string
	FontSize int
	Submenu  []*AdminMenuItemStruct
}

func (menu *AdminMenuStruct) print() {
	for _, v := range(menu.AllPaths) {
		for _, p := range(v) {
			print(p.Title, " > ")
		}
		println("\n--------------------------------")
	}
}
func (menu *AdminMenuStruct) buildAllPaths()() {
	for _, node := range (menu.Items) {
		fmt.Printf("%+v\n\n", node)
		if node.HasSubmenu() {
			nodes := _walk(node)
			for _, itm := range(nodes) {
				menu.AllPaths = append(menu.AllPaths, itm)
			}
		} else {
			var nodeS []*AdminMenuItemStruct
			nodeS = append(nodeS, node)
			menu.AllPaths = append(menu.AllPaths, nodeS)
		}
		//_walk(node)
	}
	menu.print()
}
func (menu *AdminMenuStruct) init() {
	menu.buildAllPaths()
}
func (menu *AdminMenuStruct) Add(item *AdminMenuItemStruct) *AdminMenuItemStruct {
	menu.Items = append(menu.Items, item)
	return item
}
func (item *AdminMenuStruct) SetCurrentUrl(url string) {
	item.CurrentUrl = url
}
func (menu *AdminMenuStruct) GetCurrentPath() []*AdminMenuItemStruct {
	//if menu.CurrentPath == nil {
	//	menu.BuildCurrentPath()
	//}
	return menu.CurrentPath
}

var allPaths [][]*AdminMenuItemStruct
var currentPath []*AdminMenuItemStruct

func (menu *AdminMenuStruct) BuildCurrentPath() {
	//for _, node := range (menu.Items) {
	//	_walk(node)
	//}
}
var nodeS []*AdminMenuItemStruct
func _walk(itm *AdminMenuItemStruct) [][]*AdminMenuItemStruct{
	var nodeSa [][]*AdminMenuItemStruct
	for _, item := range (itm.Submenu) {
		var nodeS []*AdminMenuItemStruct
		nodeS = append(nodeS, itm)
		nodeS = append(nodeS, item)
		if item.HasSubmenu() {
			for _, item1 := range (item.Submenu) {
				nodeS = append(nodeS, item1)
				if item.HasSubmenu() {
				}
			}
		}
		nodeSa = append(nodeSa, nodeS)
	}
	return nodeSa
}

func (menu *AdminMenuItemStruct) AddSubmenu(item *AdminMenuItemStruct) *AdminMenuItemStruct {
	menu.Submenu = append(menu.Submenu, item)
	return menu
}

func (item AdminMenuItemStruct) GetUrl() string {
	return AdminBaseUrl + item.Url
}

func (item AdminMenuItemStruct) HasSubmenu() bool {
	return len(item.Submenu) > 0
}

func (item AdminMenuItemStruct) GetSubmenu() []*AdminMenuItemStruct {
	return item.Submenu
}

func (item *AdminMenuItemStruct) SetActive() {
	item.Active = "active"
}

var AdminBaseUrl string = "/admin"
var AdminMenu = new(AdminMenuStruct)

func init() {
	/*AdminMenu.Add(&AdminMenuItemStruct{
		Icon:   "home",
		Title: "Dashboard",
		Url:    "",
		Color: "#418BCA",
		HColor: "#418BCA",
		FontSize: 18,
	},
	)
	*/AdminMenu.Add(
		&AdminMenuItemStruct{
			Icon:   "tags",
			Title: "Catalog",
			Url:    "#",
			Color: "#00bc8c",
			HColor: "#00bc8c",
			FontSize: 18,
	}).AddSubmenu(&AdminMenuItemStruct{
		Title: "Categories",
		Url:    "/catalog/categories",
	}).AddSubmenu(&AdminMenuItemStruct{
		Title: "Products",
		Url:    "/catalog/products",
	}).AddSubmenu(&AdminMenuItemStruct{
		Title: "Recurring Profiles",
		Url:    "/catalog/recuring-profiles",
	}).AddSubmenu(&AdminMenuItemStruct{
		Title: "Attributes",
		Url:    "#",
		Submenu: []*AdminMenuItemStruct{
			{
				Title: "Attributes",
				Url:    "/catalog/attributes",
			}, {
				Title: "Attribute Groups",
				Url:    "/catalog/attribute-groups",
			},
		},
	}).AddSubmenu(&AdminMenuItemStruct{
		Title: "Filters",
		Url:    "/catalog/filters",
	})
	/*.AddSubmenu(&AdminMenuItemStruct{
			Title: "Options",
			Url:    "/catalog/options",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Manufacturers",
			Url:    "/catalog/manufacturers",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Downloads",
			Url:    "/catalog/downloads",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Feeds",
			Url:    "/extensions/feeds",
		})

		AdminMenu.Add(&AdminMenuItemStruct{
			Icon:   "screen-full",
			Title: "Extensions",
			Url:    "#",
			Color: "#F89A14",
			HColor: "#F89A14",
			FontSize: 18,
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Modules",
			Url:    "/extensions/modules",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Shipping",
			Url:    "/extensions/shipping",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Payments",
			Url:    "/extensions/payments",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Order Totals",
			Url:    "/extensions/order-totals",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Feeds",
			Url:    "/extensions/feeds",
		})
		AdminMenu.Add(&AdminMenuItemStruct{
			Icon:   "shopping-cart",
			Title: "Sales",
			Url:    "#",
			Color: "#5bc0de",
			HColor: "#5bc0de",
			FontSize: 18,
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Orders",
			Url:    "/sales/orders",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Recuring Orders",
			Url:    "/sales/recuring-orders",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Returns",
			Url:    "/sales/returns",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Customers",
			Url:    "#",
			Submenu: []*AdminMenuItemStruct{
				{
					Title: "Customers",
					Url:    "/sales/customers",
				},
				{
					Title: "Customer Groups",
					Url:    "/sales/customer-groups",
				},
				{
					Title: "Custom Fields",
					Url:    "/sales/custom-fields",
				},
				{
					Title: "Banned IP",
					Url:    "/sales/banned-ip",
				},
			},
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Gift Vouchers",
			Url:    "#",
			Submenu: []*AdminMenuItemStruct{
				{
					Title: "Gift Vouchers",
					Url:    "/sales/gift-vouchers",
				},
				{
					Title: "Voucher Themes",
					Url:    "/sales/voucher-themes",
				},
			},
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "PayPal",
			Url:    "#",
			Submenu: []*AdminMenuItemStruct{
				{
					Title: "Search",
					Url:    "/sales/paypal-search",
				},
			},
		})
		AdminMenu.Add(&AdminMenuItemStruct{
			Icon:   "share",
			Title: "Marketing",
			Url:    "#",
			Color: "#00bc8c",
			HColor: "#00bc8c",
			FontSize: 18,
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Marketing",
			Url:    "/marketing/tracking",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Affiliates",
			Url:    "/marketing/affiliates",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Coupons",
			Url:    "/marketing/coupons",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Mail",
			Url:    "/marketing/mail",
		})
		AdminMenu.Add(&AdminMenuItemStruct{
			Icon:   "gear",
			Title:  "System",
			Url:    "#",
			Color:  "#EF6F6C",
			HColor: "#EF6F6C",
			FontSize: 18,
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Settings",
			Url:    "/system/settings",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Design",
			Url:    "#",
			Submenu: []*AdminMenuItemStruct{
				{
					Title: "Layouts",
					Url:    "/system/design/layouts",
				},
				{
					Title: "Banners",
					Url:    "/system/design/banners",
				},
			},
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Users",
			Url:    "#",
			Submenu: []*AdminMenuItemStruct{
				{
					Title: "Users",
					Url:    "/system/users",
				},
				{
					Title: "User Groups",
					Url:    "/system/users/groups",
				},
			},
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Localisation",
			Url:    "#",
			Submenu: []*AdminMenuItemStruct{
				{
					Title: "Store location",
					Url:    "/system/localisation/store-location",
				},
				{
					Title: "Languages",
					Url:    "/system/localisation/languages",
				},
				{
					Title: "Currencies",
					Url:    "/system/localisation/currencies",
				},
				{
					Title: "Stock Statuses",
					Url:    "/system/localisation/stock-statuses",
				},
				{
					Title: "Order Statuses",
					Url:    "/system/localisation/order-statuses",
				},
				{
					Title: "Returns",
					Url:    "#",
					Submenu: []*AdminMenuItemStruct{
						{
							Title: "Return Statuses",
							Url:    "/system/localisation/returns/return-statuses",
						},
						{
							Title: "Return Actions",
							Url:    "/system/localisation/returns/return-actions",
						},
						{
							Title: "Return Reasons",
							Url:    "/system/localisation/returns/return-reasons",
						},
					},
				},
				{
					Title: "Countries",
					Url:    "/system/localisation/countries",
				},
				{
					Title: "Zones",
					Url:    "/system/localisation/zones",
				},
				{
					Title: "Geo Zones",
					Url:    "/system/localisation/geo-zones",
				},
				{
					Title: "Taxes",
					Url:    "#",
					Submenu: []*AdminMenuItemStruct{
						{
							Title: "Tax Classes",
							Url:    "/system/localisation/taxes/tax-classes",
						},
						{
							Title: "Tax Rates",
							Url:    "/system/localisation/taxes/tax-rates",
						},
					},
				},
				{
					Title: "Length Classes",
					Url:    "/system/localisation/length-classes",
				},
				{
					Title: "Weight Classes",
					Url:    "/system/localisation/weight-classes",
				},
			},
		})
		AdminMenu.Add(&AdminMenuItemStruct{
			Icon:   "wrench",
			Title: "Tools",
			Url:    "#",
			Color: "#5bc0de",
			HColor: "#5bc0de",
			FontSize: 18,
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Uploads",
			Url:    "/tools/uploads",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Backup / Restore",
			Url:    "/tools/backup-restore",
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Error Logs",
			Url:    "/tools/error-logs",

		})
		AdminMenu.Add(&AdminMenuItemStruct{
			Icon:   "linechart",
			Title: "Reports",
			Url:    "#",
			Color: "#F89A14",
			HColor: "#F89A14",
			FontSize: 18,
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Sales",
			Url:    "#",
			Submenu: []*AdminMenuItemStruct{
				{
					Title: "Orders",
					Url:    "/reports/sales/orders",
				},
				{
					Title: "Tax",
					Url:    "/reports/sales/tax",
				},
				{
					Title: "Shipping",
					Url:    "/reports/sales/shipping",
				},
				{
					Title: "Returns",
					Url:    "/reports/sales/returns",
				},
				{
					Title: "Coupons",
					Url:    "/reports/sales/coupons",
				},
			},
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Products",
			Url:    "#",
			Submenu: []*AdminMenuItemStruct{
				{
					Title: "Viewed",
					Url:    "/reports/products/viewed",
				},
				{
					Title: "Purchased",
					Url:    "/reports/products/purchased",
				},
			},
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Customers",
			Url:    "#",
			Submenu: []*AdminMenuItemStruct{
				{
					Title: "Customers Online",
					Url:    "/reports/customers/customers-online",
				},
				{
					Title: "Customers Activity",
					Url:    "/reports/customers/customers-activity",
				},
				{
					Title: "Orders",
					Url:    "/reports/customers/orders",
				},
				{
					Title: "Reward Points",
					Url:    "/reports/customers/reward-points",
				},
				{
					Title: "Credit",
					Url:    "/reports/customers/credit",
				},
			},
		}).AddSubmenu(&AdminMenuItemStruct{
			Title: "Marketing",
			Url:    "#",
			Submenu: []*AdminMenuItemStruct{
				{
					Title: "Marketing",
					Url:    "/reports/marketing",
				},
				{
					Title: "Affiliates",
					Url:    "/reports/marketing/affiliates",
				},
				{
					Title: "Affiliate Activity",
					Url:    "/reports/marketing/affiliate-activity",
				},
			},
		})*/
	AdminMenu.init()
}
/*
var menuItems = []AdminMenuItemStruct{
	AdminMenuItemStruct{
		Icon:   "home",
		Title: "Dashboard",
		Url:    "",
		Color: "#418BCA",
		HColor: "#418BCA",
		FontSize: 18,
	},
	AdminMenuItemStruct{
		Icon:   "tags",
		Title: "Catalog",
		Url:    "#",
		Color: "#00bc8c",
		HColor: "#00bc8c",
		FontSize: 18,
		Submenu: []AdminMenuItemStruct{
			AdminMenuItemStruct{
				Title: "Categories",
				Url:    "/catalog/categories",
			},
			AdminMenuItemStruct{
				Title: "Products",
				Url:    "/catalog/products",
			},
			AdminMenuItemStruct{
				Title: "Recurring Profiles",
				Url:    "/catalog/recuring-profiles",
			},
			AdminMenuItemStruct{
				Title: "Filters",
				Url:    "/catalog/filters",
			},
			AdminMenuItemStruct{
				Title: "Attributes",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "Attributes",
						Url:    "/catalog/attributes",
					},
					AdminMenuItemStruct{
						Title: "Attribute Groups",
						Url:    "/catalog/attribute-groups",
					},
				},
			},
			AdminMenuItemStruct{
				Title: "Options",
				Url:    "/catalog/options",
			},
			AdminMenuItemStruct{
				Title: "Manufacturers",
				Url:    "/catalog/manufacturers",
			},
			AdminMenuItemStruct{
				Title: "Downloads",
				Url:    "/catalog/downloads",
			},
			AdminMenuItemStruct{
				Title: "Reviews",
				Url:    "/catalog/reviews",
			},
		},
	},
	AdminMenuItemStruct{
		Icon:   "screen-full",
		Title: "Extensions",
		Url:    "#",
		Color: "#F89A14",
		HColor: "#F89A14",
		FontSize: 18,
		Submenu: []AdminMenuItemStruct{
			AdminMenuItemStruct{
				Title: "Modules",
				Url:    "/extensions/modules",
			},
			AdminMenuItemStruct{
				Title: "Shipping",
				Url:    "/extensions/shipping",
			},
			AdminMenuItemStruct{
				Title: "Payments",
				Url:    "/extensions/payments",
			},
			AdminMenuItemStruct{
				Title: "Order Totals",
				Url:    "/extensions/order-totals",
			},
			AdminMenuItemStruct{
				Title: "Feeds",
				Url:    "/extensions/feeds",
			},
		},
	},
	AdminMenuItemStruct{
		Icon:   "shopping-cart",
		Title: "Sales",
		Url:    "#",
		Color: "#5bc0de",
		HColor: "#5bc0de",
		FontSize: 18,
		Submenu: []AdminMenuItemStruct{
			AdminMenuItemStruct{
				Title: "Orders",
				Url:    "/sales/orders",
			},
			AdminMenuItemStruct{
				Title: "Recuring Orders",
				Url:    "/sales/recuring-orders",
			},
			AdminMenuItemStruct{
				Title: "Returns",
				Url:    "/sales/returns",
			},
			AdminMenuItemStruct{
				Title: "Customers",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "Customers",
						Url:    "/sales/customers",
					},
					AdminMenuItemStruct{
						Title: "Customer Groups",
						Url:    "/sales/customer-groups",
					},
					AdminMenuItemStruct{
						Title: "Custom Fields",
						Url:    "/sales/custom-fields",
					},
					AdminMenuItemStruct{
						Title: "Banned IP",
						Url:    "/sales/banned-ip",
					},
				},
			},
			AdminMenuItemStruct{
				Title: "Gift Vouchers",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "Gift Vouchers",
						Url:    "/sales/gift-vouchers",
					},
					AdminMenuItemStruct{
						Title: "Voucher Themes",
						Url:    "/sales/voucher-themes",
					},
				},
			},
			AdminMenuItemStruct{
				Title: "PayPal",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "search",
						Url:    "/sales/paypal-search",
					},
				},
			},
		},
	},
	AdminMenuItemStruct{
		Icon:   "share",
		Title: "Marketing",
		Url:    "#",
		Color: "#00bc8c",
		HColor: "#00bc8c",
		FontSize: 18,
		Submenu: []AdminMenuItemStruct{
			AdminMenuItemStruct{
				Title: "Marketing",
				Url:    "/marketing/tracking",
			},
			AdminMenuItemStruct{
				Title: "Affiliates",
				Url:    "/marketing/affiliates",
			},
			AdminMenuItemStruct{
				Title: "Coupons",
				Url:    "/marketing/coupons",
			},
			AdminMenuItemStruct{
				Title: "Mail",
				Url:    "/marketing/mail",
			},

		},
	},
	AdminMenuItemStruct{
		Icon:   "gear",
		Title:  "System",
		Url:    "#",
		Color:  "#EF6F6C",
		HColor: "#EF6F6C",
		FontSize: 18,
		Submenu: []AdminMenuItemStruct{
			AdminMenuItemStruct{
				Title: "Settings",
				Url:    "/system/settings",
			},
			AdminMenuItemStruct{
				Title: "Design",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "Layouts",
						Url:    "/system/design/layouts",
					},
					AdminMenuItemStruct{
						Title: "Banners",
						Url:    "/system/design/banners",
					},
				},
			},
			AdminMenuItemStruct{
				Title: "Users",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "Users",
						Url:    "/system/users",
					},
					AdminMenuItemStruct{
						Title: "User Groups",
						Url:    "/system/users/groups",
					},
				},
			},
			AdminMenuItemStruct{
				Title: "Localisation",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "Store location",
						Url:    "/system/localisation/store-location",
					},
					AdminMenuItemStruct{
						Title: "Languages",
						Url:    "/system/localisation/languages",
					},
					AdminMenuItemStruct{
						Title: "Currencies",
						Url:    "/system/localisation/currencies",
					},
					AdminMenuItemStruct{
						Title: "Stock Statuses",
						Url:    "/system/localisation/stock-statuses",
					},
					AdminMenuItemStruct{
						Title: "Order Statuses",
						Url:    "/system/localisation/order-statuses",
					},
					AdminMenuItemStruct{
						Title: "Returns",
						Url:    "#",
						Submenu: []AdminMenuItemStruct{
							AdminMenuItemStruct{
								Title: "Return Statuses",
								Url:    "/system/localisation/returns/return-statuses",
							},
							AdminMenuItemStruct{
								Title: "Return Actions",
								Url:    "/system/localisation/returns/return-actions",
							},
							AdminMenuItemStruct{
								Title: "Return Reasons",
								Url:    "/system/localisation/returns/return-reasons",
							},
						},
					},
					AdminMenuItemStruct{
						Title: "Countries",
						Url:    "/system/localisation/countries",
					},
					AdminMenuItemStruct{
						Title: "Zones",
						Url:    "/system/localisation/zones",
					},
					AdminMenuItemStruct{
						Title: "Geo Zones",
						Url:    "/system/localisation/geo-zones",
					},
					AdminMenuItemStruct{
						Title: "Taxes",
						Url:    "#",
						Submenu: []AdminMenuItemStruct{
							AdminMenuItemStruct{
								Title: "Tax Classes",
								Url:    "/system/localisation/taxes/tax-classes",
							},
							AdminMenuItemStruct{
								Title: "Tax Rates",
								Url:    "/system/localisation/taxes/tax-rates",
							},
						},
					},
					AdminMenuItemStruct{
						Title: "Length Classes",
						Url:    "/system/localisation/length-classes",
					},
					AdminMenuItemStruct{
						Title: "Weight Classes",
						Url:    "/system/localisation/weight-classes",
					},
				},
			},
		},
	},
	AdminMenuItemStruct{
		Icon:   "wrench",
		Title: "Tools",
		Url:    "#",
		Color: "#5bc0de",
		HColor: "#5bc0de",
		FontSize: 18,
		Submenu: []AdminMenuItemStruct{
			AdminMenuItemStruct{
				Title: "Uploads",
				Url:    "/tools/uploads",
			},
			AdminMenuItemStruct{
				Title: "Backup / Restore",
				Url:    "/tools/backup-restore",
			},
			AdminMenuItemStruct{
				Title: "Error Logs",
				Url:    "/tools/error-logs",
			},
		},
	},
	AdminMenuItemStruct{
		Icon:   "linechart",
		Title: "Reports",
		Url:    "#",
		Color: "#F89A14",
		HColor: "#F89A14",
		FontSize: 18,
		Submenu: []AdminMenuItemStruct{
			AdminMenuItemStruct{
				Title: "Sales",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "Orders",
						Url:    "/reports/sales/orders",
					},
					AdminMenuItemStruct{
						Title: "Tax",
						Url:    "/reports/sales/tax",
					},
					AdminMenuItemStruct{
						Title: "Shipping",
						Url:    "/reports/sales/shipping",
					},
					AdminMenuItemStruct{
						Title: "Returns",
						Url:    "/reports/sales/returns",
					},
					AdminMenuItemStruct{
						Title: "Coupons",
						Url:    "/reports/sales/coupons",
					},
				},
			},
			AdminMenuItemStruct{
				Title: "Products",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "Viewed",
						Url:    "/reports/products/viewed",
					},
					AdminMenuItemStruct{
						Title: "Purchased",
						Url:    "/reports/products/purchased",
					},
				},
			},
			AdminMenuItemStruct{
				Title: "Customers",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "Customers Online",
						Url:    "/reports/customers/customers-online",
					},
					AdminMenuItemStruct{
						Title: "Customers Activity",
						Url:    "/reports/customers/customers-activity",
					},
					AdminMenuItemStruct{
						Title: "Orders",
						Url:    "/reports/customers/orders",
					},
					AdminMenuItemStruct{
						Title: "Reward Points",
						Url:    "/reports/customers/reward-points",
					},
					AdminMenuItemStruct{
						Title: "Credit",
						Url:    "/reports/customers/credit",
					},
				},
			},
			AdminMenuItemStruct{
				Title: "Marketing",
				Url:    "#",
				Submenu: []AdminMenuItemStruct{
					AdminMenuItemStruct{
						Title: "Marketing",
						Url:    "/reports/marketing",
					},
					AdminMenuItemStruct{
						Title: "Affiliates",
						Url:    "/reports/marketing/affiliates",
					},
					AdminMenuItemStruct{
						Title: "Affiliate Activity",
						Url:    "/reports/marketing/affiliate-activity",
					},
				},
			},
		},
	},

}

*/