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
<html>
<head>
<style type="text/css">
#replyTable {
	border-top-color: white;
	margin-top: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=0.3, maximum-scale=2.0, minimum-scale=0.3, user-scalable=yes,target-densitydpi=device-dpi">

<meta name="description" content="" />
<meta name="naver-site-verification" content="" />
<title>Star Rail</title>
<link rel="stylesheet" href="../../css/Main_css/default_shop.css"
	type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/common.css"
	type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/layout.css"
	type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/contents.css"
	type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/board.css"
	type="text/css" />
<link rel="stylesheet" href="../../css/review_css/Review_detail.css"
	type="text/css" />

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



















