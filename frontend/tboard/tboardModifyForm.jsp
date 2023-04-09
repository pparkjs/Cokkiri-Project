
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
#out{
	margin-top: 100px;
}
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
      width: 80px;
      height: 80px;
      background-color: antiquewhite;
      margin: 0 5px;
    }
   	.previewimg{
   		width: 80px;
   		height: 80px;
   	}
   	.image-preview li{
   		float: left;
   		margin: 10px 10px;
   		list-style: none;
   	}
   	#formdiv{
   		width: 1000px;
   		margin: 0 auto;
   	}
   	#uldiv{
   		height: 100px;
   		padding-top: 15px;
   		padding-bottom: 15px;
   		border: 1px solid;
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
#form{
	width: 800px;
	margin: 0 auto;
}
fieldset{
	width: 800px;
	margin: 0 auto;
	padding: 30px;
}
textarea{
	resize: none;
}

.inputgroup{
	margin: 30px 0;
	display: flex;
    align-items: flex-start;
}
label {
	display: inline-block;
	margin-right: 15px;
	width: 100px;
	
}

</style>
<% 
	TBoardVO boardVO = (TBoardVO)request.getAttribute("boardVO");
	List<TImageVO> ilist = (List<TImageVO>)request.getAttribute("ilist");
%>
<script type="text/javascript"> 
path = "<%=request.getContextPath()%>"
tboard_id="<%=boardVO.getTboard_id()%>"
$(()=>{
	
    
    
<%   
    out.print("modifyImageLoad('"+boardVO.getTboard_id()+"')");
%>
	
	
	
	categoryRecieve("<%=boardVO.getCategory_id()%>");
	$("#title").val("<%=boardVO.getTboard_title()%>");
	$(".state[value=<%=boardVO.getTboard_state()%>]").prop("checked",true);
	$("#price").val("<%=boardVO.getTboard_price()%>");
	$("#content").val("<%=boardVO.getTboard_content().replace("\r\n", "\\r\\n")%>");

      

     
    	  	
    	  	
  
})

</script>
</head>
<body>
<div class="wrap">
   <%@ include file="/module/header.jsp" %>
</div>
      
      
<div id="out">
	<div id="formdiv">
		<form id="wform">
			<fieldset>
				<legend>글 수정</legend>
				<input type="file" class="real-upload" accept="image/*" required multiple >
				<h3>이미지 업로드</h3><br>
				<div id="uldiv">
					<ul class="image-preview">
						<li id="upload">
							<div class="upload"></div>
						</li>
					</ul>
				</div>
				<div class="inputgroup">
					<label for="title">제목</label>
					<input type="text" name="title" id="title" size="60"><br>
				</div>
				
				<div class="inputgroup">
					<label>판매구매</label>
					<label><input type="radio" name="state" class="state" value="삽니다"> 삽니다</label>
				    <label><input type="radio" name="state" class="state" value="팝니다"> 팝니다</label>
				    <label><input type="radio" name="state" class="state" value="나눔"> 나눔</label>
				</div>
				<div class="inputgroup">
					<label for="category">카테고리</label>
					<select name="category" id="category">			
					</select>
				</div>
				<div class="inputgroup">
					<label for="text">가격</label>
					<input type="text" name="price" id="price" value="<%=boardVO.getTboard_price() %>" size="10">&nbsp;원<br>
				</div>
				<div class="inputgroup">
					<label id="contentlabel" for="content">내용</label>
					<textarea rows="10" cols="60" id="content"></textarea>
				</div>
				<div class="inputgroup">
					<input type="button" id="modify" value="수정">
					<input type="button" id="cancle" value="취소">
				</div>
			</fieldset>
			
		</form>
	</div>
</div>
<%@ include file="/module/footer.jsp" %>
</body>
</html>