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
	
	// ���� ���� �ڵ�
	public List<String> startList();	//��ü ��(=��߿� �̸�) ����Ʈ �ҷ�����
	public List<Stopstation> availableStart(String s_station);	//ss_name�� ������ ��߿� �̸��� ���� Stopstation ��ü ��ȯ
	public List<Stopstation> availableEnd(Stopstation start_stopstation);	//���õ� ��߿� ���� ������ �ĺ��� Stopstation ��ü ��ȯ
	public List<Traintime> availableTrain(HashMap<String, String> map);		//��߿�, ������, ��� �ð��� �������� ž�� ������ ����, �ð� ��ȸ
	
}
