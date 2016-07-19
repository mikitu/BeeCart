#!/usr/bin/env bash

fld="tools"
path="error_logs"

Fld=$(perl -e "print ucfirst($fld)")
Path=$(echo $path | perl -pe 's/(^|_)./uc($&)/ge;s/_//g')

echo $Fld
echo $Path

ctlName="${Fld}$Path"
sectionName=$(echo $path | perl -pe 's/(^|_)./uc($&)/ge;s/_/ /g')

echo $sectionName

tpl="views/admin/$fld/$path.tpl"
ctl="controllers/admin/${fld}_${path}.go"

touch $tpl
cat >$tpl <<EOL
<div class="row">
</div>
EOL

touch $ctl
cat >$ctl <<EOL
package controllers

type ${ctlName}Controller struct {
	AdminController
}

func (this *${ctlName}Controller) Index() {
    this.TplName = "admin/${fld}/${path}.tpl"
    this.Data["PageTitle"] = "${sectionName}"
}

EOL

search="NSNamespace(\"/$fld"
searchEscaped=$(sed 's/[^^]/[&]/g; s/\^/\\^/g' <<<"$search")
#echo "----"
#echo $searchEscaped
repl="beego.NSRouter(\"/$path\", &adminControllers.${ctlName}Controller{}, \"*:Index\"),"
echo $repl

#replEscaped=$(sed 's/[^^]/[&]/g; s/\^/\\^/g' <<<"$repl")
#echo $replEscaped
#sed '/$searchEscaped/a$replEscaped' ./routers/router.go


