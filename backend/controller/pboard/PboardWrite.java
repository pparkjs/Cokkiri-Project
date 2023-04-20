package controller.pboard;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import service.pboardService.IPboardService;
import service.pboardService.PboardServiceImpl;
import service.pimageService.IPimageService;
import service.pimageService.PimageServiceImpl;
import vo.MemberVO;
import vo.PboardVO;
import vo.PimageVO;


@WebServlet("/PboardWrite.do")
@MultipartConfig(
		//1024Kbyte = 1Mbyte ,1Kbyte = 1024byte
		fileSizeThreshold = 1024 * 1024 * 10 , maxFileSize = 1024 * 1024 * 30,
		maxRequestSize = 1024 * 1024 * 100 ) 
public class PboardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberVO memVo = (MemberVO)session.getAttribute("memberVo");
		String memId = memVo.getMem_id();
		
		PboardVO pvo = new PboardVO();
		
		pvo.setMem_id(memId);
		pvo.setPboard_title(request.getParameter("title"));
		pvo.setPboard_content(request.getParameter("content"));
		pvo.setPboard_addr(request.getParameter("place"));
		
		IPboardService service = PboardServiceImpl.getInstance();
		
		int res = service.insertBoard(pvo);
		
		System.out.println("인설트: " + res);
		
		String uploadPath = "c:/cokkiri/imgServer";
		
		File f = new File(uploadPath);		
		// 폴더 없으면 새로 만들기
		if (!f.exists()) {
			f.mkdirs();
		}

		String fileName = "";

		List<PimageVO> plist = new ArrayList<>();

		for (Part part : request.getParts()) {
			fileName = extractFileName(part); // 파일명 추출
			
			if (!"".equals(fileName)) {

				PimageVO pi = new PimageVO();

				pi.setPboard_id(pvo.getPboard_id());
				pi.setPimg_origin_name(fileName);

				// 파일 이름 중복 방지
				String saveFileName = UUID.randomUUID().toString() + "_" + fileName;

				pi.setPrimg_save_name(saveFileName);

				try {
					// write() -> upload된 파일 저장 메서드
					part.write(uploadPath + File.separator + saveFileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
				plist.add(pi);
			}
		}
				
		//DB에 insert
		IPimageService imgsv = PimageServiceImpl.getInstance();
		
		for (PimageVO pivo : plist) {
			System.out.println(pivo);
			imgsv.insertPimage(pivo);
		}
				
		response.sendRedirect(request.getContextPath() + "/pboard/pboard.jsp");
		
	}

	private String extractFileName(Part part) {
		String fileName = "";
		String headerValue = part.getHeader("content-disposition");

		String[] items = headerValue.split(";");
		for (String item : items) {
			if (item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}
		return fileName;
	}
}
