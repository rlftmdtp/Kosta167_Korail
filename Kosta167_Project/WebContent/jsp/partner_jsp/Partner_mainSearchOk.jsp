<%@page import="partner.model.Member"%>
<%@page import="java.util.List"%>
<%@page import="partner.model.PartnerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	
	PartnerService service = PartnerService.getInstance();

	String Partner_search = request.getParameter("Partner_search");
	
	System.out.println("Partner_search : " + Partner_search);

		
	if(Partner_search != null){
		RequestDispatcher dispatcher = request.getRequestDispatcher("Partner_calendar.jsp");
		request.setAttribute("Partner_search", Partner_search);
		dispatcher.forward(request, response); 	
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