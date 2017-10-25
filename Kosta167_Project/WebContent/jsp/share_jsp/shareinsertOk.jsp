 <%@page import="org.apache.catalina.Service"%>
<%@page import="share.model.ShareService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    request.setCharacterEncoding("utf-8");
    %>
    <jsp:useBean id="share" class="share.model.Share"></jsp:useBean>
    <jsp:setProperty property="*" name="share"/>
 <%
 	
 	System.out.println(share);
 	ShareService service = ShareService.getInstance();
	int re = service.insertShareService(share);
	
 	if(re > 0){
		
		
		response.sendRedirect("shareList.jsp");
	 }else{
		response.sendRedirect("shareForm.jsp");
	} 
	%>    
 		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>