<%@page import="review.model.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	 request.setCharacterEncoding("UTF-8");
 %>
 
 
 <jsp:useBean id="reply" class="review.model.Reply"></jsp:useBean>
 <jsp:setProperty property="*" name="reply"/>
 
 
 <%
 	ReviewService service = ReviewService.getInstance();
 	
 	service.insertReplyService(reply);
 	
 	response.sendRedirect("reviewdetail.jsp?r_no="+reply.getR_no());
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