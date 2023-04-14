package vo;

public class ChatRoomDetailVO {
	private ChatRoomVO chatRoomVO;
	private int noReadCnt;
	private ChatMessageVO LastMessageVO;
	private MemberVO myMember;
	private MemberVO yourMember;
	private String title;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public ChatRoomVO getChatRoomVO() {
		return chatRoomVO;
	}
	public void setChatRoomVO(ChatRoomVO chatRoomVO) {
		this.chatRoomVO = chatRoomVO;
	}
	public int getNoReadCnt() {
		return noReadCnt;
	}
	public void setNoReadCnt(int noReadCnt) {
		this.noReadCnt = noReadCnt;
	}
	public ChatMessageVO getLastMessageVO() {
		return LastMessageVO;
	}
	public void setLastMessageVO(ChatMessageVO lastMessageVO) {
		LastMessageVO = lastMessageVO;
	}
	public MemberVO getMyMember() {
		return myMember;
	}
	public void setMyMember(MemberVO myMember) {
		this.myMember = myMember;
	}
	public MemberVO getYourMember() {
		return yourMember;
	}
	public void setYourMember(MemberVO yourMember) {
		this.yourMember = yourMember;
	}

	
	
}
