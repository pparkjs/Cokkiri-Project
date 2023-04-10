package controller.tboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.tboardService.TboardServiceImpl;
import vo.CategoryVO;


@WebServlet("/category.do")
public class Category extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		TboardServiceImpl service = TboardServiceImpl.getInstance();
		List<CategoryVO> list = service.selectCategory();
		
		Gson gson = new Gson();
		
		String json = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}



}
