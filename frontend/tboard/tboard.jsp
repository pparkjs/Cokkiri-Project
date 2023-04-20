<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
MemberVO memVo = (MemberVO)session.getAttribute("memberVo");	
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mycss.css">
<style type="text/css">
.btnactive{
	background: rgb(56, 102, 233) !important;
	border: none !important;
	color: white;
}
.img{
	width: 200px;
	height: 200px;
}
#out{
}
.box{
	width: 1000px;
	margin: 0 auto;
}
#under{
	width: 1000px;
	text-align: center;
	margin: 0 auto;
	margin-top: 100px;
}
.ele{
	display: inline-block;
	margin: 10px 10px;
	padding: 10px;
	border: 1px solid rgb(217, 217, 217);
	border-radius: 12px;
	cursor: pointer;
}
.nomargin{
	margin: 0;
}
.title{
	font-size: 1.0em;
	font-weight: 900;
	margin-bottom: 5px;
}
.price{
	font-weight: 900;
	font-size: 0.9em;
	margin-bottom: 5px;
}
.state{
	display: inline-block;
    width: 60px;
    text-align:center;
    color:rgb(99,99,102);
    border-radius:12px;
    background: rgb(229,229,234);
    padding: 4px;
    margin-right: 8px;
    font-size: 14px;
    font-weight: 400;
}
.add{
	font-weight: 100;
	font-size:0.8em;
	color: rgb(38, 38, 38);
	margin-bottom: 10px;
}
.viewcnt{
	font-weight:100;
	font-size: 0.7em;
	color: gray;
}
.img{
	border-radius: 12px;
}
#searchbar{
	display:flex;
	width: 1000px;
	height:80px;
	margin: 0 auto;
	padding-right: 50px;
	border-bottom: 2px solid rgb(217, 217, 217);
	justify-content: center;
	align-items:center;
	text-align: center;
}
#rest{
	display:flex;
	flex: 8;
}
#searchl{	
	flex: 8;
	text-align: center;
	position: relative;
}
#category{	
	height: 32px;
}
#search{	
	height: 28px;
	width: 250px;
}
#searchbtn{	
	position:absolute;
	left:395px;
    width: 32px;
    height: 32px;
	border: none;
}
#searchr{
	flex: 1;
}
#btnbar{
	padding-top: 50px;
	height:100px;
	width: 1000px;
	margin: 0 auto;
	text-align: center;
}

#btnbar button{
	width: 80px;
	height: 40px;
	margin-left: 10px;
	margin-right: 10px;
	border-radius: 20px;
	border:1px solid rgb(209,209,214);
	background: white;
	
}
#write{
	background-color:white;
	background-image: url(../images/글쓰기.png);
    background-repeat: no-repeat;
    background-size: 28px 28px;
    width: 40px;
    height: 40px;
    background-position: center;
    border: none;
}
#btn{
	width: 60px;
	height: 30px;
}
</style>
<script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script src="../js/tboard.js" type="text/javascript"></script>
<script type="text/javascript">

$((ev)=>{
	ad=null;
	page=1;
	boardstate=null;
	category=null;
	sword=null;
	path="<%=request.getContextPath()%>";
	if ( ev.persisted || (window.performance && window.performance.navigation.type == 2)) {
    	pagetmp = Number(sessionStorage.getItem("page")); 
		categorytmp = sessionStorage.getItem("category");
		swordtmp = sessionStorage.getItem("sword");
		boardstatetmp=sessionStorage.getItem("boardstate");
		if(pagetmp!=0){
			page = pagetmp
		}
		if(categorytmp!="null"){
			category=categorytmp
		}
		if(swordtmp!="null"){
			sword=swordtmp
		}
		if(boardstatetmp!="null"){
			boardstate=boardstatetmp
		}
    }
	sessionStorage.clear();

	categoryRecieve()
	
	console.log(page, category, sword, boardstate);
	if($("#notifycheck").is(":checked") == true){
	    
	}
	listRecieveFromOne(page,category,sword,boardstate);
	
	
	$(document).on("click",".ele",function(){
		sessionStorage.setItem("page",page);
		sessionStorage.setItem("sword",sword);
		sessionStorage.setItem("category",category);
		sessionStorage.setItem("boardstate",boardstate);
		location.href="<%=request.getContextPath()%>/tboardInfo.do?id="+$(this).attr("id")		
	})
	
	$("#btn").on("click",function(){
		page=page+1;
		if($("#notifycheck").is(":checked") == true){
			notifyListRecieve(page,category,sword,boardstate)
		}else{
			listRecieve(page,category,sword,boardstate);
		}
		
	})
	$("#searchbtn").on("click",function(){
		page=1;
		category= $("#category option:selected").attr("id");
		sword = $("#search").val();
		$(".box").empty();
		if($("#notifycheck").is(":checked") == true){
			notifyListRecieve(page,category,sword,boardstate)
		}else{
			listRecieve(page,category,sword,boardstate);
		}
		
	})
	
	
	$("#write").on("click",function(){
		sessionStorage.setItem("page",page);
		sessionStorage.setItem("sword",sword);
		sessionStorage.setItem("category",category);
		sessionStorage.setItem("boardstate",boardstate);
		location.href="<%=request.getContextPath()%>/writeForm.do"
	})
	
	$(".btns").on("click",function(e){
		$("#search").val("");
		flag=false;
		if($(this).attr("class").indexOf("btnactive")!=-1){
			flag=true;
		}
		$(".btns").removeClass("btnactive");
		$(this).addClass("btnactive")
		page=1;
		category=null;
		sword=null;
		boardstate=$(this).text();
		if(flag){
			$(".btns").removeClass("btnactive");
			boardstate=null;
		}
		$(".box").empty();
		if($("#notifycheck").is(":checked") == true){
			notifyListRecieve(page,category,sword,boardstate)
		}else{
			listRecieve(page,category,sword,boardstate);
		}
		$("#default").prop("selected", true);
	})
	
	
	$(document).on("change","#notifycheck",function(){
		$(".btns").removeClass("btnactive");
		$(".box").empty();
		page=1;
		category=null;
		sword=null;
		boardstate=null;
		if($("#notifycheck").is(":checked") == true){
			notifyListRecieve(page,category,sword,boardstate)
		}else{
			listRecieve(page,category,sword,boardstate);
		}
	})
				
})


</script>
</head>
<body>

    <div class="wrap">
        <%if(memVo.getAdmin_auth().equals("N")){ %> 
		<%@ include file="/module/header.jsp" %>
		<%}else{ %>
		<%@ include file="/module/adminHeader.jsp" %>
		<%} %>


		<div id="out">
		<div id="searchbar">
			<div id="searchl">
				<select name="category" id="category">
					<option id="default">카테고리
				</select>
				<input type="text" id="search">
				<img id="searchbtn" src="<%=request.getContextPath()%>/images/돋보기.png">
			</div>
			<div id="rest"></div>	
			<div id="searchr">
				<%if(memVo.getAdmin_auth().equals("N")){ %> 
					<button id="write"></button>
				<%}else{ %>
					
				<%} %>
			</div>
		</div>
		<div id="btnbar">
			<button type="button" class="btns">팝니다</button>
			<button type="button" class="btns">삽니다</button>
			<button type="button" class="btns">나눔 </button>
		</div>
		<div class="box">
		
		</div>
		<div id="under">
			<img src='../images/더보기버튼.png' id="btn"> </img>
		</div>
		</div>



	<%@ include file="/module/footer.jsp" %>
</div>

</body>
</html>
