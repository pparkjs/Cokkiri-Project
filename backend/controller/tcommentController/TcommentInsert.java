package controller.tcommentController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.tcommentService.ITcommentService;
import service.tcommentService.TcommentServiceImpl;
import vo.TcommentVO;


@WebServlet("/tcommentInsert.do")
public class TcommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doPost(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int tboardId = Integer.parseInt(request.getParameter("tboard"));
		
		TcommentVO vo = new TcommentVO();
		vo.setTcomment_content(request.getParameter("tco"));
		vo.setMem_id("nickname");
		vo.setTboard_id(tboardId);
		ITcommentService service = TcommentServiceImpl.getInstance();
		int result = service.insertTcomment(vo);
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("/tcommentList.do").forward(request, response);
	}

}
