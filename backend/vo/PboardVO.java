package vo;

public class PboardVO {

	private int pboard_id;
	private String mem_id;
	private String pboard_title;
	private String pboard_content;
	private int pboard_hit;
	private String pboard_cdate;
	private String pboard_mdate;
	private String pboard_rdate;
	private String pboard_addr;
	private double lat;
	private double lng;
	
	public int getPboard_id() {
		return pboard_id;
	}
	public String getPboard_addr() {
		return pboard_addr;
	}
	public void setPboard_addr(String pboard_addr) {
		this.pboard_addr = pboard_addr;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
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
	public String getPboard_title() {
		return pboard_title;
	}
	public void setPboard_title(String pboard_title) {
		this.pboard_title = pboard_title;
	}
	public String getPboard_content() {
		return pboard_content;
	}
	public void setPboard_content(String pboard_content) {
		this.pboard_content = pboard_content;
	}
	public int getPboard_hit() {
		return pboard_hit;
	}
	public void setPboard_hit(int pboard_hit) {
		this.pboard_hit = pboard_hit;
	}
	public String getPboard_cdate() {
		return pboard_cdate;
	}
	public void setPboard_cdate(String pboard_cdate) {
		this.pboard_cdate = pboard_cdate;
	}
	public String getPboard_mdate() {
		return pboard_mdate;
	}
	public void setPboard_mdate(String pboard_mdate) {
		this.pboard_mdate = pboard_mdate;
	}
	public String getPboard_rdate() {
		return pboard_rdate;
	}
	public void setPboard_rdate(String pboard_rdate) {
		this.pboard_rdate = pboard_rdate;
	}
	
	
		
}
