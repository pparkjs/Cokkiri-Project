package controller.chat;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.net.aso.r;
import service.chatService.ChatServiceImpl;
import service.chatService.IChatService;
import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;
import vo.ChatMessageTboardVO;
import vo.ChatMessageVO;
import vo.ChatRoomVO;
import vo.MemberVO;
import vo.TBoardVO;
import vo.TImageVO;


@WebServlet("/chatmessage.do")
public class Chatmessage extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		long room_id = Long.parseLong(request.getParameter("room_id"));
		String nick = request.getParameter("yournick");
		IMemberService service3 = MemberServiceImpl.getInstance();
		MemberVO ymem = service3.selectMemberinfoByNick(nick);
		
		IChatService service = ChatServiceImpl.getInstance();
		List<ChatMessageVO> list = service.selectChatMessageByRoomId(room_id);
		
		ChatMessageTboardVO chatMessageTboardVO = new ChatMessageTboardVO();
		chatMessageTboardVO.setMlist(list);
		chatMessageTboardVO.setYourMember(ymem);
		
		ChatRoomVO roomVO = service.selectChatRoomByRid(room_id);
		Long tboard_id = roomVO.getTboard_id();
		ITboardService service2 = TboardServiceImpl.getInstance();
		
		TBoardVO tBoardVO = service2.selectTboardInfo(tboard_id);
		MemberVO seller = service3.selectMemberinfo(tBoardVO.getMem_id());
		chatMessageTboardVO.setSeller(seller);
		
		List<TImageVO> ilist = service2.selecttImgBytboardId(tboard_id);
		chatMessageTboardVO.setfTImageVO(ilist.get(0));
		
		chatMessageTboardVO.settBoardVO(tBoardVO);
		request.setAttribute("cmtVO", chatMessageTboardVO);
		request.getRequestDispatcher("/view/chatMessageList.jsp").forward(request, response);
		
		
	}

}
