package controller.chat;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.chatService.ChatServiceImpl;
import service.chatService.IChatService;
import vo.ChatMessageVO;
import vo.ChatRoomVO;


@WebServlet("/preChatExist.do")
public class PreChatExist extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long tboard_id = Long.parseLong(request.getParameter("tboard_id"));
		String mem_id = (String)request.getSession().getAttribute("id");

		IChatService service = ChatServiceImpl.getInstance();
		Map<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("tboard_id", tboard_id);
		ChatRoomVO roomRes = service.selectChatRoomByMidTid(map);
		List<ChatMessageVO> list=null;
		if(roomRes!=null) {
			list = service.selectChatMessageByRoomId(roomRes.getRoom_id());
		}
		
		
		request.setAttribute("res", list);
		request.getRequestDispatcher("/view/resview.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
