<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<% String id = request.getParameter("memId"); %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script>
fcnt = 1;
$(function(){
	//제목 글자수 제한
	$('#ta1').on('keyup', function(){
		$('#maxTitle').html("("+$(this).val().length+" / 70)");
		
		if($(this).val().length > 70){
			$(this).val($(this).val().substring(0, 70));
			$('#maxTitle').html("(70 / 70)");
		}
	})
	
	//내용 글자수 제한
	$('#ta2').on('keyup', function(){
		$('#maxContent').html("("+$(this).val().length+" / 500)");
		
		if($(this).val().length > 500){
			$(this).val($(this).val().substring(0, 500));
			$('#maxContent').html("(500 / 500)");
		}
	})
	
	$('.rg_btn').on('click',function(){
		
		title = $('#ta1').val();
		content = $('#ta2').val();
		console.log(title, content)
		
		if(title != '' && content != ''){
			$('form').submit();
						
		}else{
			alert("제목 또는 내용을 입력하세요.")
		}
	})
		
		//파일 미리보기
		$(document).on('change','.file', function(){
			if($('.file').length == 6){
				alert('이미지는 최대 5개까지만 등록 가능합니다.')
				return;
			}
			alert(fcnt);
	 		readURL(this);
		})
		
		function readURL(input){
			if(input.files && input.files[0]){
				var reader = new FileReader(); //파일 읽기위한 객체 생성
				reader.onload = function(e){ //파일 읽어 들이기 성공했을 때 호출되는 이벤트핸들러
					vimg = `<div class="img_div" id="img_div${fcnt}">
					          <img class="img" id="img${fcnt}" src="#" alt="image">
					          <img class="img_del" src="<%=request.getContextPath()%>/images/x마크.png">
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
										<img class="img_up" src="<%=request.getContextPath()%>/images/카메라.png">
										</label>
									</div>
								</div>`;
						//첨부한img 뒤에 추가
// 						$('#img_div'+fcnt).after(vwrap);
						$('.rg_images').append(vwrap);
						fcnt = fcnt + 1;

			
				}
				reader.readAsDataURL(input.files[0]);//File내용을 읽어 dataURL형식의 문자열롷 저장
			}
		}
	
		
		$(document).on('click','.img_del', function(){
			$(this).parent().next().remove();
			$(this).parent().remove();
		})

})

</script>
</head>
<body>
 <%@ include file="/module/header.jsp" %>
<div class="con_regist">
	<form action="<%=request.getContextPath()%>/InsertSboard.do?memId=<%=id%>" method="post"
		enctype="multipart/form-data">
		<div class="rg_header">
			<h1>비밀게시판 글쓰기</h1>
		</div>
		<!-- 이미지 업로드 -->
		<div class="rg_images">
			<div class="txt">이미지<br><span>(최대 6개까지 첨부가능)</span></div>
			
			<div class="img_wrap1">
				<input type="file" class="file" id="f1" name="img_file1">
				<div class="file_background">
					<label for="f1">
						<img class="img_up" src="<%=request.getContextPath()%>/images/카메라.png">
					</label>
				</div>
			</div>
			
			
		</div>
		
		<div class="rg_title">
			<div class="txt">제목</div>
			<textarea rows="1" id="ta1" name="title" cols="155" placeholder="제목을 입력해주세요."></textarea>
			<div id="maxTitle">(0 / 70)</div>
		</div>
		<div class="rg_content">
			<div class="txt">내용</div>
			<div class="rgc">
				<textarea  id="ta2" name="content" rows="10" cols="140" placeholder="내용을 입력해주세요."></textarea>
				<div id="maxContent">(0 / 500)</div>
			</div>
			<br>
		</div>
		<div class="rg_bottom">
			<input type="button" class="rg_btn" value="등록하기">
		</div>
	</form>
</div>
	
 <%@ include file="/module/footer.jsp" %>	
</body>
</html>