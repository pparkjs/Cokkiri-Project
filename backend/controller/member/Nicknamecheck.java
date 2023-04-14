package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;

@WebServlet("/nicknamecheck.do")
public class Nicknamecheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String nickname = request.getParameter("nicknamevalue");
		IMemberService service = MemberServiceImpl.getInstance();
		int nicknameCnt = service.nicknamecheck(nickname);
		String result = null;
		if(nicknameCnt==0 && nickname!=null && nickname!="") {
			result = "true";
		} else {
			result = "false";
		}
		
		request.setAttribute("result", result);
		request.getRequestDispatcher("/view/member/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
