<%@page import="Exceptions.MyException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>User </title>

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

</head>

<frameset rows="25%,*" cols="*" frameborder="no" border="0"	framespacing="0">
	<frame	src="UserHomeHeader.jsp"	name="topFrame" noresize="noresize" id="topFrame"title="topFrame" />
		<frameset rows="*" cols="179,*" framespacing="0" frameborder="no"	border="0" bordercolor="#ECE9D8">
		<frame 	src="UserCategoryHome.jsp" 	name="leftFrame"  noresize="noresize" id="leftFrame" title="leftFrame" />
		<frame 	src="UserProductHome.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
	</frameset>
</frameset>
<noframes>
	<body>
	
	</body>
</noframes>

</html>