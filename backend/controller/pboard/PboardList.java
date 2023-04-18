package controller.pboard;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.pboardService.IPboardService;
import service.pboardService.PboardServiceImpl;
import vo.PboardVO;


@WebServlet("/PboardList.do")
public class PboardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int more = Integer.parseInt(request.getParameter("more"));
		System.out.println(more);
		String type = request.getParameter("pb_type");
		String text = request.getParameter("pb_search");
		
		IPboardService service = PboardServiceImpl.getInstance();
		 
		Map<String, Object> morePage = service.morePage(more, type, text);
		List<PboardVO> list = service.selectByPage(morePage);
		System.out.println("list : " + list);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/pboardList.jsp").forward(request, response);
	}

}
