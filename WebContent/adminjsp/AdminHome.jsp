<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="Exceptions.MyException"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin Control Panel</title>
<jsp:include page="AdminBar.jsp" />
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
</head>
<body>

</body>
</html>