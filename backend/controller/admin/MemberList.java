package controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import vo.MemberVO;
import vo.PageVO;

@WebServlet("/MemberList.do")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String stext = request.getParameter("stext");
		int page = Integer.parseInt(request.getParameter("cpage"));
		
		IMemberService service = MemberServiceImpl.getInstance();

		// 페이지 처리에 필요한 값들 계산
		PageVO pvo = service.pageInfo(page, stext);

		Map<String, Object> map = new HashMap<>();
		map.put("stext", stext);
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());

		//현재 페이지 기준 8개 게시글 목록 가져옴
		List<MemberVO> list = service.listByPage(map);
		request.setAttribute("list", list);
		request.setAttribute("page", pvo);

		request.getRequestDispatcher("/view/admin/memberList.jsp").forward(request, response);
	}

}
