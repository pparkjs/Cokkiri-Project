package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;

@WebServlet("/idcheck.do")
public class Idcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Idcheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		IMemberService service = MemberServiceImpl.getInstance();
		int idcheckCnt = service.incheck(id);
		String result = null;
		if(idcheckCnt==0) {
			result = "true";
		} else {
			result = "false";
		}
		
		request.setAttribute("result", result);
		request.getRequestDispatcher("/view/member/result.jsp").forward(request, response);
	
	}

}
