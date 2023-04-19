package vo;

public class ScommentVO {
	int scomment_id;
	int scomment_pid = 0;
	int sboard_id;
	String mem_id; 
	String scomment_content;
	String scomment_cdate;
	String scomment_mdate;
	String scomment_rdate;
	String scomment_isremove;
	String mem_nickname;
	int level;
	int startScomment;
	int endScomment;
	int scomment_writer;
	
	public int getScomment_id() {
		return scomment_id;
	}
	public void setScomment_id(int scomment_id) {
		this.scomment_id = scomment_id;
	}
	public int getScomment_pid() {
		return scomment_pid;
	}
	public void setScomment_pid(int scomment_pid) {
		this.scomment_pid = scomment_pid;
	}
	public int getSboard_id() {
		return sboard_id;
	}
	public void setSboard_id(int sboard_id) {
		this.sboard_id = sboard_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getScomment_content() {
		return scomment_content;
	}
	public void setScomment_content(String scomment_content) {
		this.scomment_content = scomment_content;
	}
	public String getScomment_cdate() {
		return scomment_cdate;
	}
	public void setScomment_cdate(String scomment_cdate) {
		this.scomment_cdate = scomment_cdate;
	}
	public String getScomment_mdate() {
		return scomment_mdate;
	}
	public void setScomment_mdate(String scomment_mdate) {
		this.scomment_mdate = scomment_mdate;
	}
	public String getScomment_rdate() {
		return scomment_rdate;
	}
	public void setScomment_rdate(String scomment_rdate) {
		this.scomment_rdate = scomment_rdate;
	}
	public String getScomment_isremove() {
		return scomment_isremove;
	}
	public void setScomment_isremove(String scomment_isremove) {
		this.scomment_isremove = scomment_isremove;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStartScomment() {
		return startScomment;
	}
	public void setStartScomment(int startScomment) {
		this.startScomment = startScomment;
	}
	public int getEndScomment() {
		return endScomment;
	}
	public void setEndScomment(int endScomment) {
		this.endScomment = endScomment;
	}
	public int getScomment_writer() {
		return scomment_writer;
	}
	public void setScomment_writer(int scomment_writer) {
		this.scomment_writer = scomment_writer;
	}
	
	
	
	
}
