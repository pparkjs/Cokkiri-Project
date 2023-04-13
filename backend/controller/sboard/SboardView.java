package controller.sboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;
import vo.SboardVO;

@WebServlet("/SboardView.do")
public class SboardView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bId = request.getParameter("sboardId");
		System.out.println("아이디 : " + bId);
		ISboardService service = SboardServiceImpl.getInstance();
		
		List<SboardVO> list = service.sboardSelect(bId);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/secretboard/sboardView.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
