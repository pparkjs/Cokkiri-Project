package controller.tboard;

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

import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;
import vo.TImageVO;


@WebServlet("/images/TboardImageView.do")
public class TboardImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String str = request.getParameter("imgno");
		Long imgno = Long.parseLong(str);
		ITboardService service = TboardServiceImpl.getInstance();
		TImageVO tImageVO = service.selectImage(imgno);
		String uploadPath = "C:/Users/변정민/Desktop/tboard_image";
		// 테스트용 
		// String uploadPath = "D:/중프/tboard_image";
		
		File f = new File(uploadPath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		String imgPath = uploadPath+File.separator+tImageVO.getTimg_save_name();
		File imgFile = new File(imgPath);
		
		if(imgFile.exists()) {
			BufferedInputStream bin=null;
			BufferedOutputStream bout = null;
			
			try {
				//출력용 스트림 객체 생성
				bout = new BufferedOutputStream(response.getOutputStream());
				bin = new BufferedInputStream(new FileInputStream(imgFile));
				
				byte[] temp = new byte[1024];
				int len=0;
				while((len=bin.read(temp))>0) {
					bout.write(temp,0,len);
				}
				bout.flush();
				
			} catch (Exception e) {
				System.out.println("입출력 오류: "+e.getMessage());
			}finally {
				if(bin!=null) bin.close();
				if(bout!=null) bout.close();
			}
			
		}
	}


}
