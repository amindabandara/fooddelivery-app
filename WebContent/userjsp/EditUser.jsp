

<%@page	import="Model.User"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update User Profile</title>
<jsp:include page="UserHomeHeader.jsp" />
<%
  

User user = new User();
user = (User) request.getSession().getAttribute("userupdate");
	if (user == null) {
		request.getSession().setAttribute("message",
				"Error!!!!!!!! Select User.");
		response.sendRedirect("UserHome.jsp");
	}
%>


</head>

<body>
	<div align="center">
		<h2>Update User Profile</h2>
	</div>
	<div>
		<form action="../UserUpdateServlet" method="post">
		<input type="hidden" name="form-userid" readonly="readonly"
						value="<%=user.getUserid()%>" />
			<table align="center">
				
				<tr>
					<td>User Name :</td>
					<td><input type="text" name="form-username" required="true"
						value="<%=user.getUsername()%>" /></td>
				</tr>
				<tr>
					<td>New Password :</td>
					<td><input type="password" name="form-password" required="true"
						value="<%=user.getPassword()%>" /></td>
				</tr>
				<tr>
					<td>User Email :</td>
					<td><input type="text" name="form-email" required="true"
						value="<%=user.getEmailid()%>"  /></td>
				</tr>
				
				<tr>
					<td>User Mobile :</td>
					<td><input type="text" name="form-mobno" required="true"
						value="<%=user.getMobno()%>" /></td>
				</tr>
				<tr>
					<td>User Address :</td>
					<td><input type="text" name="form-address" required="true"
						value="<%=user.getAddress()%>" /></td>
				</tr>
				
				
				<tr>
					<td  align="center"><input name="form-bt" value="Update Profile"
						type="submit" /></td>
				<td align="center"><input name="form-bt" value="Delete Profile"
						type="submit" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>