<!DOCTYPE html>
<html>

<head>
{{template "admin/metadata.tpl" .}}
</head>

<body class="skin-josh">
{{template "admin/header.tpl" .}}
<div class="wrapper row-offcanvas row-offcanvas-left">
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="left-side sidebar-offcanvas">
	{{template "admin/side.tpl" .}}
	</aside>
	<!-- Right side column. Contains the navbar and content of the page -->
	<aside class="right-side">
		<!-- Main content -->
		<section class="content-header">
			<h1>{{.PageTitle}}</h1>
			{{template "admin/breadcrumbs.tpl" .}}
		</section>
		{{.LayoutContent}}
	</aside>
	<!-- right-side -->
</div>
<a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="Return to top" data-toggle="tooltip" data-placement="left">
	<i class="livicon" data-name="plane-up" data-size="18" data-loop="true" data-c="#fff" data-hc="white"></i>
</a>
{{template "admin/scripts.tpl" .}}
</body>
</html>
