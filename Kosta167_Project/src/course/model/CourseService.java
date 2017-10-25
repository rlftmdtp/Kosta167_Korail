package course.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import main.model.Member;

public class CourseService {
	private static CourseService service = new CourseService();
	private static CourseDao dao;
	
	public static CourseService getInstance(){
		dao = CourseDao.getInstance();
		return service;
	}
	
	public Member login(HttpServletRequest request){

		Member member = new Member();
		
		member.setM_id(request.getParameter("id"));
		member.setM_pw(request.getParameter("pass"));
		
		return dao.login(member);
	}
	
	public List<IssueStation> getIssuetation(List<String> issueStations){
		List<IssueStation>  issueStationList = new ArrayList<IssueStation>();

		for(int i=0; i<issueStations.size(); i++){
			issueStationList.add(dao.getIssueStation(issueStations.get(i)));
		}
		
		System.out.println(issueStationList);
		return issueStationList;
	}
	
	public int insertCourse(String m_id){
		Course course = new Course();
		
		String c_id = dao.selectC_id() + 1 + "";

		course.setC_id(c_id); // 데이터베이스에 존재하는 데이터 최대치에 + 1
		course.setM_id(m_id);
		
		int re = dao.insertCourse(course);
		
		if(re>0){ // 코스 저장에 성공했을 경우 방금 생성된 해당 코스 id를 반환
			return Integer.parseInt(c_id);
		}
		else{
			return -1;
		}
	}
	
	public String select_tt_id(String tr_id,String ss_id){
		return dao.select_tt_id(tr_id,ss_id);
	}
	
	public int insertCourseDetail(CourseDetail courseDetail){
		courseDetail.setCd_id(dao.selectCd_id()+1 + "");
		return dao.insertCourseDetail(courseDetail);
	}
	
	// 윤주누나 코드
	public List<String> startListService() {
		return dao.startList();
	}

	public List<String> endListService(String s_station) {

		List<Stopstation> start_stopstations = dao.availableStart(s_station);
		List<Stopstation> tempList = null;

		List<Stopstation> availableEnds = new ArrayList<Stopstation>();

		for (int i = 0; i < start_stopstations.size(); i++) {
			tempList = dao.availableEnd(start_stopstations.get(i));
			for (int j = 0; j < tempList.size(); j++) {
				availableEnds.add(tempList.get(j));

			}
		}

		List<String> esNames = new ArrayList<String>();
		for (int i = 0; i < availableEnds.size(); i++) {
			String str = availableEnds.get(i).getSs_name();
			if (!(esNames.contains(str))) {
				esNames.add(str);
			}
		}

		return esNames;
	}

	public List<Traintime> availableTime(String s_station, String e_station, String startTime) {
		
		List<Stopstation> start_stopstations = dao.availableStart(s_station);
		List<Stopstation> tempList = null;

		List<Stopstation> availableEnds = new ArrayList<Stopstation>();

		for (int i = 0; i < start_stopstations.size(); i++) {
			tempList = dao.availableEnd(start_stopstations.get(i));
			for (int j = 0; j < tempList.size(); j++) {
				availableEnds.add(tempList.get(j));

			}
		}
		
		List<String> availableLines = new ArrayList<String>();
		
		for(int i=0; i<availableEnds.size(); i++){
			String ss_name=availableEnds.get(i).getSs_name();
			if(ss_name.equals(e_station)){
				String str = availableEnds.get(i).getLine_id();
				availableLines.add(str);
			}
		}
		
		int time = Integer.parseInt(startTime);
		int beforeTime = time-2;
		int afterTime = time+2;
		
		if(beforeTime<0){
			beforeTime=0;
		}
		
		if(afterTime>24){
			afterTime=24;
		}
		
		String before="";
		String after="";
		
		if(beforeTime<10){
			before="0"+beforeTime+":00";
		} else {
			before=""+beforeTime+":00";
		}
		
		if(afterTime<10){
			after="0"+afterTime+":00";
		} else {
			after=""+afterTime+":00";
		}
		
		HashMap<String, String> map = new HashMap<String,String>();
		List<Traintime> trainTimes = new ArrayList<Traintime>();
		
		map.put("before", before);
		map.put("after", after);
		map.put("ss_name", s_station);
		
		for(int i=0; i<availableLines.size(); i++){
			map.put("line_id", availableLines.get(i));
			List<Traintime> temps = dao.availableTrain(map);
			
			for(int j=0; j<temps.size(); j++){
				trainTimes.add(temps.get(j));
			}
		}
		
		for(int i=0; i<trainTimes.size(); i++){
			System.out.println(trainTimes.get(i));
		}

		return trainTimes;
	}
}
