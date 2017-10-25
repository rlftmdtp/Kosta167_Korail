<%@page import="javax.swing.RepaintManager"%>
<%@page import="review.model.Review"%>
<%@page import="review.model.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("r_no");
	
	int r_no=0;
	if(id!=null){
		r_no = Integer.parseInt(id);
	}
	
	String check_pw = request.getParameter("check_pw");
	
	ReviewService service = ReviewService.getInstance();
	Review review = service.selectReviewService(r_no);
	
	if(review.getR_pw().equals(check_pw)){
		service.deleteReviewService(r_no);
		response.sendRedirect("reviewlist.jsp");
	}else{
		response.sendRedirect("reviewdetail.jsp?r_no="+r_no);
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