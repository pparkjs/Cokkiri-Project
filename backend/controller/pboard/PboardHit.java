package controller.pboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.pboardService.IPboardService;
import service.pboardService.PboardServiceImpl;
import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;


@WebServlet("/PboardHit.do")
public class PboardHit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		IPboardService service = PboardServiceImpl.getInstance();
		
		int res = service.updateHit(boardId);
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/view/pbResult.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
