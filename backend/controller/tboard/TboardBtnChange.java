package controller.tboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;
import vo.MemberVO;


@WebServlet("/tboardBtnChange.do")
public class TboardBtnChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String btn = request.getParameter("btn");
		request.setAttribute("btn",btn);
		String tboard_id = request.getParameter("tboard_id");
		MemberVO smem = (MemberVO)request.getSession().getAttribute("memberVo");
		PrintWriter out = response.getWriter();
		ITboardService service =TboardServiceImpl.getInstance();
		if(btn.equals("nbtn")) {
			Map<String, Object> map = new HashMap<>();
			map.put("tboard_id", tboard_id);
			map.put("mem_id", smem.getMem_id());
			int res = service.insertTnotify(map);
			request.setAttribute("res", res);
		}
		if(btn.equals("ncbtn")) {
			Map<String, Object> map = new HashMap<>();
			map.put("tboard_id", tboard_id);
			map.put("mem_id", smem.getMem_id());
			int res = service.deleteTnotify(map);
			request.setAttribute("res", res);
		}
		if(btn.equals("mlbtn")) {
			Map<String, Object> map = new HashMap<>();
			map.put("tboard_id", tboard_id);
			map.put("mem_id", smem.getMem_id());
			int res = service.insertMylist(map);
			request.setAttribute("res", res);
		}
		if(btn.equals("mlcbtn")) {
			Map<String, Object> map = new HashMap<>();
			map.put("tboard_id", tboard_id);
			map.put("mem_id", smem.getMem_id());
			int res = service.deleteMylist(map);
			request.setAttribute("res", res);
		}
		
		
		request.getRequestDispatcher("/view/btnchange.jsp").forward(request, response);
	}

}
