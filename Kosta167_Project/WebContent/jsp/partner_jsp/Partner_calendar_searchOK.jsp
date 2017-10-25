
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="org.apache.catalina.DistributedManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="partner.model.Member"%>
<%@page import="java.util.List"%>
<%@page import="partner.model.PartnerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	PartnerService service = PartnerService.getInstance();	
	
	String sd = request.getParameter("start");
	String ed = request.getParameter("end");
	System.out.println("sd: " + sd);
	System.out.println("ed: " + ed);
	
	String sd2 = sd.replaceAll("-|:|\\s", "/");
	String ed2 = ed.replaceAll("-|:|\\s", "/");
	
	//sd: 2017-10-25 01:00
/* 	System.out.println("sd2: " + sd2.substring(2));
	System.out.println("ed2: " + ed2); */
	
	
	HashMap<String, String> map = new HashMap<String, String>();
	
	map.put("endDate", ed2);
	map.put("startDate",sd2.substring(2));
	
	System.out.println(map+"kkkkkkkkkkkkkkkkkkkkkk");
	
	if(map != null){
	    RequestDispatcher rd = request.getRequestDispatcher("Partner_calendar.jsp");
	    request.setAttribute("map", map);
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