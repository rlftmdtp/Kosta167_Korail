package review.model;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import review.model.Reply;
import review.model.ListModel;
import review.model.Search;
import review.model.Review;
import review.model.ImageUtil;

public class ReviewService {
	private static ReviewService service = new ReviewService();
	private static ReviewDao dao;
	private static final int PAGE_SIZE = 10; //페이지당 사이즈를 2로정했어요.

	public ReviewService() {
		
	}
	
	public static ReviewService getInstance() {
		dao = ReviewDao.getInstance();
		return service;
	}
	
	public int insertReviewService(HttpServletRequest request) throws Exception {
		Review review = new Review();

		/*HttpSession session = request.getSession();
		session.setAttribute("m_id", m_id);*/
		
		// 파일 업로드 (경로,크기 , 인코딩, 파일이름이 중첩되었을 때 정책)
		String uploadPath = request.getRealPath("upload");
		int size = 20 * 1024 * 1024; // 20MB

		// 파일 업로드 하기위한 라이브러리 객체 (cos.jar)
		// MultipartRequest 파일을 업로드 하기이한 request객체
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
				new DefaultFileRenamePolicy());
		// new DefaultFileRenamePolicy() 정책
		// 파일 이름이 겹칠 경우 뒤에 (숫자)를 받음
		
		review.setM_id(multi.getParameter("m_id"));
		review.setR_content(multi.getParameter("r_content"));
		review.setR_name(multi.getParameter("r_name"));
		review.setR_pw(multi.getParameter("r_pw"));
		review.setR_title(multi.getParameter("r_title"));
		
		review.setR_no(Integer.parseInt(multi.getParameter("r_no")));

		// 파일 업로드 시
		// api사용 => getFilesystemName 파일 이름을 가져옴
		if (multi.getFilesystemName("r_fname") != null) {
			String r_frame = multi.getFilesystemName("r_fname");
			review.setR_fname(r_frame);

			// 썸네일 이미지 생성(jpg, gif) aaa.gif => aaa_small.gif(썸네일 이미지)
			String pattern = r_frame.substring(r_frame.lastIndexOf(".") + 1); // 확장자만
																				// 뽑아줌
			String headName = r_frame.substring(0, r_frame.lastIndexOf("."));

			// 원본 파일 객체
			String imagePath = uploadPath + "\\" + r_frame;
			File src = new File(imagePath);

			// 썸네일 이미지 파일 객체
			String thumImagePath = uploadPath + "//" + headName + "_small." + pattern;
			File dest = new File(thumImagePath);

			if (pattern.equals("jpg") || pattern.equals("gif")) {
				ImageUtil.resize(src, dest, 100, ImageUtil.RATIO);
				// ImageUTil.RATIO 100의 크기만큼
			}
		} else {
			review.setR_fname("");
		}
		if (review.getR_no() != 0) {
			review.setR_no(dao.selectR_no() + 1);
		} else {// 원본글일때
			review.setR_no(dao.selectR_no() + 1);// 새로운 b_id
		}

		return dao.insertReview(review);
	}

	 public ListModel listReviewService(HttpServletRequest request , int requstPage) {
		Search search = new Search();
		
		HttpSession session = request.getSession();
		
		//새로운 검색 시도인가
		if(request.getParameter("temp") != null || request.getParameter("pageNum") == null){
			session.removeAttribute("search");
		}
		
		//처음 검색 시 
		if(request.getParameterValues("area") != null){
			
			search.setArea(request.getParameterValues("area"));
			search.setSearchKey("%" + request.getParameter("searchKey") + "%");
			session.setAttribute("search", search);
			
		}else if ((Search) session.getAttribute("search") != null){
			//검색 후 페이징을 클릭 시 session이 유지되어야 한다.
			search = (Search) session.getAttribute("search");
		}
		
		
		//페이지당 글 갯수, 글갯수 , 총페이지수, 시작페이지, 마지막페이지 ,현재페이지를 구할 수 있어야함
		
		//총 글개수 
		int totalCount = dao.countBoard(search);
		
		//총 페이지 수 
		int totalPageCount = totalCount / PAGE_SIZE ;
		
		if(totalCount % PAGE_SIZE > 0){
			totalPageCount ++;
		}
		
		//시작 페이지 , 마지막 페이지 => 클릭한 현재 페이지 기준
		//현재 페이지가 6이면 시작페이지는 5, 마지막 페이지는 10
		
		//시작 페이지  = 현재 페이지 - (현재페이지 - 1 ) % 한번에 볼 페이지 범위
		int startPage = requstPage - ( requstPage -1 )%5;
		int endPage = startPage + 4;
		
		if(endPage > totalPageCount){
			endPage = totalPageCount;
		}
		
		//전체의 list중에 startRow부터 볼 수 있게
		int startRow = (requstPage - 1) * PAGE_SIZE;
		
		List<Review> list = dao.listReview(startRow,search);
		
		//list.jsp로 글목록, 요청페이지, 페이지 총 수 , 시작페이지, 끝 페이지를 넘겨주기 위해 객체에 넣어서 반환
		return new ListModel(list, requstPage, totalPageCount, startPage, endPage);
	}

	public Review selectReviewService(int r_no) {
		Review review = dao.selectDetail(r_no); // r_no(콜라)라는 보내줄값을 review(커피)를
												// 통해 본낸다. 메서드(자판기)
		dao.updateHit(dao.selectDetail(r_no)); // 디테일을 눌렀을때 조회수가 증가한다.
		return review;
	}

	public int updateReviewService(Review review) {
		//System.out.println("수정");
		int re = dao.updateReview(review);
		return re;
	}

	public int deleteReviewService(int r_no) {
		//System.out.println("삭제" + r_no);

		return dao.deleteReview(r_no);
	}
	
	public int insertReplyService(Reply reply){
		System.out.println("댓글 입력");
		reply.setRe_no(dao.selectRe_no()+1);
		return dao.insertReply(reply);
	}
	
	public List<Reply> listReplyService(int r_no){
		return dao.listReply(r_no);
	}
	public void deleteBoardService(int r_no){
		dao.deleteReview(r_no);
	}
	
	
	
}













