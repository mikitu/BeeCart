<!DOCTYPE html>
<html>
<head>
	{{template "templates/default/common/metadata.tpl"}}
</head>
<body class="common-home">
<div id="page">
	<!-- header -->
	{{template "templates/default/common/header.tpl"}}
	<!-- header_modules -->
	{{template "templates/default/module/header_modules.tpl"}}
	<div id="container">
		<div class="container">
			<div class="row">
				<!-- side -->
				{{template "templates/default/common/side.tpl"}}
				<div id="content" class="col-sm-9">
					{{.LayoutContent}}
				</div>
			</div>
		</div>
	</div>
	<!-- content_bottom -->
	{{template "templates/default/module/content_bottom.tpl"}}
	<!-- footer -->
	{{template "templates/default/common/footer.tpl"}}
</div>
<script src="static/js/livesearch.js" type="text/javascript"></script>
<script src="static/js/script.js" type="text/javascript"></script>

</body>
</html>