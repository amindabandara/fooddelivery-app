
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserHome JSP</title>
<style>
body {
	margin: 0px;
	background: url(../images/bg.png) repeat;
}
 a{
 	list-style: none;'
 }
#ux-header {
	line-height: 100px;
	min-width: 998px;
	background-color: rgb(40, 40, 40);
	color: rgb(207, 207, 207);
	margin-top: -21px;
}
</style>
<style>
.button {
  border-radius: 4px;
  background-color: #0099cc;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 20px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>
<%
	String userName = (String)request.getSession().getAttribute("userSession");
	
%>
</head>
<body>
	<div id="header" >
		<div id="ux-header">
			<h1 align="center">Welcome	<%=userName%></h1>
		</div>
		<div align="right">
		<a class="button" href="../userjsp/UserHome.jsp" target="_parent">
						Home</a>&nbsp;&nbsp;&nbsp;
		<a class="button" href="../ViewMyCartServlet?UserId=<%=userName%>" target="_parent">
						View My Cart</a>&nbsp;&nbsp;&nbsp;
		<a class="button" href="../EditUserServlet?UserId=<%=userName%>" target="_parent">
						Update Profile</a>
			<!--  <a href='../UserUpdateServlet'>Update Profile</a>-->
		&nbsp;&nbsp;&nbsp;
			<a class="button" href='../UserLogoutServlet' target="_parent">Logout User</a>
		</div>
	</div>
</body>
</html>