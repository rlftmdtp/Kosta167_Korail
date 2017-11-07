
<%@page import="review.model.ListModel"%>
<%@page import="review.model.Review"%>
<%@page import="java.util.List"%>
<%@page import="review.model.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String pageNum = request.getParameter("pageNum");

	if (pageNum == null) {
		pageNum = "1";
	}

	int reguestPage = Integer.parseInt(pageNum);

	ReviewService service = ReviewService.getInstance();
	ListModel listModel = service.listReviewService(request, reguestPage);

	request.setAttribute("listModel", listModel);
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

<link rel="stylesheet" href="../../css/Main_css/default_shop.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/common.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/layout.css?ver=1" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/contents.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/board.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/All.css" type="text/css" />
<link rel="stylesheet" href="../../css/review_css/Review_list.css" type="text/css" />


<script type="text/javascript" src="../../javascript/Main_script/jquery.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery-migrate.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.easing.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/base.js"></script>
<script src="../../javascript/Main_script/jquery.shop.menu.js"></script>
<script src="../../javascript/Main_script/common.js"></script>
<script src="../../javascript/Main_script/wrest.js"></script>
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
					<li class="hnn-gnb2 "><a href="../course_jsp/course.jsp">코스 짜기</a>
					<li class="hnn-gnb3 "><a href="../partner_jsp/Partner_calendar.jsp">동반자 찾기</a></li>
					<li class="hnn-gnb4 "><a href="reviewlist.jsp">후기남겨요</a></li>
					<li class="hnn-gnb5 "><a href="../share_jsp/shareList.jsp">공유해요</a></li>
				</ul>
				</div>
			</div>
		</div>



<!-- 메인값  -->
	<div class="body-wrap">
	<br>
	<br>
	<br>
	
		<h1 class="header">Board</h1>
	
	<br>
	<br>
	<center>
		<table class="li">
			<thead>
				<tr id="ll" class="borderLine" height="30">
					<th width="80">번호</th>
					<th width="530">제목</th>
					<th width="130">작성자</th>
					<th width="130">작성일</th>
					<th width="130">조회수</th>
				</tr>
			</thead>
			<tfoot>
				<c:forEach var="review" items="${listModel.list}">
					<tr height="30" class="borderLine">
						<td align="center">${review.r_no}</td>
						<td align="left"><a href="reviewdetail.jsp?r_no=${review.r_no }">${review.r_title }</a>
						</td>
						<td align="center">${review.r_name }</td>
						<td align="center"><fmt:formatDate value="${review.r_date }"
								pattern="yyyy-MM-dd" /></td>
						<td align="center">${review.r_hit }</td>
					</tr>
				</c:forEach>
			</tfoot>
		</table>


		<br>
		<!-- 페이지 처리 영역 -->
		<!-- 이전 -->
		<table>
			<!-- <input id="sy"   type="submit" href="insertform.jsp" value="글쓰기"><br>
			 -->
		   <a class="gs" href="reviewinsertform.jsp">
		   			<input id="ww" type="submit" value="글쓰기" style="color: white;back-ground: #black; width: 80px;height: 33px; outline: 0; border: 0">
		</a>  
			<br/><br/><br/>
			<thead>
				<c:if test="${listModel.startPage > 5}">
					<a href="reviewlist.jsp?pageNum=${listModel.startPage-1}"><img
						src="../../images/review_images/left.png"></a>
				</c:if>

				<!-- 페이지 목록 -->
				<!-- start 페이지부터 end페이지 까지 출력  -->
				<c:forEach var ="pageNo" begin="${listModel.startPage}" end = "${listModel.endPage }">
					<c:if test="${listModel.requestPage == pageNo}"><b></c:if>
					<a href="reviewlist.jsp?pageNum=${pageNo}">　${pageNo}　</a>
					<c:if test="${listModel.requestPage == pageNo}"></b></c:if>		
				</c:forEach>
				<!-- 이후 -->
				<c:if test="${listModel.endPage < listModel.totalPageCount}">
					<a href="reviewlist.jsp?pageNum=${listModel.endPage + 1}"><img
						src="../../images/review_images/right.png"></a>
				</c:if>
				
			</thead>
		</table>
		<br>

		<form action="reviewlist.jsp" method="post">
			<br> <input type="checkbox" name="area" value="r_title">제목</input>
			<input type="checkbox" name="area" value="r_name">작성자</input>
			<!-- <select name="area">
			 <option value="">방문역 선택 </option>
			 	<option value="춘천">춘천역</option>
				<option value="대전">대전역</option>
				<option value="부산">부산역</option>
				<option value="광주">광주역</option>
				<option value="용산">용산역</option>	 	
		 </select> -->
			<input type="text"  id="dd" name="searchKey" size="10"　></input> 
			<input id="qq" type="submit" value="검색" style="color: white;back-ground: #black; width: 80px;height: 23px; outline: 0; border: 0">
		</form>
		<br><br>
	</center>


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