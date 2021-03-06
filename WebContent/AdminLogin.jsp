<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<!--META-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Form</title>

<!--STYLESHEETS-->
<link href="css/style.css" rel="stylesheet" type="text/css" />

<!--SCRIPTS-->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
	
<script type="text/javascript" src="js/jquery.min.js"> </script>
<!--Slider-in icons-->
<script type="text/javascript">
	$(document).ready(function() {
		$(".username").focus(function() {
			$(".user-icon").css("left", "-48px");
		});
		$(".username").blur(function() {
			$(".user-icon").css("left", "0px");
		});

		$(".password").focus(function() {
			$(".pass-icon").css("left", "-48px");
		});
		$(".password").blur(function() {
			$(".pass-icon").css("left", "0px");
		});
	});
</script>

</head>
<body>
<br><br>
<h1><center>Food Ordering System</center></h1>
	<!--WRAPPER-->
	<div id="wrapper">

		<!--SLIDE-IN ICONS-->
		<div class="user-icon"></div>
		<div class="pass-icon"></div>
		<!--END SLIDE-IN ICONS-->

		<!--LOGIN FORM-->
		<form name="login-form" class="login-form" action="AdminLoginServlet" method="post">
			<!--HEADER-->
			<div class="header">
				<!--TITLE-->
				<h1>Seller Login</h1>
				<!--END TITLE-->
				<!--DESCRIPTION-->
				<span>Fill out the form below to login to Seller control panel.</span>
				<!--END DESCRIPTION-->
			</div>
			<!--END HEADER-->

			<!--CONTENT-->
		
			<div class="content">
				<!--USERNAME-->
				<input name="admin-username" type="text" class="input username"
					value="Username" onfocus="this.value=''" required="true" />
				<!--END USERNAME-->
				<!--PASSWORD-->
				<input name="admin-password" type="password" class="input password"
					value="Password" onfocus="this.value=''" required="true"/>
				<!--END PASSWORD-->
			</div>
			<!--END CONTENT-->

			<!--FOOTER-->
			<div class="footer">
				<!--LOGIN BUTTON-->
				<input type="submit" name="submit" value="Login" class="button" />
				<!--END LOGIN BUTTON-->
				<a href="RegisterAdmin.jsp" class="register" style="text-decoration: none;">Register</a>
			</div>
			<!--END FOOTER-->
			<h4><center>Click <a href="Login.jsp"> here </a>for User Login</center></h4>
		</form>
		<!--END LOGIN FORM-->
	</div>
	<!--END WRAPPER-->

	<!--GRADIENT-->
	<div class="gradient"></div>
	<!--END GRADIENT-->

</body>
</html>