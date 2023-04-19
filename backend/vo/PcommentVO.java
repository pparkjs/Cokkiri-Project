package vo;

public class PcommentVO {
	private int pcomment_id;
	private int pcomment_pid = 0;
	private int pboard_id;
	private String mem_id;
	private String pcomment_content;
	private String pcomment_cdate;
	private String pcomment_mdate;
	private String pcomment_rdate;
	private String pcomment_isremove;
	private MemberVO memberVO;
	private int level;
	private int startPcomment;
	private int endPcomment;
	
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStartPcomment() {
		return startPcomment;
	}
	public void setStartPcomment(int startPcomment) {
		this.startPcomment = startPcomment;
	}
	public int getEndPcomment() {
		return endPcomment;
	}
	public void setEndPcomment(int endPcomment) {
		this.endPcomment = endPcomment;
	}
	public int getPcomment_id() {
		return pcomment_id;
	}
	public void setPcomment_id(int pcomment_id) {
		this.pcomment_id = pcomment_id;
	}
	public int getPcomment_pid() {
		return pcomment_pid;
	}
	public void setPcomment_pid(int pcomment_pid) {
		this.pcomment_pid = pcomment_pid;
	}
	public int getPboard_id() {
		return pboard_id;
	}
	public void setPboard_id(int pboard_id) {
		this.pboard_id = pboard_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPcomment_content() {
		return pcomment_content;
	}
	public void setPcomment_content(String pcomment_content) {
		this.pcomment_content = pcomment_content;
	}
	public String getPcomment_cdate() {
		return pcomment_cdate;
	}
	public void setPcomment_cdate(String pcomment_cdate) {
		this.pcomment_cdate = pcomment_cdate;
	}
	public String getPcomment_mdate() {
		return pcomment_mdate;
	}
	public void setPcomment_mdate(String pcomment_mdate) {
		this.pcomment_mdate = pcomment_mdate;
	}
	public String getPcomment_rdate() {
		return pcomment_rdate;
	}
	public void setPcomment_rdate(String pcomment_rdate) {
		this.pcomment_rdate = pcomment_rdate;
	}
	public String getPcomment_isremove() {
		return pcomment_isremove;
	}
	public void setPcomment_isremove(String pcomment_isremove) {
		this.pcomment_isremove = pcomment_isremove;
	}

	
	
}
