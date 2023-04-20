package controller.pboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.pboardService.IPboardService;
import service.pboardService.PboardServiceImpl;
import service.sboardService.ISboardService;
import vo.PboardVO;

@WebServlet("/pboardDetail.do")
public class PboardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pId = request.getParameter("pboardId");
		
		IPboardService service = PboardServiceImpl.getInstance();
		
		List<PboardVO> list = service.pboardSelect(pId);
		
//		request.setAttribute("list", list);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("pbList", list);
//		session.setAttribute("pboardId", pId);
		
		response.sendRedirect(request.getContextPath() + "/pboard/pboardDetail.jsp");
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
