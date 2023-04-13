package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/messageCheck.do")
public class MessageCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sendMessage = (String) request.getSession().getAttribute("randomMessage");
		String messageCheck = request.getParameter("messageCheck");
		
		if(sendMessage.equals(messageCheck)) {
			request.getSession().removeAttribute("randomMessage");
			request.setAttribute("result", "true");
		} else {
			request.setAttribute("result", "false");
			
		}
		
		request.getRequestDispatcher("/view/member/result.jsp").forward(request, response);
	}

}
