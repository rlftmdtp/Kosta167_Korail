
<%@page import="java.util.Enumeration"%>

<%@page import="course.model.CourseDetail"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="course.model.Traintime"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="course.model.IssueStation"%>
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
	// CourseDetail 저장시 traintime의 tt_id를 구하기 위해 아래의 두가지가 필요
	String tt_startStation = request.getParameter("tt_startStation");
	String tt_arriveStation = request.getParameter("tt_arriveStation");
	if (startTime != null) {

		// 나중에 db에서 넘어온 +-2 시간 범위안에 가능한 시간 목록이 올 것임.
		List<Traintime> trainList = service.availableTime(tt_startStation, tt_arriveStation, startTime);
		JSONObject jsonObject = new JSONObject();
		JSONArray jsooArray = new JSONArray();


		for (int i = 0; i < trainList.size(); i++) {
			jsonObject.put("tr_id", "(" + trainList.get(i).getTr_id() + ") ");
			jsonObject.put("tt_stime", trainList.get(i).getTt_stime());
			jsonObject.put("ss_id", " " + trainList.get(i).getSs_id());

			jsooArray.add(jsonObject);
		}
		System.out.println(jsooArray);
		out.println(jsooArray);
	}

	// 발권역 정보 로직 - DB의 테이블 Issueinfo에서 가져온다

	String[] issueStations = request.getParameterValues("issueStations[]");
	if (issueStations != null) {
		System.out.println(issueStations[0]);

		Pattern regrex = Pattern.compile("[가-힣]{1,3}역");
		List<String> stationList = new ArrayList<String>();
		
		for (int i = 0; i < issueStations.length; i++) {
			Matcher regrexMatcher = regrex.matcher(issueStations[i]);
			
			while (regrexMatcher.find()) {
				//System.out.println(regrexMatcher.group());
				String station = regrexMatcher.group();

				if (station != null) {
					stationList.add(station);
					System.out.println(regrexMatcher.group());
				}
			}
		}


		List<IssueStation> issueStationList = service.getIssuetation(stationList);

		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < issueStationList.size(); i++) {
			jsonObject.put("station", issueStationList.get(i).getI_name());
			jsonObject.put("benefit", issueStationList.get(i).getI_content());
			jsonArray.add(jsonObject);
		}
		System.out.println(jsonArray);
		out.println(jsonArray);
	}


	// 전체 코스 저장 로직
	String[] storeLine = request.getParameterValues("storeLine");
	if (storeLine != null) {

		String m_id = (String) session.getAttribute("m_id");
		service = CourseService.getInstance();

		int c_id = service.insertCourse(m_id);

		if (c_id > 0) {// 코스 저장에 성공했을 경우 해당 코스의 다음 세부 저장
			// 코스 세부를 저장해야한다.
			String[] splitStr = new String[6]; // 한 라인의 글자들을 세분화한다
			for (int i = 0; i < storeLine.length; i++) {
				System.out.println(storeLine[i]);

				// 0:출발날짜 1:tr_id 2:출발시간 3:ss_id 4:출발역 5:도착역
				splitStr = storeLine[i].split(" ");
				splitStr[1] = splitStr[1].replace("(", "");
				splitStr[1] = splitStr[1].replace(")", "");

				// traintime테이블의 tt_id를 구해오기 위해 
				String tt_id = service.select_tt_id(splitStr[1], splitStr[3]);

				// 데이트 객체로 변환
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:ss");
				Date date = format.parse(splitStr[0] + " " + splitStr[2]);
				//System.out.println(date);

				CourseDetail courseDetail = new CourseDetail();
				courseDetail.setC_id(c_id);
				courseDetail.setTt_id(tt_id);
				courseDetail.setCd_start(splitStr[4]);
				courseDetail.setCd_stime(date);
				courseDetail.setCd_end(splitStr[5]);
				courseDetail.setCd_etime(new Date());

				int re = service.insertCourseDetail(courseDetail);
				if (re > 0) {
					System.out.println("코스 세부저장을 완료했습니다");
				} else {
					System.out.println("실패");
				}
			}
			
			if(c_id > 0)
			{
			RequestDispatcher rd = request.getRequestDispatcher("../../jsp/share_jsp/shareQuestion.jsp");
			request.setAttribute("c_id",c_id);
			rd.forward(request, response);
			}
		
		} else { // 코스 저장에 실패
			out.println("로그인을 해주세요");
		}

	}
%>