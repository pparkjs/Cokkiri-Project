package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.noticeService.INoticeService;
import service.noticeService.NoticeServiceImpl;
import vo.NoticeVO;

@WebServlet("/NoticeView.do")
public class NoticeView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nbId = Integer.parseInt(request.getParameter("nbId"));
		
		System.out.println("아이디 : " + nbId);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		NoticeVO noticeData = service.selectNotice(nbId);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("noticeData", noticeData);
		
		response.sendRedirect(request.getContextPath() + "/admin/noticeView.jsp");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
