<%@page import="org.apache.ibatis.annotations.Update"%>
<%@page import="review.model.Review"%>
<%@page import="review.model.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String id = request.getParameter("r_no"); //id에 r_no를 요청한값을 넣는다..

	int r_no=0;  //r_no는 0으로 해주고
	
	if(id != null){  //r_no가 null이아니면
		r_no=Integer.parseInt(id); //r_no에 아까 요청한 값을 넣는다.
	}
	
	ReviewService service = ReviewService.getInstance(); //리뷰서비스에서 서비스를 만든후 거기에 리뷰서비스의 인스턴스를 넣는다.
	Review review = service.selectReviewService(r_no); //review객체의 review에 미리만든 서비스의 선택리뷰서비스의 파라미턱밧 r_no를 넣는다
	request.setAttribute("review" , review); //"review"<< 바디에서 쓰려고만든거임.
	
	String pw = request.getParameter("r_pw"); //스트링값으로  파라미터값 요청함 r_pw를 통해서
	System.out.println(pw);
	
	if(pw.equals(review.getR_pw())){  //만약 패스워드가 맞다면
		review.setR_content(request.getParameter("r_content"));  //"" 이거주는거 다시물어보기/.
		review.setR_title(request.getParameter("r_title"));
		review.setR_name(request.getParameter("r_name"));
		
		System.out.println(review.toString());
		
		int re = service.updateReviewService(review);
		if(re>0){
			response.sendRedirect("reviewlist.jsp");
		}else{
			System.out.println("0");
		}
		
	}else{
		response.sendRedirect("reviewlist.jsp");
	}
	
	
	
//글번호를 받아온다. 
//pw가 맞는지 확인한다.
//맞으면 보내고 안맞으면 못 보낸다.




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