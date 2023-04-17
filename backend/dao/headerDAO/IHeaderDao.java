package dao.headerDAO;

import java.util.List;

import vo.AlarmVO;

public interface IHeaderDao {
	public List<AlarmVO> selectChatAlarm(String mem_id);
}
