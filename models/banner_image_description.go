package models

type BannerImageDescription struct {
	Id_RENAME  int       `orm:"column(id)"`
	LanguageId *Language `orm:"column(language_id);rel(fk)"`
	BannerId   *Banner   `orm:"column(banner_id);rel(fk)"`
	Title      string    `orm:"column(title);size(64)"`
}
