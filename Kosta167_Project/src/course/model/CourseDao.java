package course.model;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import course.mapper.CourseMapper;
import main.model.Member;

public class CourseDao {
	private static CourseDao dao = new CourseDao();

	public static CourseDao getInstance() {
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

	public int selectC_id(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			if(sqlSession.getMapper(CourseMapper.class).selectC_id() == null){
				return 0;
			}
			else{
				return sqlSession.getMapper(CourseMapper.class).selectC_id();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return 0;
	}
	
	public int selectCd_id(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			if(sqlSession.getMapper(CourseMapper.class).selectCd_id() == null){
				return 0;
			}
			else{
				return sqlSession.getMapper(CourseMapper.class).selectCd_id();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return 0;
	}
	
	public int insertCourse(Course course){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		
		try {
			re = sqlSession.getMapper(CourseMapper.class).insertCourse(course);
			
			if(re > 0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re;
	}

	public IssueStation getIssueStation(String issueStaion) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		IssueStation station = null;

		try {
			station = sqlSession.getMapper(CourseMapper.class).getIssueStation(issueStaion);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return station;
	}

	public Member login(Member member) {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Member dbMember = null;

		try {
			dbMember = sqlSession.getMapper(CourseMapper.class).login(member);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return dbMember;
	}
	
	public String select_tt_id(String tr_id,String ss_id){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String tt_id = null;
		HashMap<String, String> map = new HashMap<String, String>();
	    map.put("tr_id", tr_id);
	    map.put("ss_id", ss_id);

		try {
			tt_id = sqlSession.getMapper(CourseMapper.class).select_tt_id(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return tt_id;
	}
	
	public int insertCourseDetail(CourseDetail courseDetail){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		try {
			re = sqlSession.getMapper(CourseMapper.class).insertCourseDetail(courseDetail);
			
			if(re > 0){
				sqlSession.commit();
			}else{
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re;
	}
	
	// 윤주 누나 코드
	public List<String> startList() {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<String> list = null;

		try {
			list = sqlSession.getMapper(CourseMapper.class).startList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return list;
	}


	
	
	
	public List<Stopstation> availableStart(String s_station){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Stopstation> availableStart = null;

		try {
			availableStart = sqlSession.getMapper(CourseMapper.class).availableStart(s_station);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return availableStart;
		
	}
	
	
	public List<Stopstation> availableEnd(Stopstation start_stopstation){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Stopstation> list=null;

		try {
			list = sqlSession.getMapper(CourseMapper.class).availableEnd(start_stopstation);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return list;
		
	}

	public List<Traintime> availableTrain(HashMap<String, String> map){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Traintime> availableTrain = null;

		try {
			availableTrain = sqlSession.getMapper(CourseMapper.class).availableTrain(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return availableTrain;
	}
}
