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
	<div class="sb">
		<div class="sb_top">
			<img src=<%=request.getContextPath() %>/images/기본프로필.png>
			<p class="writer" id="${v.mem_id}">익명</p>
			<p class="date">${date}</p>
		</div>
		<div class="sb_middle">
			<a class="${v.sboard_id}"
				href="<%=request.getContextPath() %>/SboardView.do?sboardId=${v.sboard_id}">${title}</a>
		</div>
		<div class="sb_bottom">
			<div class="hit">
				<img src="<%=request.getContextPath() %>/images/조회수.png">
				<p>${v.sboard_hit}</p>
			</div>
			<div class="like">
				<input type="checkbox" class="ck" id="like_img"> <label>
					<img class="lk" id="${v.sboard_id}"
					src="<%=request.getContextPath() %>/images/좋아요-체크.png">
				</label>
				<p>${v.sbstate_like}</p>
			</div>
			<div class="unlike">
				<input type="checkbox" class="ck" id="unlike_img"> <label
					for="unlike_img">` `<img class="uk" id="${v.sboard_id}"
					src="<%=request.getContextPath() %>/images/싫어요-체크함.png">
				</label>
				<p>${v.sbstate_unlike}</p>
			</div>
		</div>
	</div>

</body>
</html>