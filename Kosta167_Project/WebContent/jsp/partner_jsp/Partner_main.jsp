<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
	// 자바스크립트에서 사용하는 전역변수 선언
	var g5_url = "http://www.e-seje.com";
	var g5_bbs_url = "http://www.e-seje.com/bbs";
	var g5_is_member = "";
	var g5_is_admin = "";
	var g5_is_mobile = "";
	var g5_bo_table = "";
	var g5_sca = "";
	var g5_editor = "";
	var g5_cookie_domain = "";
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

<link rel="stylesheet" href="../../css/partner_css/partner_main.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
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
					<a href="mainpage.jsp"><img src="../../images/logo.jpg"
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
		<!-- //ELEMENT -->
<!-- 여기에 각자 내용 넣기 -->








	<div id="Partner_main_wrap">
		<div class="Partner_mainPage">
			<div class="Partner_main_container">
<!-- 동반자를 찾기 위해 키워드로 검색 할 수 있으며 + 역  / 날짜,시간 기준으로 선택하여 검색 가능  -->
				<div class="Partner_main_search">
					<p>
						<h2><strong>전국 Star Rail 동반자를 한번에 만나는 통합 검색</strong></h2>
					</p>
					
					<div class="Partner_main_search_box">
						<form id="Partner_main_search_form" action="Partner_calendar.jsp" method="post">
							<input type="text" id="Partner_search" size="50">
							<input type="submit" id="Partner_search_button" value="">
						</form>
					</div>
				</div>
				
				<div class="Partner_main_filter_select">
					<ul class="select_standard">
						<li class="select_station">
							<a href="Partner_station.jsp">
								<img src="../../images/partner_images/station.PNG"/><br><span>역</span>
							</a>
						</li>
						<li class="select_date">
							<a href="Partner_calendar.jsp">
								<img src="../../images/partner_images/calendar.PNG"><br><span>날짜 / 시간</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			
			
<!-- 급해요 기능 : 동반자를 찾지 못한 사람 중 기간이 임박한 순서대로 슬라이드 -->
			<div class="Partner_intro_min">
				<img src="../../images/partner_images/notice_icon.png">
				<p>동반자 찾기에 시간이 얼마 안남은 사람 순서대로 흘러가는 공간</p>
			</div>
			
			
			
			
		</div>
	</div>
	
<!-- 여기에 각자 내용 넣기 -->

</body>
</html>