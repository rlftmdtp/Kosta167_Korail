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
<meta name="viewport"
	content="width=device-width, initial-scale=0.3, maximum-scale=2.0, minimum-scale=0.3, user-scalable=yes,target-densitydpi=device-dpi">
<title>Star Rail</title>

<link rel="stylesheet" href="../../css/Main_css/default_shop.css"
	type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/common.css"
	type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/layout.css?ver=1"
	type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/contents.css"
	type="text/css" />
<link rel="stylesheet" href="../../css/Main_css/board.css"
	type="text/css" />



<script type="text/javascript"
	src="../../javascript/Main_script/jquery.js"></script>
<script type="text/javascript"
	src="../../javascript/Main_script/jquery-migrate.js"></script>
<script type="text/javascript"
	src="../../javascript/Main_script/jquery.easing.js"></script>
<script type="text/javascript"
	src="../../javascript/Main_script/jquery.bxslider.js"></script>
<script type="text/javascript"
	src="../../javascript/Main_script/base.js"></script>
<script src="../../javascript/Main_script/jquery.shop.menu.js"></script>
<script src="../../javascript/Main_script/common.js"></script>
<script src="../../javascript/Main_script/wrest.js"></script>


</head>
<body>
	<div class="header-Wrap">
		<!-- 팝업레이어 시작 { -->
		<!-- 	<div id="hd_pop">
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
	} 팝업레이어 끝
	
	 -->
		<div id="hnn-wrap">
			<!-- TNB  -->
			<div id="hnn-tnb">
				<div class="hnn-inner">
					<div id="hnn-logo">
						<a href="MainStart.jsp"><img
							src="../../images/main_images/logo.jpg" width="161" height="76" /></a>
					</div>

					<ul id="hnn-log">
						<li><a href="MainStart.jsp?body=mainpage.jsp">홈</a></li>
						<li><a href="MainStart.jsp?body=mainLogin.jsp">로그인</a><span></span></li>
						<li><a href="#">회원가입</a><span></span></li>
						<li><a
							href="MainStart.jsp?body=../message_jsp/msg_receive.jsp">쪽지함</a></li>
						<li><a href="MainStart.jsp?body=Mypage.jsp">마이페이지</a></li>
					</ul>
					<!-- 다국어 -->
					<!-- <div id="hnn-lang">
					<a class="hnn-btn" href="#">Korean <em></em></a>
					<ul style="">
						<li><a href="#">English</a></li>
						<li><a href="#">China</a></li>
					</ul>
				</div> -->
					<!-- //다국어 -->
				</div>
			</div>
		</div>
		<!-- //TNB  -->

		<!--HEADER -->
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
					<li class="hnn-gnb2 "><a href="#">코스 짜기</a>
					<li class="hnn-gnb3 "><a href="#">동반자 찾기</a></li>
					<li class="hnn-gnb4 "><a href="#">후기남겨요</a></li>
					<li class="hnn-gnb5 "><a href="#">공유해요</a></li>
				</ul>
				<!-- GNB -->
				<!-- 검색 -->
				<!-- <script>
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
				<form name="frmsearch1" action="#"
					onsubmit="return search_submit(this);">
					<input type="text" name="q" value="" class="form"
						placeholder="검색어를 입력하세요." /> <input type="image"
						src="http://www.e-seje.com/images/ico-search2.gif" alt="검색"
						class="btn" />
				</form>
			</div> -->
			</div>
		</div>
	</div>
</body>
</html>