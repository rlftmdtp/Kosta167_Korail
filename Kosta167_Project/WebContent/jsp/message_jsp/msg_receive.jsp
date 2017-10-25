<%@page import="message.model.Message"%>
<%@page import="message.model.MessageService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String m_id = request.getParameter("m_id");
	System.out.println(m_id);
	
	if (m_id == null) {
		m_id = (String) session.getAttribute("m_id");
	} else {
		session.setAttribute("m_id", m_id);
	}
	//session.setAttribute("msg_sendid", msg_sendid);

	MessageService service = MessageService.getInstance();

	List<Message> list = service.msg_receiveService(m_id);
	request.setAttribute("list", list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=0.3, maximum-scale=2.0, minimum-scale=0.3, user-scalable=yes,target-densitydpi=device-dpi">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/message_css/Message_receive.css?ver=1"
	type="text/css" />
	<link rel="stylesheet" href="../../css/Main_css/All.css"
	type="text/css" />

<script type="text/javascript">
	function openTest() {
		var child = window
				.open(
						'../message_jsp/msg_insertform.jsp',
						'childWindow',
						'resizable=no, width=360, height=380, left=500, top=200, menubar=no, status=no, scrollbars=no');
	}

	/* 	function allChk(obj){
	       var chkObj = document.getElementsByName("RowCheck");
	       var rowCnt = chkObj.length - 1;
	       var check = obj.checked;
	
	       if (check) {﻿
	           for (var i=0; i<=rowCnt; i++){
	            if(chkObj[i].type == "checkbox")
	                chkObj[i].checked = true; 
	           }
	       } else {
	           for (var i=0; i<=rowCnt; i++) {
	            if(chkObj[i].type == "checkbox"){
	                chkObj[i].checked = false; 
	            }
	           }
	       }
	   } 
	
	 function CheckDelete() { 
	 alert("aa");
	
	 } */
</script>
</head>
<body>
	<div class="body-Wrap">
	<form action="msg_receivedetail.jsp" method="post" name="userForm">
		<div class = "msgform">
			<h4>${m_id }님의 쪽지함</h4>
		</div>
		<table class="receive_Table">
			<thead>
				<tr>
					<td colspan="5" class="head_btn"><input type="button"
						value="삭제" onclick="CheckDelete()"> &nbsp;&nbsp; <input
						type="button" value="답장" onclick="openTest()">
						<!-- &nbsp;&nbsp; <a href="MainLogin.jsp">로그아웃</a> --></td>
				</tr>
				<tr>
					<th class="check_table">NO <!-- <input id="allCheck" type="checkbox" onclick="allChk(this);" /> -->
					</th>
					<th class="mail_table">수신</th>
					<th class="people_table">보낸쨔람</th>
					<th class="content_table">내용</th>
					<th class="date_table">날짜</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="message" items='${list }' varStatus="ss">
					<tr>

						<td class="check_table">${ss.index +1} <%-- <input type="checkbox" name = "row" id="RowCheck-${ss.index }" value="${message.msg_no }"> --%></td>
						<c:choose>
							<c:when test="${message.msg_hit > 0}">
								<td class="even"><img
									src="../../images/message_images/receivemail_icon.png" name="msg_hit"></td>
							</c:when>
							<c:otherwise>
								<td class="even"><img
									src="../../images/message_images/sendmail_icon.png" name="msg_hit"></td>
							</c:otherwise>
						</c:choose>
						<td class="people_table">${message.m_id}</td>
						<td class="content_table"><a
							href="msg_detail.jsp?msg_no=${message.msg_no }"> <%--  <a href="#" onclick="window.open('msg_detail.jsp?msg_no=${message.msg_no }', 'childWindow',
							'resizable=no, width=360, height=380, left=500, top=200, menubar=no, status=no, scrollbars=no')"> --%>
								${message.msg_content }
						</a></td>
						<td class="date_table"><fmt:formatDate
								value="${message.msg_date }" pattern="yyyy-MM-dd (hh:mm)" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


	</form>
</div>
</body>
</html>