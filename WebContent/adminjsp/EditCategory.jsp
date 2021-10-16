<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="DAOLayer.AdminCategoryDAO, Model.Category"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>New Category</title>

<jsp:include page="AdminBar.jsp" />
<%
	String catgId = request.getParameter("catgId");
	if(catgId == null){
		response.sendRedirect("../AdminLogin.jsp");
	}
	AdminCategoryDAO adminCatgDAO = new AdminCategoryDAO();
	Category category = new Category();
	category = adminCatgDAO.getCategoryById(Integer.parseInt(catgId));
%>
</head>
<body>
	<div align="center">
		<h2>Update Category</h2>
		<form action="../UpdateCategoryServlet" method="post">
		<table>
		<tr><td>Category Id:</td> <td><input type="text" name="catgId" readonly="readonly" value="<%=category.getCatgId()%>"/></td></tr>
		<tr><td>Category Name:</td><td><input type="text" name="catgName" required="true" value="<%=category.getCatgName()%>"/></td></tr>
		<tr><td>Category Description:</td><td><textarea name="catgDesc" required="true" ><%=category.getCatgDesc()%></textarea></td></tr>
		<tr><td colspan="2"><center><input type="submit" value="Update Category" /></center></td></tr>
		</form>
	</div>
</body>
</html>