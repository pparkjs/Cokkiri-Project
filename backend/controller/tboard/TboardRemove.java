package controller.tboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;


@WebServlet("/tboardRemove.do")
public class TboardRemove extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		int res=0;
		Long tboard_id = Long.parseLong(request.getParameter("tboard_id"));
		String mem_id = request.getParameter("mem_id");
		String smem_id = (String) request.getSession().getAttribute("id");
		if(mem_id.equals(smem_id)) {
			ITboardService service = TboardServiceImpl.getInstance();
			res = service.deleteTboard(tboard_id);
		}
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("/view/tboardRemove.jsp").forward(request, response);
		
		
	}

}
