<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("sh_no");
    	int sh_no = 0;
    	System.out.println("shareDelete : " + id);
    	if(id != null){
    		sh_no = Integer.parseInt(id);
    	}
    	request.setAttribute("sh_no", id);
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	
	<form action="shareDeletePassword.jsp" method="post">
		<table>
			<tr>
				 <td> <input type="hidden" name="sh_no" value="<%=id%>"></td>
				<tr> 비밀번호를 입력하세요.</tr> 
				<tr><td><input type="password" name="check_pw"></td></tr> 
				<tr><td align="center"><input type="submit" name = "delete" value="입력확인"></td></tr>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>