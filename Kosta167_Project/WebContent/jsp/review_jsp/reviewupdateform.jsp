<%@page import="review.model.Review"%>
<%@page import="review.model.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("r_no");
	int r_no=0;
	if(id!=null){
		r_no= Integer.parseInt(id);
	}

	ReviewService service = ReviewService.getInstance();
	Review review = service.selectReviewService(r_no);
	
	request.setAttribute("review", review);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<h1>글수정하기</h1>
	<form action="reviewpasswordok.jsp" method ="post">
	<input type ="hidden" name="r_no" value="<%=r_no %>">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr height="30">
				<td width="80">작성자</td>
				<td width="170"><input type="text" name="r_name" size="10" value="${review.r_name}">
				</td>
				<td width="80">비밀번호</td>
				<td width="170"><input type="password" name="r_pw" size="10">
				</td>
			</tr>
			<tr height="30">
				<td width="80">제목</td>
				<td align="left" colspan="3">
					<input type="text" name="r_title" size="50" value="${review.r_title }">
				</td>
			</tr>
			<tr height="30">
				<td colspan="4"><textarea rows="10" cols="70" name="r_content">${review.r_content }</textarea>
				</td>
			</tr>
			<tr height="30">
				<td colspan="4" align="center">
				<input type="submit" value="글쓰기">&nbsp;&nbsp;
					<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>