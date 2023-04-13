
package controller.sboard;

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
import javax.servlet.http.Part;

import service.sboardService.ISboardService;
import service.sboardService.SboardServiceImpl;
import service.simageService.ISimageService;
import service.simageService.SimageServiceImpl;
import vo.SboardVO;
import vo.SimageVO;

@WebServlet("/InsertSboard.do")
@MultipartConfig(
		//1024Kbyte = 1Mbyte ,1Kbyte = 1024byte
		fileSizeThreshold = 1024 * 1024 * 10 , maxFileSize = 1024 * 1024 * 30,
		maxRequestSize = 1024 * 1024 * 100 ) 
public class InsertSboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		SboardVO sb = new SboardVO();

		sb.setMem_id(request.getParameter("memId"));
		System.out.println("id : " + request.getParameter("memId"));
		sb.setSboard_content(request.getParameter("content"));
		sb.setSboard_title(request.getParameter("title"));

		ISboardService bService = SboardServiceImpl.getInstance(); 

		int res = bService.sboardInsert(sb);
		System.out.println(sb.getSboard_id()); //실제로 selectKey에서 boardid저장해줌

		if(res > 0) { // board에 게시글 등록이 성공하면
			String uploadPath = "e:/cokkiri/imgServer";

			// 저장될 폴더가 없으면 새로 만든다.
			File f = new File(uploadPath);
			if(!f.exists()) { // 파일이 없으면
				f.mkdirs(); // 폴더 생성
			}
			// 수신 받은 파일 데이터 처리하기
			String fileName = "";

			List<SimageVO> imgList = new ArrayList<>(); //수신받을 여러개 파일 list에 저장

			for(Part part : request.getParts()) {
				fileName = extractFileName(part); // 파일명 추출해옴
				System.out.println(fileName);
				if(!"".equals(fileName)){ // 파일인지 검사 
					
					SimageVO si = new SimageVO(); //1개의 파일 저장할 vo객체 생성
					
					si.setSboard_id(sb.getSboard_id());
					si.setSimg_origin_name(fileName);
					
					//중복 방지용 저장될 파일 네임 생성
					String saveFileName = UUID.randomUUID().toString() + "_" + fileName;
					si.setSimg_save_name(saveFileName);
					
					try {
						part.write(uploadPath + File.separator + saveFileName); //파일 저장하기
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					imgList.add(si); //list에 해당 객체 추가
				}
				
			}
			
			ISimageService mService = SimageServiceImpl.getInstance();
			
			for (SimageVO mvo : imgList) {
				mService.simageInsert(mvo);
			}
			
			response.sendRedirect(request.getContextPath() + "/sessionLogin.do");
		}

	}
	
	// Part구조 안에서 파일명을 찾는 메서드
	private String extractFileName(Part part) {
		String fileName = "";   // 파일명이 저장될 변수
		String headerValue = part.getHeader("content-disposition"); // 헤더의 '키값'을 이용하여 값을 구한다.
		
		String[] items = headerValue.split(";");
		for (String item : items) {
			// filename으로 시작하는 것만
			if(item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=")+2, item.length()-1);
			}
			
		}
		//빈문자가 넘어가면 파일이 아니란것
		return fileName;
	}


}



