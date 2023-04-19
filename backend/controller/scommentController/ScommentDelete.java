package controller.scommentController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.scommentService.IScommentService;
import service.scommentService.ScommentServiceImpl;
import vo.MemberVO;
import vo.ScommentVO;

@WebServlet("/scommentDelete.do")
public class ScommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//작성한 댓글 작성자의 아이디
		int scommentId = Integer.parseInt(request.getParameter("scommentId"));
		
		IScommentService service = ScommentServiceImpl.getInstance();
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("memberVo");
		ScommentVO scomment = service.getScomment(scommentId); //해당 댓글 아이디에 댓글 정보 가져오기
		
		int result=0;
		
		// 현재 로그인 한 회원 본인이 작성한 댓글일 경우 
		if(memberVO.getMem_id().equals(scomment.getMem_id())) {
			//삭제여부 y로 업데이트
			result = service.updateScommentIsremove(scommentId);
		}

		Gson gson = new Gson();
		
		String data = gson.toJson(result);
		response.getWriter().write(data);
		response.flushBuffer();
	}

}
