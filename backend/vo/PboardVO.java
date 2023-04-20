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
	private int pboard_fimg;
	
	// 이미지 테이블의 컬럼 추가
	private int pimg_id;
	private String pimg_origin_name;
	private String primg_save_name;
	
	// 상태 테이블의 컬럼 추가
	private int pbstate_likenum;
	private int pbstate_like;
	private int pbstate_unlike;
	
	// 내가 누른 좋아요 와 싫어요 
	private int me_like;
	private int me_unlike;
	
	// 내가 누른 신고 체크
	private int me_notify;
	
	private String region;
	
	// 신고 일자
	private String pnotify_date;
	
	// 신고 합계
	private String sum_notify ;
	
	
	public int getPboard_fimg() {
		return pboard_fimg;
	}
	public void setPboard_fimg(int pboard_fimg) {
		this.pboard_fimg = pboard_fimg;
	}
	public int getPimg_id() {
		return pimg_id;
	}
	public void setPimg_id(int pimg_id) {
		this.pimg_id = pimg_id;
	}
	public String getPimg_origin_name() {
		return pimg_origin_name;
	}
	public void setPimg_origin_name(String pimg_origin_name) {
		this.pimg_origin_name = pimg_origin_name;
	}
	public String getPrimg_save_name() {
		return primg_save_name;
	}
	public void setPrimg_save_name(String primg_save_name) {
		this.primg_save_name = primg_save_name;
	}
	public int getPbstate_likenum() {
		return pbstate_likenum;
	}
	public void setPbstate_likenum(int pbstate_likenum) {
		this.pbstate_likenum = pbstate_likenum;
	}
	public int getPbstate_like() {
		return pbstate_like;
	}
	public void setPbstate_like(int pbstate_like) {
		this.pbstate_like = pbstate_like;
	}
	public int getPbstate_unlike() {
		return pbstate_unlike;
	}
	public void setPbstate_unlike(int pbstate_unlike) {
		this.pbstate_unlike = pbstate_unlike;
	}
	public int getMe_like() {
		return me_like;
	}
	public void setMe_like(int me_like) {
		this.me_like = me_like;
	}
	public int getMe_unlike() {
		return me_unlike;
	}
	public void setMe_unlike(int me_unlike) {
		this.me_unlike = me_unlike;
	}
	public int getMe_notify() {
		return me_notify;
	}
	public void setMe_notify(int me_notify) {
		this.me_notify = me_notify;
	}

	public String getSum_notify() {
		return sum_notify;
	}
	public void setSum_notify(String sum_notify) {
		this.sum_notify = sum_notify;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	
	public int getPboard_id() {
		return pboard_id;
	}
	public String getPboard_addr() {
		return pboard_addr;
	}
	public void setPboard_addr(String pboard_addr) {
		this.pboard_addr = pboard_addr;
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
	public String getPnotify_date() {
		return pnotify_date;
	}
	public void setPnotify_date(String pnotify_date) {
		this.pnotify_date = pnotify_date;
	}
	
	
		
}
