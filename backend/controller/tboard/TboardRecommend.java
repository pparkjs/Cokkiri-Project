package controller.tboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.memberService.IMemberService;
import service.memberService.MemberServiceImpl;
import service.tboardService.ITboardService;
import service.tboardService.TboardServiceImpl;
import vo.MemberVO;
import vo.TBoardAndAttVO;
import vo.TBoardVO;
import vo.TImageVO;


@WebServlet("/tboardRecommend.do")
public class TboardRecommend extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String category = request.getParameter("category");
		String smem_id = (String) request.getSession().getAttribute("id");
		Long tboard_id = Long.parseLong(request.getParameter("tboard_id"));
		IMemberService mservice = MemberServiceImpl.getInstance();
		MemberVO memberVO = mservice.selectMemberinfo(smem_id);
		Map<String, Object> map = new HashMap<>();
		map.put("mem_add", memberVO.getMem_add());
		map.put("category", category);
		map.put("cnt",6);
		map.put("tboard_id", tboard_id);
		ITboardService tbservice = TboardServiceImpl.getInstance();
		List<TBoardVO> list = tbservice.selectTboardRecommend(map);
		List<TBoardAndAttVO> res = new ArrayList<>();
		if(list!=null&&list.size()!=0) {
			for (TBoardVO boardVO : list) {
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

				List<TImageVO> imgList = tbservice.selecttImgBytboardId(boardVO.getTboard_id());
				memberVO = mservice.selectMemberinfo(boardVO.getMem_id());
				
				tBoardAndAttVO.setWriter(memberVO);

				int mylistNum = tbservice.selectMylistNum(boardVO.getTboard_id());
				
				tBoardAndAttVO.setMylist(mylistNum);
				
				if(imgList.size()==0) {
					res.add(tBoardAndAttVO);
					continue;
				}
				tBoardAndAttVO.setFimgid(imgList.get(0).getTimg_id());
				res.add(tBoardAndAttVO);
			}
		}
		response.setContentType("text/html; charset=utf-8");
		Gson gson = new Gson();
		String json = gson.toJson(res);
		response.getWriter().print(json);
		
	}

}
