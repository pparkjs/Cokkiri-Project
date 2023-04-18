package controller.pboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.pboardService.IPboardService;
import service.pboardService.PboardServiceImpl;
import vo.PboardVO;


@WebServlet("/SaveLocation.do")
public class SaveLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 클라이언트에서 전송한 좌표값을 가져오기
	    double lat = Double.parseDouble(request.getParameter("lat"));
	    double lng = Double.parseDouble(request.getParameter("lng"));
	    
	    PboardVO vo = new PboardVO();
	    
	    IPboardService service = PboardServiceImpl.getInstance();
	    int res = service.insertBoard(vo);
	    
	    vo.setLat(lat);
	    vo.setLng(lng);
	   
	    
	}

}
