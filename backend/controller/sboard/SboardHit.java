package controller.sboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;

@WebServlet("/SboardHit.do")
public class SboardHit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		ISboardService service = SboardServiceImpl.getInstance();
		
		int res = service.updateHit(boardId);
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/view/sbResult.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
