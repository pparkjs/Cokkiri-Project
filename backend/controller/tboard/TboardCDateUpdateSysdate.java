package controller.tboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import service.tboardService.TboardServiceImpl;

@WebServlet("/tboardCDateUpdateSysdate.do")
public class TboardCDateUpdateSysdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int tboardId = Integer.parseInt(request.getParameter("tboard_id"));
		
		TboardServiceImpl service = TboardServiceImpl.getInstance();
		int res = service.updateTboardCompleteDate(tboardId);
		String result = null;
		String tboardState = service.selectTboardState(tboardId);		
		JsonObject jsonObject = new JsonObject();	
		if(res == 1) {
			jsonObject.addProperty("result", "ok");
			jsonObject.addProperty("tboardState", tboardState);
		} else {
			jsonObject.addProperty("result", "no");
		}
		
		
		Gson gson = new Gson();
		String json = gson.toJson(jsonObject);
		response.getWriter().write(json);
		response.flushBuffer();
	}

}
