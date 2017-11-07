<%@page import="message.model.Message"%>
<%@page import="message.model.MessageService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%

	String m_id = (String)session.getAttribute("m_id");
	System.out.println("id야 " + m_id);
	
	
	if (m_id == null) {
		m_id = (String) session.getAttribute("m_id");
	} else {
		session.setAttribute("m_id", m_id);
	}
	//session.setAttribute("msg_sendid", msg_sendid);

	MessageService service = MessageService.getInstance();

	List<Message> list = service.msg_receiveService(m_id);
	request.setAttribute("list", list);
	System.out.println("list야 왔니? " +list);
	
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
<link rel="stylesheet" href="../../css/message_css/Message_receive.css" type="text/css" />


<script type="text/javascript" src="../../javascript/Main_script/jquery.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery-migrate.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.easing.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/base.js"></script>
<script src="../../javascript/Main_script/jquery.shop.menu.js"></script>
<script src="../../javascript/Main_script/common.js"></script>
<script src="../../javascript/Main_script/wrest.js"></script>

<script type="text/javascript">
	function openTest() {
		var child = window
				.open(
						'msg_insertform.jsp',
						'childWindow',
						'resizable=no, width=360, height=380, left=500, top=200, menubar=no, status=no, scrollbars=no');
	}

	/* 	function allChk(obj){
	       var chkObj = document.getElementsByName("RowCheck");
	       var rowCnt = chkObj.length - 1;
	       var check = obj.checked;
	
	       if (check) {﻿
	           for (var i=0; i<=rowCnt; i++){
	            if(chkObj[i].type == "checkbox")
	                chkObj[i].checked = true; 
	           }
	       } else {
	           for (var i=0; i<=rowCnt; i++) {
	            if(chkObj[i].type == "checkbox"){
	                chkObj[i].checked = false; 
	            }
	           }
	       }
	   } 
	
	 function CheckDelete() { 
	 alert("aa");
	
	 } */
	 
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
							href="msg_receive.jsp">쪽지함</a></li>
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
					<li class="hnn-gnb4 "><a href="../review_jsp/reviewlist.jsp">후기남겨요</a></li>
					<li class="hnn-gnb5 "><a href="../share_jsp/shareList.jsp">공유해요</a></li>
				</ul>
				</div>
			</div>
		</div>
	

		<!-- 메인  -->
	<div class="body-wrap">
	
		<div class = "msgform">
			<h4>${m_id }님의 쪽지함</h4>
		</div>
		<table class="receive_Table">
			<thead>
				<tr>
					<td colspan="5" class="head_btn"><input type="button"
						value="삭제" onclick="CheckDelete()"> &nbsp;&nbsp; <input
						type="button" value="답장" onclick="openTest()">
						<!-- &nbsp;&nbsp; <a href="MainLogin.jsp">로그아웃</a> --></td>
				</tr>
				<tr>
					<th class="check_table">NO <!-- <input id="allCheck" type="checkbox" onclick="allChk(this);" /> -->
					</th>
					<th class="mail_table">수신</th>
					<th class="people_table">보낸쨔람</th>
					<th class="content_table">내용</th>
					<th class="date_table">날짜</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="message" items='${list }' varStatus="ss">
					<tr>

						<td class="check_table">${ss.index +1} <%-- <input type="checkbox" name = "row" id="RowCheck-${ss.index }" value="${message.msg_no }"> --%></td>
						<c:choose>
							<c:when test="${message.msg_hit > 0}">
								<td class="even"><img
									src="../../images/message_images/receivemail_icon.png" name="msg_hit"></td>
							</c:when>
							<c:otherwise>
								<td class="even"><img
									src="../../images/message_images/sendmail_icon.png" name="msg_hit"></td>
							</c:otherwise>
						</c:choose>
						<td class="people_table">${message.m_id}</td>
						<td class="content_table"><a
							href="msg_detail.jsp?msg_no=${message.msg_no }"> <%--  <a href="#" onclick="window.open('msg_detail.jsp?msg_no=${message.msg_no }', 'childWindow',
							'resizable=no, width=360, height=380, left=500, top=200, menubar=no, status=no, scrollbars=no')"> --%>
								${message.msg_content }
						</a></td>
						<td class="date_table"><fmt:formatDate
								value="${message.msg_date }" pattern="yyyy-MM-dd (hh:mm)" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

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