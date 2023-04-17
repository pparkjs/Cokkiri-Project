package vo;

public class PageVO {
	//한 페이지 내의 게시글의 시작과 끝
	private int start;
	private int end;
	
	//한 화면에 보이는 페이지의 시작과 끝
	private int startPage;
	private int endPage;
	private int totalPage; //전체 페이지 수
	private int count; //전체 게시글 수
	private int pageNum;  //현재 내가 있는 페이지번호
	
	private static int perList = 7; //한 페이지에 출력될 게시글 수
	private static int perPage = 4; //한 화면에 보이는 페이지 수
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public static int getPerList() {
		return perList;
	}
	public static void setPerList(int perList) {
		PageVO.perList = perList;
	}
	public static int getPerPage() {
		return perPage;
	}
	public static void setPerPage(int perPage) {
		PageVO.perPage = perPage;
	}
	
	
	
}
