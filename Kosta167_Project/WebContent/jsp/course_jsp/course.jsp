<%@page import="course.model.CourseService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 출발역 리스트를 가져오는 윤주누나 코드
	request.setCharacterEncoding("utf-8");

	CourseService service = CourseService.getInstance();
	List<String> ssList = service.startListService();

	request.setAttribute("ssList", ssList);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<!-- 달력 UI 적용 -->
<script src="../../javascript/jquery.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../../javascript/course_script/course.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="../../css/course_css/course.css?ver=1">
</head>

<body>
	
	<form action="course_Login.jsp" method="post">
	로그인
	<input type="text" name="id">
	<input type="text" name="pass">
	<input type="submit" value="로그인">
	이름<input type="text" value="<%=session.getAttribute("name")%>" id="name" disabled="disabled">
	아이디<input type="text" value="<%=session.getAttribute("m_id")%>" id="m_id" disabled="disabled">
	</form>
	 
					<form id="selectCourseForm">
						<h3>여행 세부 코스 짜기</h3>
						여행날짜선택<input type="text" id="datepicker" size="10"> 여행기간선택
						<input type="checkbox" class="tripLong" name="tripLong" value="5">5<input
							type="checkbox" class="tripLong" name="tripLong" value="7">7
						출발날<select id="startDate" class="date"></select>

							출발역 <select id="startStation" class="selectStaion">
								<c:forEach var="sStation" items="${ssList}">
									<option value="${sStation}" class="startStation">${sStation}</option>
								</c:forEach>
							</select> <img src="../../images/course_images/화살표.PNG" id="arrow">
							도착역<select id="arriveStation" class="selectStaion"></select>
							
							출발하고싶은시간<select id="startTime"></select>
						출발가능한기차시간<select id="possibleTime" class="date"></select> <input
							type="button" id="lineSave" value="코스넣기">
					</form>


					<img src="../../images/course_images/map.PNG" id="viewSelectCourse">
		
				
	
				

					<div id="selectCourseForm">
						<h3>저장된 경로</h3>
						<form action="course_select.jsp" method="post" id="storeLine">
							<!-- 여기에 <input type="text" value="" name="storeLine"> 동적생성 -->

							<input type="hidden" id="lineCnt" name="lineCnt" value="0">
							<input type="submit" value="전체코스저장">
						</form>
					</div>



				<input type="button" id="issueinfo" value="발권역정보보기"> 발권역 혜택
				정보
				<textarea id="benefit" cols="50" rows="5"></textarea>
</body>
</html>