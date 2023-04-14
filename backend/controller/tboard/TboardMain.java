package controller.tboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.tboardService.TboardServiceImpl;
import vo.MemberVO;
import vo.TBoardAndAttVO;
import vo.TBoardVO;
import vo.TImageVO;

@WebServlet("/tboardMain.do")
public class TboardMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect(request.getContextPath()+"/tboard/tboard.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String page = request.getParameter("page");
		String category = request.getParameter("category");
		String sword = request.getParameter("sword");
		String state = request.getParameter("state");
		Map<String, Object> map = new HashMap<>();
		if (page != null) {
			map.put("page_num", page);
		}
		if (category != null && !category.equals("default")) {
			map.put("category", category);
		}

		if (sword != null) {
			map.put("sword", sword);
		}
		
		if(state!=null) {
			map.put("state", state);
		}

		/*
		 session 유저 정보에 있는 지역 이름을 맵에 포함시켜야함
		 */
		HttpSession session = request.getSession();
		String smem_id = (String)session.getAttribute("id");
		IMemberService service2 = MemberServiceImpl.getInstance();
		MemberVO smemberVO = service2.selectMemberinfo(smem_id);
		map.put("region", smemberVO.getMem_add().split(" ")[0]);
		
		TboardServiceImpl service = TboardServiceImpl.getInstance();
		
		List<TBoardAndAttVO>list=new ArrayList<>();
		List<TBoardVO> List = null;
		if(request.getParameter("one")!=null) {
			List = service.selecttboardsByPagefromOne(map);
		}else {
			List = service.selecttboardsByPage(map);	
		}
		
		for (TBoardVO boardVO : List) {
			TBoardAndAttVO tBoardAndAttVO = new TBoardAndAttVO();
			if(boardVO.getTboard_title().getBytes().length>18) {
				String title=boardVO.getTboard_title();
				if(title.length()>16) {
					boardVO.setTboard_title(title.substring(0, 16)+"..");
				}else if(title.length()>10){			
					boardVO.setTboard_title(title.substring(0, title.length()-title.length()/3)+"..");
				}
				
			}
			tBoardAndAttVO.setBoardVO(boardVO);

			List<TImageVO> imgList = service.selecttImgBytboardId(boardVO.getTboard_id());
			MemberVO memberVO = service2.selectMemberinfo(boardVO.getMem_id());
			
			tBoardAndAttVO.setWriter(memberVO);

			int mylistNum = service.selectMylistNum(boardVO.getTboard_id());
			
			tBoardAndAttVO.setMylist(mylistNum);
			
			if(imgList.size()==0) {
				list.add(tBoardAndAttVO);
				continue;
			}
			tBoardAndAttVO.setFimgid(imgList.get(0).getTimg_id());
			list.add(tBoardAndAttVO);
		}
		
		
		Gson gson = new Gson(); 
		String json =gson.toJson(list); 
		PrintWriter out = response.getWriter(); 
		out.print(json);
		out.flush();
		
	}

}
