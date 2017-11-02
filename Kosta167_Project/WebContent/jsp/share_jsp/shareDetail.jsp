<%@page import="course.model.CourseDetail"%>
<%@page import="share.model.ShareReply"%>
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
%>
<%
	String id = request.getParameter("sh_no");

	int sh_no = 0;
	if (id != null) {
		sh_no = Integer.parseInt(id);
	}
	
	ShareService service = ShareService.getInstance();
	Share share = service.selectShareService(sh_no, true);
	
	int c_id = share.getC_id();
	List<CourseDetail> cd = service.viewCourseDetailService(c_id);
	
	
	request.setAttribute("share", share);

	List<ShareReply> list = service.listShareReplyService(sh_no);

	request.setAttribute("list", list);
	
	request.setAttribute("cd_list", cd);
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


<script type="text/javascript" src="../../javascript/Main_script/jquery.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery-migrate.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.easing.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/jquery.bxslider.js"></script>
<script type="text/javascript" src="../../javascript/Main_script/base.js"></script>
<script src="../../javascript/Main_script/jquery.shop.menu.js"></script>
<script src="../../javascript/Main_script/common.js"></script>
<script src="../../javascript/Main_script/wrest.js"></script>

<script type="text/javascript">
	function fn_update() {
		location.href = "shareUpdate.jsp?sh_no=${share.sh_no}";
	}
	function go_list() {
		location.href = "shareList.jsp";
	}

	function fn_delete() {
		location.href = "shareDelete.jsp?sh_no=${share.sh_no}";
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




<!-- 메인값  -->
	<div class="body-wrap">


	<center>
		<div class="view">
			<hr align="center" style="border: solide 1.5px #dddddd; width: 75%">
			<hr align="center" style="border: outset 0.8px #dddddd; width: 75%">
			<br>
			
			<!-- 제목출력 -->
			<div align="center" class="title" id="sh_title"
				style="font-size: 38px;"><span style="color: blue">${share.sh_subject}</span>
				${share.sh_title}</div>
			<br> <br>
			
			<!-- 글번호 , 작성자, 작성날짜, 조회수출력  -->
			<div class="detail" style="font-size: 22px;">
				<span>${share.sh_no}번글&nbsp;&nbsp;|</span> 
				<span>"" &nbsp;&nbsp;|</span>
				<span><fmt:formatDate value="${share.sh_date}"
						pattern="yyyy-MM-dd" />&nbsp;&nbsp;|
				</span> <span>조회수 : ${share.sh_hit}</span>
			</div>
			<br>
			<hr align="center" style="border: dotted 1.5px #dddddd; width: 75%"><br>
		</div>
		<!-- 코스정보 -->
		<div class="course_railro" align="center"></div>
		<span style="font-size: 20px; color:#38BAEB">◇◆코스정보◆◇</span>
		<br>
		<span><img src="../../images/share_images/railmap.jpg" width="400px" height="400px"></span>
		<span><textarea cols="130" rows="13"
					style="resize: none; overflow: scoll;"><c:forEach var="cd" items="${cd_list}">
					${cd.cd_start} (<fmt:formatDate value="${cd.cd_stime }" pattern="yy/MM/dd HH:mm"/>) ---> ${cd.cd_end } (<fmt:formatDate value="${cd.cd_etime }" pattern="yy/MM/dd HH:mm"/>)
					
				</c:forEach></textarea></span></div>
		<br>
		<hr align="center" style="border: dotted 1.5px #dddddd; width: 75%"><br>
		<div class="course_text" >
		<span><table width="600px" height="400px;" align="center">
				<tr><td>${share.sh_content}</td></tr>
		</table></span>
		</div>
		<hr align="center" style="border: outset 0.8px #dddddd; width: 75%">
		<hr align="center" style="border: outset 1.5px #dddddd; width: 75%">

		<div class="button">
		<span><input type="button" value="목록" onclick="go_list();">&nbsp;</span> 
		<span><input type="button" value="수정" onclick="fn_update()">&nbsp; </span>
		<span><input type="button" value="삭제" onclick="fn_delete()"></span>
		</div>
		
		
		<!-- 기존 코드 -->
		<%-- <table>
			<tr height="3" bgcolor="#82B5DF">
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
				<td align="center">글번호 :</td>
				<td>${share.sh_no}</td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td align="center">조회수 :</td>
				<td>${share.sh_hit}</td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td align="center">작성일자 :</td>
				<td><fmt:formatDate value="${share.sh_date}"
						pattern="yyyy-MM-dd" /></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td align="center">제목 :</td>
				<td>${share.sh_subject}${share.sh_title}</td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td align="center">코스</td>
				<td><textarea cols="130" rows="13"
						style="resize: none; overflow: scoll;">c-id내용</textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td align="center">내용</td>
				<td><textarea cols="130" rows="13"
						style="resize: none; overflow: scoll;">${share.sh_content}</textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr height="1" bgcolor="#82B5DF">
				<td colspan="4"></td>
			</tr>

			<tr height="30" align="right">
				<td colspan="4"><input type="button" value="목록가기"
					onclick="go_list();"> <input type="button" value="수정"
					onclick="fn_update()"> <input type="button" value="삭제"
					onclick="fn_delete()"></td>
			</tr>

		</table>
	</center>
	</form> --%>
	<br>
	<br>
	<center>
		<hr align="center" style="border: dotted 1.5px #dddddd; width: 75%"><br>
		<form action="shareReply_add.jsp" method="post">
			<input type="hidden" name="sh_no" value="${share.sh_no}">
			<tr>
				<td colspan="3"><img src="../../images/share_images/railro2.jpg" ></td>
				<td align="left" colspan="3">
				<textarea cols="60" rows="7" placeholder="다른사람을 비방하는 글은 삭제될 수 있습니다."  name="sr_content" style="resize: none; overflow: scoll;"></textarea>
				</td>
				<td colspan="4" align="center"><input type="submit"
					value="전송">&nbsp;&nbsp; </td>
			</tr>
			
		</form>

		<br>
		<table style="text-align: center; border: 1px solid=#777777">
			<tr>
				<th width="650"
					style="background-color: #eeeeee; text-align: center;">내용</th>
				<th width="150"
					style="background-color: #eeeeee; text-align: center;">작성자</th>
				<th width="150"
					style="background-color: #eeeeee; text-align: center;">작성일</th>
			</tr>

			<c:forEach var="sharereply" items="${list}">
				<tr height="30">
					<td align="center">${sharereply.sr_content}</td>
					<td align="center">${member.m_name}</td>
					<td align="center"><fmt:formatDate value="${share.sh_date}"
							pattern="yyyy-MM-dd (hh:mm)" /></td>
				</tr>
				<tr bordercolor="#dddddd"></tr>
			</c:forEach>
		</table>
	</center>
	
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