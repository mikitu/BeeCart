package helpers


type AdminMenuStruct struct {
    Items []AdminMenuItemStruct
}
type AdminMenuItemStruct struct {
    Icon    string
    Title   string
    Url     string
    Active  string
    Color   string
    HColor  string
    FontSize  int
    Submenu []AdminMenuItemStruct
}

var AdminMenu = AdminMenuStruct{
    Items: menuItems,
}

func (item AdminMenuItemStruct) GetUrl() string {
    return AdminBaseUrl + item.Url
}

func (item AdminMenuItemStruct) HasSubmenu() bool {
    return len(item.Submenu) > 0
}

func (item AdminMenuItemStruct) GetSubmenu() *[]AdminMenuItemStruct {
    return &item.Submenu
}

func (item *AdminMenuItemStruct) SetActive(){
    item.Active = "active"
}

var AdminBaseUrl string = "/admin"

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
}

