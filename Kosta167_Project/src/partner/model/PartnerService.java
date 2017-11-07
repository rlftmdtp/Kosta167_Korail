package partner.model;


import java.security.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import main.model.Member;

public class PartnerService {
	 private static PartnerService service = new PartnerService();
	 private static PartnerDao dao;
	   
	 public static PartnerService getInstance(){
	    dao = PartnerDao.getInstance();
	    return service;
	 }
	 
	 // (startDate : 異쒕컻�궇吏�+�떆媛�) + (endDate : �룄李⑸궇吏�+�떆媛�)�꽑�깮 �썑 �씪移섑븯�뒗 �룞諛섏옄�쓽 �븘�씠�뵒 �씠由� �굹�씠 �꽦蹂� 寃��깋
	 public List<Member> calendar_searchService(HttpServletRequest request){


	      HttpSession session = request.getSession();
	      
	      // �깉濡쒖슫 寃��깋 �떆�룄瑜� �뻽�굹? -> temp媛믪씠 �꽆�뼱�샂
        if(request.getParameter("map") != null){

	         // 湲곗〈�뿉 寃��깋�뻽�뜕 媛믪쓣 吏���
	         session.removeAttribute("map");
	      }
	     return dao.calendar_search((HashMap<String, String>)request.getAttribute("map"));
	 }
	 

	 public List<Member> partner_allListService(){
/*		 System.out.println("�꽌鍮꾩뒪 : "+dao.partner_allList());*/
		 
		 return dao.partner_allList();
	 }
	 
	 
	 //�넄
	 public List<Member> listSearchService(HttpServletRequest request){
		 Search search = new Search();
		 HttpSession session = request.getSession();
		 if(request.getParameter("Partner_search") != null){
			 session.removeAttribute("Partner_search");
			 search.setPartner_search("%" + request.getParameter("Partner_search")+"%");
	     }
		 //System.out.println("�꽌鍮꾩뒪111"+search.getPartner_search());
		 return dao.listSearch(search);
	 }
	 
 
	 
	 // (吏��뿭 �꽑�깮  + �뿭 �꽑�깮) => �꽑�깮 �썑 �씪移섑븯�뒗 �룞諛섏옄�쓽 �븘�씠�뵒 �씠由� �굹�씠 �꽦蹂�... 寃��깋
	 public List<Member> station_searchService(HttpServletRequest request){
		 HttpSession session = request.getSession();
		 
	      // �깉濡쒖슫 寃��깋 �떆�룄瑜� �뻽�굹? -> temp媛믪씠 �꽆�뼱�샂
	      if(request.getParameter("station_map") != null){
	         // 湲곗〈�뿉 寃��깋�뻽�뜕 媛믪쓣 吏���
	         session.removeAttribute("station_map");
	      }
	     return dao.station_search((HashMap<String, String>)request.getAttribute("station_map"));
	 }
	 

	 
	 
}
