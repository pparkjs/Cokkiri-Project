package controller.scommentController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.scommentService.IScommentService;
import service.scommentService.ScommentServiceImpl;
import vo.MemberVO;
import vo.ScommentVO;

@WebServlet("/scommentList.do")
public class ScommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int sboardId = Integer.parseInt(request.getParameter("sboardId"));
		int page = Integer.parseInt(request.getParameter("page"));
		ScommentVO vo = new ScommentVO();
		vo.setSboard_id(sboardId);
		vo.setStartScomment((page-1)*5+1);
		vo.setEndScomment((page)*5);
		
		IScommentService service = ScommentServiceImpl.getInstance();
		IMemberService service2 = MemberServiceImpl.getInstance();
		
		List<ScommentVO> result = service.getAllScomment(vo);
		
		for(int i=0; i<result.size(); i++) {
			ScommentVO scommentVO = result.get(i);
			MemberVO mem = service2.selectMemberinfo(scommentVO.getMem_id());
			scommentVO.setMem_nickname(mem.getMem_nickname());
			result.set(i, scommentVO);
			
		}

		request.setAttribute("scommentList", result);
		request.getRequestDispatcher("/view/scommentList.jsp").forward(request, response);
	}

}
