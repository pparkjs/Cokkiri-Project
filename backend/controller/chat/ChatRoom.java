package controller.chat;

import java.io.IOException;
import java.util.ArrayList;
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
import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;
import vo.ChatMessageVO;
import vo.ChatRoomDetailVO;
import vo.ChatRoomVO;
import vo.MemberVO;
import vo.TBoardVO;


@WebServlet("/chatRoom.do")
public class ChatRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect(request.getContextPath()+"/chat/chatroom.jsp");
		
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		IChatService service = ChatServiceImpl.getInstance();
		MemberVO smem = (MemberVO)request.getSession().getAttribute("memberVo");
		List<ChatRoomVO> list = service.selectChatRoomListByMid(smem.getMem_id());
		List<ChatRoomDetailVO> resList = new ArrayList<>();
		IMemberService service2 = MemberServiceImpl.getInstance();
		MemberVO myMember = service2.selectMemberinfo(smem.getMem_id());
		ITboardService service3 = TboardServiceImpl.getInstance();
		
		for (ChatRoomVO chatRoomVO : list) {
			ChatRoomDetailVO chatRoomDetailVO = new ChatRoomDetailVO();
			chatRoomDetailVO.setChatRoomVO(chatRoomVO);
			
			ChatMessageVO lasgMessage = service.selectLastMessageByRid(chatRoomVO.getRoom_id());
			chatRoomDetailVO.setLastMessageVO(lasgMessage);
			
			Long tboard_id = chatRoomVO.getTboard_id();
			TBoardVO tboard = service3.selectTboardInfo(tboard_id);
			chatRoomDetailVO.setTitle(tboard.getTboard_title());
			String tmem_id=tboard.getMem_id();
			
			
			chatRoomDetailVO.setMyMember(myMember);
			String bmem_id = chatRoomVO.getMem_id();
			MemberVO yourMember=null;
			if(!bmem_id.equals(smem.getMem_id())) {
				yourMember = service2.selectMemberinfo(bmem_id);
				chatRoomDetailVO.setYourMember(yourMember);
			}else if(!tmem_id.equals(smem.getMem_id())) {
				yourMember = service2.selectMemberinfo(tmem_id);
				chatRoomDetailVO.setYourMember(yourMember);
			}
			
			Map<String,Object> map = new HashMap<>();
			map.put("room_id", chatRoomVO.getRoom_id());
			map.put("mem_id", smem.getMem_id());
			int noReadCnt = service.selectNoReadMessageCnt(map);
			chatRoomDetailVO.setNoReadCnt(noReadCnt);
			resList.add(chatRoomDetailVO);
		}
		
		request.setAttribute("list", resList);
		
		request.getRequestDispatcher("/view/chatList.jsp").forward(request, response);
		
		
		
	}
}
