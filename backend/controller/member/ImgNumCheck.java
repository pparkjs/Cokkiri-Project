package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.captcha.Captcha;

@WebServlet("/imgNumCheck.do")
public class ImgNumCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String userNum = request.getParameter("imgNumInput");
		
		Captcha imgNum = (Captcha)request.getSession().getAttribute(Captcha.NAME);
		System.out.println("Captcha" + imgNum);
		
		String result = null;
		if(userNum!=null && !"".equals(userNum)) {
			// 사용자가 입력한 문자가 정답과 일치하는지 검사
			if(imgNum.isCorrect(userNum)) {
				request.getSession().removeAttribute(Captcha.NAME);
				result = "true";
			} else {
				result = "false";
			}
		}
		
		request.setAttribute("result", result);
		System.out.println("result"+ result);
		request.getRequestDispatcher("/view/member/result.jsp").forward(request, response);
	}

}
