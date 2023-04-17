package controller.tcommentController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.tcommentService.ITcommentService;
import service.tcommentService.TcommentServiceImpl;
import vo.MemberVO;
import vo.TcommentVO;


@WebServlet("/tcommentList.do")
public class TcommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int tboardId = Integer.parseInt(request.getParameter("tboardId"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		TcommentVO vo = new TcommentVO();
		vo.setTboard_id(tboardId);
		vo.setStartTcomment((page-1)*5+1);
		vo.setEndTcomment((page)*5);
		ITcommentService service = TcommentServiceImpl.getInstance();
		IMemberService service2 = MemberServiceImpl.getInstance();
		
		List<TcommentVO> result = service.getAllTcomment(vo);
		for(int i=0; i<result.size(); i++) {
			TcommentVO tcommentVO = result.get(i);
			MemberVO mem = service2.selectMemberinfo(tcommentVO.getMem_id());
			tcommentVO.setMem_nickname(mem.getMem_nickname());
			result.set(i, tcommentVO);
			
		}
		
		/*
		 * for(int i=0; i<result.size(); i++) { int cnt =
		 * service.selectChildIsExist(result.get(i).getTcomment_id()); if(cnt>0) {
		 * TcommentVO tcommentVO = result.get(i); tcommentVO.setHasparent("y");
		 * result.set(i, tcommentVO); } System.out.println(result.get(i)); }
		 */

		request.setAttribute("tcommentList", result);
		request.getRequestDispatcher("/view/tcommentList.jsp").forward(request, response);
	}
}




