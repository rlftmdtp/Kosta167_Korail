/*$(function() {
	 원하는 지역 선택시 해당하는 지역의 역이 option동적 생성되어 나오게 됨 
	var seoul = [ "청량리", "서울", "용산" ];
	var gyeonggido = [ "수원", "안양", "평택" ];
	var gangwon = [ "대관령", "강릉", "정동진" ];
	var chungnam = [ "천안", "아산" ];
	var jeonbuk = [ "여수", "순천" ];
	var $selectItem;

	var changeItem;

	// 지역 선택 시 지역에 해당하는 역 동적 생성되는 부분
	$("#station_line").change(function() {

		$selectItem = $(this).val();

		$('#station_line_in').find('option').remove();

		if ($selectItem == "경기도") {
			changeItem = gyeonggido;
			alert("경기도" + changeItem);
		} else if ($selectItem == "서울") {
			changeItem = seoul;
			alert("서울" + changeItem);
		} else if ($selectItem == "강원도") {
			changeItem = gangwon;
			alert("강원" + changeItem);
		} else if ($selectItem == "충청남도") {
			changeItem = chungnam;
			alert("충남" + changeItem);
		} else if ($selectItem == "전라북도") {
			changeItem = jeonbuk;
			alert("전북" + changeItem);
		}

		// 원하는 역 선택 시 그곳에 머무는 사람 검색되기 위해 내가 선택 한 값
		$.each(changeItem, function(index, item) {
			$('#station_line_in').append('<option>' + item + '</option>');

		})

		// 원하는 역 선택 시 그 값을 (ex:강릉) -> ajax로 partner_station_searchOK.jsp로 '강릉'을
		// 전달
		$('#station_line_in').change(function() {
			var station = $("#station_line_in option:selected").text();
			alert("station" + station);

			$.ajax({
				url : '../../jsp/partner_jsp/Partner_station_searchOK.jsp',
				data : {
					"station" : station
				},
				dataType : 'json',
				type : 'post'
			});
		})

	})
})
*/