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
	 
	 // (startDate : 출발날짜+시간) + (endDate : 도착날짜+시간)선택 후 일치하는 동반자의 아이디 이름 나이 성별 검색
	 public List<Member> calendar_searchService(HttpServletRequest request){

	      HttpSession session = request.getSession();
	      
	      // 새로운 검색 시도를 했나? -> temp값이 넘어옴
/*	      if(request.getParameter("map") != null){
	         // 기존에 검색했던 값을 지움
	         session.removeAttribute("map");
	      }*/
	     return dao.calendar_search((HashMap<String, String>)request.getAttribute("map"));
	 }
	 
	 public List<Member> partner_allListService(){
/*		 System.out.println("서비스 : "+dao.partner_allList());*/
		 
		 return dao.partner_allList();
	 }
	 
	 
	 
	 // (지역 선택  + 역 선택) => 선택 후 일치하는 동반자의 아이디 이름 나이 성별... 검색
	 public List<Member> station_searchService(HttpServletRequest request){
		 HttpSession session = request.getSession();
		 
	      // 새로운 검색 시도를 했나? -> temp값이 넘어옴
	      if(request.getParameter("station_map") != null){
	         // 기존에 검색했던 값을 지움
	         session.removeAttribute("station_map");
	      }
	     return dao.station_search((HashMap<String, String>)request.getAttribute("station_map"));
	 }
	 
	 
	 
}
