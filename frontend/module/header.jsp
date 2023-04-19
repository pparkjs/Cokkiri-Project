<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$.ajax({

		url: "<%=request.getContextPath()%>/memInfo.do",
		type: "post",
		dataType: "json",
		success: function(res) {
			add=res.member.mem_add;
			$(".area").text(add.split(" ")[0]);
			if(typeof res.alarm=='undefined' || res.alarm==null || res.alarm==""){
				acnt=0;
			}else{
				acnt=res.alarm.length;
				
				$(".navbar__alamLogo").prepend($("<span class='alarmcnt'></span>"))
				$(".alarmcnt").text(acnt);
				$.each(res.alarm, function(i,v){
					li=$("<li><a href='#'></a></li>");
					li.find('a').text(v.ynick+" 님으로 부터 메세지가 도착했습니다.")
					li.find("a").attr("href","<%=request.getContextPath()%>/alarmToChat.do?room_id="+v.room_id);
					$("#alarmList").append(li)
				})
			}
		},
		error: function(xhr) {
			alert("상태: " + xhr.status)
		}
	})
	
$(()=>{
	$(".navbar__alamLogo").on("click",function(){
		alarmstate=$(".alarmsidebar").css("display")
		if(alarmstate=="block"){
			$(".alarmsidebar").css("display","none")
		}else{
			$(".alarmsidebar").css("display","block")
		}
	})
	
	<%
		MemberVO sessionmem = (MemberVO)request.getSession().getAttribute("memberVo");
	%>
	mem_img="<%=sessionmem.getMem_image()%>"
	if(typeof mem_img!='undefined' && mem_img!=null && mem_img!=""&&mem_img!="null"){
		$(".myimage").attr("src","<%=request.getContextPath()%>/profileImageView.do")
	}
	
	
})
	
</script>
<style>
.navbar__alamLogo{
	position: relative;
}
.alarmcnt{
	position: absolute;
	top: -50%;
	left: 50%;
	background: rgb(255,159,10);
	color: white;
	font-weight: bold;
	border-radius: 100px;
	padding: 3px 5px 3px 5px;
	font-size: 5px;
}
.alarmsidebar{
  padding-top : 15px;
  position: absolute;
  width: 130px;
  height:100px;
  left : -50px;
  z-index : 100;
  top : 36px;
  border-radius: 10px;
/*   box-shadow: 1px 1px 2px 1px; */
  background: white;
  display: none;  
  overflow: auto;
}
.alarmsidebar a{
	font-size: 8px !important;
	text-align: left;
}

</style>
<!--  wrap의 시작 -->
 <div class="wrap">
        <!-- nav를 포함하는 가장 상단의 header-->
        <div class="header">
            <div class="navbar">
                <div class="navbar__mainLogo">
                    <img class="mainLogo__img" src="<%=request.getContextPath()%>/images/logo2.png" alt="logo.png">
                    <a class="mainLogo__a" href="<%=request.getContextPath()%>/home/main.jsp">
                    	<img src="<%=request.getContextPath()%>/images/logotext.png" alt="logotext.png">
                    </a>
                    
                </div>
                <ul class="navbar__board">
                    <li class="item">
                   		<a class="a1" href="<%=request.getContextPath()%>/tboard/tboard.jsp">중고거래</a>
                    </li>
                    <li><a href="<%=request.getContextPath()%>/secretboard/sboard.jsp">비밀게시판</a></li>
                    <li><a href="#">마이플레이스</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/memNotice.jsp">공지사항</a></li>
                </ul>
                <div class ="navbar__mapLogo">
                    <img src="<%=request.getContextPath()%>/images/지도아이콘.png" alt="지도아이콘.png">
                    <p class="area">지역</p>	
                </div>
                <div class ="navbar__alamLogo">	
                    <img id='test' src="<%=request.getContextPath()%>/images/알람.png" alt="알람.png">
					 <div class="alarmsidebar" >
                       		<ul class="sidebar__list" id="alarmList">
                         	  
                     	    </ul>
                    </div>


                </div>
                
                               <!-- 이런식으로 input의 id와 label의 for을 연결해주면 label클릭시 input이 체크 되거나 체크 해제됨 -->
               <!-- 
                <div class="navbar__mymenu">
                    <input type="checkbox" id="mymenu">
                    <label class="navbar__label" for="mymenu">
                        <img class="myimage" src="../images/기본프로필.png" alt="기본프로필.png">
                    </label>
                    <div class="sidebar">
                        <ul class="sidebar__list">
                            <li><a href="#">My 프로필</a></li>
                            <li><a href="#">판매내역</a></li>
                            <li><a href="#">관심목록</a></li>
                            <li><a href="#">채팅방</a></li>
                            <li><a href="#">내 글 보기</a></li>
                            <li><a href="#">로그아웃</a></li>
                        </ul>
                    </div>
                </div>  -->
                  
                <div class="navbar__mymenu">
                    <!-- <input type="checkbox" id="mymenu"> -->
                    <div class="navbar__label" >
                        <img class="myimage" src='<%=request.getContextPath()%>/images/기본프로필.png' alt="기본프로필.png">
                   		 <div class="sidebar" >
                       		<ul class="sidebar__list">
                         	  <li><a href="<%=request.getContextPath()%>/mypage/myProfile.jsp">My 프로필</a></li>
                          	  <li><a href="<%=request.getContextPath()%>/mypage/mypageWishList.jsp">관심목록</a></li>
                          	  <li><a href="<%=request.getContextPath()%>/chatRoom.do">채팅방</a></li>
                          	  <li><a href="<%=request.getContextPath()%>/mypage/mypageTboard.jsp">내 글 보기</a></li>
                          	  <li><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
                     	    </ul>
                    	</div>
                    </div>
                </div>  
            </div>
        </div> 
   </div>