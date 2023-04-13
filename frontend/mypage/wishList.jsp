<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
</head>
<body>
<!-- header -->
<%@ include file="/module/header.jsp" %>
               
<!-- container 시작 -->
<div class="container">
<select class="wishListCategory" name="wishListCategory">
	<option value="">
</select>
</div>
 	
<!-- footer -->
<%@ include file="/module/footer.jsp" %>	
 
<script>
    let home1TextH = document.querySelector('.home1__h1')
    let home1TextP = document.querySelector('.home1__p')
    let home2TextH = document.querySelector('.home2__h1')
    let home2TextP = document.querySelector('.home2__p')
    let home3TextH = document.querySelector('.home3__h1')
    let home3TextP = document.querySelector('.home3__p')
    //스크롤 할때 줄 이벤트
    window.addEventListener('scroll', function(){
        //스크롤의 높이를 가져오는 것
        let value = window.scrollY 
        console.log(value);
        if(value > 250){
            // 애니메이션에 forwards주면 방금 일어난 에니메이션상태 유지됨
            home1TextH.style.animation = "disappear 1s ease-out forwards";
            home1TextP.style.animation = "disappear 1s ease-out forwards";
        }else{
            home1TextH.style.animation = "slideLeft 1s ease-out";
            home1TextP.style.animation = "slideLeft 1.5s ease-out";
        }
        if(value < 350 || value > 950){
            home2TextH.style.animation = "disappearH 1s ease-out forwards";
            home2TextP.style.animation = "disappearP 1s ease-out forwards";
        }else{
            home2TextH.style.animation = "slideRightH 1s ease-out";
            home2TextP.style.animation = "slideRightP 1.5s ease-out";
        }

        if(value < 950){
            // 애니메이션에 forwards주면 방금 일어난 에니메이션상태 유지됨
            home3TextH.style.animation = "disappear 1s ease-out forwards";
            home3TextP.style.animation = "disappear 1s ease-out forwards";
        }else{
            home3TextH.style.animation = "slideLeft 1s ease-out";
            home3TextP.style.animation = "slideLeft 1.5s ease-out";
        }
    
    })

</script>
</body>
</html>