<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 연습용 로그인 세션 -->
<% 
//클라이언트에서 전송한 도로명 주소 가져오기
   String address = request.getParameter("address");
   String memId = (String)session.getAttribute("memId");
   String nickName = (String)session.getAttribute("nickName");
%>
<head>
<meta charset="UTF-8">
<title>My Place</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/pboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=783f45435dd899b6746abc88c415eb86&libraries=services"></script>

</head>

<script>

	$(function() {

		$('.upload_btn').on('click', function() {

			title = $('#v1').val();
			content = $('#v2').val();

			econtent = content.replace(/\n/g, "<br>");

			$('#v2').val(econtent);

			if (title != '' && content != '') {
				$('form').submit();

 			} else {
 				alert("제목 또는 내용을 입력하세요.")
 			}
		}) 
		
		
	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.5665, 126.9780), // 지도 중심좌표
            level: 5 // 지도 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성

    // 지도 클릭 이벤트 등록
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        var latlng = mouseEvent.latLng; // 클릭한 위치의 위도, 경도 정보
        var marker = new kakao.maps.Marker({
            position: latlng,
            map: map
        });
        var geocoder = new kakao.maps.services.Geocoder();

        // 좌표를 주소로 변환
        geocoder.coord2Address(latlng.getLng(), latlng.getLat(), function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var address = result[0].address.address_name; // 변환된 주소 정보
                $('#address').val(address); // 주소 정보를 히든 필드에 저장
            }
        });
    });

    // 위치 저장 버튼 클릭 이벤트 등록
    $('#saveBtn').on('click', function() {
        var address = $('#address').val(); // 히든 필드에서 주소 정보를 가져옴
        var lat = marker.getPosition().getLat(); // 마커의 위도 정보를 가져옴
        var lng = marker.getPosition().getLng(); // 마커의 경도 정보를 가져옴

        $.ajax({
            url: 'saveLocation.do',
            type: 'POST',
            data: {
                address: address,
                lat: lat,
                lng: lng
            },
            success: function(response) {
                alert('위치가 저장되었습니다.');
            }
        });
    });	
</script>



<body>
<%@ include file="/module/header.jsp" %>

	<div class="writebody">
		<form action="<%=request.getContextPath()%>/PboardWrite.do"
			method="post" enctype="multipart/form-data">
			<div class="wr_header">
				<h1>마이플레이스 글쓰기</h1>
			</div>

			<!--이미지 넣기 -->
			<div class="wr_images">
				<div class="text">
					이미지<br> <span>(최대 6개까지 첨부가능)</span>
				</div>

				<div class="img_wrap">
					<input type="file" class="file" id="file" name="img_file">
					<div class="file_background">
						<label for="f1"> <img class="img_up"
							src="<%=request.getContextPath()%>/images/카메라.png">
						</label>
					</div>
				</div>
			</div>


			<div class=title>
				<div class="text">장소명</div>
				<textarea rows="1" cols="155" id="v1" name="title" placeholder=" 장소명을 입력해주세요"></textarea>
				<input type="hidden" name="memId" value="<%=memId%>">
				<div id="maxTitle">(0 / 70)</div>
			</div>

			<div class="content">
				<div class="text">내용</div>
				<div class="wrc">
					<textarea rows="20" cols="170" id="v2" name="content" placeholder=" 추천 메뉴등 내용을 입력해주세요 !"></textarea>
					<div id="maxContent">(0 / 500)</div>
				</div>
			</div>
			<br><br>
			
			<div class="place" >
				<div id="clickLatlng" style="border-bottom: 2px solid lightgray;"></div>
				<div class="text" style="margin-top: 30px;">장소 검색
				<input type="text" placeholder=" 가게명을 입력해주세요" style="width:300px; height:30px;"></div>
				<br><br>
				<input type="submit" class="saveBtn" value="위치 저장하기" style= "margin-left: 1020px; margin-bottom: 20px; border-radius:20px; width:100px; height:30px; background: white;">
				
				<div id="map" style="width: 60%; height: 400px; margin-left : 300px;"></div>
			</div>
			
			<br><br>
			<div class="button">
				<input type="submit" class="upload_btn" value="등록하기">
			</div>
	 </form>
</div>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(36.350710442653956, 127.38473542742071), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시
marker.setMap(map);

// 지도에 클릭 이벤트를 등록
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져오기 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮기기
    marker.setPosition(latlng);
    
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message 
    
});


</script>
	
<%@ include file="/module/footer.jsp" %>	
</body>
</html>