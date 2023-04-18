package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import vo.MemberVO;

@WebServlet("/memberLogin.do")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String idmemory = request.getParameter("idmemory");
		
		// checkbox가 체크되어 있을 경우 쿠키저장, 해제된 생태이면 쿠키 삭제
		// 회원가입시 저장된 쿠키 : joinId
		Cookie[] cookieArr = request.getCookies();
		if(idmemory == null) {
			for(Cookie cookie : cookieArr) {
				String name = cookie.getName();
				if("id".equals(name)) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		} else {
			// 체크박스가 체크되어있을 경우 아이디 쿠키에 저장
			Cookie cookie = new Cookie("id", id);
			response.addCookie(cookie);
		}
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		MemberVO memVo = new MemberVO();
		memVo.setMem_id(id);
		memVo.setMem_pw(pw);
		int idPassCheck = service.selectIdPassCheck(memVo);
		MemberVO memberVo = service.selectMemberById(id);
		String result = "";
		if(idPassCheck == 1) {
			request.getSession().setAttribute("memberVo", memberVo);
			result = memberVo.getAdmin_auth();
			
		}else {
			result = "false";
		}
		request.setAttribute("result", result);
		System.out.println("result"+ result);
		request.getRequestDispatcher("/view/member/loginResult.jsp").forward(request, response);
		
		
		
	}

}
