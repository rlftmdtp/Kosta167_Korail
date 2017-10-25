<%@page import="course.model.Member"%>
<%@page import="course.model.CourseService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");

	CourseService service = CourseService.getInstance();
	Member member = service.login(request);

	if (member != null) {

		System.out.println("member " + member.getM_id());
		System.out.println("member " + member.getM_pw());

		System.out.println("request " + request.getParameter("id"));
		System.out.println("request " + request.getParameter("pass"));
		
		if (member.getM_id().equals(request.getParameter("id"))
				&& member.getM_pw().equals(request.getParameter("pass"))) {

			session.setAttribute("name", member.getM_name());
			session.setAttribute("m_id", member.getM_id());
			response.sendRedirect("course.jsp");
		}
		else{
			//???
		}
	}else {
		out.println("로그인에 실패하셨습니다");
	}
%>
</head>
<body>

</body>
</html>