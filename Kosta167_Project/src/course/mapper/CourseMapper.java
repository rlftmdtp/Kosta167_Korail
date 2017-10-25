package course.mapper;

import java.util.HashMap;
import java.util.List;

import course.model.Course;
import course.model.CourseDetail;
import course.model.IssueStation;
import course.model.Member;
import course.model.Stopstation;
import course.model.Traintime;

public interface CourseMapper {
	public IssueStation getIssueStation(String issueStaion);
	public Member login(Member login);
	public Integer selectC_id();
	public Integer selectCd_id();
	public int insertCourse(Course course);
	public int insertCourseDetail(CourseDetail courseDetail);
	public String select_tt_id(HashMap<String, String> map);
	
	// 윤주 누나 코드
	public List<String> startList();	//전체 역(=출발역 이름) 리스트 불러오기
	public List<Stopstation> availableStart(String s_station);	//ss_name이 선택한 출발역 이름과 같은 Stopstation 객체 반환
	public List<Stopstation> availableEnd(Stopstation start_stopstation);	//선택된 출발역 기준 도착역 후보의 Stopstation 객체 반환
	public List<Traintime> availableTrain(HashMap<String, String> map);		//출발역, 도착역, 출발 시간을 기준으로 탑승 가능한 열차, 시간 조회
	
}
