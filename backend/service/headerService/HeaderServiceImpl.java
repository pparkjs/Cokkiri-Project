package service.headerService;

import java.util.List;

import dao.headerDAO.HeaderDaoImpl;
import dao.headerDAO.IHeaderDao;
import vo.AlarmVO;

public class HeaderServiceImpl implements IHeaderService {
	
	private static IHeaderService service;
	private static IHeaderDao dao;
	
	private HeaderServiceImpl() {
		dao = HeaderDaoImpl.getInstance();
	}
	
	public static IHeaderService getInstance() {
		if(service==null) {
			service = new HeaderServiceImpl();
		}
		return service;
	}
	
	
	@Override
	public List<AlarmVO> selectChatAlarm(String mem_id) {
		// TODO Auto-generated method stub
		return dao.selectChatAlarm(mem_id);
	}

}
