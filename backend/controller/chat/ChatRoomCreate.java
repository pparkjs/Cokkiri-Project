package controller.chat;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.chatService.ChatServiceImpl;
import service.chatService.IChatService;
import vo.ChatMessageVO;
import vo.ChatRoomVO;


@WebServlet("/chatRoomCreate.do")
public class ChatRoomCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tboard_id = request.getParameter("tboard_id");
		request.getRequestDispatcher("/chat/buyerchatroom.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String smem_id= (String)request.getSession().getAttribute("id");
		Long tboard_id= Long.parseLong(request.getParameter("tboard_id"));
		String fmessage = request.getParameter("fmessage");
		
		IChatService service = ChatServiceImpl.getInstance();
		ChatRoomVO chatRoomVO = new ChatRoomVO();
		chatRoomVO.setMem_id(smem_id);
		chatRoomVO.setTboard_id(tboard_id);
		int res=0;
		int createRes = service.insertChatRoom(chatRoomVO);	
		if(createRes==1) {
			ChatMessageVO chatMessageVO = new ChatMessageVO();
			chatMessageVO.setMem_id(smem_id);
			chatMessageVO.setMessage_content(fmessage);
			chatMessageVO.setMessage_isread("n");
			chatMessageVO.setRoom_id(chatRoomVO.getRoom_id());
			
			res = service.insertChatMessage(chatMessageVO);
			if(res==1) {
				chatMessageVO = service.selectChatMessageByCid(chatMessageVO.getMessage_id());
				request.setAttribute("message", chatMessageVO);
			}
			
		}
		request.setAttribute("res", res);
		request.getRequestDispatcher("/view/createchatroom.jsp").forward(request, response);
		
	
	}

}
