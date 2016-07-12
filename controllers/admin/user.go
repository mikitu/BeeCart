package controllers

type UserController struct {
	AdminController
}

func (this *UserController) Login() {
    this.TplName = "admin/login.tpl"
}

func (this *UserController) Logout() {
    this.TplName = "admin/login.tpl"
}
