package controller.tboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.tboardService.TboardServiceImpl;
import vo.MemberVO;


@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		IMemberService service = MemberServiceImpl.getInstance();
		int res = service.selectIsMember(id);
	
		if(res==0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			request.setAttribute("id", id);
			RequestDispatcher rd = request.getRequestDispatcher("/view/loginfail.jsp");
			rd.forward(request, response);
		}else {
			HttpSession session = request.getSession();
			MemberVO memberVO = service.selectMemberinfo(id);
			session.setAttribute("id", memberVO.getMem_id());
			session.setAttribute("nickname", memberVO.getMem_nickname());
			session.setAttribute("add", memberVO.getMem_add());
			response.sendRedirect(request.getContextPath()+"/tboard/tboard.jsp");
		}
	}

}
