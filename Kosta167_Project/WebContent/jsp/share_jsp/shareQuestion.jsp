<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String c_id = request.getAttribute("c_id").toString();
	System.out.println("c_id " + c_id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../javascript/jquery.js" type="text/javascript"></script>
<script>
$(function(){
	if (confirm('공유하시겠습니까?')) {
		var c_id = $('#c_id').val();
		location.href = '../../jsp/share_jsp/shareForm.jsp?c_id="'+c_id+'"';
	} else {
		location.href = "shareList.jsp"
	}
})
</script>
</head>
<body>
	<input type="hidden" value="<%=c_id%>" id="c_id">
</body>
</html>