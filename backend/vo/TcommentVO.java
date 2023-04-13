package vo;

public class TcommentVO {
	int tcomment_id;
	int tcomment_pid = 0;
	int tboard_id;
	String mem_id; 
	String tcomment_content;
	String tcomment_cdate;
	String tcomment_mdate;
	String tcomment_rdate;
	String tcomment_secret;
	String tcomment_isremove;
	String mem_nickname;
	int level;
	int startTcomment = 1;
	int endTcomment = 5;
	
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStartTcomment() {
		return startTcomment;
	}
	public void setStartTcomment(int startTcomment) {
		this.startTcomment = startTcomment;
	}
	public int getEndTcomment() {
		return endTcomment;
	}
	public void setEndTcomment(int endTcomment) {
		this.endTcomment = endTcomment;
	}
	public int getTcomment_id() {
		return tcomment_id;
	}
	public void setTcomment_id(int tcomment_id) {
		this.tcomment_id = tcomment_id;
	}
	public int getTcomment_pid() {
		return tcomment_pid;
	}
	public void setTcomment_pid(int tcomment_pid) {
		this.tcomment_pid = tcomment_pid;
	}
	public int getTboard_id() {
		return tboard_id;
	}
	public void setTboard_id(int tboard_id) {
		this.tboard_id = tboard_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getTcomment_content() {
		return tcomment_content;
	}
	public void setTcomment_content(String tcomment_content) {
		this.tcomment_content = tcomment_content;
	}
	public String getTcomment_cdate() {
		return tcomment_cdate;
	}
	public void setTcomment_cdate(String tcomment_cdate) {
		this.tcomment_cdate = tcomment_cdate;
	}
	public String getTcomment_mdate() {
		return tcomment_mdate;
	}
	public void setTcomment_mdate(String tcomment_mdate) {
		this.tcomment_mdate = tcomment_mdate;
	}
	public String getTcomment_rdate() {
		return tcomment_rdate;
	}
	public void setTcomment_rdate(String tcomment_rdate) {
		this.tcomment_rdate = tcomment_rdate;
	}
	public String getTcomment_secret() {
		return tcomment_secret;
	}
	public void setTcomment_secret(String tcomment_secret) {
		this.tcomment_secret = tcomment_secret;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getTcomment_isremove() {
		return tcomment_isremove;
	}
	public void setTcomment_isremove(String tcomment_isremove) {
		this.tcomment_isremove = tcomment_isremove;
	}
}
