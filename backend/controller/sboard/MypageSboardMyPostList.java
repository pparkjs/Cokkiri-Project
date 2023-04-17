package controller.sboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;
import vo.MemberVO;
import vo.SboardVO;

/**
 * Servlet implementation class MypageSboardMyPostList
 */
@WebServlet("/mypageSboardMyPostList.do")
public class MypageSboardMyPostList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageSboardMyPostList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int more = Integer.parseInt(request.getParameter("more"));
		
		
		// 로그인할 때 저장했던 고객정보
		MemberVO memVo = (MemberVO)request.getSession().getAttribute("memberVo");
		String memId = memVo.getMem_id();
		
		
		ISboardService service = SboardServiceImpl.getInstance();
		List<SboardVO> list = service.selectByMoerMypageMypost(memId, more);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/mypageSboardList.jsp").forward(request, response);
	}

}
