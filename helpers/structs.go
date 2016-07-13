package helpers

type Widget struct{
    Title string
    Template string
}

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