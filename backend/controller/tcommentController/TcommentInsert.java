package controller.tcommentController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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

		int tboardId = Integer.parseInt(request.getParameter("tboardId"));
		String memId = request.getParameter("memId");
		String tcontent = request.getParameter("tcontent");
		//int tcommentId = Integer.parseInt(request.getParameter("tcommentId"));
		int tcommentPid = Integer.parseInt(request.getParameter("tcommentPid"));
		int level = Integer.parseInt(request.getParameter("level"));
		
		
		TcommentVO vo = new TcommentVO();
		vo.setTcomment_content(tcontent);
		vo.setMem_id(memId);
		vo.setTboard_id(tboardId);
		//vo.setTcomment_id(tcommentId);
		vo.setLevel(level);
		vo.setTcomment_pid(tcommentPid);
		
		
		ITcommentService service = TcommentServiceImpl.getInstance();
		int result = service.insertTcomment(vo);
		
		if(result > 0) {
			List<TcommentVO> list = service.getAllTcomment(tboardId);
			
			
			Gson gson = new Gson();
			String data = gson.toJson(list);
			response.getWriter().write(data);
			response.flushBuffer();
			 
			//request.setAttribute("tcommentList", list);
			//request.getRequestDispatcher("/view/tcommentList.jsp").forward(request, response);
		}
	}
}
