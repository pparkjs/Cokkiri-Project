package vo;

public class ChatMessageVO {
	private Long message_id;
	private String message_content;
	private String message_isread;
	private String message_cdate;
	private Long room_id;
	private String mem_id;
	private int res;
	private MemberVO ymem;
	private String sender;
	private String reciever;
	private int noread;
	private Long croom_id;
	private String message;
	
	
	
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReciever() {
		return reciever;
	}
	public void setReciever(String reciever) {
		this.reciever = reciever;
	}
	public int getNoread() {
		return noread;
	}
	public void setNoread(int noread) {
		this.noread = noread;
	}
	public Long getCroom_id() {
		return croom_id;
	}
	public void setCroom_id(Long croom_id) {
		this.croom_id = croom_id;
	}
	public MemberVO getYmem() {
		return ymem;
	}
	public void setYmem(MemberVO ymem) {
		this.ymem = ymem;
	}
	public int getRes() {
		return res;
	}
	public void setRes(int res) {
		this.res = res;
	}
	public Long getMessage_id() {
		return message_id;
	}
	public void setMessage_id(Long message_id) {
		this.message_id = message_id;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_isread() {
		return message_isread;
	}
	public void setMessage_isread(String message_isread) {
		this.message_isread = message_isread;
	}
	public String getMessage_cdate() {
		return message_cdate;
	}
	public void setMessage_cdate(String message_cdate) {
		this.message_cdate = message_cdate;
	}
	public Long getRoom_id() {
		return room_id;
	}
	public void setRoom_id(Long room_id) {
		this.room_id = room_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	@Override
	public String toString() {
		return "ChatMessage [message_id=" + message_id + ", message_content=" + message_content + ", message_isread="
				+ message_isread + ", message_cdate=" + message_cdate + ", room_id=" + room_id + ", mem_id=" + mem_id
				+ "]";
	}
	
	
}
