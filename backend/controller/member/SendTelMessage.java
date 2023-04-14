package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;



@WebServlet("/sendTelMessage.do")
public class SendTelMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public SendTelMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		String tel = request.getParameter("tel");
		
		try {
			// 이미 가입된 전화번호가 없으면
			if(service.memberTelCount(tel)==0) {
				String randomMessage = service.sendRandomMessage(tel);
				request.getSession().setAttribute("randomMessage", randomMessage);
				request.setAttribute("result", "true");
			} else {
				request.setAttribute("result", "false");
			}
			request.getRequestDispatcher("/view/member/result.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
