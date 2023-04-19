package controller.member;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import vo.MemberVO;

@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, //1mb = 1024byte * 1024  byte
		maxRequestSize = 1024 * 1024 * 100)
@WebServlet("/memberUpdate.do")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String add = request.getParameter("add");
		String tel = request.getParameter("tel");
		
		MemberVO memVo = (MemberVO)request.getSession().getAttribute("memberVo");
		String mem_id = memVo.getMem_id();
	
		// 업로드된 파일이 저장될 폴더 설정
		String uploadPath = "C:/Users/gram/Desktop/tboard_image";
				
		// 저장될 폴더가 없으면 새로 만든다.
		File file = new File(uploadPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String fileName = "";
		
		MemberVO memberVo = new MemberVO();
		for (Part part : request.getParts()) {
			fileName = extractFileName(part);
			
			if(!"".equals(fileName)) {
				
				String saveFileName = UUID.randomUUID().toString() + "_"+fileName;
				
				memberVo.setMem_image(saveFileName);
				
				try {
					// 업로드된 파일 저장
					part.write(uploadPath + File.separator + saveFileName); // 파일 저장하기
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		memberVo.setMem_id(mem_id);
		memberVo.setMem_name(name);
		memberVo.setMem_nickname(nickname);
		memberVo.setMem_add(add);
		memberVo.setMem_tel(tel);
		
		IMemberService service = MemberServiceImpl.getInstance();
		int updatemember = service.updatemember(memberVo);
		request.getSession().removeAttribute("memberVo");
		MemberVO memberVo1 = service.selectMemberById(mem_id);
		request.getSession().setAttribute("memberVo", memberVo1);
		response.sendRedirect(request.getContextPath() + "/home/main.jsp");
	}

	private String extractFileName(Part part) {
		String fileName = "";
		String headerValue = part.getHeader("content-disposition"); // 헤더의 '키값'을 이용하여 값을 구한다.
		//System.out.println("headerValue : " + headerValue);
		String[] items = headerValue.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=")+2, item.length()-1);
			}
		}
		
		return fileName;
	}

}


