package service.headerService;

import java.util.List;

import vo.AlarmVO;

public interface IHeaderService {
	public List<AlarmVO> selectChatAlarm(String mem_id);
}
