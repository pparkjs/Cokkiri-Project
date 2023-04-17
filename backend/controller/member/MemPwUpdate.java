package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import vo.MemberVO;

/**
 * Servlet implementation class MemPwUpdate
 */
@WebServlet("/memPwUpdate.do")
public class MemPwUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pw = request.getParameter("pw");
		String id = request.getParameter("id");
		MemberVO memVo = new MemberVO();
		memVo.setMem_pw(pw);
		memVo.setMem_id(id);
		
		IMemberService service = MemberServiceImpl.getInstance();
		int updateMemberPw = service.updateMemberPw(memVo);
		
		String result = null;
		if(updateMemberPw == 1) {
			result = "true";
		} else {
			result = "false";
		}
		request.setAttribute("result", result);
		request.getRequestDispatcher("/view/member/result.jsp").forward(request, response);
		
	}

}
