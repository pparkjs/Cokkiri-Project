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
		int more = Integer.parseInt(request.getParameter("more"));
		String vtype = request.getParameter("sb_type");
		String vtext = request.getParameter("sb_search");
		
		ISboardService service = SboardServiceImpl.getInstance();
		HttpSession session = request.getSession();

		MemberVO memVo = (MemberVO)session.getAttribute("memberVo");
		String memId = memVo.getMem_id();
		System.out.println("확인:" + more);
		System.out.println("확인:" + vtype);
		System.out.println("확인:" + vtext);
		Map<String, Object> morePage = service.morePage(more, vtype, vtext, memId);
		System.out.println("맵 : "+ morePage);
		List<SboardVO> list = service.notifyByMore(morePage);
		System.out.println("리스트 : " + list);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/sboardList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int more = Integer.parseInt(request.getParameter("more"));
		String vtype = request.getParameter("sb_type");
		String vtext = request.getParameter("sb_search");
		
		ISboardService service = SboardServiceImpl.getInstance();
		HttpSession session = request.getSession();

		MemberVO memVo = (MemberVO)session.getAttribute("memberVo");
		String memId = memVo.getMem_id();
		
		Map<String, Object> morePage = service.morePage(more, vtype, vtext, memId);
		List<SboardVO> list = service.selectByMore(morePage);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/sboardList.jsp").forward(request, response);
		
		
	}

}
