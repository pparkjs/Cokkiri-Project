package vo;

import java.util.List;

public class ChatMessageTboardVO {
	private List<ChatMessageVO> mlist;
	private TBoardVO tBoardVO;
	private MemberVO yourMember;
	private MemberVO seller;
	private TImageVO fTImageVO;
	
	
	
	public TImageVO getfTImageVO() {
		return fTImageVO;
	}
	public void setfTImageVO(TImageVO fTImageVO) {
		this.fTImageVO = fTImageVO;
	}
	public List<ChatMessageVO> getMlist() {
		return mlist;
	}
	public void setMlist(List<ChatMessageVO> mlist) {
		this.mlist = mlist;
	}
	public TBoardVO gettBoardVO() {
		return tBoardVO;
	}
	public void settBoardVO(TBoardVO tBoardVO) {
		this.tBoardVO = tBoardVO;
	}
	public MemberVO getYourMember() {
		return yourMember;
	}
	public void setYourMember(MemberVO yourMember) {
		this.yourMember = yourMember;
	}
	public MemberVO getSeller() {
		return seller;
	}
	public void setSeller(MemberVO seller) {
		this.seller = seller;
	}
	
	
}
