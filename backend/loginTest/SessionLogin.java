package loginTest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import vo.MemberVO;

@WebServlet("/sessionLogin.do")
public class SessionLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
//		String id = request.getParameter("id");
//		String pw = request.getParameter("pass");
		
//		HttpSession session = request.getSession();
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		List<MemberVO> list = service.memberAllList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/secretboard/sboard.jsp").forward(request, response);
		
	}

}
