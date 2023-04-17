package vo;

/**
 * @author PC-26
 *
 */
public class WebMessageVO {
	private String sender;
	private String reciever;
	private String message;
	private Long room_id;
	private Long message_id;
	private int noread;
	private Long croom_id;
	private int res;
	
	
	
	public int getRes() {
		return res;
	}
	public void setRes(int res) {
		this.res = res;
	}
	public Long getCroom_id() {
		return croom_id;
	}
	public void setCroom_id(Long croom_id) {
		this.croom_id = croom_id;
	}
	public int getNoread() {
		return noread;
	}
	public void setNoread(int noread) {
		this.noread = noread;
	}
	public Long getMessage_id() {
		return message_id;
	}
	public void setMessage_id(Long message_id) {
		this.message_id = message_id;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Long getRoom_id() {
		return room_id;
	}
	public void setRoom_id(Long room_id) {
		this.room_id = room_id;
	}
	@Override
	public String toString() {
		return "WebMessageVO [sender=" + sender + ", reciever=" + reciever + ", message=" + message + ", room_id="
				+ room_id + ", message_id=" + message_id + ", noread=" + noread + ", croom_id=" + croom_id + "]";
	}
	
	
	
	
}
