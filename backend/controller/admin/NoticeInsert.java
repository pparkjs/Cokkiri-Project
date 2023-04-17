package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.noticeService.INoticeService;
import service.noticeService.NoticeServiceImpl;
import vo.NoticeVO;

@WebServlet("/NoticeInsert.do")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		NoticeVO vo = new NoticeVO();
		
		vo.setNboard_title(title);
		vo.setNboard_content(content);
		
		service.insertNotice(vo);
		
		response.sendRedirect(request.getContextPath() + "/admin/noticeboard.jsp");
	}

}
