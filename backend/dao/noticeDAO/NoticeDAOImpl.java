package dao.noticeDAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;
import vo.NoticeVO;

public class NoticeDAOImpl implements INoticeDAO {
	private static INoticeDAO dao;
	
	private NoticeDAOImpl()	{}
	
	public static INoticeDAO getInstance() {
		if(dao == null) dao = new NoticeDAOImpl();
		return dao;
	}
	
	@Override
	public List<NoticeVO> listByPage(Map<String, Object> map) {
		SqlSession session = null;
		List<NoticeVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("notice.listByPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.selectOne("notice.totalCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.insert("notice.insertNotice", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.update("notice.updateNotice", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int deleteNotice(int noticeId) {
		SqlSession session = null;
		int res = 0;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.delete("notice.deleteNotice", noticeId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public NoticeVO selectNotice(int nId) {
		SqlSession session = null;
		NoticeVO vo = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("notice.selectNotice", nId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return vo;
	}

}
