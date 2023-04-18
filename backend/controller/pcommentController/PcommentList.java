package controller.pcommentController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.pcommenService.IPcommentService;
import service.pcommenService.PcommentServiceImpl;
import vo.PcommentVO;


@WebServlet("/pcommentList.do")
public class PcommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int pboardId = Integer.parseInt(request.getParameter("pboardId"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		PcommentVO vo = new PcommentVO();
		vo.setPboard_id(pboardId);
		vo.setStartPcomment((page-1)*5+1);
		vo.setEndPcomment((page)*5);
		
		IPcommentService service = PcommentServiceImpl.getInstance();
		IMemberService service2 = MemberServiceImpl.getInstance();
		
		List<PcommentVO> result = service.getAllPcomment(vo);
		for(int i=0; i<result.size(); i++) {
			PcommentVO pcommentVO = result.get(i);
			pcommentVO.setMem_nickname(service2.selectMemberinfo(pcommentVO.getMem_id()).getMem_nickname());
			result.set(i, pcommentVO);
		}
		for (PcommentVO pcommentVO : result) {
			System.out.println(pcommentVO);
		}
		System.out.println("pcomment" + result);
		request.setAttribute("pcommentList", result);
		request.getRequestDispatcher("/view/pcommentList.jsp").forward(request, response);
	}
	
}
