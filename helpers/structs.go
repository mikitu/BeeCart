package helpers

import (
    "html/template"
)

type Widget struct{
    Title string
    Template string
    Data interface{}
}

var WidgetTemplates *template.Template

type Widgets struct {
    Items []Widget
}

func (widgets *Widgets) Add (w Widget) {
    if widgets.Find(w.Title) == nil {
        widgets.Items = append(widgets.Items, w)
    }
}

func (widgets *Widgets) Find (t string) (interface{}) {
    for _, w := range(widgets.Items) {
        if w.Title == t {
            return w
        }
    }
    return nil
}

type Breadcrumbs struct {
    Items []BreadcrumbsItem
}
func NewBreadcrumbs() (*Breadcrumbs) {
    return new(Breadcrumbs)
}
func (b *Breadcrumbs) Add(title, url string) {
    bci := new(BreadcrumbsItem)
    bci.Title = title
    bci.Url = url
    println("IsActive: ", bci.IsActive())
    b.Items = append(b.Items, *bci)
}

type BreadcrumbsItem struct {
    Title   string
    Url     string
}

func (bi BreadcrumbsItem) IsActive() bool {
    return bi.Url == ""
}