package controller.scommentController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.scommentService.IScommentService;
import service.scommentService.ScommentServiceImpl;
import vo.MemberVO;
import vo.ScommentVO;

@WebServlet("/scommentInsert.do")
public class ScommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int sboardId = Integer.parseInt(request.getParameter("sboardId"));
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVo");
		String memId = memberVO.getMem_id(); // 로그인한 회원 아이디 가져옴
		
		String boardWriterId = request.getParameter("boardWriterId");
		String scontent = request.getParameter("scontent");
		String pid = request.getParameter("scommentPid");
		
		IScommentService service = ScommentServiceImpl.getInstance();
		
		ScommentVO vo = new ScommentVO();
		
		if(pid!=null) {	// 대댓글 작성시 실횅
			int scommentPid = Integer.parseInt(request.getParameter("scommentPid"));
			vo.setScomment_content(scontent);
			vo.setMem_id(memId);
			vo.setSboard_id(sboardId);
			vo.setScomment_pid(scommentPid);
		}else {	// 댓글 작성시 실행
			vo.setScomment_content(scontent);
			vo.setMem_id(memId);
			vo.setSboard_id(sboardId);
		}	
		
		//내가 해당 게시글에 댓글을 달았었는 지 체크
		List<ScommentVO> checkList = service.scommendWritedCheck(vo);
		
		if(memId.equals(boardWriterId)) {// 게시글 작성인 장본인이 댓글 달면
			vo.setScomment_writer(0); // 익명작성자 값 0
			service.insertScommentByWrited(vo);
			
		}else if(checkList == null || checkList.size() == 0) {
			service.insertScomment(vo); // 해당 게시글에 첫 댓글 등록
		}else { //이미 댓글 달았던 게시글이면
			int writer = checkList.get(0).getScomment_writer();
			vo.setScomment_writer(writer);
			
			service.insertScommentByWrited(vo);
		}
		
		ScommentVO scomment = service.getScomment(vo.getScomment_id());
		
		Gson gson = new Gson();
		String json = gson.toJson(scomment);
		response.getWriter().print(json);
	}

}
