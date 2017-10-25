<%@page import="share.model.Share"%>
<%@page import="share.model.ShareService"%>
<%@page import="share.model.ShareSearch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    
    	String id = request.getParameter("sh_no");
    	int sh_no = 0;
    	
    	if( id != null){
    		sh_no = Integer.parseInt(id);
    	}
    	System.out.println(id);
    	String check_pw = request.getParameter("check_pw");
    	ShareService service = ShareService.getInstance();
    	Share share = service.selectShareService(sh_no);
    	
    	if(share.getSh_pw().equals(check_pw)){
    		service.deleteShareService(sh_no); 
    		RequestDispatcher rd = request.getRequestDispatcher("shareList.jsp");
    		rd.forward(request, response);
    		response.sendRedirect("shareList.jsp");
    	}else{
    		response.sendRedirect("shareDetail.jsp?sh_no="+sh_no);
    	}
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