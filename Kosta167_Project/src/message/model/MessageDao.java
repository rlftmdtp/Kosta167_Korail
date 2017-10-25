package message.model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import message.mapper.MessageMapper;

public class MessageDao {
	private static MessageDao dao = new MessageDao();

	public static MessageDao getInstance() {
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

	public int selectMsg_no() {	/*쪽지번호*/
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			if (sqlSession.getMapper(MessageMapper.class).selectMsg_no() == null) {
				return 0;
			} else {
				return sqlSession.getMapper(MessageMapper.class).selectMsg_no();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			sqlSession.close();
		}
	}

	public int insertMessage(Message message) {	/*메세지 내용 삽입*/
		int re = -1;

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			re = sqlSession.getMapper(MessageMapper.class).insertMessage(message);

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

	public int checkId(String m_id) {			/*회원아이디 가져오기*/
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String msg_id = null;
		int re = -1;
		
		try {
			msg_id = sqlSession.getMapper(MessageMapper.class).checkId(m_id);
			
			if(msg_id == null){
				re = -1;
			}else{
				re = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			sqlSession.close();
		}
		return re;
	}

	public List<Message> msg_receive(String msg_sendid){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Message> list = null;
		
		try {
			list = sqlSession.getMapper(MessageMapper.class).msg_receive(msg_sendid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
		
	}
	
	public Message selectMessage(int msg_no){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Message message = null;
		
		try {
			message = sqlSession.getMapper(MessageMapper.class).selectMessage(msg_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return message;
		
	}
	
	public int selectMsg_hit(int msg_no){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			return sqlSession.getMapper(MessageMapper.class).selectMsg_hit(msg_no);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			sqlSession.close();
		}
	}
	
	public int updateHitcount(Message message){
		int re = -1;
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			re = sqlSession.getMapper(MessageMapper.class).updateHitcount(message);
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

	public void deleteMessage(int msg_no) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			sqlSession.getMapper(MessageMapper.class).deleteMessage(msg_no);
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			sqlSession.close();
		}
	}
	
	public Member login(Member member) {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Member dbMember = null;

		try {
			dbMember = sqlSession.getMapper(MessageMapper.class).login(member);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return dbMember;
	}
	
	/*public int countRecivemsg(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		try {
			re = sqlSession.getMapper(MessageMapper.class).countRecivemsg(new RowBounds(startRow, 10));
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
	}*/
}
