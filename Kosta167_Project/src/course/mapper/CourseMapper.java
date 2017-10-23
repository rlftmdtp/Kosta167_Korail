package course.mapper;

import java.util.HashMap;
import java.util.List;

import course.model.Stopstation;
import course.model.Traintime;

public interface CourseMapper {
	public List<String> startList();	//��ü ��(=��߿� �̸�) ����Ʈ �ҷ�����
	
	public List<Stopstation> availableStart(String s_station);	//ss_name�� ������ ��߿� �̸��� ���� Stopstation ��ü ��ȯ
	public List<Stopstation> availableEnd(Stopstation start_stopstation);	//���õ� ��߿� ���� ������ �ĺ��� Stopstation ��ü ��ȯ

	public List<Traintime> availableTrain(HashMap<String, String> map);		//��߿�, ������, ��� �ð��� �������� ž�� ������ ����, �ð� ��ȸ
	

}
