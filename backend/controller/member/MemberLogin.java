package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		MemberVO memVo = new MemberVO();
		memVo.setMem_id(id);
		memVo.setMem_pw(pw);
		
		int idPassCheck = service.selectIdPassCheck(memVo);
		String auth = service.selectAuth(id);
		
		Gson gson = new Gson();
		String result = "";
		if(idPassCheck == 1) {
			request.getSession().setAttribute("id", id);
			result = "true";
			
		}else {
			result = "false";
		}
		request.setAttribute("result", result);
		request.getRequestDispatcher("/view/member/result.jsp").forward(request, response);
		
		
		
	}

}
