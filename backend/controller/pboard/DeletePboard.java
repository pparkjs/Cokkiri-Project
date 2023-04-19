package controller.pboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.pboardService.IPboardService;
import service.pboardService.PboardServiceImpl;
import service.pimageService.IPimageService;
import service.pimageService.PimageServiceImpl;


@WebServlet("/DeletePboard.do")
public class DeletePboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pboardId = Integer.parseInt(request.getParameter("pdId"));
		
		
		IPimageService imgService = PimageServiceImpl.getInstance();
		IPboardService service = PboardServiceImpl.getInstance();
		
		int result = imgService.deletePimgByPboardId(pboardId);
		service.deleteBoard(pboardId);
		
		response.sendRedirect(request.getContextPath() + "pboard/pboard.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
