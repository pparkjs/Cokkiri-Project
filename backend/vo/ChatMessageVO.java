package vo;

public class ChatMessageVO {
	private Long message_id;
	private String message_content;
	private String message_isread;
	private String message_cdate;
	private Long room_id;
	private String mem_id;
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
