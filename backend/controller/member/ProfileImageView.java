package controller.member;

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

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;
import vo.MemberVO;
import vo.TImageVO;

/**
 * Servlet implementation class ProfileImageView
 */
@WebServlet("/profileImageView.do")
public class ProfileImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProfileImageView() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String mem_id = (String)request.getParameter("mem_id");
		MemberVO smem = (MemberVO)request.getSession().getAttribute("memberVo");
		if(smem!=null) {
			IMemberService service = MemberServiceImpl.getInstance();
			smem=service.selectMemberinfo(smem.getMem_id());
		}
		String uploadPath = "C:/Users/gram/Desktop/tboard_image";

		File f = new File(uploadPath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		String imgPath = uploadPath+File.separator+smem.getMem_image();
		File imgFile = new File(imgPath);
		
		System.out.println("하무가저1" + smem);
		if(imgFile.exists()) {
			System.out.println("하무가저2");
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
