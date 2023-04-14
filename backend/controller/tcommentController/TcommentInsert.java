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


@WebServlet("/tcommentInsert.do")
public class TcommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doPost(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		int tboardId = Integer.parseInt(request.getParameter("tboardId"));
		String memId = request.getParameter("memId");
		String tcontent = request.getParameter("tcontent");
		String pid = request.getParameter("tcommentPid");
		TcommentVO vo = new TcommentVO();
		if(pid!=null) {	// 대댓글
			int tcommentPid = Integer.parseInt(request.getParameter("tcommentPid"));
			vo.setTcomment_content(tcontent);
			vo.setMem_id(memId);
			vo.setTboard_id(tboardId);
			vo.setTcomment_pid(tcommentPid);
		}else {	// 댓글
			vo.setTcomment_content(tcontent);
			vo.setMem_id(memId);
			vo.setTboard_id(tboardId);
		}	
		
		
		ITcommentService service = TcommentServiceImpl.getInstance();
		int result = service.insertTcomment(vo);
		
		TcommentVO tcomment = service.getTcomment(vo.getTcomment_id());
		
		Gson gson = new Gson();
		String json = gson.toJson(tcomment);
		
		response.getWriter().print(json);
	}
}
