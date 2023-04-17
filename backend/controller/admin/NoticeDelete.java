package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.noticeService.INoticeService;
import service.noticeService.NoticeServiceImpl;

@WebServlet("/NoticeDelete.do")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nbId = Integer.parseInt(request.getParameter("nbId"));
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		service.deleteNotice(nbId);
		
		response.sendRedirect(request.getContextPath() + "/admin/noticeboard.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
