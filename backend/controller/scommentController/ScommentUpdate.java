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
import vo.ScommentVO;


@WebServlet("/scommentUpdate.do")
public class ScommentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int scommentId = Integer.parseInt(request.getParameter("scommentId"));

		String scontent = request.getParameter("scontent");

		ScommentVO vo = new ScommentVO();

		vo.setScomment_id(scommentId);
		vo.setScomment_content(scontent);

		IScommentService service = ScommentServiceImpl.getInstance();

		int result =0;

		result= service.updateScomment(vo);

		Gson gson = new Gson();

		String json = gson.toJson(result);

		response.getWriter().print(json);
	}

}
