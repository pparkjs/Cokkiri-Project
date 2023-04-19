package controller.pboard;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PimageSrcView.do")
public class PimageSrcView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String img = request.getParameter("imgName"); //uuid 이름 가져옴 
		
		String uploadPath = "c:/cokkiri/imgServer";
		
		File f = new File(uploadPath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		String imgPath = uploadPath + File.separator + img; //해당 서버 경로에 저장되어있는 uuid 이미지 파일 가져옴
		File imgFile = new File(imgPath);
		
		if(imgFile.exists()) {
			BufferedInputStream bin = null;
			BufferedOutputStream bout = null;
		
			try {
				
				bout = new BufferedOutputStream(response.getOutputStream());
				bin = new BufferedInputStream(new FileInputStream(imgFile));
				
				byte[] temp = new byte[1024];
				int len = 0;
				
				while((len = bin.read(temp)) > 0) {
					bout.write(temp, 0, len);
				}
				bout.flush();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(bin!=null)try {bin.close();}catch(IOException e) {}
				if(bout!=null)try {bout.close();}catch(IOException e) {}
			}

		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
