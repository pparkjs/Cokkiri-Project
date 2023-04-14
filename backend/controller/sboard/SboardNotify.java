package controller.sboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;
import vo.SboardVO;

@WebServlet("/SboardNotify.do")
public class SboardNotify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		ISboardService service = SboardServiceImpl.getInstance();
		
		SboardVO vo = new SboardVO();
		
		vo.setMem_id(memId);
		vo.setSboard_id(boardId);
		
		// 해당 게시물에 대해서 첫 신고인지 check
		int check = service.notifyCheck(vo);
		
		// 이미 누른 신고이면 아무일도 일어나지 않음
		
		// 최초 누른 신고 일때 새로 insert
		if(check > 0) {
			return;
		}else {
			int res = service.sboardNotify(vo);
			request.setAttribute("result", res);
			request.getRequestDispatcher("/view/sbResult.jsp").forward(request, response);
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
