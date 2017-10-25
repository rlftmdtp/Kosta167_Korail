<%-- <%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div id = "wrapper">
<%
    String body = request.getParameter("body");
	if(body == null){
		body = "mainpage.jsp";
	}
   
    	
    %>

	<jsp:include page="header.jsp"/>
	<br>
	<jsp:include page="<%= body %>"/>
	<br>
	<jsp:include page="footer.jsp"/> 
	
	</div>
</body>
</html>





