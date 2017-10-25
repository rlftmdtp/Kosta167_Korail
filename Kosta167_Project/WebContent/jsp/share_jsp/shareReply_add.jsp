<%@page import="share.model.ShareService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    
    %>
    <jsp:useBean id="sharereply" class="share.model.ShareReply" ></jsp:useBean>
    <jsp:setProperty property="*" name="sharereply"/>
    
    <%
    	ShareService service = ShareService.getInstance();
    
		    
   	 	int re = service.insertReplyService(sharereply);
   	 	out.println(re);
    	if(re > 0){
    		out.println(re);
    	request.setAttribute("sharereply", sharereply);	
    	RequestDispatcher rd = request.getRequestDispatcher("shareDetail.jsp");
    	rd.forward(request, response);
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