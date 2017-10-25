<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../css/partner_css/partner_main.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<div id="Partner_main_wrap">
		<div class="Partner_mainPage">
			<div class="Partner_main_container">
<!-- 동반자를 찾기 위해 키워드로 검색 할 수 있으며 + 역  / 날짜,시간 기준으로 선택하여 검색 가능  -->
				<div class="Partner_main_search">
					<p>
						<h2><strong>전국 Star Rail 동반자를 한번에 만나는 통합 검색</strong></h2>
					</p>  
					
					<div class="Partner_main_search_box">
						<form id="Partner_main_search_form" action="Partner_mainSearchOk.jsp" method="post">
							<input type="text" name="Partner_search" size="50">
							<input type="submit" id="Partner_search_button" value="sh_title">
						</form>
					</div>
				</div>
				
				<div class="Partner_main_filter_select">
					<ul class="select_standard">
						<li class="select_station">
							<a href="#">
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
	
</body>
</html>