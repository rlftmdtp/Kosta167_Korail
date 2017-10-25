package review.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import review.model.Re_Search;
import review.model.Reply;
import review.model.Review;

public interface ReviewMapper {
	public int insertReview(Review review);
	public Integer selectR_no();
	public List<Review> listReview(RowBounds row, Re_Search search);
	public Review selectReview(int r_no);
	public int updateHit(Review review);
	public Review selectDetail(int r_no);
	public int updateReview(Review review); //리뷰객체의 리뷰를 int형으로 보내겠다.//민식쓰 한번더 물어보기 update이기때문에 int형으로 반황
	public int deleteReview(int r_no);
	public int countReview(Re_Search search);
	public Integer selectRe_no();
	public int insertReply(Reply reply);
    public List<Reply> listReply(int r_no);
    public int deleteReply(int r_no);
}
