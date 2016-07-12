<!DOCTYPE html>
<html>
<head>
	<title>Login | Josh Admin Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- global level css -->
	<link href="/static/css/bootstrap.min.css" rel="stylesheet" />
	<!-- end of global level css -->
	<!-- page level css -->
	<link rel="stylesheet" type="text/css" href="/static/css/pages/login.css" />
	<!-- end of page level css -->
</head>
<body>
<div class="container">
	<div class="row vertical-offset-100">
		<div class="col-sm-6 col-sm-offset-3  col-md-5 col-md-offset-4 col-lg-4 col-lg-offset-4">
			<div id="container_demo">
				<a class="hiddenanchor" id="toregister"></a>
				<a class="hiddenanchor" id="tologin"></a>
				<a class="hiddenanchor" id="toforgot"></a>
				<div id="wrapper">
					<div id="login" class="animate form">
						<form action="/admin/login" autocomplete="on" method="post">
							<h3 class="black_bg">Log in</h3>
							<p>
								<label style="margin-bottom:0px;" for="username" class="uname"> <i class="livicon" data-name="user" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
									E- mail or Username
								</label>
								<input id="username" name="username" required type="text" placeholder="username or e-mail" />
							</p>
							<p>
								<label style="margin-bottom:0px;" for="password" class="youpasswd"> <i class="livicon" data-name="key" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
									Password
								</label>
								<input id="password" name="password" required type="password" placeholder="eg. X8df!90EO" />
							</p>
							<p class="keeplogin">
								<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" />
								<label for="loginkeeping">Keep me logged in</label>
							</p>
							<p class="login button">
								<input type="submit" value="Login" class="btn btn-success" />
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- global js -->
<script src="/static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<!-- Bootstrap -->
<script src="/static/js/bootstrap.min.js" type="text/javascript"></script>
<!--livicons-->
<script src="/static/vendors/livicons/minified/raphael-min.js" type="text/javascript"></script>
<script src="/static/vendors/livicons/minified/livicons-1.4.min.js" type="text/javascript"></script>
<script src="/static/js/josh.js" type="text/javascript"></script>
<script src="/static/js/metisMenu.js" type="text/javascript"> </script>
<script src="/static/vendors/holder-master/holder.js" type="text/javascript"></script>
<!-- end of global js -->
</body>
</html>
