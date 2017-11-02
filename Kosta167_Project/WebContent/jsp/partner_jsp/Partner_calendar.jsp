<%@page import="main.model.Member"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.io.Console"%>
<%@page import="partner.model.PartnerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:useBean id="member" class="main.model.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member" />
<%
   request.setCharacterEncoding("utf-8");

   PartnerService service = PartnerService.getInstance();

   // 날짜+시간
   List<Member> c_list = null;
   HashMap<String, String> map = (HashMap<String, String>) request.getAttribute("map");

   // 역
   List<Member> s_list = null;
   HashMap<String, String> station_map = (HashMap<String, String>) request.getAttribute("station_map");

   // 검색어
   String Partner_search = ((String) request.getAttribute("Partner_search"));

   if (map != null) { // 희정 -날짜+시간
      c_list = service.calendar_searchService(request);
      session.setAttribute("list", c_list);
      System.out.println("-날짜 시간list : " + c_list + "\n\n");
      request.removeAttribute("map");
   }

   else if (station_map != null) { // 희정 - 역
      s_list = service.station_searchService(request);
      session.setAttribute("list", s_list);
      System.out.println("-역 list가 나오니 :  " + s_list + "\n\n");
      request.removeAttribute("station_map");
   }

   else if (Partner_search != null) { // 솔 - 검색
      List<Member> list = service.listSearchService(request);
      session.setAttribute("list", list);
      System.out.println("-검색어 입력 시 list가 나오니 : " + list + "\n\n");
      request.removeAttribute("Partner_search");
   }
   
   else{
      
   }

   /*    모든 리스트 받아옴
      List<Member> all_list = service.partner_allListService();
      request.setAttribute("all_list", all_list);  */
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="width=device-width, initial-scale=0.3, maximum-scale=2.0, minimum-scale=0.3, user-scalable=yes,target-densitydpi=device-dpi">

<meta name="description" content="" />
<meta name="naver-site-verification" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Star Rail</title>

<link rel="stylesheet" href="../../css/Main_css/default_shop.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/common.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/layout.css?ver=1" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/contents.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/board.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/All.css?ver=1" type="text/css" />


<script type="text/javascript" src="../../javascript/Main_script/jquery.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery-migrate.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.easing.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/base.js"></script>
<script src="../../javascript/Main_script/jquery.shop.menu.js"></script>
<script src="../../javascript/Main_script/common.js"></script>
<script src="../../javascript/Main_script/wrest.js"></script>
<script type="text/javascript">
	function message(m_id) {
			var child = window.open('../message_jsp/msg_insertform.jsp?rec_id='+m_id,'childWindow',
					'resizable=no, width=360, height=380, left=500, top=200, menubar=no, status=no, scrollbars=no');
			
	}
</script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="../../javascript/partner_javascript/Partner_calenderPage.js"></script>
<link rel="stylesheet" href="../../css/partner_css/partner_newCssFile.css?ver=1" type="text/css" />


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
               <li class="hnn-gnb3 "><a href="Partner_calendar.jsp">동반자 찾기</a></li>
               <li class="hnn-gnb4 "><a href="../review_jsp/reviewlist.jsp">후기남겨요</a></li>
               <li class="hnn-gnb5 "><a href="../share_jsp/shareList.jsp">공유해요</a></li>
            </ul>
            </div>
         </div>
      </div>




   <div class="body-wrap">

   <!-- 기본적으로 내 코스의 정보가 떠야 함 -->
   <div class="Partner_calendar_wrap">
	      <div class="partner_myCourse">
	         <h2>
	            <span>내 코스 확인</span>
	         </h2>
	         <img src="../../images/partner_images/map.PNG">
	      </div>
		
      <!-- 동반자를 검색하기위한 조건 선택 : 날짜/시간    -->
      <div class="Partner_check">


         <!--    솔 start-->
         <div class="Partner_calendar_check1">
            <p>
            <h2>
               <strong>전국 Star Rail 동반자를 한번에 만나는 통합 검색</strong>
            </h2>
            </p>

            <div class="Partner_main_search_box">
               <form>
                  <input type="text" id="Partner_search" size="50">&nbsp;&nbsp;
                  <input class="search_icon" id="Partner_search_button" type="image" src="../../images/partner_images/ico_fa_search_m.png">
               </form>
            </div>
         </div>
         <!--    솔 end-->




         <!-- 동반자를 검색하기위한 조건 선택 : 지역  -> 역검색 start    -->
         <div class="Partner_calendar_check2">
            <form>
               <div id="partner_station_sel">
                  <table>
                     <!-- 노선을 선택하고 역을 선택한 후 검색하면 일치하는 동반자 리스트 출력 -->
                     <tr>
                        <th><h2>노선 선택</h2></th>

                        <th><select id="station_line" name="station_line">
                              <option>서울</option>
                              <option>경기도</option>
                              <option>충청남도</option>
                              <option>강원도</option>
                              <option>전라북도</option>
                        </select></th>

                        <th><h2>역 선택</h2></th>
                        <th><select id="station_line_in" name="station_line_in"></select></th>               
                        <th colspan="4">&nbsp;&nbsp;
                        <input class="search_icon" id="submit" type="image" src="../../images/partner_images/ico_fa_search_m.png"></th>
                     </tr>
                  </table>
               </div>
            </form>
         </div>
         <!-- 동반자를 검색하기위한 조건 선택 : 지역  -> 역검색 end    -->



         <!-- 동반자를 검색하기위한 조건 선택 : 날짜  -> 시간 검색 start    -->
         <div class="Partner_calendar_check3">
	         <form>
	            <input type="hidden" id="total_Sdate" value="total_Sdate"> <input
	               type="hidden" id="total_Edate" value="total_Edate"> <input
	               type="hidden" id="total_Stime" value="total_Stime"> <input
	               type="hidden" id="total_Etime" value="total_Etime">
	
	            <table>
	               <tr>
	                  <td colspan="4">
	                     <h2>
	                        <span>날짜 / 시간 선택</span>
	                     </h2>
	                  </td>
	               </tr>
	
	               <tr>
	                  <th>출발 날짜</th>
	                  <!-- 출발 날짜 선택한 텍스트박스 -->
	                  <th><input type="text" id="datepicker_start"></th>
	
	                  <th>출발 시간</th>
	                  <th>
	                     <!-- 출발하는 날 시간 선택한 셀렉트박스 --> <select id="selStartTime"
	                     name="selStartTime"></select>
	                  </th>	
	               </tr>
	
	               <tr>
	                  <th>도착 날짜</th>
	                  <!-- 출발 날짜 선택한 텍스트박스 -->
	                  <td><input type="text" id="datepicker_end"></td>
	
	                  <th>도착 시간</th>
	                  <th>
	                  	<!-- 도착하는 날 시간 선택한 셀렉트박스 -->
	                  	<select id="selEndTime"name="selEndTime"></select>
	                  </th>
	                  <th>&nbsp;&nbsp;
	                  	<input class="search_icon" id="aaa" type="image" src="../../images/partner_images/ico_fa_search_m.png">
	                  </th>
	               </tr>
	            </table>
	
	         </form>
         <!-- 동반자를 검색하기위한 조건 선택 : 날짜  -> 시간 검색 end    -->
		</div>
		
      </div>


<hr>

      <!-- 동반자 검색 시 나오는 리스트 -> 후행 : 페이징 처리  /     -->
      <div class="Partner_calendar_list">
         
         <ul class="Partner_calender_searchList">
            <c:choose>
               <c:when test="${list != null}">
                  <c:forEach var="c" items="${list}">
                     <li><a href="#">
                           <div>
                              <div id="Partner_calender_searchImage">
                                 <img src="../../images/partner_images/search_map.PNG">

                                 <div class="Partner_sendMessage">
                                    <input id="message_send" type="image"
                                       src="../../images/partner_images/messages-icon.png" onclick="message('${c.m_id}')">
                                 </div>
                              </div>

                              <div class="Partner_info_cSearch">
                                 <p class="name">${c.m_name}</p>
                                 <p class="gender">${c.m_gender}</p>
                                 <p class="age">${c.m_age}</p>
                              </div>
                           </div>
                     </a></li>
                  </c:forEach>
               </c:when>
            </c:choose>


         </ul>
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



</body>
</html>