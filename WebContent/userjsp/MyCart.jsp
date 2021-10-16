<%@page import="Model.CartLog"%>
<%@page	import="Model.User"%>
<%@ page import="java.util.List"%>
<%@page import="Exceptions.MyException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Update My Cart</title>
<jsp:include page="UserHomeHeader.jsp" />
<%
  
List<CartLog> mycartitems = (List<CartLog>) request.getSession().getAttribute("mycart");

	if (mycartitems.toString() == null) {
		request.getSession().setAttribute("message",
				"Error!!!!!!!! Select Items.");
		response.sendRedirect("UserHome.jsp");
	}
%>


</head>

<body>
	<div align="center">
		<h2>Update My Cart</h2>
	</div>
	<div>
		
		
			<table align="center" border=1>
				
				
			<tr>
				<!-- <th width="100">Category ID</th> -->
				<th width="200">Category Name</th>
				<th width="200">Product Name</th>
				<th width="200">Quantity</th>
				<th width="80">Edit</th>
				<th width="80">Delete</th>
			</tr>
			<%
			if (mycartitems != null) {
				for (CartLog obj : mycartitems) {
				
			%>
			<tr>
			 <form action="../UpdateMyCartServlet" method="post">
				<%-- <td align="center"><%=catg.getCatgId()%></td> --%>
				<input type="hidden" name="cartId" value="<%=obj.getCartid()%>"/>
				<td align="center"><%=obj.getCategory_id()%></td>
				<td align="center"><%=obj.getProductid()%></td>
				<td align="center"><input type="number" name="quantity" min="1" value="<%=obj.getQuantity()%>"/></td>
				<td align="center"><button
							type="submit">Update</button></td>
				<td align="center"><a
					href="../UpdateMyCartServlet?cartId=<%=obj.getCartid()%>&quantity=5&type=2"><button
							type="button">Delete</button></a></td>
			</form>
			</tr>
			<%
				}
			}else {
				response.setContentType("text/html");
				out.print("<h2>No items in cart.</h2>");
			}
			%>
		</table>
			
		
	</div>
</body>
</html>