<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/pboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
</head>
<script >

mypath = "<%=request.getContextPath()%>";


</script>
<body>
<%@ include file="/module/header.jsp" %>
<div class="main_body"><h1 style="text-align: center; font-size: 20px; margin-top: 15px;" >'우리끼리' 공유 맛집</h1></div>
<div class="main_body"><h1 style="text-align: center; font-size: 10x; margin-top: 10px;" > 카페 백목</h1></div>

<div class="main_body">
	<div class="feed_box">
		<div class="feed_name">
			<div class="profile_box">
				<img class="profile_img"
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHYYkHVAza2xsjRZ977X0TE-LGNLaFM9uY0A&usqp=CAU">
			</div>
			<span class="feed_name_txt"> sungheesideup </span>
		</div>
		<img class="feedImg"
			src="https://pup-review-phinf.pstatic.net/MjAyMzA0MDJfMjM2/MDAxNjgwNDE0MDcxMTk3.lzz9xgSBhbDoh-vOH8wJL8JznGsUFIVRTrME_82bU6Ig.WxDLtpT73NV1DyVcCXCp2o8RoZdUIg8E60QdVnKZaIcg.JPEG/0E12B117-A284-4F1D-8327-08C8053E4347.jpeg?type=w828_60_sharpen">



			<div class="pb_bottom">
				<div class="hit">
					<img src="<%=request.getContextPath()%>/images/조회수.svg">
					<p>164</p>
				</div>
				<div class="like">
					<input type="checkbox" class="like_ck" id="like_img"> <label
						for="like_img"> <img src="<%=request.getContextPath()%>/images/좋아요-체크안함.svg">
					</label>
					<p>0</p>
				</div>
				<div class="unlike">
					<input type="checkbox" class="like_ck" id="unlike_img"> <label
						for="like_img"> <img src="<%=request.getContextPath()%>/images/싫어요-체크안함.svg">
					</label>
					<p>0</p>
				</div>
			</div>


			<div class="feed_like">
			<p class="feed_txt">
				<b>좋아요 136개</b>
			</p>
		</div>
		<div class="feed_content">
			<p class="feed_txt">
				<b> sungheesideup </b> 여기 커피 존존맛 ! 
			</p>
		</div>
		<div class="feed_reply">
        <span class="feed_txt"> <b> parkjungsoo </b> 저도 가고 싶어요 ㅠㅠ</span>
        <span class="feed_txt"> <b> hi_yoon </b> 맛있겠다,, </span>
      </div>
	</div>
</div>	
<%@ include file="/module/footer.jsp" %>	
</body>
</html>