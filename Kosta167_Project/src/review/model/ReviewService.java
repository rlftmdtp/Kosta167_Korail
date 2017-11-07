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
import review.model.Re_Search;
import review.model.Review;
import review.model.ImageUtil;

public class ReviewService {
	private static ReviewService service = new ReviewService();
	private static ReviewDao dao;
	private static final int PAGE_SIZE = 10; //�럹�씠吏��떦 �궗�씠利덈�� 2濡쒖젙�뻽�뼱�슂.

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
		
		// �뙆�씪 �뾽濡쒕뱶 (寃쎈줈,�겕湲� , �씤肄붾뵫, �뙆�씪�씠由꾩씠 以묒꺽�릺�뿀�쓣 �븣 �젙梨�)
		String uploadPath = request.getRealPath("upload");
		int size = 20 * 1024 * 1024; // 20MB

		// �뙆�씪 �뾽濡쒕뱶 �븯湲곗쐞�븳 �씪�씠釉뚮윭由� 媛앹껜 (cos.jar)
		// MultipartRequest �뙆�씪�쓣 �뾽濡쒕뱶 �븯湲곗씠�븳 request媛앹껜
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
				new DefaultFileRenamePolicy());
		// new DefaultFileRenamePolicy() �젙梨�
		// �뙆�씪 �씠由꾩씠 寃뱀튌 寃쎌슦 �뮘�뿉 (�닽�옄)瑜� 諛쏆쓬
		int r_no = dao.selectR_no()+1;
		
		review.setM_id(multi.getParameter("m_id"));
		review.setR_content(multi.getParameter("r_content"));
		review.setR_name(multi.getParameter("r_name"));
		review.setR_pw(multi.getParameter("r_pw"));
		review.setR_title(multi.getParameter("r_title"));
		
		review.setR_no(r_no);

		// �뙆�씪 �뾽濡쒕뱶 �떆
		// api�궗�슜 => getFilesystemName �뙆�씪 �씠由꾩쓣 媛��졇�샂
		if (multi.getFilesystemName("r_fname") != null) {
			String r_frame = multi.getFilesystemName("r_fname");
			review.setR_fname(r_frame);

			// �뜽�꽕�씪 �씠誘몄� �깮�꽦(jpg, gif) aaa.gif => aaa_small.gif(�뜽�꽕�씪 �씠誘몄�)
			String pattern = r_frame.substring(r_frame.lastIndexOf(".") + 1); // �솗�옣�옄留�
																				// 戮묒븘以�
			String headName = r_frame.substring(0, r_frame.lastIndexOf("."));

			// �썝蹂� �뙆�씪 媛앹껜
			String imagePath = uploadPath + "\\" + r_frame;
			File src = new File(imagePath);

			// �뜽�꽕�씪 �씠誘몄� �뙆�씪 媛앹껜
			String thumImagePath = uploadPath + "//" + headName + "_small." + pattern;
			File dest = new File(thumImagePath);

			if (pattern.equals("jpg") || pattern.equals("gif")) {
				ImageUtil.resize(src, dest, 100, ImageUtil.RATIO);
				// ImageUTil.RATIO 100�쓽 �겕湲곕쭔�겮
			}
		} else {
			review.setR_fname("");
		}
		if (review.getR_no() != 0) {
			review.setR_no(dao.selectR_no() + 1);
		} else {// �썝蹂멸��씪�븣
			review.setR_no(dao.selectR_no() + 1);// �깉濡쒖슫 b_id
		}

		return dao.insertReview(review);
	}

	 public ListModel listReviewService(HttpServletRequest request , int requstPage) {
		Re_Search search = new Re_Search();
		
		HttpSession session = request.getSession();
		
		//�깉濡쒖슫 寃��깋 �떆�룄�씤媛�
		if(request.getParameter("temp") != null || request.getParameter("pageNum") == null){
			session.removeAttribute("search");
		}
		
		//泥섏쓬 寃��깋 �떆 
		if(request.getParameterValues("area") != null){
			
			search.setArea(request.getParameterValues("area"));
			search.setSearchKey("%" + request.getParameter("searchKey") + "%");
			session.setAttribute("search", search);
			
		}else if ((Re_Search) session.getAttribute("search") != null){
			//寃��깋 �썑 �럹�씠吏뺤쓣 �겢由� �떆 session�씠 �쑀吏��릺�뼱�빞 �븳�떎.
			search = (Re_Search) session.getAttribute("search");
		}
		
		
		//�럹�씠吏��떦 湲� 媛��닔, 湲�媛��닔 , 珥앺럹�씠吏��닔, �떆�옉�럹�씠吏�, 留덉�留됲럹�씠吏� ,�쁽�옱�럹�씠吏�瑜� 援ы븷 �닔 �엳�뼱�빞�븿
		
		//珥� 湲�媛쒖닔 
		int totalCount = dao.countBoard(search);
		
		//珥� �럹�씠吏� �닔 
		int totalPageCount = totalCount / PAGE_SIZE ;
		
		if(totalCount % PAGE_SIZE > 0){
			totalPageCount ++;
		}
		
		//�떆�옉 �럹�씠吏� , 留덉�留� �럹�씠吏� => �겢由��븳 �쁽�옱 �럹�씠吏� 湲곗�
		//�쁽�옱 �럹�씠吏�媛� 6�씠硫� �떆�옉�럹�씠吏��뒗 5, 留덉�留� �럹�씠吏��뒗 10
		
		//�떆�옉 �럹�씠吏�  = �쁽�옱 �럹�씠吏� - (�쁽�옱�럹�씠吏� - 1 ) % �븳踰덉뿉 蹂� �럹�씠吏� 踰붿쐞
		int startPage = requstPage - ( requstPage -1 )%5;
		int endPage = startPage + 4;
		
		if(endPage > totalPageCount){
			endPage = totalPageCount;
		}
		
		//�쟾泥댁쓽 list以묒뿉 startRow遺��꽣 蹂� �닔 �엳寃�
		int startRow = (requstPage - 1) * PAGE_SIZE;
		
		List<Review> list = dao.listReview(startRow,search);
		
		//list.jsp濡� 湲�紐⑸줉, �슂泥��럹�씠吏�, �럹�씠吏� 珥� �닔 , �떆�옉�럹�씠吏�, �걹 �럹�씠吏�瑜� �꽆寃⑥＜湲� �쐞�빐 媛앹껜�뿉 �꽔�뼱�꽌 諛섑솚
		return new ListModel(list, requstPage, totalPageCount, startPage, endPage);
	}

	public Review selectReviewService(int r_no) {
		Review review = dao.selectDetail(r_no); // r_no(肄쒕씪)�씪�뒗 蹂대궡以꾧컪�쓣 review(而ㅽ뵾)瑜�
												// �넻�빐 蹂몃궦�떎. 硫붿꽌�뱶(�옄�뙋湲�)
		dao.updateHit(dao.selectDetail(r_no)); // �뵒�뀒�씪�쓣 �닃���쓣�븣 議고쉶�닔媛� 利앷��븳�떎.
		return review;
	}

	public int updateReviewService(Review review) {
		//System.out.println("�닔�젙");
		int re = dao.updateReview(review);
		return re;
	}

	public int deleteReviewService(int r_no) {
		//System.out.println("�궘�젣" + r_no);

		return dao.deleteReview(r_no);
	}
	
	public int insertReplyService(Reply reply){
		System.out.println("�뙎湲� �엯�젰");
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













