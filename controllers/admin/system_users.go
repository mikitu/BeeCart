package controllers

type SystemUsersController struct {
	AdminController
}

func (this *SystemUsersController) Index() {
    this.TplName = "admin/system/users.tpl"
    this.Data["PageTitle"] = "Users"
}

