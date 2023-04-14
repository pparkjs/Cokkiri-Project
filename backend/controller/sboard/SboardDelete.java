package controller.sboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.simageDAO.ISimageDAO;
import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;
import service.simageService.ISimageService;
import service.simageService.SimageServiceImpl;

@WebServlet("/SboardDelete.do")
public class SboardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sboardId = Integer.parseInt(request.getParameter("sbId"));
		ISimageService mService = SimageServiceImpl.getInstance();
		
		int result = mService.simageDeleteBySboardId(sboardId);
		
		ISboardService bService = SboardServiceImpl.getInstance();
		
		bService.sboardDelete(sboardId);
		
		// 경로 나중에 바꿔야함
		response.sendRedirect(request.getContextPath() + "/secretboard/sboard.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
