package controller.pboard;

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


@WebServlet("/loginTest.do")
public class loginTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMemberService service = MemberServiceImpl.getInstance();
		List<MemberVO> mem = service.memberAllList();
		
		String memId = mem.get(5).getMem_id();
		String nickName = mem.get(5).getMem_nickname();
		HttpSession session = request.getSession();
		session.setAttribute("memId", memId);
		session.setAttribute("nickName", nickName);
		
		response.sendRedirect(request.getContextPath() + "/pboard/pboard.jsp");
				
	}

}
