package controller.tboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;
import vo.TBoardVO;
import vo.TImageVO;

/**
 * Servlet implementation class TboardModifyForm
 */
@WebServlet("/tboardModifyForm.do")
public class TboardModifyForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("image/jpeg");
		Long tboard_id = Long.parseLong(request.getParameter("tboard_id"));
		ITboardService service = TboardServiceImpl.getInstance();
		TBoardVO boardVO = service.selectTboardInfo(tboard_id);
		List<TImageVO> ilist = service.selecttImgBytboardId(tboard_id);
		request.setAttribute("boardVO", boardVO);
		request.setAttribute("ilist", ilist);
		
		request.getRequestDispatcher("/tboard/tboardModifyForm.jsp").forward(request, response);
		
		
	}

}
