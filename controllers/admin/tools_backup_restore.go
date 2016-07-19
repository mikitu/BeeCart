package controllers

type ToolsBackupRestoreController struct {
	AdminController
}

func (this *ToolsBackupRestoreController) Index() {
    this.TplName = "admin/tools/backup_restore.tpl"
    this.Data["PageTitle"] = "Backup Restore"
}

