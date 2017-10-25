package partner.model;

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
	      if(request.getParameter("map") != null){
	         // ������ �˻��ߴ� ���� ����
	         session.removeAttribute("map");
	      }
	     return dao.calendar_search((HashMap<String, String>)request.getAttribute("map"));
	 }
	 
	 
	 public List<Member> listSearchService(HttpServletRequest request){
		 Search search = new Search();
		 
		 if(request.getParameter("Partner_search") != null){
			 search.setPartner_search("%" + request.getParameter("Partner_search")+"%");
	     }
		 System.out.println("����111"+search.getPartner_search());
		 return dao.listSearch(search);
	 }
	 
	 public List<Member> partner_allListService(){
/*		 System.out.println("���� : "+dao.partner_allList());*/
		 
		 return dao.partner_allList();
	 }
	 
	 
	 
	 
	 
}
