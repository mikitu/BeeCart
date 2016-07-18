<section class="content">
	<div class="row">
		{{range .Widgets.Items}}
			{{IncludeTemplate .Template .Data}}
		{{end}}
	</div>
	<!--/row-->
	<div class="row ">
		{{template "admin/widgets/realtime-server-load.tpl" .}}
		<div class="col-md-4 col-sm-6">
			{{template "admin/widgets/server-stats.tpl" .}}
			<!-- BEGIN Percentage monitor -->
			{{template "admin/widgets/result-vs-target.tpl" .}}
			<!-- END BEGIN Percentage monitor-->
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="row">
		{{template "admin/widgets/calendar.tpl" .}}
		<!-- To do list -->
		{{template "admin/widgets/todo.tpl" .}}
	</div>
	<div class="clearfix"></div>
	<div class="row ">
		{{template "admin/widgets/quick-mail.tpl" .}}
		{{template "admin/widgets/visitor-map.tpl" .}}
	</div>
</section>