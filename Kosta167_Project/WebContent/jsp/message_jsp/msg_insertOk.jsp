<%@page import="java.io.PrintWriter"%>
<%@page import="message.model.MessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
	<!-- usebean을 사용하여 message라는 객체에 담고 속성전체를 가져온다 -->
	<jsp:useBean id="message" class="message.model.Message"></jsp:useBean>
	<jsp:setProperty property="*" name = "message" />
	
<%
	
	String m_id = request.getParameter("m_id");
	int re = -1;
	
	MessageService service = MessageService.getInstance();
	re = service.checkId(m_id);
	PrintWriter writer = response.getWriter();
	 
	 /* 받는아이디가 회원아이디에 있다면 DB에 집어넣어라   */
	if(re > 0){
		service.insertMessageService(message);
		writer.println("<script type='text/javascript'>");
		writer.println("window.close()");
		writer.println("</script>");
	}
	else{
		/* response.sendRedirect("msg_insertform.jsp"); */
		writer.println("<script type='text/javascript'>");
		writer.println("alert('아이디가 존재하지 않습니다.')");
		writer.println("</script>");
		/* 여기서 alert창 뜨고 다시 로그인창 뜨게 하고 싶은데 안됨 */
		
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
</head>
<body>

</body>
</html>