<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mycss.css">
<style type="text/css">
.btnactive{
	background: rgb(51, 207, 255) !important;
	border: 2px solid black !important;
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
	margin: 10px 19px;
	padding: 5px;
	border: 1px solid rgb(217, 217, 217);
	border-radius: 12px;
	cursor: pointer;
}
.nomargin{
	margin: 0;
}
.title{
	font-size: 1.0em;
	font-weight: 100;
	margin-bottom: 5px;
}
.price{
	font-weight: 900;
	font-size: 0.9em;
	margin-bottom: 5px;
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
	border-top: 2px solid rgb(217, 217, 217);
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
	border:none;
	background: rgb(230, 249, 255);
}
#btnbar button:hover{
	background: rgb(204, 243, 255);
}

</style>
<script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script src="../js/tboard.js" type="text/javascript"></script>
<script type="text/javascript">

$((ev)=>{
	page=1;
	boardstate=null;
	category=null;
	sword=null;
	path="<%=request.getContextPath()%>";
	if ( ev.persisted || (window.performance && window.performance.navigation.type == 2)) {
    	page = Number(sessionStorage.getItem("page"));  	
		categorytmp = sessionStorage.getItem("category");
		swordtmp = sessionStorage.getItem("sword");
		
		if(categorytmp!="null"){
			category=categorytmp
		}
		if(swordtmp!="null"){
			sword=swordtmp
		}
    }
	sessionStorage.clear();

	categoryRecieve()
	

	listRecieve(page,category,sword);
	
	$(document).on("click",".ele",function(){
		sessionStorage.setItem("page",page);
		sessionStorage.setItem("sword",sword);
		sessionStorage.setItem("category",category);
		
		location.href="<%=request.getContextPath()%>/tboardInfo.do?id="+$(this).attr("id")		
	})
	
	$("#btn").on("click",function(){
		page=page+1;
		listRecieve(page,category,sword,boardstate);
		
	})
	$("#searchbtn").on("click",function(){
		page=1;
		category= $("#category option:selected").attr("id");
		sword = $("#search").val();
		$(".box").empty();
		listRecieve(page,category,sword,boardstate);
		
	})
	
	
	$("#write").on("click",function(){
		sessionStorage.setItem("page",page);
		sessionStorage.setItem("sword",sword);
		sessionStorage.setItem("category",category);
		location.href="<%=request.getContextPath()%>/writeForm.do"
	})
	
	$(".btns").on("click",function(){
		$(".btns").removeClass("btnactive");
		$(this).addClass("btnactive")
		page=1;
		boardstate=null;
		category=null;
		sword=null;
		boardstate=$(this).text();
		listRecieve(page,category,sword,boardstate);
		
	})
	
})


</script>
</head>
<body>

    <div class="wrap">
        <%@ include file="/module/header.jsp" %>


		<div id="out">
		<div id="searchbar">
			<div id="searchl">
				<select name="category" id="category">
					<option id="default">카테고리
				</select>
				<input type="text" id="search">
				<button id="searchbtn">검색</button>
			</div>
			<div id="rest"></div>	
			<div id="searchr">
				<button id="write">글쓰기</button>
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
			<button id="btn">목록 더보기</button>
		</div>
		</div>



	<%@ include file="/module/footer.jsp" %>
</div>

</body>
</html>