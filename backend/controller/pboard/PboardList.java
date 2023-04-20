package controller.pboard;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.pboardService.IPboardService;
import service.pboardService.PboardServiceImpl;
import service.pimageService.IPimageService;
import service.pimageService.PimageServiceImpl;
import vo.MemberVO;
import vo.PboardVO;
import vo.PimageVO;


@WebServlet("/PboardList.do")
public class PboardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int more = Integer.parseInt(request.getParameter("more"));
		
		String vtype = request.getParameter("pb_type");
		String vtext = request.getParameter("pb_search");
		String region = request.getParameter("region");
		
		IPboardService service = PboardServiceImpl.getInstance();
		HttpSession session = request.getSession();
		
		MemberVO memVo =  (MemberVO)session.getAttribute("memberVo");
		String memId = memVo.getMem_id();
		Map<String, Object> morePage = service.morePage(more, vtype, vtext, memId, region);
		
		List<PboardVO> list = service.selectByPage(morePage);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/pboardList.jsp").forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		
		int more = Integer.parseInt(request.getParameter("more"));
		
		String vtype = request.getParameter("pb_type");
		String vtext = request.getParameter("pb_search");
		String region = request.getParameter("region");
		
		IPboardService service = PboardServiceImpl.getInstance();
		IPimageService imgservice = PimageServiceImpl.getInstance();
		HttpSession session = request.getSession();

		MemberVO memVo =  (MemberVO)session.getAttribute("memberVo");
		String memId = memVo.getMem_id();
		
		Map<String, Object> morePage = service.morePage(more, vtype, vtext, memId, region);
		List<PboardVO> list = service.selectByPage(morePage);
		
		for (int i=0; i<list.size(); i++) {
			PboardVO pboardVO = list.get(i);
			List<PimageVO> ilist = imgservice.selectPimage(pboardVO.getPboard_id());
			if(ilist!=null&&ilist.size()!=0) {
				pboardVO.setPboard_fimg(ilist.get(0).getPimg_id());
			}
			list.set(i, pboardVO);
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/pboardList.jsp").forward(request, response);
	}

}
