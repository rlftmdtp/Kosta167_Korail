<%@page import="java.awt.Window"%>
<%@page import="share.model.Share"%>
<%@page import="share.model.ShareService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    	request.setCharacterEncoding("utf-8");
    
    	String id=request.getParameter("sh_no");
    	
    	int sh_no=0;
    	
    	if( id != null){
    		sh_no=Integer.parseInt(id);
    	}
    	
    	ShareService service = ShareService.getInstance();
    	Share share = service.selectShareService(sh_no,false);
    	request.setAttribute("share", share);  
    	
    	
    	
    	String pw = request.getParameter("sh_pw");
    	System.out.println(pw);
    	if(share.getSh_pw().equals(pw)){
    		share.setSh_title(request.getParameter("sh_title"));
    		share.setSh_content(request.getParameter("sh_content"));
    		
    			
    		int re= service.updateShareService(share);
    			
    		if(re>0){
    			response.sendRedirect("shareList.jsp");	
    		}else{
    			System.out.println("0");
    					
    		}
    	}else{
    		
    		
    		response.sendRedirect("shareList.jsp");
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