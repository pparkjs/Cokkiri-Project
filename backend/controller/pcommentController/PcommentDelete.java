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
import vo.MemberVO;
import vo.PcommentVO;


@WebServlet("/pcommentDelete.do")
public class PcommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int pcommentId = Integer.parseInt(request.getParameter("pcommentId"));
		
		IPcommentService service = PcommentServiceImpl.getInstance();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVo");
		PcommentVO pcomment = service.getPcomment(pcommentId);
		
		int result=0;
		if(memberVO.getMem_id().equals(pcomment.getMem_id())) {
			result = service.updatePcommentIsremove(pcommentId);
		}
		
		Gson gson = new Gson();
		
		String data = gson.toJson(result);
		response.getWriter().write(data);
		response.flushBuffer();
	}

}
