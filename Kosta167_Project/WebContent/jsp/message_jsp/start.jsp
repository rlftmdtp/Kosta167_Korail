<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* 쪽지보내기 버튼 누르면 자식창이 뜨게 한다. msg_insertform.jsp로 연결 */
	function openTest(){
		var child = window.open('msg_insertform.jsp','childWindow',
				'resizable=no, width=360, height=380, left=500, top=200, menubar=no, status=no, scrollbars=no');
		}
		
</script>
</head>
<body>

   <input type="button" value="쪽지보내기" onclick="openTest()">

</body>
</html>