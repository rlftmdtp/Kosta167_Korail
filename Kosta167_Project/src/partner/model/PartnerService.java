package partner.model;

import java.security.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class PartnerService {
	 private static PartnerService service = new PartnerService();
	 private static PartnerDao dao;
	   
	 public static PartnerService getInstance(){
	    dao = PartnerDao.getInstance();
	    return service;
	 }
	 
	 // (startDate : ��߳�¥+�ð�) + (endDate : ������¥+�ð�)���� �� ��ġ�ϴ� �������� ���̵� �̸� ���� ���� �˻�
	 public List<Member> calendar_searchService(HttpServletRequest request){

	      HttpSession session = request.getSession();
	      
	      // ���ο� �˻� �õ��� �߳�? -> temp���� �Ѿ��
/*	      if(request.getParameter("map") != null){
	         // ������ �˻��ߴ� ���� ����
	         session.removeAttribute("map");
	      }*/
	     return dao.calendar_search((HashMap<String, String>)request.getAttribute("map"));
	 }
	 
	 public List<Member> partner_allListService(){
/*		 System.out.println("���� : "+dao.partner_allList());*/
		 
		 return dao.partner_allList();
	 }
	 
	 
	 
	 // (���� ����  + �� ����) => ���� �� ��ġ�ϴ� �������� ���̵� �̸� ���� ����... �˻�
	 public List<Member> station_searchService(HttpServletRequest request){
		 HttpSession session = request.getSession();
		 
	      // ���ο� �˻� �õ��� �߳�? -> temp���� �Ѿ��
	      if(request.getParameter("station_map") != null){
	         // ������ �˻��ߴ� ���� ����
	         session.removeAttribute("station_map");
	      }
	     return dao.station_search((HashMap<String, String>)request.getAttribute("station_map"));
	 }
	 
	 
	 
}
