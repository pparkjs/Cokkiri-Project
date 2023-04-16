package controller.tboard;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;

import com.google.gson.Gson;

import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;
import vo.TImageVO;
import vo.TimageFileVO;

@WebServlet("/ModifyImage.do")
public class ModifyImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		Long timg_id = Long.parseLong(request.getParameter("timg_id"));

		ITboardService service = TboardServiceImpl.getInstance();
		TImageVO tImageVO = service.selectImage(timg_id);
		List<TImageVO> ilist = service.selecttImgBytboardId(timg_id);

		// 업로드된 파일들이 저장된 폴더 설정
		String uploadPath = "C:/Users/변정민/Desktop/tboard_image";

		File f = new File(uploadPath);
		if (!f.exists()) {
			f.mkdirs();
		}

		// 다운 받을 파일의 정보를 갖는 file객체 생성 ==> 실제 저장된 파일명 지정
		String imgPath = uploadPath + File.separator + tImageVO.getTimg_save_name();
		File imgFile = new File(imgPath);

		if (imgFile.exists()) {
			BufferedInputStream bin = null;
			BufferedOutputStream bout = null;

			try { // 출력용 스트림 객체 생성
				bout = new BufferedOutputStream(response.getOutputStream());
				bin = new BufferedInputStream(new FileInputStream(imgFile));

				byte[] temp = new byte[1024];
				int len = 0;
				while ((len = bin.read(temp)) > 0) {
					bout.write(temp, 0, len);
				}
				bout.flush();

			} catch (Exception e) {
				System.out.println("입출력 오류: " + e.getMessage());
			} finally {
				if (bin != null)
					bin.close();
				if (bout != null)
					bout.close();
			}

		}
		
		
		
		
		
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");


		
		Long tboard_id = Long.parseLong(request.getParameter("tboard_id"));

		ITboardService service = TboardServiceImpl.getInstance();
		List<TImageVO> ilist = service.selecttImgBytboardId(tboard_id);
		List<TimageFileVO> flist = new ArrayList<>();
		
		// 업로드된 파일들이 저장된 폴더 설정
		String uploadPath = "C:/Users/PC-26/Desktop/tboard_image";

		File f = new File(uploadPath);
		if (!f.exists()) {
			f.mkdirs();
		}

		for(int i=0; i<ilist.size(); i++) {
		// 다운 받을 파일의 정보를 갖는 file객체 생성 ==> 실제 저장된 파일명 지정
		String imgPath = uploadPath + File.separator + ilist.get(i).getTimg_save_name();
		File imgFile = new File(imgPath);

		if (imgFile.exists()) {
			BufferedInputStream bin = null;
			ByteArrayOutputStream bout = null;

			try { // 출력용 스트림 객체 생성
				bout = new ByteArrayOutputStream();
				bin = new BufferedInputStream(new FileInputStream(imgFile));

				byte[] temp = new byte[1024];
				int len = 0;
				while ((len = bin.read(temp)) > 0) {
					bout.write(temp, 0, len);
				}
				bout.flush();

				TimageFileVO timageFileVO = new TimageFileVO();
				timageFileVO.setOriginName(ilist.get(i).getTimg_origin_name());
				timageFileVO.setSaveName(ilist.get(i).getTimg_save_name());
				byte[] fileArray = bout.toByteArray();
				String fileString = new String(Base64.encodeBase64(fileArray));
				timageFileVO.setFile(fileString);
				flist.add(timageFileVO);
				
			} catch (Exception e) {
				System.out.println("입출력 오류: " + e.getMessage());
			} finally {
				if (bin != null)
					bin.close();
				if (bout != null)
					bout.close();
			}

		}
		}
		Gson gson = new Gson();
		String json = gson.toJson(flist);
		response.getWriter().print(json);
		
		
		
	}
	

	private String getEncodedFileName(HttpServletRequest request, String filename) {
		String encodedFilename = "";

		String userAgent = request.getHeader("user-agent");

		try {
			if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
				encodedFilename = "filename=\"" + URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "\\ ") + "\"";
			} else {
				encodedFilename = "filename*=UTF-8''" + URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");
			}
		} catch (Exception e) {
			throw new RuntimeException("지원하지 않는 브라우저입니다,");
		}

		return encodedFilename;
	}
}
