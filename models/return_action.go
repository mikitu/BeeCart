package models

type ReturnAction struct {
	Id_RENAME  int       `orm:"column(id)"`
	LanguageId *Language `orm:"column(language_id);rel(fk)"`
	Name       string    `orm:"column(name);size(64)"`
}
