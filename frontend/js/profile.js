/**
 * 
 */
/**
 * 
 */
 
function readURL(input){
	if(input.files && input.files[0]){
		var reader = new FileReader(); //파일 읽기위한 객체 생성
		reader.onload = function(e){ //파일 읽어 들이기 성공했을 때 호출되는 이벤트핸들러
			vimg = `<div class="img_div" id="img_div${fcnt}">
			          <img class="img" id="img${fcnt}" src="#" alt="image">
			          <img class="img_del" src="${mypath}/images/x마크.png">
			        </div>`
			$('.img_wrap'+fcnt).before(vimg); //버튼 앞에 이미지 틀 생성
			//이미지 Tag의 src속성에 읽어들인 File내용을 지정
			$('#img'+fcnt).attr('src', e.target.result)
			
			//기존에 있던 img_wrap을 숨기고 새로운 img_wrap을 만들자
			$('.img_wrap'+fcnt).css("display", "none");
			
			//새로운 img_wrap 생성
			vwrap = `<div class="img_wrap${fcnt+1}">
						<input type="file" class="file" id="f${fcnt+1}" name="img_file${fcnt+1}">
						<div class="file_background">
							<label for="f${fcnt+1}">
								<img class="img_up" src="${mypath}/images/카메라.png">
								</label>
							</div>
						</div>`;
			//첨부한img 뒤에 추가
			$('.rg_images').append(vwrap);
			fcnt = fcnt + 1;
			
			if($('.file').length == 7){
				$('.rg_images div:nth-child(14)').css("display", "none");
				return;
			}
	
		}
		reader.readAsDataURL(input.files[0]);//File내용을 읽어 dataURL형식의 문자열롷 저장
	}
}