package controller.header;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/alarmToChat.do")
public class AlarmToChat extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String room_id = request.getParameter("room_id");
		response.sendRedirect(request.getContextPath()+"/chat/chatroom.jsp?selroom_id="+room_id);
		
		
	}

}
