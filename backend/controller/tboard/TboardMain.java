package controller.tboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.tboardService.TboardServiceImpl;
import vo.TBoardAndAttVO;

@WebServlet("/tboardMain.do")
public class TboardMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect(request.getContextPath()+"/tboard/tboard.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String page = request.getParameter("page");
		String category = request.getParameter("category");
		String sword = request.getParameter("sword");
		String state = request.getParameter("state");
		Map<String, Object> map = new HashMap<>();
		if (page != null) {
			map.put("page_num", page);
		}
		if (category != null && !category.equals("default")) {
			map.put("category", category);
		}

		if (sword != null) {
			map.put("sword", sword);
		}
		
		if(state!=null) {
			map.put("state", state);
		}
		
		/*
		 session 유저 정보에 있는 지역 이름을 맵에 포함시켜야함
		 */
		HttpSession session = request.getSession();
		map.put("region", (String)session.getAttribute("add"));
		
		TboardServiceImpl service = TboardServiceImpl.getInstance();
		List<TBoardAndAttVO>list = service.boardMain(map); 
		Gson gson = new Gson(); 
		String json =gson.toJson(list); 
		PrintWriter out = response.getWriter(); 
		out.print(json);
		out.flush();
		
	}

}
