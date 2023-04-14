package vo;

public class ChatRoomVO {
	private Long room_id;
	private Long tboard_id;
	private String mem_id;
	private String room_cdate;
	public Long getRoom_id() {
		return room_id;
	}
	public void setRoom_id(Long room_id) {
		this.room_id = room_id;
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
	public String getRoom_cdate() {
		return room_cdate;
	}
	public void setRoom_cdate(String room_cdate) {
		this.room_cdate = room_cdate;
	}
	@Override
	public String toString() {
		return "ChatRoomVO [room_id=" + room_id + ", tboard_id=" + tboard_id + ", mem_id=" + mem_id + ", room_cdate="
				+ room_cdate + "]";
	}
	
	
}
