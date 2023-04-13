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


@WebServlet("/tboardBtnInfo.do")
public class TboardBtnInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("mem_id");
		String smem_id=(String)request.getSession().getAttribute("id");
		PrintWriter out = response.getWriter();
		if(mem_id.equals(smem_id)) {
			out.print("{ \"res\":\"ok\"}");
		}else {
			
			String tboard_id = request.getParameter("tboard_id");
			
			ITboardService service = TboardServiceImpl.getInstance();
			Map<String, Object> map = new HashMap<>();
			map.put("mem_id", smem_id);
			map.put("tboard_id",tboard_id);
			int mylist = service.selectMylist(map);
			int notify = service.selectTnotify(map);
			
			request.setAttribute("mylist", mylist);
			request.setAttribute("notify", tboard_id);
			
			out.print("{ \"res\":\"no\",\"notify\":\""+notify+"\",\"mylist\":\""+mylist+"\"}");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String smem_id=(String)request.getSession().getAttribute("id");
		String tboard_id = request.getParameter("tboard_id");
		
		ITboardService service = TboardServiceImpl.getInstance();
		Map<String, Object> map = new HashMap<>();
		map.put("mem_id", smem_id);
		map.put("tboard_id",tboard_id);
		int mylist = service.selectMylist(map);
		int notify = service.selectTnotify(map);
		
		request.setAttribute("mylist", mylist);
		request.setAttribute("notify", tboard_id);
		
		request.getRequestDispatcher(request.getContextPath()+"/view/mylistNotify.jsp").forward(request, response);
		
	}

}
