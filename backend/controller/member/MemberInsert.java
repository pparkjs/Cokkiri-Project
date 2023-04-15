package controller.member;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import vo.MemberVO;

@WebServlet("/memberInsert.do")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String repass = request.getParameter("repass");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		String bir = year+month+day;
		
		String gender = request.getParameter("gender");
		String nickname = request.getParameter("nickname");
		String auth = "N";
		
		
		MemberVO memVo = new MemberVO();
	
		// 입력받은 회원정보를 Vo 객체에 저장
		memVo.setMem_id(id);
		memVo.setMem_pw(repass);
		memVo.setMem_name(name);
		memVo.setMem_tel(tel);
		memVo.setMem_mail(email);
		memVo.setMem_add(addr);
		memVo.setMem_bir(bir);
		memVo.setMem_gend(gender);
		memVo.setMem_nickname(nickname);
		memVo.setAdmin_auth(auth);
		
		IMemberService service = MemberServiceImpl.getInstance();
		int joinResult = service.memberInsert(memVo);
		String result = null;
		if(joinResult==1) {
			// 회원가입을 성공했다면
			// 쿠키에 아이디 저장
			Cookie cookie = new Cookie("joinId", id);
			if(memVo.getAdmin_auth().equals("N")) {
				// 일반 회원일 경우
				response.sendRedirect(request.getContextPath() + "/login/login.jsp");
			} else {
				// 관리자일 경우
			}
			
		} else {
			result = "false";
		}
	}
	

}
