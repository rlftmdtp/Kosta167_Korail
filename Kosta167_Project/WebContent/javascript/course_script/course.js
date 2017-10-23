$(function() {
		var tripDateStart; // 출발날짜 여행날짜 선택 함수에서 날짜를 고를때
		var tripDateEnd = new Date(); // 끝날짜
		var tripLong = document.getElementsByName("tripLong"); // 체크박스 전용 변수

		//UI 사용 (한국어 변경)
		
		$('#datepicker').datepicker({
			onSelect : function(dateText) {

				//삭제
				initDelete();
				
				alert(dateText);
				tripDateStart = new Date(dateText);
				alert(tripDateStart);
			},
			minDate : 0, // 이전 날짜 선택불가
			showOn : "button",
			buttonImage : "../../images/course_images/littlecalendar.PNG",
			buttonImageOnly : true,
			showAnim: "slideDown",
			dateFormat: 'yy-mm-dd',
		});

		// 여행 지속 요일기간 선택
		$('.tripLong').click(function() {
					
					//여행 날짜를 선택 안했을 경우 종료
					if (tripDateStart == null) {
						alert("여행 시작 날짜를 선택하세요");
						tripLong[0].checked = false;
						tripLong[1].checked = false;
						return;
					}

					var day = parseInt($(this).val()); // val()는 문자열이기 떄문에 Date의 요일과 더하기 위해서 Int로 변형
					//날짜 더하기
					tripDateEnd.setDate(tripDateStart.getDate() + day);

					// 역 출발 일에 가능한 요일들을 추가
					var interval = tripDateEnd.getTime() - tripDateStart.getTime();
					interval = Math.floor(interval / (1000 *  60 * 60 * 24)); // 요일 간격 계산
					
					// Number객체를 -> 문자열로 변경후 -> 숫자자료형으로 변경한다
					interval.toString(); // 객체를 문자열로 변경
					for(var i=0; i<=parseInt(interval); i++){
						$('#startDate').append('<option value="' + ((tripDateStart.getMonth()+1) + "월" + tripDateStart.getDate() + "일") + '">' + ((tripDateStart.getMonth()+1) + "월" + tripDateStart.getDate() + "일") + '</option>');
						tripDateStart.setDate(tripDateStart.getDate() + 1);
					}
		})

		$('.startStation').click(
				function() {
					$.ajax({
						type : 'post',
						url : 'course_select.jsp',
						dataType : 'json',
						data : {
							"startStation" : $(this).val()
						},
						success : function(result) {
							$('#arriveStation').empty(); // 기존에 있던 도착역 리스트 삭제
							$.each(result, function(key, value) { // 도착역 추가
								$('#arriveStation').append(
										'<option class="arriveStation" value="' + value + '">'
												+ value + '</option>');
							})
						}
					})
				});

		// 동적으로 생성된 태그는 이벤트가 인식하지 못하므로 부모에게 이벤트를 걸었음.
		$('#arriveStation')
				.on(
						'click',
						'.arriveStation',
						function() {
							var startStation = $(
									"#startStation option:selected").val();
							$.ajax({
								type : 'post',
								url : 'course_select.jsp',
								dataType : 'json',
								data : {
									"rstartStation" : startStation,
									"arriveStation" : $(this).val()
								},
								success : function(result) {
									$('#startTime').empty(); // 기존에 있던 시간 리스트 삭제
									
									$.each(result, function(key, value) { // 도착역 추가
										$('#startTime').append(
												'<option class="startTime" value="' + value + '">'
														+ value + '</option>');
									})
								}
							})
						});
		
		// 출발 가능한 역 시간 출력
		$('#startTime').on('click','.startTime',function(){
			var startTime = $('#startTime option:selected').val();
			var startStation = $("#startStation option:selected").val();
			var arriveStation = $("#arriveStation option:selected").val();
			$.ajax({
				type:'post',
				url: '../../jsp/course_jsp/course_select.jsp',
				dataType: 'json',
				data : {
					"tt_startStation" : startStation,
					"tt_arriveStation" : arriveStation,	
					"startTime" : startTime},
				
				success : function(result){
					$('#possibleTime').empty();
					$.each(result, function(index,item){
						$('#possibleTime').append('<option class="possibleTime" value="' + item.tr_id +'">' + item.tr_id +'</option>');
					})
				}
			})
		});

		//경로 저장 로직
		$('#line').click(function() {

			var startStation = $('#startStation option:selected').val();
			var arriveStation = $('#arriveStation option:selected').val();
			var date = $('#startDate option:selected').val();
			var startTime = $('#possibleTime option:selected').val();
			
			var storeLine = document.getElementById('storeLine');
			storeLine.value += date + " " + startTime + " " + startStation + " " + arriveStation + "\n";

		});

		// 발권역 정보보기 로직
		$('#issueinfo').click(
				function() {
					var issueStation = $('#storeLine').val();
					var benefit = document.getElementById('benefit');
					benefit.value = "";
					$.ajax({
						type : 'post',
						url : 'course_select.jsp',
						dataType : 'json',
						data : {
							"issueStation" : issueStation
						},
						success : function(result) {
							$.each(result, function(index, item) {
								benefit.value += "발권역 " + item.station + " 혜택 "
										+ item.benefit + '\n';
							})
						}
					})
				});
		
		// 전체 경로 저장로직
		$('#courseSave').click(function(){
			// 저장경로에서 모든 정보를 가져온다
			var totalLine = $('#storeLine').val();
			alert(totalLine);
		});
		
		function initDelete(){
			alert("삭제합니다");
			//체크박스 해제
			for (var i = 0; i < tripLong.length; i++) {
				tripLong[i].checked = false;
			}
			
			// 선택된 요일 삭제
			$('#startDate').empty() // 자식을 모두 삭제한다
		}
		
		
});


