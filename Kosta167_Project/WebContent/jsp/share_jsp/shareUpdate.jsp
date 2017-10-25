
<%@page import="share.model.Share"%>
<%@page import="share.model.ShareService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("sh_no");
	int sh_no = 0;
	if (id != null) {
		sh_no = Integer.parseInt(id);
	}

	ShareService service = ShareService.getInstance();
	Share share = service.selectShareService(sh_no);

	request.setAttribute("share", share);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script type="text/javascript">
	function write() {
	
	var form = document.wirteform;	
	
		if( !form.sh_title.value) {
			alert("제목을 입력해주세요.");
			form.sh_title.focus();
			return;
		}
		if( !form.sh_content.value) {
			alert("내용을 입력해주세요.");
			form.sh_content.focus();
			return;
		}if( !form.sh_content.value) {
			alert("비밀번호를 입력해주세요.");
			form.sh_pw.focus();
			return;
	
	
	form.submit();
}
</script>
</head>
<body>
	<center>
		<h1>글수정하기</h1>
		<form action="" method="post">
			<input type="hidden" name="sh_no" value="<%=sh_no%>">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr height="30">
					<td width="80">작성자</td>
					<td width="170"><input type="text" name="m_name" size="10"
						value="${member.m_name}"></td>
					<td width="80">비밀번호</td>
					<td width="170"><input type="password" name="sh_pw" size="10">
					</td>
				</tr>
				<tr height="30">
					<td width="80">제목</td>
					<td align="left" colspan="3"><input type="text"
						name="sh_title" size="50" value="${share.sh_title }" /></td>
				</tr>
				<tr height="30">
					<td colspan="4"><textarea rows="10" cols="70"
							name="sh_content">${share.sh_content }</textarea></td>
				</tr>
				<tr height="30">
					<td colspan="3" align="center"><input type="button"
						value="수정하기" onclick="write();"></td>

					<td><input type="reset" value="취소" /></td>
				</tr>
			</table>

		</form>
	</center>
</body>
</html>