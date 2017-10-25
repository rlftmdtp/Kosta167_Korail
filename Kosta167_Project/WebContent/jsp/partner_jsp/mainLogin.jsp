<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/Main_css/All.css"
	type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/main_login.css?ver=1"
	type="text/css" />
<title>Insert title here</title>
</head>
<body>
<div class ="body-Wrap">
	
	<div id="container">
         
        <form action="mainLoginOk.jsp" method="post">
         	<span>LOGIN</span> <br>
            <label for="username">ID:</label>
             
            <input type="text" id="id" name="id">
             
            <label for="password">Password:</label>
             
            <p><a href="#">Forgot your password?</a></p>
             
            <input type="password" id="pass" name="pass">
             
            <div id="lower">
             
                <input type="checkbox"><label class="check" for="checkbox">Keep me logged in</label>
                 
                <input type="submit" value="Login">
             
            </div><!--/ lower-->
            
        <input type="hidden" value="<%=session.getAttribute("name")%>" id="name"	disabled="disabled"><br>
		<input type="hidden" value="<%=session.getAttribute("m_id")%>" id="m_id"	disabled="disabled"><br>
	
         
        </form>
         
    </div><!--/ container-->
	
	
	</div>	
</body>
</html>