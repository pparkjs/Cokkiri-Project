package vo;

public class TBoardVO {
	private Long tboard_id;
	private String mem_id;
	private String category_id;
	private String tboard_title;
	private String tboard_content;
	private String tboard_state;
	private int tboard_price;
	private int tboard_hit;
	private String tboard_cdate;
	private String tboard_mdate;
	private String tboard_rdate;
	private String tboard_completedate;

	

	public int getTboard_hit() {
		return tboard_hit;
	}
	public void setTboard_hit(int tboard_hit) {
		this.tboard_hit = tboard_hit;
	}
	public Long getTboard_id() {
		return tboard_id;
	}
	public void setTboard_id(Long tboard_id) {
		this.tboard_id = tboard_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getTboard_title() {
		return tboard_title;
	}
	public void setTboard_title(String tboard_title) {
		this.tboard_title = tboard_title;
	}
	public String getTboard_content() {
		return tboard_content;
	}
	public void setTboard_content(String tboard_content) {
		this.tboard_content = tboard_content;
	}
	public String getTboard_state() {
		return tboard_state;
	}
	public void setTboard_state(String tboard_state) {
		this.tboard_state = tboard_state;
	}
	public int getTboard_price() {
		return tboard_price;
	}
	public void setTboard_price(int tboard_price) {
		this.tboard_price = tboard_price;
	}
	public String getTboard_cdate() {
		return tboard_cdate;
	}
	public void setTboard_cdate(String tboard_cdate) {
		this.tboard_cdate = tboard_cdate;
	}
	public String getTboard_mdate() {
		return tboard_mdate;
	}
	public void setTboard_mdate(String tboard_mdate) {
		this.tboard_mdate = tboard_mdate;
	}
	public String getTboard_rdate() {
		return tboard_rdate;
	}
	public void setTboard_rdate(String tboard_rdate) {
		this.tboard_rdate = tboard_rdate;
	}
	public String getTboard_completedate() {
		return tboard_completedate;
	}
	public void setTboard_completedate(String tboard_completedate) {
		this.tboard_completedate = tboard_completedate;
	}
	@Override
	public String toString() {
		return "TBoardVO [tboard_id=" + tboard_id + ", mem_id=" + mem_id + ", category_id=" + category_id
				+ ", tboard_title=" + tboard_title + ", tboard_content=" + tboard_content + ", tboard_state="
				+ tboard_state + ", tboard_price=" + tboard_price + ", tboard_hit=" + tboard_hit + ", tboard_cdate="
				+ tboard_cdate + ", tboard_mdate=" + tboard_mdate + ", tboard_rdate=" + tboard_rdate
				+ ", tboard_completedate=" + tboard_completedate + "]";
	}


	
	
	
	
}
