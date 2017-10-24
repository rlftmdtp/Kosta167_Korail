package partner.model;

import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import partner.mapper.PartnerMapper;

public class PartnerDao {
	private static PartnerDao dao = new PartnerDao();	

	public static PartnerDao getInstance() {
		return dao;
	}
	
	
	public SqlSessionFactory getSqlSessionFactory(){
		String resource = "mybatis-config.xml";
		InputStream in = null;
		try {
			in = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new SqlSessionFactoryBuilder().build(in);
	}
	
	
	public List<Member> calendar_search(HashMap<String, String> map){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Member> mem_list = null;
		
		try {
			mem_list = sqlSession.getMapper(PartnerMapper.class).calendar_search(map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
/*		System.out.println("cc: " + mem_list);*/
		return mem_list;
	}
	
	
	public List<Member> partner_allList(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Member> all_list = null;
		
		try {
			all_list = sqlSession.getMapper(PartnerMapper.class).partner_allList();
/*			System.out.println("�ٿ�" + all_list);*/
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return all_list;
	}
	
	
	
	
	
	
	
}