<%@page import="java.util.HashMap"%>
<%@page import="partner.model.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.io.Console"%>
<%@page import="partner.model.PartnerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:useBean id="member" class="partner.model.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member" />
<%
	request.setCharacterEncoding("utf-8");

	PartnerService service = PartnerService.getInstance();
	List<Member> m_list = null;
	HashMap<String, String> map = (HashMap<String, String>) request.getAttribute("map");
	
	if(map!=null){
		m_list = service.calendar_searchService(request);
		session.setAttribute("calendar_list", m_list);
		System.out.println("*메인m_list : " + m_list);
	}

	
	List<Member> all_list = service.partner_allListService();
	request.setAttribute("all_list", all_list); 
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"	src="../../javascript/partner_javascript/"></script>
	
<link rel="stylesheet" href="../../css/partner_css/partner_station?ver=1"	type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 기본적으로 내 코스의 정보가 떠야 함 -->
	<div class="Partner_station_wrap">
		<div class="partner_myCourse">
			<h2>
				<span>내 코스 확인</span>
			</h2>
			<img src="../../images/partner_images/map.PNG" width="350px"
				height="400px">
		</div>


		<!-- 동반자를 검색하기위한 조건 선택 : 지역  -> 역검색	 -->
		<div class="Partner_staion_check">
			<form>
				
			</form>
		</div>





		<!-- 동반자 검색 시 나오는 리스트 -> 후행 : 페이징 처리  / 	 -->
		<div class="Partner_station_list">
		<hr>
<%-- 			<ul class="Partner_calender_searchList">
				<c:choose >
				<c:when test="${calendar_list != null}">
					<c:forEach var="c" items="${calendar_list}">
					<li>
						<a href="#">
							<div>
								<div id="Partner_calender_searchImage">
									<img src="../../images/partner_images/search_map.PNG">

									<div class="Partner_sendMessage">
										<img src="images/minishop_Img/cart.png" id="btn-open-dialog">
									</div>
								</div>

								<div class="Partner_info_cSearch">
									<p class="name">${c.m_name}</p>
									<p class="gender">${c.m_gender}</p>
									<p class="age">${c.m_age}</p>
								</div>
							</div>
						</a>
					</li>
				</c:forEach>
				</c:when>
				</c:choose>
				
				
			</ul> --%>
		</div>
		
		
	</div>




</body>
</html>