package controller.sboard;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;
import vo.MemberVO;
import vo.SboardVO;

@WebServlet("/SboardList.do")
public class SboardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int more = Integer.parseInt(request.getParameter("more"));
		String vtype = request.getParameter("sb_type");
		String vtext = request.getParameter("sb_search");
		
		ISboardService service = SboardServiceImpl.getInstance();
		HttpSession session = request.getSession();

		// 아직 로그인 페이지랑 연결 안해서 임의로 받은 테스트용 세션 (로그인한 내 자신의 아이디가 와야함)
		String memId  = (String)session.getAttribute("mem_id");
		
		Map<String, Object> morePage = service.morePage(more, vtype, vtext, memId);
		List<SboardVO> list = service.selectByMore(morePage);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/sboardList.jsp").forward(request, response);
		
		
	}

}
