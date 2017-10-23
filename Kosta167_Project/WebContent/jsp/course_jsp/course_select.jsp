<%@page import="java.util.Date"%>
<%@page import="course.model.Traintime"%>
<%@page import="course.model.CourseService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSON"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	CourseService service = CourseService.getInstance();
	// 출발역 선택 후 도착역 반환
	String startStation = request.getParameter("startStation");

	if (startStation != null) {
		// service와 dao를 이용하여 도착 리스트를 가져온다.
		List<String> endList = service.endListService(startStation);
		JSONObject jsonObject = new JSONObject();

		for (int i = 0; i < endList.size(); i++) {
			jsonObject.put(i, endList.get(i));
		}
		out.println(jsonObject);
	}

	// 도착역 선택후 출발시간 반환
	String rstartStation = request.getParameter("rstartStation");
	String arriveStation = request.getParameter("arriveStation");

	if (arriveStation != null) {
		// service와 dao를 이용하여 출발가능한 시간 리스트를 가져온다.
		JSONObject jsonObject = new JSONObject();

		for (int i = 1; i < 25; i++) {
			jsonObject.put("출발시간" + i, i);
		}
		out.println(jsonObject);
	}

	// 출발시간 선택 후 출발가능한 시간 반환
	String startTime = request.getParameter("startTime");
	String tt_startStation =request.getParameter("tt_startStation");
	String tt_arriveStation = request.getParameter("tt_arriveStation");
	
	
	if (startTime != null) {

		// 나중에 db에서 넘어온 +-2 시간 범위안에 가능한 시간 목록이 올 것임.
		
		List<Traintime> trainList = service.availableTime(tt_startStation, tt_arriveStation, startTime);
		JSONObject jsonObject = new JSONObject();
		JSONArray jsooArray = new JSONArray();
		
		for (int i = 0; i < trainList.size(); i++) {
			jsonObject.put("tr_id", "("+trainList.get(i).getTr_id()+") "+trainList.get(i).getTt_stime());
			jsonObject.put("tt_id", trainList.get(i).getTt_id());
			jsooArray.add(jsonObject);
		}
		System.out.println(jsooArray);
		out.println(jsooArray);
		
	}
	

	// 발권역 정보 로직 - DB의 테이블 Issueinfo에서 가져온다
	/* 	String issueStation = request.getParameter("issueStation");
		if (issueStation != null) {
			String[] station = issueStation.split("\\s"); // \\s 공백을 의미하는 정규표현식 
	
			List<String> issueStations = new ArrayList<String>(); // 전송용 리스트
	
			for (int i = 0; i < station.length; i++) {
				issueStations.add(station[i]);
				System.out.println(station[i]);
			}
	
			CourseService service = CourseService.getInstance();
			List<IssueStation> issueStationList = service.getIssuetation(issueStations);
	
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			for (int i = 0; i < issueStationList.size(); i++) {
				jsonObject.put("station", issueStationList.get(i).getI_name());
				jsonObject.put("benefit", issueStationList.get(i).getI_content());
				jsonArray.add(jsonObject);
			}
			System.out.println(jsonArray);
			out.println(jsonArray);
		} */
%>