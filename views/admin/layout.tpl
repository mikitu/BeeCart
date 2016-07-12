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
			<h1>Welcome to Dashboard</h1>
			<ol class="breadcrumb">
				<li class="active">
					<a href="#">
						<i class="livicon" data-name="home" data-size="16" data-color="#333" data-hovercolor="#333"></i>
						Home
					</a>
				</li>
			</ol>
		</section>
		{{.LayoutContent}}
	</aside>
	<!-- right-side -->
</div>
<a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="Return to top" data-toggle="tooltip" data-placement="left">
	<i class="livicon" data-name="plane-up" data-size="18" data-loop="true" data-c="#fff" data-hc="white"></i>
</a>
<!-- global js -->
<script src="/static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="/static/js/bootstrap.min.js" type="text/javascript"></script>
<!--livicons-->
<script src="/static/vendors/livicons/minified/raphael-min.js" type="text/javascript"></script>
<script src="/static/vendors/livicons/minified/livicons-1.4.min.js" type="text/javascript"></script>
<script src="/static/js/josh.js" type="text/javascript"></script>
<script src="/static/js/metisMenu.js" type="text/javascript"> </script>
<script src="/static/vendors/holder-master/holder.js" type="text/javascript"></script>
<!-- end of global js -->
<!-- begining of page level js -->
<!--  todolist-->
<script src="/static/js/todolist.js"></script>
<!-- EASY PIE CHART JS -->
<script src="/static/vendors/charts/easypiechart.min.js"></script>
<script src="/static/vendors/charts/jquery.easypiechart.min.js"></script>
<!--for calendar-->
<script src="/static/vendors/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="/static/vendors/fullcalendar/calendarcustom.min.js" type="text/javascript"></script>
<!--   Realtime Server Load  -->
<script src="/static/vendors/charts/jquery.flot.min.js" type="text/javascript"></script>
<script src="/static/vendors/charts/jquery.flot.resize.min.js" type="text/javascript"></script>
<!--Sparkline Chart-->
<script src="/static/vendors/charts/jquery.sparkline.js"></script>
<!-- Back to Top-->
<script type="text/javascript" src="/static/vendors/countUp/countUp.js"></script>
<!--   maps -->
<script src="/static/vendors/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/static/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="/static/vendors/jscharts/Chart.js"></script>
<script src="/static/js/dashboard.js" type="text/javascript"></script>
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
