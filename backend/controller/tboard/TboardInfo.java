package controller.tboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.tboardService.TboardServiceImpl;
import vo.MemberVO;
import vo.TBoardVO;
import vo.TImageVO;


@WebServlet("/tboardInfo.do")
public class TboardInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		Long a = Long.parseLong(id);
		TboardServiceImpl service = TboardServiceImpl.getInstance();
		
		int cnt = service.incrementHit(a);
		
		TBoardVO boardVO = service.selectTboardInfo(a);
		List<TImageVO> ilist = service.selecttImgBytboardId(a);
		MemberVO memberVO = service.selectMemberinfo(boardVO.getMem_id());
		
		Map<String, Object> map = new HashMap<>();
		
		//session에서 현재 회원의 id를 꺼냈다고 가정
		HttpSession session = request.getSession();
		map.put("mem_id", (String)session.getAttribute("id"));
		map.put("tboard_id", a);
		int mylist = service.selectMylist(map);
		int tnotify = service.selectTnotify(map);
		
		String category_id = boardVO.getCategory_id();
		String category_name = service.selectCategoryName(category_id);
		
		request.setAttribute("memberVO", memberVO);
		request.setAttribute("board", boardVO);
		request.setAttribute("img", ilist);
		request.setAttribute("category", category_name);
		request.setAttribute("mylist", mylist);
		
		
		
		
		request.getRequestDispatcher("tboard/tboardInfo.jsp").forward(request, response);
		
	}
	
	
}
