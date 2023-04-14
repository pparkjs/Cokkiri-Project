package controller.sboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;
import vo.SboardVO;

@WebServlet("/sboardViewState.do")
public class sboardViewState extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String memId = request.getParameter("memId");
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		SboardVO vo = new SboardVO();
		
		vo.setMem_id(memId);
		vo.setSboard_id(boardId);
		ISboardService service = SboardServiceImpl.getInstance();
		
		SboardVO states = service.viewState(vo);
		
		Gson gson = new Gson();
		
		String result = gson.toJson(states);
		
		response.getWriter().write(result);
		response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
