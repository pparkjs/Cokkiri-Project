<%@page import="javax.swing.text.PlainDocument"%>
<%@page import="vo.MemberVO"%>
<%@page import="vo.PboardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>

<% List<PboardVO> pbList = (List<PboardVO>)session.getAttribute("pbList"); %>
<% MemberVO memVo = (MemberVO)session.getAttribute("memberVo"); %>
 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/pboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/pbView.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=783f45435dd899b6746abc88c415eb86&libraries=services"></script>
</head>
<script >

boardId = `<%=pbList.get(0).getPboard_id()%>`;
memId = `<%=memVo.getMem_id()%>`;
mypath = `<%=request.getContextPath()%>`;
boardWriterId = `<%=pbList.get(0).getMem_id()%>`;
$(function(){
	// 이미지 보여지는 부분
	imageView();
	
	// 좋아요 처리부분
	viewLikeOrUnlikeClick()
	
	// 모든 상태를 가져오는 함수
	viewState();
	
	// 신고 처리하는 함수
	pboardNotify();
	
	$('#delete').on('click', function(){
		if(confirm('정말 삭제하시겠습니까?')){ // 확인누르면 true반환 취소 누르면 false반환
			alert(<%=pbList.get(0).getPboard_id()%>);
			location.href="<%=request.getContextPath()%>/DeletePboard.do?pbId=<%=pbList.get(0).getPboard_id()%>";
		}
	})
	
	$('#modify').on('click', function(){
			location.href="<%=request.getContextPath()%>/pboard/updatePboard.jsp";
	})
	
	<%if(pbList.get(0).getPboard_mdate() != null ){ %>
		mdate = "<%=pbList.get(0).getPboard_mdate() %>"
		dateView = elapsedTimeModify(mdate);
		console.log(dateView)
		$('.mDate').append(dateView);
	<%} %>

})

function imageView(){
	<%
	for(PboardVO vo : pbList){
	%>
		if("<%=vo.getPimg_origin_name()%>" != "null"){
			
		code = `<img src="<%=request.getContextPath()%>/PimageSrcView.do?imgName=<%=vo.getPrimg_save_name()%>">`;
	 		$('.mem_img').append(code);
		}		
	<%
	}
	%>
	
}
	
</script>
<body>
<%@ include file="/module/header.jsp" %>
<div class="main_body"><h1 style="text-align: center; font-size: 20px; margin-top: 15px;" >'우리끼리' 공유 맛집</h1></div>
	<div class="mem_header">
	<%if(pbList.get(0).getMem_id().equals(memVo.getMem_id())){ %>
		<input type="button" id="modify" value="수정">
		<input type="button" id="delete" value="삭제">
	<%}else if(memVo.getAdmin_auth().equals("Y")){ %>
		<input type="button" id="delete" value="삭제">
	<%} %>
	</div>
	
	


<div class="main_body">
	<div class="feed_box">
		<div class="feed_name">
			<div class="profile_box">
				<img class="profile_img"
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHYYkHVAza2xsjRZ977X0TE-LGNLaFM9uY0A&usqp=CAU">
			</div>
			<span class="feed_name_txt"><%=pbList.get(0).getMem_id()%> </span>
			<p class="m_date"><%= pbList.get(0).getPboard_cdate() %></p>
		</div>

		<div class="mem_img">
		</div>
	

		<div class="feed_content">
			<p class="feed_txt">
				<b><%=pbList.get(0).getMem_id()%></b> <%=pbList.get(0).getPboard_content()%>
			</p>
		</div>
		
		
			<div class="mem_btns">
				<div class="m_hit">
					<img id="mHit" src="<%=request.getContextPath()%>/images/조회수.png">
					<p id="htext"></p>
				</div>
				<div class="m_like">
					<img id="mLike"
						src="<%=request.getContextPath()%>/images/좋아요-체크안함.png">
					<p id="lktext"></p>
				</div>
				<div class="m_unlike">
					<img id="mUnlike"
						src="<%=request.getContextPath()%>/images/싫어요-체크안함.png">
					<p id="untext"></p>
				</div>
				<%
				if (!pbList.get(0).getMem_id().equals(memVo.getMem_id()) && memVo.getAdmin_auth().equals("N")) {
				%>
				<div class="m_notify">
					<img id="mNotify"
						src="<%=request.getContextPath()%>/images/신고-체크안함.png">
				</div>
				<%} %>
			</div>
			<br>
			<div id="map" style="width: 80%; height: 300px; margin-left : 50px; border-top: 1px solid lightgray;" ></div>
		</div>
</div>	

<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(36.350710442653956, 127.38473542742071),
			level: 5
		};

		var map = new kakao.maps.Map(container, options);
	</script>

<%@ include file="/module/footer.jsp" %>	
</body>
</html>