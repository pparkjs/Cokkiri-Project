
<%@page import="vo.TImageVO"%>
<%@page import="vo.TBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mycss.css">
<script src="js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script src="js/tboardModify.js" type="text/javascript"></script>
<style type="text/css">

.real-upload{
	display: none;
}

    .real-upload {
      display: none;
    }
	ul{
		margin-left: 25px;
	}
    .upload {
      width: 100px;
      height: 100px;
      background-color: rgb(229,229,234);
      margin: 0 5px;
      border: 1px solid gray;
    }
    .img_up{
    	width: 25px;
    	height: 25px;
    	margin: 38px 38px;
    }
   	.previewimg{
   		width: 100px;
   		height: 100px;
   	}
   	.image-preview li{
   		float: left;
   		margin: 10px 10px;
   		list-style: none;
   	}
   	#formdiv{
   		width: 1369px;
   		margin: 50px auto;
   	}
   	#uldiv{
   		display:inline-block;
   		height: 100px;
   		padding-bottom: 15px;

   	}
.animation-init {
  opacity: 0;
  padding-left: 0.5em;
}

.animation-fade {
  opacity: 1;
  padding-left: 0;
  transition: all 1s;
}
#wform{
	width: 1200px;
	margin: 0 auto;
}

textarea{
	resize: none;
	font-size: 18px;
}

.inputgroup{
	margin: 30px 50px;
	display: flex;
    align-items: flex-start;
}
label {
	display: inline-block;
	margin-right: 15px;
	width: 100px;
	
}
#title{
	padding: 10px;
}
#price{
	padding: 5px;
}
.ssbtn{
	padding: 6px 15px;
	margin-right: 20px;
	border-radius: 20px; 
	border: 1px solid gray;
	background: white;
	color: black;
	cursor: pointer;
}
.act{
	padding: 6px 15px;
	margin-right: 20px;
	border-radius: 20px; 
	border: none;
	background: rgb(100,210,255);
	color: white;
	cursor: pointer;
}
#actgroup{
	margin: 30px 0;
	display: flex;
    justify-content:flex-end;
}
.activeBtn{
	background: rgb(50,173,230);
	color: white;
	border: none;
}
h2{
	margin-left: 30px;
	margin-bottom: 30px;
}
option{
	padding: 3px 0;
}
</style>
<% 
	TBoardVO boardVO = (TBoardVO)request.getAttribute("boardVO");
	List<TImageVO> ilist = (List<TImageVO>)request.getAttribute("ilist");
%>
<script type="text/javascript"> 
path = "<%=request.getContextPath()%>"
tboard_id="<%=boardVO.getTboard_id()%>"
state='<%=boardVO.getTboard_state()%>';
$(()=>{
	
    
    
<%   
    out.print("modifyImageLoad('"+boardVO.getTboard_id()+"')");
%>
	
	
	
	categoryRecieve("<%=boardVO.getCategory_id()%>");
	$("#title").val("<%=boardVO.getTboard_title()%>");
	$(".state[value=<%=boardVO.getTboard_state()%>]").prop("checked",true);
	$(".ssbtn:contains('<%=boardVO.getTboard_state()%>')").addClass("activeBtn");
	$("#price").val("<%=boardVO.getTboard_price()%>");
	$("#content").val("<%=boardVO.getTboard_content().replace("\r\n", "\\r\\n")%>");

      

     
    	  	
    	  	
  
})

</script>
</head>
<body>
<div class="wrap">
   <%@ include file="/module/header.jsp" %>
</div>
      
      
<div id="formdiv">
		<form id="wform">
				<input type="file" class="real-upload" accept="image/*" required multiple >
				<h2>상품등록</h2><hr>
				<div class="inputgroup">
					<label for="uldiv">상품이미지</label>
					<div id="uldiv">
						<ul class="image-preview">
							<li id="upload">
								<div class="upload"><img class="img_up" src="<%=request.getContextPath()%>/images/카메라.png"></div>
							</li>
						</ul>
					</div>
				</div>
				<hr>
				<div class="inputgroup">
					<label for="title">제목</label>
					<input type="text" name="title" id="title" size="117" placeholder="상품 제목을 입력해주세요."><br>
				</div>
				<hr>
				<div class="inputgroup">
					<label>판매구매</label>
				    <button class="ssbtn" type="button">삽니다</button>
				    <button class="ssbtn" type="button">팝니다</button>
				    <button class="ssbtn" type="button">나눔</button>
				</div>
				<hr>
				<div class="inputgroup">
					<label for="category">카테고리</label>
					<select name="category" id="category" multiple size="5">			
					</select>
				</div>
				<hr>
				<div class="inputgroup">
					<label for="text">가격</label>
					<input type="text" name="price" id="price" size="20" placeholder="숫자만 입력하세요.">&nbsp;&nbsp;&nbsp;<h3>원</h3><br>
				</div>
				<hr>
				<div class="inputgroup">
					<label id="contentlabel" for="content">내용</label>
					<textarea rows="10" cols="80" id="content" placeholder="내용을 입력하세요."></textarea>
				</div>
				<hr>
				<div class="inputgroup" id="actgroup">
					<input type="button" class="act" id="modify" value="수정하기">
					<input type="button" class="act" id="cancle" value="취소하기">
				</div>
			
		</form>
	</div>
<%@ include file="/module/footer.jsp" %>
</body>
</html>