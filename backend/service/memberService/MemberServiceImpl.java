package service.memberService;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;
import java.util.List;
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
	public String sendRandomMessage(String mem_tel) {
		NaverTelMessage message = new NaverTelMessage();
		Random random = new Random();
		String rannum= "";
		for(int i=0; i<6; i++) {
			rannum += Integer.toString(random.nextInt(9) + 1);
		}
		message.sendMessage(mem_tel, rannum);
		return rannum;
	}

	@Override
	public int memberTelCount(String mem_tel) {
		return dao.memberTelCount(mem_tel);
	}

	@Override
	public int incheck(String mem_id) {
		return dao.incheck(mem_id);
	}

	@Override
	public int nicknamecheck(String mem_nickname) {
		return dao.nicknamecheck(mem_nickname);
  }
  
	public int selectIsMember(String id) {
		// TODO Auto-generated method stub
		return dao.selectIsMember(id);
	}

	@Override
	public MemberVO selectMemberinfo(String mem_id) {
		// TODO Auto-generated method stub
		return dao.selectMemberinfo(mem_id);
	}

	@Override
	public MemberVO selectMemberinfoByNick(String nickname) {
		// TODO Auto-generated method stub
		return dao.selectMemberinfoByNick(nickname);
	}

}
