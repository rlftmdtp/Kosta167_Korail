package main.model;

import javax.servlet.http.HttpServletRequest;



public class MainService {
	private static MainService service = new MainService();
	private static MainDao dao;
	
	public static MainService getInstance(){
		dao = MainDao.getInstance();
		return service;
	}
	
	public Member login(HttpServletRequest request){

		Member member = new Member();
		
		member.setM_id(request.getParameter("id"));
		member.setM_pw(request.getParameter("pass"));
		
		return dao.login(member);
	}
}
