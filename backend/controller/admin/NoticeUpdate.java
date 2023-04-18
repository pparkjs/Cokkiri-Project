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

/**
 * Servlet implementation class NoticeUpdate
 */
@WebServlet("/NoticeUpdate.do")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int nbId = Integer.parseInt(request.getParameter("nbId"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		
		NoticeVO vo = new NoticeVO();
		
		vo.setNboard_content(content);
		vo.setNboard_title(title);
		vo.setNboard_id(nbId);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		service.updateNotice(vo);
		
		response.sendRedirect(request.getContextPath() + "/admin/noticeboard.jsp");
		
	}

}
