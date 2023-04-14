package util;

import nl.captcha.text.producer.TextProducer;

// 오디오 캡챠에서 텍스트를 생성하기 위해 사용
// 이미지에 포함된 텍스트를 받아 그 값을 반환함
public class SetTextProducer implements TextProducer{
	private final String getImgAnswer;
	
	public SetTextProducer(String getImgAnswer) {
		this.getImgAnswer = getImgAnswer;
	}
	@Override
	public String getText() {
		// TODO Auto-generated method stub
		return getImgAnswer;
	}
}
