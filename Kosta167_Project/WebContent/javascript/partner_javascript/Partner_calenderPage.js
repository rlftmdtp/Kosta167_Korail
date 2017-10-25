
$(function() {
	var start_date;     //출발날짜
	var end_date;       //도착날짜
	var $start_time;    //출발시간
	var $end_time;      //도착시간
	
	
	// 가는날 달력 선택하기
	$( "#datepicker_start" ).datepicker({
		showOn : "button",
		buttonImage : "../../images/partner_images/littlecalendar.PNG",
		buttonImageOnly : true,
		showAnim: "slideDown",
		autoclose: true,
		dateFormat: 'yy-mm-dd',
		minDate: 0,
		onClose: function( selectedDate ) {    
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#datepicker_end").datepicker( "option", "minDate", selectedDate );
        }  ,
		onSelect: function(dateText){ // 달력에서 선택한 값과 시간을 합쳐 startDate
			start_date = dateText;
			$("#total_Sdate").val(start_date);
		}
	
	})

	// 오는날 달력 선택하기
	$( "#datepicker_end" ).datepicker({ 
		showOn : "button",
		buttonImage : "../../images/partner_images/littlecalendar.PNG",
		buttonImageOnly : true,
		showAnim: "slideDown",
		autoclose: true,
		dateFormat: 'yy-mm-dd',
		minDate: 0,
		onClose: function( selectedDate ) {
            // 종료일(toDate) datepicker가 닫힐때
            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#fromDate").datepicker( "option", "maxDate", selectedDate );
        },
		onSelect: function(dateText){ // 달력에서 선택한 값과 시간을 합쳐 endDate로 저장하기
			end_date = dateText;
			$("#total_Edate").val(end_date);
		}
		
	})


//select박스에 시간 동적으로 생성하기
	for (i = 0; i < 24; i++) {
	    var hour = '';
	    var min = ':00';
	
	    if (i<10) {
	        hour = "0"+i;
	    } else {
	        hour = i;
	    }
	    $("#selStartTime").append('<option value=' + hour + min + '>' + hour + min + '</option>');
		$("#selEndTime").append('<option value=' + hour + min + '>' + hour + min + '</option>');
	}
	
	// 출발 시간 선택 시
	$("#selStartTime").click(function () {
		$start_time = $(this).val();
		$("#total_Stime").val($start_time);
	})
	
	// 도착 시간 선택 시
	$("#selEndTime").click(function () {
		$end_time = $(this).val();
		$("#total_Etime").val($end_time);
	})
	
	
	
	// (출발 날짜/시간) + (도착 날짜 /시간)을 ajax로 jsp파일에 값을 전달한다.
	$('#submit').click(function () {
		var start = $("#total_Sdate").val() + " " + $("#total_Stime").val()
	    var end = $("#total_Edate").val() + " " + $("#total_Etime").val()
	    alert(start);
		alert(end);
		
		$.ajax({
		url : '../../jsp/partner_jsp/Partner_calendar_searchOK.jsp',
		data : {"start":start,"end":end},
		dataType : 'json',
		type : 'post'
		});
	})
	
	
/*	$('.Partner_calender_searchList li').css({
		display: inline
	})
	*/


	
	
	
	
	
})



















