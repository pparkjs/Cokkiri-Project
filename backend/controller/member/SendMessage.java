package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;

/**
 * Servlet implementation class SendMessage
 */
@WebServlet("/sendMessage.do")
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMemberService service = MemberServiceImpl.getInstance();
		
		String tel = request.getParameter("tel");
		
		try {
			if(service.memberTelCount(tel)==0) { // 가입이 안된 전화번호
				request.setAttribute("result", "false");
			} else {
				String randomMessage = service.sendRandomMessage(tel);
				request.getSession().setAttribute("randomMessage", randomMessage);
				request.setAttribute("result", "true");
			}
			request.getRequestDispatcher("/view/member/result.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
