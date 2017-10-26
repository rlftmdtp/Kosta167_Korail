package share.model;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import main.model.Member;
import share.model.ListModel;



public class ShareService {
	private static ShareService service = new ShareService();
	private static ShareDao dao;
	private static final int PAGE_SIZE = 5;
	
	public static ShareService getInstance(){
		dao=ShareDao.getInstence();
		return service;
	}
	public int insertShareService(Share share){
		share.setSh_no(dao.selectSh_no()+1);
		share.setC_id("");
		
		share.setM_id("");
		
		return dao.insertShare(share);
	}
	
	//로그인
	public Member login(HttpServletRequest request){

		Member member = new Member();
		
		member.setM_id(request.getParameter("id"));
		member.setM_pw(request.getParameter("pass"));
		
		return dao.login(member);
	}
	
	
	public ListModel listShareService(HttpServletRequest request, int requestPage){
		ShareSearch shareSearch = new ShareSearch();
		
		HttpSession session = request.getSession();
		
		/*새로운 검색 시도*/
		if(request.getParameter("temp") != null || request.getParameter("pageNum")==null){
			session.removeAttribute("shareSearch");
		}
		
		/*검색*/
		if(request.getParameter("area") != null){
			shareSearch.setArea(request.getParameterValues("area"));
			shareSearch.setSearchKey("%" + request.getParameter("searchKey") + "%");
			session.setAttribute("shareSearch", shareSearch);
			
		}else if((ShareSearch) session.getAttribute("shareSearch") != null){
			shareSearch = (ShareSearch) session.getAttribute("shareSearch");
		}
		
		
		int totalCount = dao.countBoard(shareSearch);
		int totalPageCount = totalCount/PAGE_SIZE;
		
		/*나머지가 0보다 크다면 페이지 추가*/
		if(totalCount%PAGE_SIZE >0){
			totalPageCount++;
		}
		int startPage = requestPage - (requestPage-1)%5;
		int endPage = startPage+4;
		if(endPage > totalPageCount){
			endPage=totalPageCount;

		}
		
		int startRow = (requestPage -1)*PAGE_SIZE;
		
		
		
		List<Share> list = dao.listShare(startRow, shareSearch);
		
		return new ListModel(list, requestPage, totalPageCount, startPage, endPage);
	}
	
	public Share selectShareService(int sh_no, boolean bool){
		if(bool){
			dao.updateShareHit(sh_no);	
		}
		
		return dao.selectShare(sh_no);
	}
	
	public void deleteShareService(int sh_no){
		
		dao.deleteShare(sh_no);
	}
	
	public int updateShareService(Share share){
		int re = dao.updateShare(share);
		return re;
	}
	
	//리플 생성
	public int insertReplyService (ShareReply sharereply){
		sharereply.setSr_no(dao.selectSr_no()+1);
		
		return dao.insertReply(sharereply);
	}
	
	public List<ShareReply> listShareReplyService(int sh_no){
		return dao.listShareReply(sh_no);
	}
	
	
}
