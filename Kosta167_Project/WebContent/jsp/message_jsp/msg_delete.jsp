<%@page import="message.model.MessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int msg_no = Integer.parseInt(request.getParameter("msg_no"));
	System.out.println("나는개똥이"+msg_no);
	
	
	MessageService service = MessageService.getInstance();
	//service.deleteMessage(msg_no);
	
	response.sendRedirect("msg_receive.jsp");
	
	//response.sendRedirect("msg_receive.jsp");
/*  	response.sendRedirect("msg_receive.jsp");
 */
	
	/* RequestDispatcher dispatcher = request.getRequestDispatcher("MainStart.jsp?body=../../message_jsp/msg_receive.jsp");
	dispatcher.forward(request, response);  */ 
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