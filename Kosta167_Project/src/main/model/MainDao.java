package main.model;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import main.mapper.MainMapper;


public class MainDao {
	private static MainDao dao = new MainDao();

	public static MainDao getInstance() {
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
	
	public Member login(Member member) {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Member dbMember = null;

		try {
			dbMember = sqlSession.getMapper(MainMapper.class).login(member);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return dbMember;
	}
}
