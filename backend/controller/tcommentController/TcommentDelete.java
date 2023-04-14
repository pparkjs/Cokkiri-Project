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


@WebServlet("/tcommentDelete.do")
public class TcommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int tcommentId = Integer.parseInt(request.getParameter("tcommentId"));
		
		ITcommentService service = TcommentServiceImpl.getInstance();
		

		int result = service.updateTcommentIsremove(tcommentId);

		
		Gson gson = new Gson();
		
		String data = gson.toJson(result);
		response.getWriter().write(data);
		response.flushBuffer();
	}

}
