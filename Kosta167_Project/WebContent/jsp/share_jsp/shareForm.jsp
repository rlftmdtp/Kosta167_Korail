<%@page import="course.model.CourseDetail"%>
<%@page import="java.util.List"%>
<%@page import="share.model.Share"%>
<%@page import="share.model.ShareService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("c_id");
	
	if(id.equals("25")){
		System.out.println("25****");
	}
	
	int c_id = Integer.parseInt(id);
	System.out.println(id);
	
	String m_id =(String) session.getAttribute("m_id");
	ShareService service = ShareService.getInstance();
	List<CourseDetail> list = service.viewCourseDetailService(c_id);
	
	request.setAttribute("cd_list", list);
	request.setAttribute("m_id", m_id);
	request.setAttribute("c_id", c_id);
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
<link rel="stylesheet" href="../../css/share_css/shareform.css?ver=1" type="text/css" />


<script type="text/javascript" src="../../javascript/Main_script/jquery.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery-migrate.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.easing.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/base.js"></script>
<script src="../../javascript/Main_script/jquery.shop.menu.js"></script>
<script src="../../javascript/Main_script/common.js"></script>
<script src="../../javascript/Main_script/wrest.js"></script>

<script type="text/javascript">
	function gotoshareInsert() {
		location.href = "shareForm.jsp";
	}

	/* 입력안된 곳 입력하라는 경고창 */
	function writeCheck() {
		var form = document.wirteform;

		if (!form.sh_title.value) {
			alert("제목을 입력해주세요.")
			form.sh_title.focus();
			return;
		}
		if (!form.sh_content.value) {
			alert("내용을 입력해주세요.")
			form.sh_content.focus();
			return;
		}
		if (!form.sh_pw.value) {
			alert("비밀번호를 입력해주세요.");
			form.sh_pw.focus();
			return;
		}

		form.submit();
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
					<li class="hnn-gnb4 "><a href="../review_jsp/reviewlist.jsp">후기남겨요</a></li>
					<li class="hnn-gnb5 "><a href="shareList.jsp">공유해요</a></li>
				</ul>
				</div>
			</div>
		</div>
	<div class="body-wrap">
	
	<div id = "formtableWrap">
		<form action="shareinsertOk.jsp" name="wirteform" method="post">
		<input type="hidden" name="c_id" value="${c_id }"/>
				<hr align="center" style="border: outset 1.2px #ffffff; width:83%">
				<h1 align="center"> 공유글쓰기 </h1>
				
				<div align="center"> 
				<span><font color="red" size="2">(*)는 필수입력 입니다.</font></span>
				</div>
			<!-- <hr align="center" style="border: outset 1.2px #CC66FF; width:75%"> -->
			
			<table align="center" id="formtable">
				
				<tr height="3" bgcolor="black">
					<td colspan="3"></td>
					<tr>
					
		
				<tr height="1" bgcolor="#dddddd">
						<td colspan="3"></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="3"></td>
					</tr>
					<tr>
							<td>&nbsp;</td>
							<td class="th_td" align="center">여행기간</td>
							<td class="tc_td">
							<select name="sh_subject">
								<option value="  ">여행기간 선택</option>
								<option value="[5일]">[5일]</option>
								<option value="[7일]">[7일]</option>
							</select>
					</td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						
						<tr>
							<td>&nbsp;</td>
							<td class="th_td" align="center">제목(*)</td>
							<td class="tc_td"><input name="sh_title" size="100" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="th_td" align="center">작성자</td>
							<td class="tc_td"><input type="hidden" name="m_id" value="${m_id }" size="50" maxlength="100">${m_id }</td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="th_td" align="center">비밀번호(*)</td>
							<td class="tc_td"><input type="password" name="sh_pw" size="30" maxlength="50"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="th_td" align="center">코스</td>
							<td class="tc_td"><textarea cols="130" rows="13"
							style="resize : none; overflow: scoll;"><c:forEach var="cd" items="${cd_list}">
					${cd.cd_start} (<fmt:formatDate value="${cd.cd_stime }" pattern="yy/MM/dd HH:mm"/>) ---> ${cd.cd_end } (<fmt:formatDate value="${cd.cd_etime }" pattern="yy/MM/dd HH:mm"/>)
					
				</c:forEach></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr> 
						<tr>
							<td>&nbsp;</td>
							<td class="th_td" align="center">내용(*)</td>
							<td class="tc_td"><textarea name="sh_content" cols="130" rows="13"
							style="resize: none; overflow: scoll;"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#777777">
							<td colspan="4"></td>
						</tr>
						<tr align="right">
							<br>
							<td>&nbsp;</td>
							<td colspan="2">
							<a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Twitter" >
				<img src="../../images/share_images/twitter.png" height="3%" width="3%"></a>

				<a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Facebook" >
				<img src="../../images/share_images/facebook.png" height="3%" width="3%"></a>
				
				<a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url=' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=300,width=600');return false;" target="_blank" alt="Share on kakaostory">
				<img src="../../images/share_images/kakao.png" height="3%" width="3%"></a>
				
				<a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Naver" >
				<img src="../../images/share_images/naver.png" height="3%" width="3%"></a>
							
	
							
							&nbsp;							 
							<input type="button" value="등록" onclick="writeCheck();"> <input
						type="reset" value="취소">
						
				</tr>
					</table>
				</form>
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