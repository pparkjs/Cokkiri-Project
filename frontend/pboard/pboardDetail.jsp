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
<% MemberVO writerVo = (MemberVO)session.getAttribute("writer"); %>
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
pboard_id = `<%=pbList.get(0).getPboard_id()%>`;
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
<%if(memVo.getAdmin_auth().equals("N")){ %> 
<%@ include file="/module/header.jsp" %>
<%}else{ %>
 <%@ include file="/module/adminHeader.jsp" %>
<%} %>
<div class="main_body"><h1 style="text-align: center; font-size: 20px; margin-top: 15px;" >'우리끼리' 공유 맛집</h1></div>
	<div class="mem_header">
	<%if(pbList.get(0).getMem_id().equals(memVo.getMem_id())){ %>
		<input type="button" id="modify" value="수정">
		<input type="button" id="delete" value="삭제">
	<%}else if(memVo.getAdmin_auth().equals("Y")){ %>
		<input type="button" id="delete" value="삭제">
	<%} %>
	</div>
	
	
<% 
String profilesrc="../images/기본프로필.png";

if(writerVo.getMem_image()!=null){
    profilesrc=request.getContextPath()+"/profileImageView.do?mem_id="+writerVo.getMem_id();
}
%>

<div class="main_body">
	<div class="feed_box2">
		<div class="feed_name">
			<div class="profile_box">
				<img class="profile_img"
					src="<%=profilesrc%>">
			</div>
			<span   style="font-size: 22px;" class="feed_name_txt" ><%=pbList.get(0).getMem_id()%> </span>
			<p class="m_date"><%= pbList.get(0).getPboard_cdate() %></p>
		</div>

		<div class="mem_img" style="width:802px; height:760; margin-bottom: 50px; margin: 0 auto;">
		</div>
	

		<div class="feed_content">
			<p class="feed_txt">
				 <%=pbList.get(0).getPboard_content()%>
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
			<div id="map" style="width: 100%; height: 430px; border-top: 1px solid lightgray;" ></div>
			
			
			<div id="pcommentdiv">
				<%@ include file="/pcomment/pcommentMain.jsp" %>
			</div>
			
		</div>
</div>	


<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(36.350536229269395, 127.3849643404652), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성  
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체 생성
var geocoder = new kakao.maps.services.Geocoder();
//var location = $('#v3').val();

//주소로 좌표를 검색 대전 중구 계룡로 860-9 
geocoder.addressSearch('<%=pbList.get(0).getPboard_addr()%>', function(result, status) {
	console.log(result)
// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">Here!</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동
    map.setCenter(coords);
} 
});    


</script>

<%@ include file="/module/footer.jsp" %>	
</body>
</html>