<%@page import="message.model.Message"%>
<%@page import="message.model.MessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <%
    	String no = request.getParameter("msg_no");
    	System.out.print(no);
    	int msg_no = 0;
    	 if(no != null){
    		msg_no = Integer.parseInt(no);
    	}
    	
    	MessageService service = MessageService.getInstance();
    	Message message = service.selectMessageService(msg_no);  /* , true */
    	
    	request.setAttribute("message", message);
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../../css/message_css/Message_detail.css" type="text/css" />
<script type="text/javascript">
function show(obj){
    window.opener.document.fmt.addr.value = obj.innerHTML;
    //자식윈도우로 부모윈도우를 불러온다. 클릭된 text값을 부모윈도우의 fmt의 addr의 값에 넣음
     window.self.close();   //자식클래스 닫아줌
}

	function Message_delete() {
		location.href = "msg_delete.jsp?msg_no=${message.msg_no }";
		
	}
	
	 function Message_history(){
		location.href = "msg_receive.jsp?msg_sendid=${message.msg_sendid }";
	} 
</script>
</head>
<body>         

	<table class="type11">
    <tr>
        <th>보낸 사람</th>
        <td> ${message.m_id }</td>
    </tr>

    <tr>
        <th>작성일</th>
        <td><fmt:formatDate value="${message.msg_date }" pattern="yyyy-MM-dd / HH:mm"/></td>
    </tr>
    <tr>
        <th>내용</th>
        <td>${message.msg_content }</td>
    </tr>
    <tr>
        <td><input type="button" value="뒤로가기" onclick="Message_history()" /> </td> 
        <td><input type="button" value="삭제" onclick="Message_delete()" /></td>
    </tr>
</table>


</body>
</html>