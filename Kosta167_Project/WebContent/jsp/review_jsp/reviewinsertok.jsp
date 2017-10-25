<%@page import="review.model.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%

	//review.setR_fname("");
	//review.setR_hit(0);
	//review.setM_id("aaa");


	ReviewService service = ReviewService.getInstance();
	//request.setAttribute("review", review);
	int re = service.insertReviewService(request);
	System.out.println(re);
	if(re > 0) {
		response.sendRedirect("reviewlist.jsp");
	}else {
		response.sendRedirect("reviewinsertform.jsp");
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