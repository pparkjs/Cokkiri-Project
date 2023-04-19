package service.memberService;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.memberDAO.IMemberDAO;
import dao.memberDAO.MemberDAOImpl;
import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.producer.NumbersAnswerProducer;
import util.NaverTelMessage;
import util.SetTextProducer;
import vo.MemberVO;
import vo.PageVO;

public class MemberServiceImpl implements IMemberService {
	private IMemberDAO dao;
	private static IMemberService service;
	
	private MemberServiceImpl() {
		dao = MemberDAOImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public List<MemberVO> memberAllList() {
		return dao.memberAllList();
	}

	@Override
	public int memberInsert(MemberVO memVo) {
		return dao.memberInsert(memVo);
	}

	@Override
	public String sendRandomMessage(String memTel) {
		NaverTelMessage message = new NaverTelMessage();
		Random random = new Random();
		String rannum= "";
		for(int i=0; i<6; i++) {
			rannum += Integer.toString(random.nextInt(9) + 1);
		}
		message.sendMessage(memTel, rannum);
		return rannum;
	}

	@Override
	public int memberTelCount(String memTel) {
		return dao.memberTelCount(memTel);
	}

	@Override
	public int incheck(String memId) {
		return dao.incheck(memId);
	}

	@Override
	public int nicknamecheck(String memNickname) {
		return dao.nicknamecheck(memNickname);
  }
  
	public int selectIsMember(String id) {
		// TODO Auto-generated method stub
		return dao.selectIsMember(id);
	}

	@Override
	public MemberVO selectMemberinfo(String memId) {
		// TODO Auto-generated method stub
		return dao.selectMemberinfo(memId);
	}

	@Override
	public MemberVO selectMemberinfoByNick(String nickname) {
		// TODO Auto-generated method stub
		return dao.selectMemberinfoByNick(nickname);
	}

	@Override
	public int selectIdPassCheck(MemberVO memVo) {
		return dao.selectIdPassCheck(memVo);
	}

	@Override
	public MemberVO selectMemberById(String memId) {
		return dao.selectMemberById(memId);
	}

	@Override
	public PageVO pageInfo(int page, String stext) {
		Map<String, Object> map = new HashMap<>();
		map.put("stext", stext);
		
		int count = this.totalCount(map); // 전체 게시글 갯수 구하기
		
		// 전체 페이지 수 구하기
		int totalPage = (int)Math.ceil((double)count / PageVO.getPerList());
		
		//start, end구하기 해당 페이지당 8개 게시글
		int start = (page-1) * PageVO.getPerList() + 1; // 1, 9, 17
		int end = start + PageVO.getPerList() - 1; //8, 16, 24
		
		// end가 최대 개수보다 클때 거름
		if(end > count) end = count;
		
		//시작페이지와 끝페이지
		int perPage = PageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		
		// endPage가 전체 페이지보다 클경우 거름
		if(endPage > totalPage) endPage = totalPage;
		
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		return vo;
	}

	@Override
	public List<MemberVO> listByPage(Map<String, Object> map) {
		return dao.listByPage(map);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
  }
  
	public String selectMemberIdByTelAndName(MemberVO memVo) {
		return dao.selectMemberIdByTelAndName(memVo);
	}

	@Override
	public int updateMemberPw(MemberVO memVo) {
		return dao.updateMemberPw(memVo);
	}

	@Override
	public int updatemember(MemberVO memVo) {
		return dao.updatemember(memVo);
	}

}
