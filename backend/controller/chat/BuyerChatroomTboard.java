package controller.chat;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;
import vo.ChatMessageTboardVO;
import vo.MemberVO;
import vo.TBoardAndAttVO;
import vo.TBoardVO;
import vo.TImageVO;


@WebServlet("/buyerChatRoom/tboard.do")
public class BuyerChatroomTboard extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long tboard_id = Long.parseLong(request.getParameter("tboard_id"));
		MemberVO smem = (MemberVO)request.getSession().getAttribute("memberVo");
		ITboardService service = TboardServiceImpl.getInstance();
		TBoardVO tBoardVO = service.selectTboardInfo(tboard_id);
		List<TImageVO> ilist = service.selecttImgBytboardId(tboard_id);
		IMemberService service2 = MemberServiceImpl.getInstance();
		MemberVO writer = service2.selectMemberinfo(tBoardVO.getMem_id());
		
		TBoardAndAttVO tavo = new TBoardAndAttVO();
		tavo.setBoardVO(tBoardVO);
		if(ilist!=null&&ilist.size()!=0) {
			tavo.setFimgid(ilist.get(0).getTimg_id());
		}
		tavo.setWriter(writer);
		tavo.setMymem_id(smem.getMem_id());
		request.setAttribute("tavo", tavo);
		request.getRequestDispatcher("/view/tboardandAtt.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
