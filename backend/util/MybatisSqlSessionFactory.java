package util;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * myBatis의 환경 설정 파일(mybatis-config.xml) 을 읽어와서 실행하고
 * SqlSession 객체를 반환하는 메서드를 갖는 클래스
 * @author 박정수
 *
 */
public class MybatisSqlSessionFactory {
	private static SqlSessionFactory sqlSessionFactory = null;
	
	static {
		Reader rd = null;
		try {
			rd = Resources.getResourceAsReader("config/mybatis-config.xml");
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(rd);
		} catch (Exception e) {
			System.out.println("myBatis 초기화 실패!");
			e.printStackTrace();
		}finally {
			if(rd!=null)try { rd.close(); }catch(IOException e) {}
		}
	}
	
	/**
	 * SqlSessionFactory객체를 이용하여 SQL문을 처리할 SqlSession객체를 반환하는 메서드
	 * 
	 * @return SqlSession객체
	 */
	public static SqlSession getSqlSession() {
		SqlSession session = sqlSessionFactory.openSession();
		return session;
	}
}