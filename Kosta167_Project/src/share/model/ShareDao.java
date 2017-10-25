package share.model;

import java.io.InputStream;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import share.mapper.ShareMapper;

public class ShareDao {
	private static ShareDao dao = new ShareDao();

	public static ShareDao getInstence() {
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

	public int selectSh_no() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			if (sqlSession.getMapper(ShareMapper.class).selectSh_no() == null) {
				return 0;
			} else {
				return sqlSession.getMapper(ShareMapper.class).selectSh_no();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			sqlSession.close();
		}
		
	}

	public int insertShare(Share share) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ShareMapper.class).insertShare(share);
			
			if (re > 0) {
				sqlSession.commit();
			}
			else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();

		}
		return re;
		}
	
	public Member login(Member member) {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Member dbMember = null;

		try {
			dbMember = sqlSession.getMapper(ShareMapper.class).login(member);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return dbMember;
	}
	
	public List<Share> listShare (int startRow , ShareSearch shareSearch){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Share> list = null;
		try {
			list = sqlSession.getMapper(ShareMapper.class).listShare(new RowBounds(startRow,5),shareSearch);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return list;
	}
	
	
	public Share selectShare(int sh_no){
		Share share = null;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			share = sqlSession.getMapper(ShareMapper.class).selectShare(sh_no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return share;
	}
	
	/*조회수*/
	public int updateShareHit (int sh_no){
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ShareMapper.class).updateShareHit(sh_no);
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return re;
	}
	
	public int updateShare (Share share){
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ShareMapper.class).updateShare(share);
			if(re > 0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return re;
	}
	
	/*페이징 처리*/
	public int countBoard(ShareSearch shareSearch){
		int re=-1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			/*글갯수 알아보기*/
			re= sqlSession.getMapper(ShareMapper.class).countBoard(shareSearch);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		return re;
	}
	
	public void deleteShare(int sh_no){
		int re=-1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re=sqlSession.getMapper(ShareMapper.class).deleteShare(sh_no);
			if(re>0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
	
	}
	
	
	public int selectSr_no() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			if (sqlSession.getMapper(ShareMapper.class).selectSh_no() == null) {
				return 0;
			} else {
				return sqlSession.getMapper(ShareMapper.class).selectSr_no();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			sqlSession.close();
		}
		
	}
	
	/*리플 추가*/
	public int insertReply(ShareReply sharereply) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ShareMapper.class).insertReply(sharereply);
			System.out.println(re);
			
			if (re > 0) {
				sqlSession.commit();
				System.out.println(re);
			}
			else{
				sqlSession.rollback();
				System.out.println(re);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();

		}
		return re;
	}

	/*리플출력*/

	public List<ShareReply> listShareReply(int sh_no){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<ShareReply> replylist = null;
		try {
			replylist = sqlSession.getMapper(ShareMapper.class).listshareReply(sh_no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return replylist;
	}
	
	
}

