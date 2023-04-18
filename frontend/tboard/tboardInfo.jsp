<%@page import="vo.TBoardVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="vo.TImageVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <script src="js/jquery-3.6.4.min.js" type="text/javascript"></script>
 <script src="js/tboardInfo.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.serializejson.min.js"></script>
<script type="text/javascript" src="js/tcomment.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="css/mycss.css">

<style>
    html, body { box-sizing: border-box; padding: 0; margin: 0; text-align: center; }

    .slideimg{
    	width: 750px;
    	height: 500px;
		border-radius: 12px;
    }
    .clearfix:after { content: ''; display: block; clear: both; float: none; }
    .title { margin-bottom: 0; text-align: center; font-size: 30px; color: #333; }
    .link, .link:visited { display: inline-block; margin: 20px 0; color: #555; text-decoration: none; font-weight: bold; }
    .link:hover, .link:focus { color: #9fd6c2; }
    /* container - body */
    #container { width: 1000px; margin: auto; }
    .slide_wrap { position: relative; width: 750px; margin: auto; }
    .slide_box { width: 100%; margin: auto; overflow-x: hidden;}
    .slide_content { display: table; float: left; width: 750px; height: 500px; }
    .slide_content > p { display: table-cell; vertical-align: middle; text-align: center; font-size: 100px; font-weight: bold; color: #555; }
    .slide_btn_box > button { position: absolute; top: 50%; margin-top: -45px; width: 60px; height: 60px; font-size: 16px; color: #999; background: none; cursor: pointer; border: none;}
    .slide_btn_box > .slide_btn_prev { left: -10px; }
    .slide_btn_box > .slide_btn_next { right: -10px; }
    .slide_pagination {text-align:center; bottom: 0; list-style: none; margin: 0; padding: 0;  }
    .slide_pagination .dot { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }
    .slide_pagination .dot.dot_active { background: #333; }
    .slide_pagination .dot a { display: block; width: 100%; height: 100%; }
	#out{
		margin-top: 50px;
	}
	
	.arrow-prev,
.arrow-next {
    float:left;
    border:1px solid #000;
}

.arrow-prev:before {
    position: absolute;
	left:23px;
	top:20px;
    content: '';
    width: 13px; /* 사이즈 */
    height: 13px; /* 사이즈 */
    border-top: 2px solid #000; /* 선 두께 */
    border-right: 2px solid #000; /* 선 두께 */
    margin-right:10px;
    transform: rotate(225deg); /* 각도 */
}

.arrow-next:after {
    position: absolute;
	left:17px;
	top:20px;
    content: '';
    width: 13px; /* 사이즈 */
    height: 13px; /* 사이즈 */
    border-top: 2px solid #000; /* 선 두께 */
    border-right: 2px solid #000; /* 선 두께 */
    transform: rotate(45deg); /* 각도 */
}
#pagediv{
	position: absolute;
	top: 93%;
	left: 50%;
	width: 100%;
	transform:translate(-50%,-50%);
}

#content{
	width:750px;
	margin: 0 auto;
	min-height: 400px;
}

#userinfo{
	display: flex;
	flex-direction: row;
	padding-bottom: 5px;
	padding-top: 20px;
	padding-left: 8px;
}
#profile{
	width: 50px;
	height: 50px;
	border-radius: 100%;
}
#profilediv{
	flex: 1;
}
#addAndNick{
	flex:2;
	text-align: left;
}

#chatBtn{
	border: 1px solid black;
}
#rest1{
	flex: 6;
}
#rest2{
	flex: 0.4;
}
#notifyAndMylist{
	flex: 2;
	display: flex;
	flex-direction: row;
	padding-bottom: 5px;
	align-items: center;
}
#notifyAndMylist button{
	border-radius: 12px;
	border: none;
	background-color: white;
	width:70px;
	padding: 10px; 
	margin: 5px;
	border:1px solid black;
}
#notify{
	flex: 1;
}
#mylist{
	flex: 1;
}
#cont{
	padding: 80px 10px 20px 10px;
	text-align: left;
}
            
.img{
	width: 200px;
    height: 200px;
}         
.title{
	font-size: 1.3em;
	text-align: left;
}     
#recommend{
	margin: 0px auto;
	width: 800px;
	min-height: 300px;
	text-align: left;
}
#tcommentdiv{
	margin: 0px auto;
	width: 800px;
	min-height: 300px;
	text-align: left;
}
#recommend h2{
	margin: 40px 0px 40px 20px;
}
.ele{
	display: inline-block;
    margin: 10px 19px;
    padding: 5px;
    border: 1px solid rgb(217, 217, 217);
    border-radius: 12px;
    cursor: pointer;
}   
.nm{
	width: 50px;
	height: 50px;
	background-position: center;
}       
#nbtn{
	background-image: url(images/tnotify.png);
	background-repeat: no-repeat;
	background-size: 30px 30px;
}
#ncbtn{
	background-image: url(images/tnotifyed.png);
	background-repeat: no-repeat;
	background-size: 28px 28px;
}
#mlbtn{
	background-image: url(images/mylist.png);
	background-repeat: no-repeat;
	background-size: 25px 25px;
} 
#mlcbtn{
	background-image: url(images/mylistChecked.png);
	background-repeat: no-repeat;
	background-size: 25px 25px;
}
#title{
	margin-bottom: 5px;
}
#cd,#mc{
	font-size: 0.8em;
	color: gray;
	margin-bottom: 5px;
}
#price{
	font-weight: bolder;
}
.navbar__mapLogo{
	text-align: left;
}
</style>
<%
List<TImageVO> list = (List<TImageVO>)request.getAttribute("img"); 
MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");
TBoardVO boardVO=(TBoardVO)request.getAttribute("board");
String category = (String)request.getAttribute("category");
DecimalFormat decimalFormat = new DecimalFormat("###,###");
String price = decimalFormat.format(boardVO.getTboard_price());
MemberVO smem = (MemberVO)request.getAttribute("smem");
%>
<script>
$(()=>{
	path = "<%=request.getContextPath()%>"
	tboard_id = "<%=boardVO.getTboard_id()%>"
	mem_id="<%=boardVO.getMem_id()%>"
	smem_id="<%=smem.getMem_id()%>"
	slideImage();
	
	recommendlistRecieve(<%=boardVO.getCategory_id()%>,tboard_id);
	
	btnCreate(mem_id,tboard_id);
	
	btnChage(tboard_id)
	
	time="<%=category%> · "
	time+=elapsedTime("<%=boardVO.getTboard_cdate()%>");
	$("#cd").append(time);
	$("#chatBtn").on("click",function(){
		location.href=`\${path}/chatRoomCreate.do?tboard_id=\${tboard_id}`
	})
	
})
</script>
</head>
<body>


    <div class="wrap">
        <%@ include file="/module/header.jsp" %>

		<div id="out">
			
				
				<div id="tboard_infocontainer">
				    <div class="slide_wrap">
					      <div class="slide_box">
						        <div class="slide_list clearfix">
						        	<%
						        		if(list==null||list.size()==0){
						        	%>
							        	<div class="slide_content">
								            <img src="images/default.PNG" alt="default.PNG" class="slideimg">
								        </div>
						        	<%
						        		}else{
						        			for(int i=0; i<list.size(); i++){
						        	%>
						        		<div class="slide_content">
								            <img src="<%=request.getContextPath() %>/images/TboardImageView.do?imgno=<%=list.get(i).getTimg_id() %>" alt="default.PNG" class="slideimg">
								        </div>
							        <% 
						        			}
						        		}
							        %>

						        </div>
					        <!-- // .slide_list -->
					      </div>
				      <!-- // .slide_box -->
				      <div class="slide_btn_box">
					        <button type="button" class="slide_btn_prev arrow-prev" disabled></button>
					        <button type="button" class="slide_btn_next arrow-next"></button>
				      </div>
				      <!-- // .slide_btn_box -->
				      <div id="pagediv">
				      	<ul class="slide_pagination"></ul>
				      </div>
				      <!-- // .slide_pagination -->
				    </div>
				    <!-- // .slide_wrap -->
				  </div>
				<div id="content">
				      	<div id="userinfo">
				      		<div id="profilediv">
				      			<img id="profile" alt="images/기본프로필.png" src="images/기본프로필.png">
				      		</div>
							<div id="addAndNick">
								<div id = "nick">
									<%=memberVO.getMem_nickname() %>
									<%if(!boardVO.getMem_id().equals((String)request.getSession().getAttribute("id"))) {%>
									<button id="chatBtn" type="button">1:1대화</button>
									<%} %>
								</div>
								<div id = "add">
									<%=memberVO.getMem_add() %>
								</div>		
			
							</div>
							<div id="rest1">
							</div>
							<div id="notifyAndMylist">

							</div>
							<div id="rest2">
							</div>
						</div>
						<hr>
						<div id="cont">
						<h3 id="title"><%=boardVO.getTboard_title() %></h3>
						<p id="cd"></p>
						<h4 id="price"><%=price %>&nbsp;원</h4>
						<br>
						<p><%=boardVO.getTboard_content().replace("\r\n", "<br>") %></p>
						<br><br><br>
						<p id="mc">관심 <%=request.getAttribute("mylist") %> · 조회 <%=boardVO.getTboard_hit() %></p>
						</div>
						<hr>
					</div>
					<div id="tcommentdiv">
						<%@ include file="/tcomment/tcommentMain.jsp" %>
					</div>
				<div id="recommend" class="box">
				<hr>
					<h2>이런 게시글은 어떠세요?</h2>
				</div>
		
		</div>




        <%@ include file="/module/footer.jsp" %>
</div>

</body>
</html>