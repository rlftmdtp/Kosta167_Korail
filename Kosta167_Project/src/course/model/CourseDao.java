package course.model;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import course.mapper.CourseMapper;

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
