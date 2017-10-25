<%@page import="review.model.Review"%>
<%@page import="review.model.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("r_no");
	
	int r_no = 0;
	
	if(id!=null){
		r_no = Integer.parseInt(id);
	}

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<form action="reviewdeleteok.jsp">
		<input type="hidden" name = "r_no" value=<%=r_no %>>
		글 비밀번호입력 <input type="password" name = "check_pw">
		<input type="submit" name = "delete" value="입력확인">
	</form>
	</center>
</body>
</html>