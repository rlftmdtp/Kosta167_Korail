<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<a href="MainStart.jsp"><img
							src="../../images/main_images/logo.jpg" width="161" height="76" /></a>
					</div>

					<ul id="hnn-log">
						<li><a href="mainpage.jsp">홈</a></li>
						<li><a href="mainLogin.jsp">로그인</a><span></span></li>
						<li><a href="#">회원가입</a><span></span></li>
						<li><a
							href="../message_jsp/msg_receive.jsp">쪽지함</a></li>
						<li><a href="Mypage.jsp">마이페이지</a></li>
					</ul>
					</div>		
				</div>
			</div>

		<div id="hnn-header">
			<div class="hnn-inner">
				<!-- GNB -->
				<ul id="hnn-gnb">
					<li class="hnn-gnb1 "><a href="RailoInfo.jsp">Star Rail</a>
						<div>
							<ul class="hnn-snb1">
								<li><a href="RailoInfo.jsp">내일로란</a></li>
								<li><a href="RailoGift.jsp">내일로 혜택</a></li>

							</ul>
						</div></li>
					<li class="hnn-gnb2 "><a href="../course_jsp/course.jsp">코스 짜기</a>
					<li class="hnn-gnb3 "><a href="../partner_jsp/Partner_main.jsp">동반자 찾기</a></li>
					<li class="hnn-gnb4 "><a href="../review_jsp/reviewlist.jsp">후기남겨요</a></li>
					<li class="hnn-gnb5 "><a href="../share_jsp/shareForm.jsp">공유해요</a></li>
				</ul>
				</div>
			</div>
		</div>


<!-- 메인값  -->
	<div class="body-wrap">
		<!-- VISUAL -->
		<div id="hnn-vis">
			<ul class="vis-roll">
				<li class="hnn-vis"><img
					src="../../images/main_images/railo_main.jpg"></li>
				<li class="hnn-vis"><img
					src="../../images/main_images/railo_main2.jpg"></li>
				<li class="hnn-vis"><img
					src="../../images/main_images/railo_main3.jpg"></li>
			</ul>
		</div>


		<!-- ELEMENT -->
		<div id="hnn-element">
			<!-- PRODUCT INFO -->
			<div id="hnn-Pinfo">
				<div class="hnn-inner">
					<p class="p-tit">FESTIVAL INFO</p>
					<div class="p-slogan">&nbsp;축 제 몽 땅 보 기</div>
					<!--제품롤링 -->
					<div class="P-list clearfix">
						<div class="slider">
						<!-- 전국 축제 슬라이드 시작 -->
							<dl>
								<dt>
									<a href="#"> <img src="../../images/main_images/slide1.jpg"
										width="251" height="251" alt="여수 밤바다 불꽃축제">
									</a>
								</dt>
								<dd>
									<span class="p-name">여수 밤바다 불꽃축제</span> <span class="p-dpri">2017.
										08. 11. 금 ~ 08. 12. 토</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img src="../../images/main_images/slide2.jpg"
										width="251" height="251" alt="순천 FOODART FESTIVAL">
									</a>
								</dt>
								<dd>
									<span class="p-name">순천 FOODART FESTIVAL</span> <span
										class="p-dpri">2017. 05. 26 ~ 05. 28 </span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img src="../../images/main_images/slide3.jpg"
										width="251" height="251" alt="순천만 별빛 축제">
									</a>
								</dt>
								<dd>
									<span class="p-name">순천만 별빛 축제</span> <span class="p-dpri">~
										2017.02.28</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img src="../../images/main_images/slide4.jpg"
										width="251" height="251" alt="부산원도심 골목길 축제">
									</a>
								</dt>
								<dd>
									<span class="p-name">부산원도심 골목길 축제</span> <span class="p-dpri">2017.
										05. 27 ~ 05. 28</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img src="../../images/main_images/slide5.jpg"
										width="251" height="251" alt="부산 푸드필름 페스타">
									</a>
								</dt>
								<dd>
									<span class="p-name">부산 푸드필름 페스타</span> <span class="p-dpri">2017.
										06. 22 ~ 06. 25</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img src="../../images/main_images/slide6.jpg"
										width="251" height="251" alt="군산 꽁당보리 축제">
									</a>
								</dt>
								<dd>
									<span class="p-name">군산 꽁당보리 축제</span> <span class="p-dpri">2017.
										05. 04 ~ 05. 07</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img src="../../images/main_images/slide7.jpg"
										width="251" height="251" alt="나라꽃 무궁화 전국축제">
									</a>
								</dt>
								<dd>
									<span class="p-name">나라꽃 무궁화 전국축제</span> <span class="p-dpri">2017.
										08. 11 ~ 08. 15</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img src="../../images/main_images/slide8.jpg"
										width="251" height="251" alt="군포 철쭉 축제">
									</a>
								</dt>
								<dd>
									<span class="p-name">군포 철쭉 축제</span> <span class="p-dpri">2017.
										04. 28 ~ 04. 30</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img src="../../images/main_images/slide9.jpg"
										width="251" height="251" alt="서울 억새 축제">
									</a>
								</dt>
								<dd>
									<span class="p-name">서울 억새 축제</span> <span class="p-dpri">2017.
										10 .13 ~ 10. 19</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img
										src="../../images/main_images/slide10.jpg" width="251"
										height="251" alt="태안 세계튤립축제">
									</a>
								</dt>
								<dd>
									<span class="p-name">태안 세계튤립축제</span> <span class="p-dpri">2017.
										04. 13 ~ 05. 10</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img
										src="../../images/main_images/slide11.jpg" width="251"
										height="251" alt="이월드 튤립축제">
									</a>
								</dt>
								<dd>
									<span class="p-name">이월드 튤립축제</span> <span class="p-dpri">2017.
										04. 08 ~ 04. 30</span>
								</dd>
							</dl>
							<dl>
								<dt>
									<a href="#"> <img
										src="../../images/main_images/slide12.jpg" width="251"
										height="251" alt="울산 옹기축제">
									</a>
								</dt>
								<dd>
									<span class="p-name">울산 옹기축제</span> <span class="p-dpri">2017.
										05. 04 ~ 05. 07</span>
								</dd>
							</dl>

						</div>
					</div>
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