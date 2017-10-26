<%@page import="review.model.Reply"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="review.model.Review"%>
<%@page import="review.model.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 태그처럼 사용할수있게. 원래자바소스는 <%로 %> 해야하는데 태그처럼 사용하게 만들어줌 포이치도있고 cif도있고많음 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = request.getParameter("r_no");

	int r_no = 0;
	if (id != null) {
		r_no = Integer.parseInt(id);
	}

	ReviewService service = ReviewService.getInstance();

	Review review = service.selectReviewService(r_no);

	request.setAttribute("review", review);

	List<Reply> list = service.listReplyService(r_no);

	request.setAttribute("list", list);

	/* String r_no = request.getParameter("r_no"); //r_no라는 겟파라미터를 요청해서 r_no에 넣는다. //스트링형이고
	
	ReviewService service = ReviewService.getInstance();
	Review review = service.selectReviewService(Integer.parseInt(r_no)); //int형으로 바꿔줘야하기때문에 inter해주고
	
	request.setAttribute("review", review);  //"review" 는 바디에서 쓰려고하는것이다. */
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
<link rel="stylesheet" href="../../css/review_css/Review_detail.css" type="text/css" />


<script type="text/javascript" src="../../javascript/Main_script/jquery.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery-migrate.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.easing.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/base.js"></script>
<script src="../../javascript/Main_script/jquery.shop.menu.js"></script>
<script src="../../javascript/Main_script/common.js"></script>
<script src="../../javascript/Main_script/wrest.js"></script>

<style type="text/css">
#replyTable {
	border-top-color: white;
	margin-top: 10px;
}
</style>

<script type="text/javascript">
	function fn_reply(){
		location.href = "reviewinsertform.jsp?r_no=${review.r_no}";
	}
	function fn_update(){
		location.href = "reviewupdateform.jsp?r_no=${review.r_no}";
	}
	function fn_delete(){
		location.href = "reviewdeleteform.jsp?r_no=${review.r_no}";
	}
</script>

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

	<h1 class="header_iss">Board</h1>

	<br>
	<br>
	<br>

	<!-- div로 해보기  전체를 감산다. -->


	<table id="dd" border="1" align="center" cols="138">
		<tr height="30">
			<td id="gb" width="50">글번호</td>
			<td id="gbb1" width="50">${review.r_no}</td>
			<td id="gb2" width="50">조회수</td>
			<td id="gbb2" width="50">${review.r_hit}</td>
		</tr>
		<tr height="30">
			<td id="gb3" width="150">작성자</td>
			<td id="gbb3" width="150">${review.r_name }</td>
			<td id="gb4" width="150">작성일</td>
			<td id="gbb4" width="150"><fmt:formatDate value="${review.r_date }"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr height="30">
			<td id="gb5"  width="150">파일</td>
			<td id="gbb5" colspan="3"><a
				href="reviewdownload.jsp?filename=${review.r_fname }">${review.r_fname }</a>
			</td>
		</tr>
		<tr height="30">
			<td id="gb6" width="150">제목</td>
			<td id="gbb6" colspan="3">${review.r_title }</td>
		</tr>
		<%-- <tr height="30">
			<td width="150">방문역</td>
			<td colspan="3">${review.r_title }</td>			
		</tr> --%>
		<tr height="30">
			<td align=center colspan="4" cols="138"><c:if
					test="${review.r_fname != null }">
					<br>
					<c:set var="head"
						value="${fn:substring(review.r_fname, 0, fn:length(review.r_fname)-4) }"></c:set>
					<c:set var="pattern"
						value="${fn:substring(review.r_fname, fn:length(head) +1, fn:length(review.r_fname)) }"></c:set>
					<c:choose>
						<c:when test="${pattern == 'jpg' || pattern == 'gif' }">
							<img src="/Kosta167_Project/upload/${head }.${pattern}"
								class="detail_img">
							<br>
							<br>
						</c:when>
						<c:otherwise>
							<c:out value=""></c:out>
						</c:otherwise>
					</c:choose>
				</c:if> ${review.r_content}</td>
		</tr>
		<tr height="30">
			<td colspan="4">
			<center>
			<input id="sb1" type="button" value="수정"  onclick="fn_update()" style="color: white;back-ground: #black; width: 80px;height: 23px; outline: 0; border: 0">&nbsp;&nbsp;
			<input id="rs1" type="button" value="삭제"  onclick="fn_delete()" style="color: white;back-ground: #black; width: 80px;height: 23px; outline: 0; border: 0">&nbsp;&nbsp;
			</center>
			</td>
		</tr>
	</table>
	<br><br><br><br>
		<table id="dereply" border="1" align="center">
			<tr class="wdt" height="30" align="center">
				<td width="60">작성자</td>
				<td width="456">댓글내용</td>
				<td width="90">작성시간</td>
			</tr>
			<c:forEach var="reply" items="${list}">
				<input type="hidden" name="re_no" value="${reply.re_no }">
				<tr height="30">					
					<td align="center">${reply.re_name}</td>
					<td align="center">${reply.re_content}</td>
					<td align="center"><fmt:formatDate value="${reply.re_date}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</table>
		<br><br><br><br>
		<form action="reviewreply_add.jsp" method="post">
			<table id="dere" border="1" align="center">
			<input type="hidden" name="r_no" value="${review.r_no }">
				<tr align="center" height="30">
					
				
						<td align="left" width="50">작성자</td>
						<td align="left"><input type="text" name="re_name" size="30"></td>
					
				</tr>
				<tr></tr>
				<tr height="30">
					<td colspan="4"><textarea rows="5" cols="138"
								name="re_content"></textarea></td>
				</tr>
				<tr></tr>
				<tr height="30">
					<td colspan="4" align="center">
						<input id="sb" type="submit" value="댓글달기" style="color: white;back-ground: #black; width: 80px;height: 23px; outline: 0; border: 0">&nbsp;&nbsp;
						<input id="rs" type="reset" value="취소" style="color: white;back-ground: #black; width: 80px;height: 23px; outline: 0; border: 0">&nbsp;&nbsp;
					</td>
				</tr>
		
			</table>
		</form>
		<%-- </center> --%>
	<br>
	<br>
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