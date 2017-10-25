<%@page import="partner.model.PartnerService"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	PartnerService service = PartnerService.getInstance();
	String station = request.getParameter("station");
	

	
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("station", station);
	
	// ex)아산 or 천안
	System.out.println(map);

	if(map != null){
	    RequestDispatcher rd = request.getRequestDispatcher("Partner_calendar.jsp");
	    request.setAttribute("station_map", map);
	    rd.forward(request, response);
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