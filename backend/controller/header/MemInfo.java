package controller.header;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.chatService.ChatServiceImpl;
import service.chatService.IChatService;
import service.headerService.HeaderServiceImpl;
import service.headerService.IHeaderService;
import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import vo.AlarmVO;
import vo.MemberVO;


@WebServlet("/memInfo.do")
public class MemInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("html/text; charset=utf-8");
		String smem_id = (String)request.getSession().getAttribute("id");
		IMemberService memservice = MemberServiceImpl.getInstance();
		MemberVO memberVO = memservice.selectMemberinfo(smem_id);
		IHeaderService service = HeaderServiceImpl.getInstance();
		List<AlarmVO> list = service.selectChatAlarm(smem_id);
		for (int i = 0; i < list.size(); i++) {
			String ymem_id = list.get(i).getMem_id();
			MemberVO ymemVo = memservice.selectMemberinfo(ymem_id);
			AlarmVO alarmVO = list.get(i);
			alarmVO.setYnick(ymemVo.getMem_nickname());
			list.set(i, alarmVO);
		}
		
		request.setAttribute("memberVO", memberVO);
		request.setAttribute("alarm", list);
		request.getRequestDispatcher("/view/headerres.jsp").forward(request, response);
		
		
	}

}
