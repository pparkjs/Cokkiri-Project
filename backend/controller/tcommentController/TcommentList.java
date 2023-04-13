package controller.tcommentController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.memberService.IMemberService;
import service.tcommentService.ITcommentService;
import service.tcommentService.TcommentServiceImpl;
import vo.TcommentVO;


@WebServlet("/tcommentList.do")
public class TcommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int tboardId = Integer.parseInt(request.getParameter("tboardId"));
		
		ITcommentService service = TcommentServiceImpl.getInstance();
		
		List<TcommentVO> result = service.getAllTcomment(tboardId);
		
		
		/*List<TcommentVO> result2 = new ArrayList<>();
		for (TcommentVO tcommentVO : result) {
			String mem_id = tcommentVO.getMem_id();
			IMemberService memservice = MemberServiceImpl.getInstance();
			
			tcommentVO.setMem_nickname();// setmemservice.s;
			result2.add(tcommentVO);*/
		/*
		 * Gson gson = new Gson(); String data = gson.toJson(result);
		 * response.getWriter().write(data); response.flushBuffer();
		 */
		request.setAttribute("tcommentList", result);
		request.getRequestDispatcher("/view/tcommentList.jsp").forward(request, response);
	}
}




