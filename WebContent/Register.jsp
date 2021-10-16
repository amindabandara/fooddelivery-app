<%@page import="DAOLayer.AdminCategoryDAO, java.util.*, Model.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="Exceptions.MyException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
<%
	HttpSession adminSession  = request.getSession(false);
	String msg =(String) adminSession.getAttribute("message");
	MyException exception =(MyException) adminSession.getAttribute("exception");
	
	if(exception != null){
	
%>
		alert("<%=exception.getMessage()%>");
<%
	
	}
	 if(msg != null){
%>
			alert("<%=msg%>");
<%
			exception = null;
			msg = null;
			adminSession.setAttribute("message", msg);
			adminSession.setAttribute("exception", exception);
		}
%>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserHome JSP</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>

body {
	margin: 0px;

}

a {
	list-style: none;
	'
}

#ux-header {
	line-height: 100px;
	min-width: 998px;
	background-color: rgb(40, 40, 40);
	color: rgb(207, 207, 207);
	margin-top: -21px;
}
.center {
position: absolute;
left: 50%;
top: 40%;
transform: translate(-50%, -50%);
border: 5px solid #FFFF00;
padding: 10px;
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
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=password], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=email], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}


input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>

</head>
<body>
	<div id="ux-header">
		<h1 align="center">SignUp User</h1>
	</div>
	<div class="center">
		<form action="UserRegisterServlet" method="post">
			<table>
				<tr>
					<td>User Name :</td>
					<td><input type="text" name="form-username" required="true"></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input type="password" name="form-password" required="true"></td>
				</tr>
				<tr>
					<td>Confirm Password :</td>
					<td><input type="password" name="confirm-password" required="true"></td>
				</tr>
				<tr>
					<td>Email Id :</td>
					<td><input type="email" name="form-email" required="true"></td>
				</tr>
				<tr>
					<td>Mobile No :</td>
					<td><input type="text" name="form-mobno" required="true" pattern="[0-9.]+"></td>
				</tr>
				<tr>
					<td>Address :</td>
					<td><textarea type="text" name="form-address" required="true" ></textarea></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="Submit"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>