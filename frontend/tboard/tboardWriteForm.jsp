<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mycss.css">
<script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script src="../js/tboardWrite.js" type="text/javascript"></script>
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
<script type="text/javascript"> 
path = "<%=request.getContextPath()%>"

</script>
</head>
<body>
<div class="wrap">
        <!-- nav를 포함하는 가장 상단의 header-->
        <div class="header">
            <div class="navbar">
                <div class="navbar__mainLogo">
                    <img class="mainLogo__img" src="../images/logo2.png" alt="logo.png">
                    <a class="mainLogo__a" href="../home/main.jsp">
                    	<img src="../images/logotext.png" alt="logotext.png">
                    </a>
                    
                </div>
                <ul class="navbar__board">
                    <li class="item">
                   		<a class="a1" href="#">중고거래</a>
                    	<div class="sub_menu_test">
                    		<div class="contents_menu">
                    			<ul>
                    				<li>테스트2</li>
                    				<li>테스트2</li>
                    				<li>테스트2</li>
                    				<li>테스트2</li>
                    			</ul>
                    		</div>
                    	</div> 
                    </li>
                    <li><a href="#">비밀게시판</a></li>
                    <li><a href="#">마이플레이스</a></li>
                </ul>
                <div class ="navbar__mapLogo">
                    <img src="../images/지도아이콘.png" alt="지도아이콘.png">
                    <p class="area">지역</p>	
                </div>
                <div class ="navbar__alamLogo">
                    <img src="../images/알람.png" alt="알람.png">
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
                        <img class="myimage" src="../images/기본프로필.png" alt="기본프로필.png">
                   		 <div class="sidebar" >
                       		<ul class="sidebar__list">
                         	  <li><a href="#">My 프로필</a></li>
                          	  <li><a href="#">판매내역</a></li>
                          	  <li><a href="#">관심목록</a></li>
                          	  <li><a href="#">채팅방</a></li>
                          	  <li><a href="#">내 글 보기</a></li>
                          	  <li><a href="#">로그아웃</a></li>
                     	    </ul>
                    	</div>
                    </div>
                </div>  
            </div>
        </div> 
      </div>
      
      
<div id="out">
	<div id="formdiv">
		<form id="wform">
			<fieldset>
				<legend>글 작성</legend>
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
					<input type="text" name="price" id="price" size="10">&nbsp;원<br>
				</div>
				<div class="inputgroup">
					<label id="contentlabel" for="content">내용</label>
					<textarea rows="10" cols="60" id="content"></textarea>
				</div>
				<div class="inputgroup">
					<input type="button" id="save" value="등록">
					<input type="button" id="cancle" value="취소">
				</div>
			</fieldset>
			
		</form>
	</div>
</div>
</body>
</html>