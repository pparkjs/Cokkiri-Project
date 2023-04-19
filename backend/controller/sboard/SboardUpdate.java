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

@WebServlet("/SboardUpdate.do")
@MultipartConfig(
		//1024Kbyte = 1Mbyte ,1Kbyte = 1024byte
		fileSizeThreshold = 1024 * 1024 * 10 , maxFileSize = 1024 * 1024 * 30,
		maxRequestSize = 1024 * 1024 * 100 ) 
public class SboardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		SboardVO sb = new SboardVO(); //실제로 selectKey에서 boardid저장해줌

		int sbId = Integer.parseInt( request.getParameter("sboardId"));

		sb.setSboard_id(sbId); 
		sb.setSboard_content(request.getParameter("content"));
		sb.setSboard_title(request.getParameter("title"));

		ISboardService bService = SboardServiceImpl.getInstance(); 
		ISimageService mService = SimageServiceImpl.getInstance();

		int res = bService.sboardUpdate(sb); //얘는 타이틀이랑 내용 수정 한것

		int fileCnt = mService.simageCount(sbId);

		if(fileCnt > 0) {
			mService.simageDeleteBySboardId(sbId); // 삭제
		}
		String uploadPath = "c:/cokkiri/imgServer";

		// 저장될 폴더가 없으면 새로 만든다.
		File f = new File(uploadPath);
		if(!f.exists()) { // 파일이 없으면
			f.mkdirs(); // 폴더 생성
		}
		// 수신 받은 파일 데이터 처리하기
		String fileName = "";

		List<SimageVO> imgList = new ArrayList<>(); //수신받을 여러개 파일 list에 저장

		for(Part part : request.getParts()) {
			fileName = extractFileName(part); // 저장되어있던 uuid파일명 추출해옴
			if(!"".equals(fileName)){ // 파일인지 검사 

				//원본파일 이름 추출
				//				String cutName = fileName.substring( fileName.indexOf("_")+1);
				SimageVO si = new SimageVO(); //1개의 파일 저장할 vo객체 생성

				si.setSboard_id(sbId);
				si.setSimg_origin_name(fileName);
				//				si.setSimg_save_old(fileName);
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

		int result = 0;

		for (SimageVO mvo : imgList) {
			//			result = mService.simageUpadateByOldName(mvo);
			mService.simageInsert(mvo);
		}

		response.sendRedirect(request.getContextPath() + "/secretboard/sboard.jsp");
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
