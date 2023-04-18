package controller.tcommentController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.tcommentService.ITcommentService;
import service.tcommentService.TcommentServiceImpl;
import vo.TcommentVO;


@WebServlet("/tcommentUpdate.do")
public class TcommentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int tcommentId = Integer.parseInt(request.getParameter("tcommentId"));
		
		String tcontent = request.getParameter("tcontent");
		

		
		TcommentVO vo = new TcommentVO();
		

		
		vo.setTcomment_id(tcommentId);
		vo.setTcomment_content(tcontent);
		
		ITcommentService service = TcommentServiceImpl.getInstance();
		
		int result =0;
		
		result= service.updateTcomment(vo);
		
		Gson gson = new Gson();
		
		String json = gson.toJson(result);
		
		response.getWriter().print(json);
	}
}
