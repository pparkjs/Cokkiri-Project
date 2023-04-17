package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import vo.MemberVO;

@WebServlet("/findId.do")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		MemberVO memVo = new MemberVO();
		memVo.setMem_name(name);
		memVo.setMem_tel(tel);
		
		IMemberService service = MemberServiceImpl.getInstance();
		String memId = service.selectMemberIdByTelAndName(memVo);
		JsonObject jsonObj = new JsonObject();
		
		if(memId != null) {
			jsonObj.addProperty("result", "true");
			jsonObj.addProperty("memId", memId);
		} else {
			jsonObj.addProperty("result", "false");
		}
		Gson gson = new Gson();
		String json = gson.toJson(jsonObj);
		System.out.println("json" + json);
		response.getWriter().write(json);
		response.flushBuffer();
	}

}
