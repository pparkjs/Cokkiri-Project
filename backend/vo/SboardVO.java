package vo;

public class SboardVO {
	private int sboard_id;
	private String sboard_title;
	private String mem_id;
	private String sboard_content;
	private String sboard_cdate;
	private String sboard_mdate;
	private String sboard_rdate;
	private int sboard_hit;
	
	// 이미지 테이블의 컬럼 추가
	private int simage_id;
	private String simg_origin_name;
	private String simg_save_name;
	
	public int getSboard_id() {
		return sboard_id;
	}
	public void setSboard_id(int sboard_id) {
		this.sboard_id = sboard_id;
	}
	public String getSboard_title() {
		return sboard_title;
	}
	public void setSboard_title(String sboard_title) {
		this.sboard_title = sboard_title;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getSboard_content() {
		return sboard_content;
	}
	public void setSboard_content(String sboard_content) {
		this.sboard_content = sboard_content;
	}
	public String getSboard_cdate() {
		return sboard_cdate;
	}
	public void setSboard_cdate(String sboard_cdate) {
		this.sboard_cdate = sboard_cdate;
	}
	public String getSboard_mdate() {
		return sboard_mdate;
	}
	public void setSboard_mdate(String sboard_mdate) {
		this.sboard_mdate = sboard_mdate;
	}
	public String getSboard_rdate() {
		return sboard_rdate;
	}
	public void setSboard_rdate(String sboard_rdate) {
		this.sboard_rdate = sboard_rdate;
	}
	public int getSboard_hit() {
		return sboard_hit;
	}
	public void setSboard_hit(int sboard_hit) {
		this.sboard_hit = sboard_hit;
	}
	public int getSimage_id() {
		return simage_id;
	}
	public void setSimage_id(int simage_id) {
		this.simage_id = simage_id;
	}
	public String getSimg_origin_name() {
		return simg_origin_name;
	}
	public void setSimg_origin_name(String simg_origin_name) {
		this.simg_origin_name = simg_origin_name;
	}
	public String getSimg_save_name() {
		return simg_save_name;
	}
	public void setSimg_save_name(String simg_save_name) {
		this.simg_save_name = simg_save_name;
	}

	

}
