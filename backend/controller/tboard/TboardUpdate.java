package controller.tboard;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;
import vo.MemberVO;
import vo.TBoardVO;
import vo.TImageVO;


@WebServlet("/tboardUpdate.do")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*10, maxFileSize = 1024*1024*30,
		maxRequestSize = 1024*1024*100
		)
public class TboardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
	  	String state = request.getParameter("state");
	  	String title = request.getParameter("title");	
	  	String content = request.getParameter("content");	
	  	String tboard_id = request.getParameter("tboard_id");
	  	//session에서 memid를 꺼냈다고 가정
	  	MemberVO smem = (MemberVO)request.getSession().getAttribute("memberVo");
	  	
	  	//tboardVO 생성
	  	TBoardVO tBoardVO = new TBoardVO();
	  	tBoardVO.setTboard_id(Long.parseLong(tboard_id));
	  	tBoardVO.setCategory_id(category);
	  	tBoardVO.setTboard_price(price);
	  	tBoardVO.setTboard_state(state);
	  	tBoardVO.setTboard_title(title);
	  	tBoardVO.setTboard_content(content);
	  	if(!smem.getAdmin_auth().equals("Y")) {
	  		tBoardVO.setMem_id(smem.getMem_id());
	  	}

	  	ITboardService service = TboardServiceImpl.getInstance();
	  	int upTboard = service.updateTboard(tBoardVO);
	  	List<TImageVO> ilist = service.selecttImgBytboardId(Long.parseLong(tboard_id));
	  	int delImage=0;
	  	if(ilist.size()==0) {
	  		delImage=1;
	  	}else {
	  		delImage = service.deleteTimages(Long.parseLong(tboard_id));
	  	}
	  	PrintWriter out = response.getWriter();
	  	if(upTboard==0||delImage==0) {
	  		out.print("false");
	  		return;
	  	}
	  	
	  	
	  	
		// 업로드될 파일 경로 설정
		String uploadPath = "C:/Users/PC-26/Desktop/tboard_image";

		// 저장될 폴더가 없으면 새로만든다.
		File f = new File(uploadPath);

		if (!f.exists()) {
			f.mkdirs();
		}
		
		
		

		// 수신 받은 파일 데이터 처리하기
		String fileName = ""; // 파일명이 저장될 변수 선언

		// 수신 받은 파잏이 여러개일 때 Upload한 파일 목록이 저장될 List객체 생성
		List<TImageVO> list = new ArrayList<>();

		/*
		 * servlet 3.0 이상에서 새롭게 추가된 upload용 메서드 1. request.getParts() ==> 전체 part객체를
		 * collection객체에 담아서 반환한다. 2. request.getPart("part이름") ==> 지정된 part이름 을 가진 개별
		 * part 객체를 반환한다. form태그 안에 입력요소의 name값으로 구별한다.
		 */

		// 전체 part객체 개수만큼 반복 처리하기
		for (Part part : request.getParts()) {
			fileName = extractFileName(part);

			// 찾은 파일명이 빈 문자열이면 이것은 파일이 아니다.
			if (!"".equals(fileName)) { // 파일인지 검사
				// 1개의 upload파일에 대한 정보를 저장하기
				TImageVO tImageVO = new TImageVO();
				tImageVO.setTboard_id(Long.parseLong(tboard_id));
				tImageVO.setTimg_origin_name(fileName);// 원본파일명 저장

				// 실제 저장되는 파일 이름이 중복되는 것을 방지하기 위해서 uuid객체를 이용하여
				// 저장할 파일명을 만든다.
				String saveFileName = UUID.randomUUID().toString();

				// 이 값을 VO에 저장 파일명으로 저장한다.
				tImageVO.setTimg_save_name(saveFileName);

				try {
					// part.write()메서드 ==> upload된 파일을 저장하는 메서드
					part.write(uploadPath + File.separator + saveFileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
				list.add(tImageVO);
			}

		}

		// List에 저장된 파일정보를 db에 insert한다.

	

		for (TImageVO tImageVO : list) {
			service.insertImage(tImageVO);
		}

		out.print("true");
	
	}
	
	private String extractFileName(Part part) {
		String fileName="";
		String headerValue = part.getHeader("content-disposition"); //헤더의 키값을 이용하여 값읗 구한다.
		String[] items = headerValue.split(";");
		
		for (String item : items) {
			if(item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=")+2,item.length()-1);
			}
		}
		
		return fileName;
	}


}
