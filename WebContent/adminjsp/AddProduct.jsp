<%@page import="DAOLayer.AdminCategoryDAO"%>
<%@page import="DAOLayer.AdminInterfaceDAO,Model.Category"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Product Details</title>
<jsp:include page="AdminBar.jsp" />
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


</style>
<%
	AdminCategoryDAO dao = new AdminCategoryDAO();
	List<?> categories = (List<?>) dao.readAll();
%>
</head>
<body>
	<div align="center">
		<h2>Add New Product</h2>
	</div>
	<div>
		<form action="../AddProductServlet" method="post">
			<table align="center">
				<tr>
					<td>Product Name :</td>
					<td><input type="text" name="product_name" required="true" /></td>
				</tr>
				<tr>
					<td>Product Price :</td>
					<td><input type="text" name="product_price" required="true" pattern="[0-9.]+"/></td>
				</tr>
				<tr>
					<td>Product Description :</td>
					<td><input type="text" name="product_desc" required="true"/></td>
				</tr>
				<!-- <tr>
					<td>Product Image :</td>
					<td><input type="file" name="product_image" required="true" accept="image/x-png, image/gif, image/jpeg"/></td>
				</tr> -->
				<tr>
					<td>Category :</td>
					<td><select name="category" required="true">
							<%
								Category category = new Category();
								for (Object obj : categories) {
									category = (Category) obj;
							%>
							<option><%=category.getCatgName()%></option>
							<%
								}
							%>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input value="Submit"
						type="submit" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
