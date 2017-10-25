<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<form action="share_loginok.jsp" method="post">
		로그인 <input type="text" name="id"> <input type="text"
			name="pass"> <input type="submit" value="로그인"> 이름<input
			type="text" value="<%=session.getAttribute("name")%>" id="name"
			disabled="disabled"> 아이디<input type="text"
			value="<%=session.getAttribute("m_id")%>" id="m_id"
			disabled="disabled">
	</form>
</body>
</html>