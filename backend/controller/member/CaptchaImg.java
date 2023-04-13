package controller.member;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import nl.captcha.Captcha;
import nl.captcha.text.producer.NumbersAnswerProducer;
import vo.captchaVO;


/**
 * Servlet implementation class CaptchaImg
 */
@WebServlet("/captchaImg.do")
public class CaptchaImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		int width = Integer.parseInt(request.getParameter("width"));
		int height = Integer.parseInt(request.getParameter("height"));
		
		Captcha captcha = new Captcha.Builder(width, height) // 이미지 크기
				.addText(new NumbersAnswerProducer(6))// 6자리 숫자
				.addNoise().addNoise() // 방해선
				.build();
	
		// 캐시 설정(브라우져가 새로운 이미지를 가져오도록 함)
		response.setHeader("Cache-Control", "no-cache"); // 브라우져가 캐시를 사용하지 않도록함
		response.setDateHeader("Expirse", 0); // 응답 만료
		response.setHeader("Pragma", "no-cache"); // HTTP/1.0의 하의 호환성을 위해 추가
		response.setDateHeader("Max-Age", 0); // 응답이 캐시될 수 있는 최대 시간
		
		// 캡챠 이미지를 응답으로 전송
		response.setContentType("image/png");
		String base64Image = null;
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(captcha.getImage(), "png", baos);
			byte[] imageBytes = baos.toByteArray();
			base64Image = Base64.getEncoder().encodeToString(imageBytes);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
		
		request.getSession().setAttribute(Captcha.NAME, captcha);
		
		// 응답 데이터 설정
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		// JSON 데이터 생성
		JsonObject jObj = new JsonObject();
		jObj.addProperty("base64Image", base64Image);
		Gson gson = new Gson();
		String jsonData = gson.toJson(jObj);
		System.out.println(jsonData);
		response.getWriter().write(jsonData);
		response.flushBuffer();
	}

}
