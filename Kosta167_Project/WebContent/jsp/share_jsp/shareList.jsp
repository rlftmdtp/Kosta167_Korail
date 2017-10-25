<%@page import="share.model.ListModel"%>
<%@page import="share.model.Share"%>
<%@page import="java.util.List"%>
<%@page import="share.model.ShareService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("utf-8");
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum==null){
		pageNum = "1";
	}
	
	int requestPage = Integer.parseInt(pageNum);
	
	ShareService service = ShareService.getInstance();
	ListModel listModel = service.listShareService(request,requestPage);
	
	request.setAttribute("listModel", listModel);
	
	
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
<title>Star Rail</title>

<link rel="stylesheet" href="../../css/Main_css/default_shop.css"
   type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/common.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/layout.css" type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/contents.css"
   type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/board.css" type="text/css" />

<script type="text/javascript">
 	function gotoshareInsert() {
		location.href = "shareForm.jsp";
	}
</script>
<script type="text/javascript"
   src="http://www.e-seje.com/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
   src="http://www.e-seje.com/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
   src="http://www.e-seje.com/js/jquery.easing.1.3.js"></script>
<script type="text/javascript"
   src="http://www.e-seje.com/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="http://www.e-seje.com/js/base.js"></script>

<script src="http://www.e-seje.com/js/jquery.shop.menu.js"></script>

<script src="http://www.e-seje.com/js/common.js"></script>
<script src="http://www.e-seje.com/js/wrest.js"></script>

</head>
<body>

   <!-- 팝업레이어 시작 { -->
   <div id="hd_pop">
      <h2>팝업레이어 알림</h2>

      <span class="sound_only">팝업레이어 알림이 없습니다.</span>
   </div>

   <script>
      $(function() {
         $(".hd_pops_reject").click(function() {
            var id = $(this).attr('class').split(' ');
            var ck_name = id[1];
            var exp_time = parseInt(id[2]);
            $("#" + id[1]).css("display", "none");
            set_cookie(ck_name, 1, exp_time, g5_cookie_domain);
         });
         $('.hd_pops_close').click(function() {
            var idb = $(this).attr('class').split(' ');
            $('#' + idb[1]).css('display', 'none');
         });
         $("#hd").css("z-index", 1000);
      });
   </script>
   <!-- } 팝업레이어 끝 -->
   <div id="hnn-wrap">
      <!-- TNB  -->
      <div id="hnn-tnb">
         <div class="hnn-inner">
            <div id="hnn-logo">
               <a href="mainpage.jsp"><img src="../images/message/logo.jpg"
                  width="161" height="72" /></a>
            </div>

            <ul id="hnn-log">
               <li><a href="#">홈</a></li>
               <li><a href="http://www.e-seje.com/bbs/login.php?url=%2F">로그인</a><span></span></li>
               <li><a href="http://www.e-seje.com/bbs/register.php">회원가입</a><span></span></li>
               <li><a href="http://www.e-seje.com/shop/cart.php" class="cart"><em
                     class="ico-cart"></em>장바구니</a></li>
               <li><a
                  href="http://www.e-seje.com/bbs/board.php?bo_table=notice">고객센터</a></li>
            </ul>
            <!-- 다국어 -->
            <div id="hnn-lang">
               <a class="hnn-btn" href="#">Korean <em></em></a>
               <ul style="">
                  <li><a href="/en">English</a></li>
                  <li><a href="/ch">China</a></li>
               </ul>
            </div>
            <!-- //다국어 -->
         </div>
      </div>
      <!-- //TNB  -->

      <!--HEADER -->
      <div id="hnn-header">
         <div class="hnn-inner">
            <!-- GNB -->
            <ul id="hnn-gnb">
               <li class="hnn-gnb1 "><a
                  href="http://www.e-seje.com/contents/sub01_01.php">Star Rail</a>
                  <div>
                     <ul class="hnn-snb1">
                        <li><a href="http://www.e-seje.com/contents/sub01_02.php">내일로란</a></li>
                        <li><a href="http://www.e-seje.com/contents/sub01_03.php">내일로
                              혜택</a></li>

                     </ul>
                  </div></li>
               <li class="hnn-gnb2 "><a
                  href="http://www.e-seje.com/contents/sub02_01.php">코스 짜기</a>
               <li class="hnn-gnb3 "><a
                  href="http://www.e-seje.com/bbs/board.php?bo_table=notice">동반자
                     찾기</a></li>
               <li class="hnn-gnb4 "><a
                  href="http://www.e-seje.com/shop/list.php?ca_id=10">후기남겨요</a></li>
               <li class="hnn-gnb5 "><a
                  href="http://www.e-seje.com/contents/sub05_01.php">공유해요</a></li>
            </ul>
            <!-- GNB -->
            <!-- 검색 -->
            <script>
               function search_submit(f) {
                  if (f.q.value.length < 2) {
                     alert("검색어는 두글자 이상 입력하십시오.");
                     f.q.select();
                     f.q.focus();
                     return false;
                  }

                  return true;
               }
            </script>
            <div id="header-search">
               <form name="frmsearch1"
                  action="http://www.e-seje.com/shop/search.php"
                  onsubmit="return search_submit(this);">
                  <input type="text" name="q" value="" class="form"
                     placeholder="검색어를 입력하세요." /> <input type="image"
                     src="http://www.e-seje.com/images/ico-search2.gif" alt="검색"
                     class="btn" />
               </form>
            </div>
            <!-- //검색 -->
         </div>
         <div class="hnn-bg"></div>
      </div>
      <!--HEADER -->

      

         
      </div>
	<center>
	<h3> 공유게시판 </h3>
	
			<table class="table table-striped"
				style="text-align: center; border: 1px solid=#dddddd">
					<tr height="50">
						<th width="160"
							style="background-color: #eeeeee; text-align: center;">글번호</th>
						<th width="600"
							style="background-color: #eeeeee; text-align: center;">제목</th>	
						<!-- <th width="100"
							style="background-color: #eeeeee; text-align: center;">작성자</th> -->
						<th width="240" style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th width="160" style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
					
					<!-- listModel안에 list객체가 존재하기 때문에  -->
			<c:forEach var="share" items="${listModel.list}">
			
			<tr height="50">
				<td>${share.sh_no}</td>
				<td align="left">
				${share.sh_subject} <a href="shareDetail.jsp?sh_no=${share.sh_no }">${share.sh_title }</a></td>
				<%-- <td>${member.m_name}</td> --%>
				<td>
				 <fmt:formatDate value="${share.sh_date}" pattern="yyyy-MM-dd"/> 
				</td>
				<td>${share.sh_hit}</td>
			</tr>
			</c:forEach>
		
			
		
			</table>
			
			<!-- 페이징 처리 -->
			<!-- 이전 페이지 가기 -->
			
			<c:if test="${listModel.startPage > 5 }">
			
				<a href="shareList.jsp?pageNum=1">[◁◀]</a>
				<a href="shareList.jsp?pageNum=${listModel.startPage-1}">[◀]</a>
				
			</c:if>
			
			<!-- startpage부터 endpage까지 출력 -->
			
			<c:forEach var="pageNo" begin="${listModel.startPage}" end="${listModel.endPage}">
				<c:if test="${listModel.requestPage == pageNo}"><b></c:if>
				<a href = "shareList.jsp?pageNum=${pageNo }" > [${pageNo}]</a>
				<c:if test = "${listModel.requestPage == pageNo }"></b></c:if>
			</c:forEach>
			
			<!-- 이후 페이지 가기 -->
			<c:if test="${ listModel.endPage < listModel.totalPageCount}">
			
				<a href = "shareList.jsp?pageNum=${listModel.endPage+1}">[▷]</a>
				<a href = "shareList.jsp?pageNum=${listModel.totalPageCount }">[▷▶]</a>
			</c:if>
			
			<table align="right">
			<tr>
			<br>
				<td colspan="4">
				<input type="button" value="메인" onclick="">&nbsp;&nbsp; 
				<input type="button" value="글쓰기" onclick="gotoshareInsert()"></td>
			</tr>
			</table>
	
	<form action="shareList.jsp" method="post">
		
		<input type="checkbox" name="area" value = "sh_title"> 제목 
		<input type="checkbox" name="area" value = "m_name"> 작성자
		<input type="text" name="searchKey" size="10"></input>
 		<input type="submit" value="검색">
	</form>
	</center>
	
	
	
	
	
	
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
                        href="http://www.e-seje.com/bbs/board.php?bo_table=notice&amp;wr_id=12">2017년
                           10월 방송일정입니다.</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=notice&amp;wr_id=11">2017년
                           08월 방송일정 입니다.</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=notice&amp;wr_id=8">2017년
                           07월 방송일정 입니다.</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=notice&amp;wr_id=7">2017년
                           6월 방송일정 입니다.</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=notice&amp;wr_id=6">2017년
                           05월 방송일정 입니다.</a></li>
                  </ul>
               </div>
            </div>
            <div class="fr">
               <div class="board-tit">
                  <em></em>report
               </div>
               <div class="board-list">
                  <ul class="board-roll">


                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=news&amp;wr_id=6">[성장동력!코넥스]비엔디생활건강,
                           &#039;세제혁명&#039;…</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=news&amp;wr_id=5">한·중
                           관계악화 속 충북도 6억7천만원 계약성…</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=news&amp;wr_id=4">비엔디생활건강,
                           &#039;뷰티&#039; 유통사업 진출</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=news&amp;wr_id=3">비엔디생활건강(215050)
                           해외 시장 개척을…</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=news&amp;wr_id=2">[강소기업이
                           뛴다]내수시장 이어 中·美 등 해…</a></li>
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
                  href="http://www.e-seje.com/contents/sub01_01.php">company</a>
                  <ul>
                     <li><a href="http://www.e-seje.com/contents/sub01_01.php">회사개요</a></li>
                     <li><a href="http://www.e-seje.com/contents/sub01_02.php">인사말</a></li>
                     <li><a href="http://www.e-seje.com/contents/sub01_03.php">연혁</a></li>
                     <li><a href="http://www.e-seje.com/contents/sub01_04.php">조직도</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=license">인증현황</a></li>
                     <li><a href="http://www.e-seje.com/contents/sub01_06.php">파트너사</a></li>
                     <li><a href="http://www.e-seje.com/contents/sub01_07.php">오시는
                           길</a></li>
                  </ul></li>
               <li class="map2"><a
                  href="http://www.e-seje.com/contents/sub02_01.php">BRAND STORY</a>
                  <ul>
                     <li><a href="http://www.e-seje.com/contents/sub02_01.php">브랜드
                           소개</a></li>
                  </ul></li>
               <li class="map3"><a
                  href="http://www.e-seje.com/bbs/board.php?bo_table=notice">CS
                     CENTER</a>
                  <ul>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=notice">공지사항</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=news">보도자료</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/board.php?bo_table=event">이벤트</a></li>
                     <li><a
                        href="http://www.e-seje.com/bbs/write.php?bo_table=inquiry">문의하기</a></li>
                  </ul></li>
               <li class="map4"><a
                  href="http://www.e-seje.com/shop/list.php?ca_id=10">SHOP</a>
                  <ul>
                     <li><a href="http://www.e-seje.com/shop/list.php?ca_id=10">다목적</a></li>
                     <li><a href="http://www.e-seje.com/shop/list.php?ca_id=20">세탁</a></li>
                     <li><a href="http://www.e-seje.com/shop/list.php?ca_id=30">세정</a></li>
                     <li><a href="http://www.e-seje.com/shop/list.php?ca_id=40">코스메틱</a></li>
                     <li><a href="http://www.e-seje.com/shop/list.php?ca_id=50">기타</a></li>
                  </ul></li>
               <li class="map5"><a
                  href="http://www.e-seje.com/contents/sub05_01.php">IR</a>
                  <ul>
                     <li><a href="http://www.e-seje.com/contents/sub05_01.php">주가정보</a></li>
                     <li><a href="http://www.e-seje.com/contents/sub05_02.php">IR정보</a></li>
                     <li><a href="http://www.e-seje.com/contents/sub05_03.php">공시자료</a></li>
                     <li><a href="http://www.e-seje.com/contents/sub05_04.php">재무정보</a></li>
                  </ul></li>
               <li class="map6"><a
                  href="http://www.e-seje.com/bbs/login.php?url=%2F">LOGIN</a>
                  <ul>
                     <li><a href="http://www.e-seje.com/bbs/login.php?url=%2F">로그인</a></li>
                     <li><a href="http://www.e-seje.com/bbs/register.php">회원가입</a></li>
                  </ul></li>

               <li class="map7"><a
                  href="http://www.e-seje.com/contents/sub10_01.php">기타</a>
                  <ul>
                     <li><a href="http://www.e-seje.com/contents/sub10_01.php">개인정보취급방침</a></li>
                     <li><a href="http://www.e-seje.com/contents/sub10_02.php">이용약관</a></li>
                     <li><a href="http://www.e-seje.com/contents/sub10_03.php">이용안내</a></li>
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
            <div class="foot-logo"></div>
            <div class="address">
               비엔디생활건강<br> 인천광역시 부평구 서달로298번길 73 <em></em>T. 02-552-8481<em></em>F.
               02-552-8482<br> 대표 : 이다니엘<em></em>사업자등록번호 : 215-87-63345<em></em>통신판매업신고
               : 제2016-인천부평-0132호 <br> Copyright 2017 B&amp;D Life Health
               Co.,Ltd. All Rights Reserved.
            </div>
            <!-- 에스크로 -->
            <a href="#" class="escrow"></a>
         </div>
      </div>
      <!-- // FOOT -->
   </div>


   <script src="http://www.e-seje.com/js/sns.js"></script>
   <!-- } 하단 끝 -->



   <!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
   <!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

</body>
</html>

