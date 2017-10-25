package review.model;

import java.io.InputStream;
import java.util.List;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import review.model.Reply;
import review.model.Re_Search;
import review.mapper.ReviewMapper;
import review.model.Review;
import review.model.ReviewDao;

public class ReviewDao {
	private static ReviewDao dao = new ReviewDao();

	public static ReviewDao getInstance() {
		return dao;
	}

	public SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis-config.xml";
		InputStream in = null;
		try {
			in = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(in);
	}

	public int selectR_no() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			if (sqlSession.getMapper(ReviewMapper.class).selectR_no() == null) {
				return 0;
			} else {
				return sqlSession.getMapper(ReviewMapper.class).selectR_no();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			sqlSession.close();
		}
	}

	public int insertReview(Review review) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ReviewMapper.class).insertReview(review);
			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re;
	}

	public List<Review> listReview(int startRow , Re_Search search) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Review> list = null;

		try {
			list = sqlSession.getMapper(ReviewMapper.class).listReview(new RowBounds(startRow,10),search);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return list;

	}

	public Review selectReview(int r_no) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Review review = null;

		try {
			review = sqlSession.getMapper(ReviewMapper.class).selectReview(r_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return review;
	}

	public int updateHit(Review review) {
		int re = -1;
		review.setR_hit(review.getR_hit()+1);
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ReviewMapper.class).updateHit(review);
			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re;
	}

	public Review selectDetail(int r_no) { // r_no라는 보낼것을 파라미터로받는다(조작가능한것). 그것을
											// Review 객체에 보낸다.
		SqlSession sqlSession = getSqlSessionFactory().openSession(); // sql문에
																		// 보내주는거
																		// 공장을
																		// 연다는뜻이다.
		Review review = null; // Review객체에 review를 null값을 주고
		try {
			review = sqlSession.getMapper(ReviewMapper.class).selectDetail(r_no); // review에
																					// sql에
																					// 보낸
																					// 맵퍼클래스안의
																					// r_no를
																					// 가진
																					// detail메서드를
																					// 보낸다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close(); // 공장을 닫는다.
		}
		return review;

	}

	public int updateReview(Review review) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			re = sqlSession.getMapper(ReviewMapper.class).updateReview(review);

			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return re;
	}
	
	public int countBoard(Re_Search search){
		SqlSession sqlSession =getSqlSessionFactory().openSession();
		int re  = -1;
		try {

			re = sqlSession.getMapper(ReviewMapper.class).countReview(search);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return re;
	}

	public int deleteReview(int r_no) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			System.out.println(r_no + "DAO");
			  sqlSession.getMapper(ReviewMapper.class).deleteReply(r_no);
			re = sqlSession.getMapper(ReviewMapper.class).deleteReview(r_no);
			if (re > 0) {
				sqlSession.commit();
				return re;

			} else {
				sqlSession.rollback();
				return re;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re;

	}
	
	public int selectRe_no(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			if(sqlSession.getMapper(ReviewMapper.class).selectRe_no()==null){
				return 0;
			}else{
				return sqlSession.getMapper(ReviewMapper.class).selectRe_no();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally{
			sqlSession.close();
		}
	}

	public int insertReply(Reply reply){
		int re=-1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			re=sqlSession.getMapper(ReviewMapper.class).insertReply(reply);
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			System.out.println(re);
			sqlSession.close();
		}
		return re;
	}
	public List<Reply> listReply(int r_no){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Reply> list = null;
		
		try {
			list = sqlSession.getMapper(ReviewMapper.class).listReply(r_no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	

}







