<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
mypath = `<%=request.getContextPath() %>`;
</script>
</head>
<body>
	<div class="tb">
		<div class="tb_img">
			<img src="${mypath}/images/기본프로필.png">
		</div>
		<div class="tb_content">
			<div class="title">
				<p>${v.tboard_title}</p>
			</div>
			<div class="add">
				<p>${v.mem_add}</p>
			</div>
			<div class="status">
				<div class="saleStatus"></div>
				<div class="price">${v.tboard_price} 원</div>
			</div>
			<div class="tb_content_bottom">
				<div class="hit">
					<img src="${mypath}/images/조회수.png">
					<p>${v.tboard_hit}</p>
				</div>
				<div class="wish">
					<input type="checkbox" class="ck" id="wish_img"> <label>
						<img class="lk" id="${v.sboard_id}"
						src="<%=request.getContextPath() %>/images/찜-체크함.png">
					</label>
					<p>${v.mylistcnt}</p>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
<input type="button" class="saleStatus ${v.tboard_id}" id="soldout" value = "판매중"></button>
</body>
</html>