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
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=0.3, maximum-scale=2.0, minimum-scale=0.3, user-scalable=yes,target-densitydpi=device-dpi">

<meta name="description" content="" />
<meta name="naver-site-verification" content="" />

<title>Star Rail</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<!-- 달력 UI 적용 -->
<link rel="stylesheet" href="../../css/Main_css/default_shop.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/common.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/layout.css?ver=1" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/contents.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/board.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/All.css?ver=1" type="text/css" />
<link rel="stylesheet" href="../../css/course_css/course.css?ver=1">


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

<script type="text/javascript" src="../../javascript/Main_script/jquery.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery-migrate.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.easing.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/base.js"></script>
<script src="../../javascript/Main_script/jquery.shop.menu.js"></script>
<script src="../../javascript/Main_script/common.js"></script>
<script src="../../javascript/Main_script/wrest.js"></script>


<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="../../javascript/course_script/course.js" type="text/javascript"></script>


</head>


<body>
<div id = "wrap">
	<div class = "header-wrap">
		<div id="hnn-wrap">
			<!-- TNB  -->
			<div id="hnn-tnb">
				<div class="hnn-inner">
					<div id="hnn-logo">
						<a href="../MainPage/mainpage.jsp"><img
							src="../../images/main_images/logo.jpg" width="161" height="76" /></a>
					</div>

					<ul id="hnn-log">
						<li><a href="../MainPage/mainpage.jsp">홈</a></li>
						<li><a href="../MainPage/mainLogin.jsp">로그인</a><span></span></li>
						<li><a href="#">회원가입</a><span></span></li>
						<li><a
							href="../message_jsp/msg_receive.jsp">쪽지함</a></li>
						<li><a href="../MainPage/Mypage.jsp">마이페이지</a></li>
					</ul>
					</div>		
				</div>
			</div>

		<div id="hnn-header">
			<div class="hnn-inner">
				<!-- GNB -->
				<ul id="hnn-gnb">
					<li class="hnn-gnb1 "><a href="../MainPage/RailoInfo.jsp">Star Rail</a>
						<div>
							<ul class="hnn-snb1">
								<li><a href="../MainPage/RailoInfo.jsp">내일로란</a></li>
								<li><a href="../MainPage/RailoGift.jsp">내일로 혜택</a></li>

							</ul>
						</div></li>
					<li class="hnn-gnb2 "><a href="course.jsp">코스 짜기</a>
					<li class="hnn-gnb3 "><a href="../partner_jsp/Partner_calendar.jsp">동반자 찾기</a></li>
					<li class="hnn-gnb4 "><a href="../review_jsp/reviewlist.jsp">후기남겨요</a></li>
					<li class="hnn-gnb5 "><a href="../share_jsp/shareList.jsp">공유해요</a></li>
				</ul>
			</div>
		</div>
	</div>



<!-- 메인값  -->
	<div class="body-wrap">
	<div id = "courseWrap">
	<!-- 

	<form action="course_Login.jsp" method="post">
	로그인
	<input type="text" name="id">
	<input type="text" name="pass">
	<input type="submit" value="로그인">

	이름<input type="text" value="<%=session.getAttribute("name")%>" id="name" disabled="disabled">
	아이디<input type="text" value="<%=session.getAttribute("m_id")%>" id="m_id" disabled="disabled">
	</form>

	 -->
	 <h3 id="c_title">내일로 여행 코스 짜기</h3>
	 
	 <div id= "mapImg">
	 	<img src="../../images/course_images/map.PNG" class="viewSelectCourse">
	 </div>
	 
	 
	 <div id="makeCourse">
	 	<div id="courseSetting">
		 	<form>
				
				<h4 class="cs1_title">여행 기간 설정</h4>
				<div class="cs1">
					출발일 선택&nbsp;<input type="text" id="datepicker" size="10">&nbsp;&nbsp;
					<input type="checkbox" class="tripLong" name="tripLong" value="5">5일권
					<input type="checkbox" class="tripLong" name="tripLong" value="7">7일권<br/>
				</div>
				
				<h4 class="cs2_title">세부 코스 설정</h4>
				<div class="cs2">
					출발일&nbsp;<select id="startDate" class="date"></select><br/>
					출발역&nbsp;<select id="startStation" class="selectStaion">
						<c:forEach var="sStation" items="${ssList}">
							<option value="${sStation}" class="startStation">${sStation}</option>
						</c:forEach>
					</select>
					<img src="../../images/course_images/화살표.PNG" id="arrow">
					도착역&nbsp;<select id="arriveStation" class="selectStaion"></select><br/>
					출발 희망 시간&nbsp;<select id="startTime"></select><br/>
					탑승 가능한 열차&nbsp;<select id="possibleTime" class="date"></select><br/>
					<p><input type="button" id="lineSave" value="추가"></p>
				</div>
				
			</form>
			
		</div>
	
		
		<div id="settedCourse">
			<h4 class="sc_title">저장된 경로</h4>
			<div class="sc">
				<form action="course_select.jsp" method="post" id="storeLine">
					
					<!-- 여기에 <input type="text" value="" name="storeLine"> 동적생성 -->
					<input type="hidden" id="lineCnt" name="lineCnt" value="0">
					
					<p><input type="submit" value="전체코스저장" ></p>
				</form>
			</div>
		</div>
		
		<div id="issueSetting">
			<p><input type="button" id="issueinfo" value="발권역정보보기"></p>
			<div class="ta"><textarea id="benefit" cols="50" rows="5"></textarea></div>
		</div>
	
	
	</div>
</div> 
 	
</div> 

<!--푸터값 -->

<div class = "footer-wrap">
	  <!-- BOARD -->
      <div id="hnn-board">
         <div class="hnn-inner clearfix">
            <div class="fl">
               <div class="board-tit">
                  <em></em>NEWS
               </div>
               <div class="board-list">
                  <ul class="board-roll">


                     <li><a
                        href="#">개인정보보호 안내</a></li>
                     <li><a
                        href="#">동행자 찾기 서비스 개설안내</a></li>
                     <li><a
                        href="#">순천 조류인플루엔자 발생</a></li>
                     <li><a
                        href="#">카카오 결제 내역 확인 안내</a></li>
                     <li><a
                        href="#">내일로 여행코스 추천</a></li>
                  </ul>
               </div>
            </div>
            <div class="fr">
               <div class="board-tit">
                  <em></em>event
               </div>
               <div class="board-list">
                  <ul class="board-roll">


                     <li><a
                        href="#">이벤트 당첨자 안내</a></li>
                     <li><a
                        href="#">이벤트 당첨  23. 장 솔님</a></li>
                     <li><a
                        href="#">이벤트 당첨  26. 길 승세님</a></li>
                     <li><a
                        href="#">이벤트 당첨  23. 장 희정님</a></li>
                     <li><a
                        href="#">이벤트 당첨  30. 배 재현님</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <!-- //BOARD -->


      <!-- SITEMAP  -->
      <div id="hnn-sitemap">
         <div class="hnn-inner">
            <ul class="sitemap-list clearfix">
               <li class="map1"><a
                  href="#">company</a>
                  <ul>
                     <li><a href="#">회사개요</a></li>
                     <li><a href="#">인사말</a></li>
                     <li><a href="#">연혁</a></li>
                     <li><a href="#">조직도</a></li>
                     <li><a
                        href="#">인증현황</a></li>
                     <li><a href="#">파트너사</a></li>
                     <li><a href="#">오시는
                           길</a></li>
                  </ul></li>
               <li class="map2"><a
                  href="#">BRAND STORY</a>
                  <ul>
                     <li><a href="#">브랜드
                           소개</a></li>
                  </ul></li>
               <li class="map3"><a
                  href="#">CS
                     CENTER</a>
                  <ul>
                     <li><a
                        href="#">공지사항</a></li>
                     <li><a
                        href="#">보도자료</a></li>
                     <li><a
                        href="#">이벤트</a></li>
                     <li><a
                        href="#">문의하기</a></li>
                  </ul></li>
               <li class="map4"><a
                  href="#">SHOP</a>
                  <ul>
                     <li><a href="#">다목적</a></li>
                     <li><a href="#">세탁</a></li>
                     <li><a href="#">세정</a></li>
                     <li><a href="#">코스메틱</a></li>
                     <li><a href="#">기타</a></li>
                  </ul></li>
               <li class="map5"><a
                  href="#">IR</a>
                  <ul>
                     <li><a href="#">주가정보</a></li>
                     <li><a href="#">IR정보</a></li>
                     <li><a href="#">공시자료</a></li>
                     <li><a href="#">재무정보</a></li>
                  </ul></li>
               <li class="map6"><a
                  href="#">LOGIN</a>
                  <ul>
                     <li><a href="#">로그인</a></li>
                     <li><a href="#">회원가입</a></li>
                  </ul></li>

           
            </ul>

         </div>
      </div>
      <!-- //SITEMAP  -->

      <script type="text/javascript">
         //VISUAL
         var $visRoll = $("#hnn-vis .vis-roll");
         slider = $visRoll.bxSlider({
            mode : "fade",
            auto : true,
            pager : false,
            controls : true,
            useCSS : false,
            easing : "easeInOutExpo",
            speed : 1500,
            pause : 4500
         });
         //인기검색어
         var $visRoll = $("#hnn-board .board-roll");
         slider = $visRoll.bxSlider({
            mode : "vertical",
            auto : true,
            pager : false,
            controls : true,
            useCSS : false,
            easing : "easeInOutExpo",
            speed : 1500,
            pause : 4500
         });

         //HITt
         $(document).ready(function() {
            $('.P-list .slider').bxSlider({
               auto : true,
               slideWidth : 253,
               minSlides : 4,
               maxSlides : 4,
               moveSlides : 1,
               slideMargin : 0,
               pager : false
            });

         });
      </script>
      
      <!-- FOOT -->
      <div id="hnn-foot">
         <div class="hnn-inner">
            <a href="#" class="gotop">Top</a>
            
            <div class="address">
               StarRail<br> 서울특별시 가산구 가산동 코스타.. <em></em>T. 112-112-112<em></em> 010-6248-7523
               <br><em></em> 길승세 박명규 배재현 장솔 장희정 조윤주<em></em>2017-10-16 2017-10-27<em></em>
                <br> <em></em><em></em>Copyright 2017 KOSTA StarRail
               Co.Ltd. All Rights Reserved.
            </div>
           
         </div>
      </div>
      <!-- // FOOT -->
   </div>


   <script src="http://www.e-seje.com/js/sns.js"></script>



</div>

</body>
</html>