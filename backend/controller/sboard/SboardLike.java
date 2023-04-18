package controller.sboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;
import vo.SboardVO;

@WebServlet("/SboardLike.do")
public class SboardLike extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int likeCnt = Integer.parseInt(request.getParameter("likeCnt"));
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String memId = request.getParameter("memId");
		
		SboardVO vo = new SboardVO();
		
		vo.setSbstate_like(likeCnt);
		vo.setMem_id(memId);
		vo.setSboard_id(boardId);
		
		ISboardService service = SboardServiceImpl.getInstance();
		
		int check = service.likeCheck(vo);
		
		//먼저 좋아요 버튼 눌렀을때 첫 버튼일 때  좋아요 생성
		if(check == 0) {
			int res = service.likeInsert(vo);
			
			request.setAttribute("result", res);
			
			request.getRequestDispatcher("/view/firstLike.jsp").forward(request, response);
		}else { 
			
			// 좋아요가 눌러져있는지 검사
			int res = service.likeByButton(vo);
			
			if(res > 0){
				//이미 좋아요 누른 거이면 좋아요 행 삭제
				int likeDelete = service.likeDelete(vo);
				
				request.setAttribute("result", likeDelete);
				
				request.getRequestDispatcher("/view/delLike.jsp").forward(request, response);
			}else {
				//싫어요 눌러져있는 거 0만들고 좋아요 1 설정
				int likeUpdate = service.likeUpdate(vo);
				
				request.setAttribute("result", likeUpdate);
				
				request.getRequestDispatcher("/view/upLike.jsp").forward(request, response);
			}
			
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int disLikeCnt = Integer.parseInt(request.getParameter("disLikeCnt"));
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String memId = request.getParameter("memId");
		
		SboardVO vo = new SboardVO();
		
		vo.setSbstate_like(disLikeCnt);
		vo.setMem_id(memId);
		vo.setSboard_id(boardId);
		
		ISboardService service = SboardServiceImpl.getInstance();
		
		int check = service.likeCheck(vo);
		
		//먼저 싫어요 버튼 눌렀을때 첫 버튼일 때  싫어요 생성
		if(check == 0) {
			int res = service.disLikeInsert(vo);
			
			request.setAttribute("result", res);
			
			request.getRequestDispatcher("/view/firstLike.jsp").forward(request, response);
		}else { 
			
			// 좋아요가 눌러져있는지 검사
			int res = service.likeByButton(vo);
			
			if(res > 0){
				//좋아요 눌러져있으면 싫어요로 업데이트
				int disLikeUp = service.disLikeUpdate(vo);
				
				request.setAttribute("result", disLikeUp);
				
				request.getRequestDispatcher("/view/upLike.jsp").forward(request, response);
			}else {
				//싫어요 이미 눌러져 있으므로 행 삭제
				int likeDelete = service.likeDelete(vo);
				
				request.setAttribute("result", likeDelete);
				
				request.getRequestDispatcher("/view/delLike.jsp").forward(request, response);
			}
			
			
		}
	}

}
