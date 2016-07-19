package controllers

type SystemUserGroupsController struct {
	AdminController
}

func (this *SystemUserGroupsController) Index() {
    this.TplName = "admin/system/user_groups.tpl"
    this.Data["PageTitle"] = "User Groups"
}

