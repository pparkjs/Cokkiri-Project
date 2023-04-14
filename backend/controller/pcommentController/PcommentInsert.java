package controller.pcommentController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.pcommenService.IPcommentService;
import service.pcommenService.PcommentServiceImpl;
import vo.PcommentVO;


@WebServlet("/pcommentInsert.do")
public class PcommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		int pboardId = Integer.parseInt(request.getParameter("pboardId"));
		String memId = request.getParameter("memId");
		String pcontent = request.getParameter("pcontent");
		String pid = request.getParameter("pcommentPid");
		PcommentVO vo = new PcommentVO();
		if(pid!=null) {	// 대댓글
			int pcommentPid = Integer.parseInt(request.getParameter("pcommentPid"));
			vo.setPcomment_content(pcontent);
			vo.setMem_id(memId);
			vo.setPboard_id(pboardId);
			vo.setPcomment_pid(pcommentPid);
		}else {	// 댓글
			vo.setPcomment_content(pcontent);
			vo.setMem_id(memId);
			vo.setPboard_id(pboardId);
		}
		System.out.println(vo);
		IPcommentService service = PcommentServiceImpl.getInstance();
		int result = service.insertPcomment(vo);
		
		PcommentVO pcomment = service.getPcomment(vo.getPcomment_id());
		
		Gson gson = new Gson();
		String json = gson.toJson(pcomment);
		
		response.getWriter().print(json);
	}

}
