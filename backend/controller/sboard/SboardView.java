package controller.sboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;
import vo.SboardVO;

@WebServlet("/SboardView.do")
public class SboardView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bId = request.getParameter("sboardId");
		
		ISboardService service = SboardServiceImpl.getInstance();
		
		List<SboardVO> list = service.sboardSelect(bId);
		
//		request.setAttribute("list", list);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("sbList", list);
		
//		request.getRequestDispatcher("/secretboard/sboardView.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/secretboard/sboardView.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
