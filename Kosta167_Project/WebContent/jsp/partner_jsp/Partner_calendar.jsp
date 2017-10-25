<%@page import="java.util.HashMap"%>
<%@page import="partner.model.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.io.Console"%>
<%@page import="partner.model.PartnerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:useBean id="member" class="partner.model.Member"></jsp:useBean>
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

	/* 	모든 리스트 받아옴
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="../../javascript/partner_javascript/Partner_calenderPage.js"></script>
<link rel="stylesheet"
	href="../../css/partner_css/partner_calendar.css?ver=1" type="text/css" />
<link rel="stylesheet"
	href="../../css/partner_css/partner_station.css?ver=1" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


	<!-- 기본적으로 내 코스의 정보가 떠야 함 -->
	<div class="Partner_calendar_wrap">
		<div class="partner_myCourse">
			<h2>
				<span>내 코스 확인</span>
			</h2>
			<img src="../../images/partner_images/map.PNG" width="350px"
				height="400px">
		</div>










		<!-- 동반자를 검색하기위한 조건 선택 : 날짜/시간	 -->
		<div class="Partner_calendar_check">


			<!-- 	솔 start-->
			<div class="Partner_main_search">
				<p>
				<h2>
					<strong>전국 Star Rail 동반자를 한번에 만나는 통합 검색</strong>
				</h2>
				</p>

				<div class="Partner_main_search_box">
					<form>
						<input type="text" id="Partner_search" size="50"> <input
							id="Partner_search_button" type="submit">
					</form>
				</div>
			</div>
			<!-- 	솔 end-->




			<!-- 동반자를 검색하기위한 조건 선택 : 지역  -> 역검색 start	 -->
			<div class="Partner_staion_check">
				<form>
					<div id="partner_station_sel">
						<table>
							<!-- 노선을 선택하고 역을 선택한 후 검색하면 일치하는 동반자 리스트 출력 -->
							<tr>
								<th>노선 선택</th>

								<td><select id="station_line" name="station_line">
										<option>서울</option>
										<option>경기도</option>
										<option>충청남도</option>
										<option>강원도</option>
										<option>전라북도</option>
								</select></td>

								<th>역 선택</th>
								<td><select id="station_line_in" name="station_line_in"></select></td>
							</tr>

							<tr>
								<td colspan="4"><input type="submit" value="검색"></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
			<!-- 동반자를 검색하기위한 조건 선택 : 지역  -> 역검색 end	 -->



			<!-- 동반자를 검색하기위한 조건 선택 : 날짜  -> 시간 검색 start	 -->
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
						<td>출발 날짜</td>
						<!-- 출발 날짜 선택한 텍스트박스 -->
						<td><input type="text" id="datepicker_start"></td>

						<td>출발 시간</td>
						<td>
							<!-- 출발하는 날 시간 선택한 셀렉트박스 --> <select id="selStartTime"
							name="selStartTime"></select>
						</td>

					</tr>

					<tr>
						<td>도착 날짜</td>
						<!-- 출발 날짜 선택한 텍스트박스 -->
						<td><input type="text" id="datepicker_end"></td>

						<td>도착 시간</td>
						<td>
							<!-- 도착하는 날 시간 선택한 셀렉트박스 --> <select id="selEndTime"
							name="selEndTime"></select>
						</td>
					</tr>

					<tr>
						<td colspan="4"><input id="submit" type="submit" value="검색"></td>
					</tr>
				</table>

			</form>
			<!-- 동반자를 검색하기위한 조건 선택 : 날짜  -> 시간 검색 end	 -->

		</div>





		<!-- 동반자 검색 시 나오는 리스트 -> 후행 : 페이징 처리  / 	 -->
		<div class="Partner_calendar_list">
			<hr>
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
													src="../../images/partner_images/messages-icon.png">
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




</body>
</html>