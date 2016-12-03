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
<script src="/static/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
<!-- global js -->
<script src="/static/admin/js/admin.js" type="text/javascript"></script>
<!--livicons-->
<script src="/static/vendors/livicons/minified/raphael-min.js" type="text/javascript"></script>
<script src="/static/vendors/livicons/minified/livicons-1.4.min.js" type="text/javascript"></script>
<script src="/static/vendors/holderjs/holder.js" type="text/javascript"></script>
<!-- end of global js -->
<!-- begining of page level js -->
<!--  todolist-->
<!-- EASY PIE CHART JS -->
<script src="/static/vendors/bower-jquery-easyPieChart/dist/jquery.easypiechart.min.js"></script>
<!--for calendar-->
<script src="/static/vendors/fullcalendar/dist/fullcalendar.min.js" type="text/javascript"></script>
<script src="/static/vendors/fullcalendar/dist/calendarcustom.min.js" type="text/javascript"></script>
<!--   Realtime Server Load  -->
<script src="/static/vendors/Flot/jquery.flot.js" type="text/javascript"></script>
<script src="/static/vendors/Flot/jquery.flot.resize.js" type="text/javascript"></script>
<!--Sparkline Chart-->
<script src="/static/vendors/jquery.sparkline/jquery.sparkline.js"></script>
<!-- Back to Top-->
<script type="text/javascript" src="/static/vendors/countUp/countUp.js"></script>
<!--   maps -->
<script src="/static/vendors/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/static/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="/static/vendors/jscharts/Chart.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var composeHeight = $('#calendar').height() +21 - $('.adds').height();
		$('.list_of_items').slimScroll({
			color: '#A9B6BC',
			height: composeHeight + 'px',
			size: '5px'
		});
	});
</script>
<!-- end of page level js -->

</body>
</html>
