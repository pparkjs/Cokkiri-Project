<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<% 
	MemberVO memVo = (MemberVO)session.getAttribute("memberVo"); 
%>
<head>
<meta charset="UTF-8">
<title>My Place</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/pboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/pboardWrite.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=783f45435dd899b6746abc88c415eb86&libraries=services"></script>

</head>


   <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>








<script>
mypath = "<%=request.getContextPath() %>";
fcnt = 1;

	$(function() {
	
		
		//제목 글자수 제한
		$('#v1').on('keyup', function(){
			$('#maxTitle').html("("+$(this).val().length+" / 70)");
			
			if($(this).val().length > 70){
				$(this).val($(this).val().substring(0, 70));
				$('#maxTitle').html("(70 / 70)");
			}
		})	
		
		
		//내용 글자수 제한
		$('#v2').on('keyup', function(){
			$('#maxContent').html("("+$(this).val().length+" / 500)");
			
			if($(this).val().length > 500){
				$(this).val($(this).val().substring(0, 500));
				$('#maxContent').html("(500 / 500)");
			}
		})
		
		
		

		$('.upload_btn').on('click', function() {

			title = $('#v1').val();
			content = $('#v2').val();
	  		address = $('#v3').val();

			econtent = content.replace(/\n/g, "<br>");

			$('#v2').val(econtent);

			if (title != '' && content != '') {
				$("#outform").append($("<input type='text' name='place' value='"+position+"'>"))
				$('#outform').submit();

 			} else {
 				alert("제목 또는 내용을 입력하세요.")
 			}
		}) 
		
		
		$('#mapbtn').on('click', function(){
			searchPlaces();
		})
		
		
	
		$('#saveBtn').on('click', function(){
			alert("위치가 저장되었습니다 !")
		})
		
	
		
		//파일 미리보기
		$(document).on('change','.file', function(){
	 		readURL(this);
	 		
		})
		
		$(document).on('click','.img_del', function(){
			$(this).parent().next().remove();
			$(this).parent().remove();
			
			if($('.file').length == 6){
				$('.rg_images div:nth-child(12)').css("display", "block");
				return;
			}
		})
		
		//keydown 키보드의 키가 눌렸을때 발생
		$('#v1').on('keydown', function(event){ 			
			if(event.keyCode === 13){ // 13은 엔터키의 keyCode 값
				event.preventDefault(); // 기본 동작인 줄바꿈을 막는다.
			}
			
			const input = document.getElementById("f1");
			console.log(input.files)
		})
    })   
    
 
</script>



<body>
<%@ include file="/module/header.jsp" %>

	<div class="writebody">
		<form action="<%=request.getContextPath()%>/PboardWrite.do"
			method="post" enctype="multipart/form-data" id="outform">
			<div class="wr_header">
				<h1>마이플레이스 글쓰기</h1>
			</div>

			<!--이미지 넣기 -->
			<div class="rg_images">
				<div class="text">
					이미지<br> <span>(최대 6개까지 첨부가능)</span>
				</div>

				<div class="img_wrap1">
					<input type="file" class="file" id="f1" name="img_file1">
					<div class="file_background">
						<label for="f1"> <img class="img_up"
							src="<%=request.getContextPath()%>/images/카메라.png">
						</label>
					</div>
				</div>
			</div>


			<div class=title>
				<div class="text">제목</div>
				<textarea rows="1" cols="155" id="v1" name="title" placeholder=" 제목을 입력해주세요"></textarea>
				<input type="hidden" name="memId">
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
			
			<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form id="mapform">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="button" id="mapbtn">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
			
 			<%-- <div class="place" > 
				<div id="clickLatlng" style="border-bottom: 2px solid lightgray;"></div> 
 					<div class="text" style="margin-top: 30px; margin-bottom: 30px;">장소 검색 
 						<input type="text" id="v3" class="pb_searchplace" name=place placeholder=" 주소를 입력해주세요">
 						<img id="psearch" src="<%=request.getContextPath()%>/images/돋보기.png">  				 
						<input type="button" class="saveBtn" value="위치 저장하기">
					</div> 
			<div id="map" style="width: 60%; height: 400px; margin-left : 300px;"></div> 
			</div>
 --%>
			<br><br>
			<div class="button">
				<input type="button" class="upload_btn" value="등록하기">
			</div>
		 
	 </form>
</div>


 <!-- <script> 
 	
	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 	 mapOption = {
	     center: new kakao.maps.LatLng(36.350536229269395, 127.3849643404652), // 지도의 중심좌표
	     level: 3 // 지도의 확대 레벨
	 };  

	 //지도를 생성  
 	var map = new kakao.maps.Map(mapContainer, mapOption); 

 	//주소-좌표 변환 객체 생성
 	var geocoder = new kakao.maps.services.Geocoder();

	 //주소로 좌표를 검색
 	geocoder.addressSearch('대전 중구 계룡로 860-9', function(result, status) {

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

	 function test(addr){
	 	var map = new kakao.maps.Map(mapContainer, mapOption); 

	 	//주소-좌표 변환 객체 생성
	 	var geocoder = new kakao.maps.services.Geocoder();

		 //주소로 좌표를 검색
	 	geocoder.addressSearch(addr, function(result, status) {

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
	 }
 
 
 </script>  -->





<script type="text/javascript">
position=null;
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'click', function() {
                displayInfowindow(marker, title);
                position=marker.getPosition();
                console.log(position)
            });

      /*       kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            }); */

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>


<%@ include file="/module/footer.jsp" %>	
</body>
</html>