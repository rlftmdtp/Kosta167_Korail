<%@page import="share.model.ShareReply"%>
<%@page import="java.util.List"%>
<%@page import="share.model.Share"%>
<%@page import="share.model.ShareService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
	
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = request.getParameter("sh_no");

	int sh_no = 0;
	if (id != null) {
		sh_no = Integer.parseInt(id);
	}

	ShareService service = ShareService.getInstance();
	Share share = service.selectShareService(sh_no);

	request.setAttribute("share", share);

	List<ShareReply> list = service.listShareReplyService(sh_no);
	
	request.setAttribute("list", list); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_update() {
		location.href = "shareUpdate.jsp?sh_no=${share.sh_no}";
	}
	function go_list() {
		location.href = "shareList.jsp";
	}

	function fn_delete() {
		location.href = "shareDelete.jsp?sh_no=${share.sh_no}";
	}
</script>
</head>
<body>
	<h3 align="center">글세부보기</h3>
	<form>
		<center>
			<table border="1 solid" align="center" bordercolor="#dddddd">
				<tr height="30">
					<td width="150">글번호</td>
					<td width="150">${share.sh_no }</td>
					<td width="150">조회수</td>
					<td width="150">${share.sh_hit }</td>
				</tr>
				<td width="150">작성일</td>
				<td width="150"><fmt:formatDate value="${share.sh_date}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr height="30">
					<td width="150">말머리</td>
					<td colspan="3">${share.sh_subject }</td>
				</tr>
				<tr>
				<tr height="30">
					<td width="150">제목</td>
					<td colspan="3">${share.sh_title }</td>
				</tr>
				<tr height="80">
					<td colspan="4">${share.c_id}</td>
				</tr>
				<tr height="80">
					<td colspan="4">${share.sh_content }</td>
				</tr>
				<tr height="30">
					<td colspan="4"><input type="button" value="목록가기"
						onclick="go_list();"> <input type="button" value="수정"
						onclick="fn_update()"> <input type="button" value="삭제"
						onclick="fn_delete()"></td>
				</tr>
				<tr>
			</table>
		</center>
	</form>
	<br>
	<br>
	<center>
		<tr height="1" bgcolor="#dddddd"></tr>
		<form action="shareReply_add.jsp" method="post">
		<input type="hidden" name ="sh_no" value="${share.sh_no}">
		<tr height="70">
			<td width="80">내용 : </td>
			<td align="left" colspan="3"><input type="text" name="sr_content" size="70"></td>
			<td colspan="4" align="center"><input type="submit" value="댓글달기">&nbsp;&nbsp;
			<input type="reset" value="취소"></td>
		</tr>
		</form>
		
	
	<table style="text-align: center; border: 1px solid=#dddddd">
		<tr>
			<th width="600"
				style="background-color: #eeeeee; text-align: center;">내용</th>
			<th width="100"
				style="background-color: #eeeeee; text-align: center;">작성자</th>
			<th width="100"
				style="background-color: #eeeeee; text-align: center;">작성일</th>
		</tr>
		
		<c:forEach var="sharereply" items="${list}">
		<tr height="30">			
			<td align="center">${sharereply.sr_content}</td>
			<td align="center">${member.m_name}</td>
			<td align="center">
				<fmt:formatDate value="${share.sh_date}" pattern="yyyy-MM-dd (hh:mm)"/>
			</td>
		</tr>
		<tr bordercolor="#dddddd"></tr>		
	</c:forEach>		
	</table>
	</center>


	
</body>
</html>