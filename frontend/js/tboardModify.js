/**
 * 
 */

 categoryRecieve = function(category_id) {

	$.ajax({
		url: `${path}/category.do`,
		type: "get",
		dataType: "json",
		success: function(res) {

			code = "";

			$.each(res, function(i, v) {
				if (category_id == v["category_id"]) {
					code += "<option id=" + v["category_id"] + " selected>" + v["category_name"]
				} else {
					code += "<option id=" + v["category_id"] + ">" + v["category_name"]
				}


			})
			$("#category").append(code);
		},
		error: function(xhr) {
			alert("상태: " + xhr.status)
		}
	})

}




function getImageFiles(e) {
	const files = e.currentTarget.files;
	const imagePreview = document.querySelector('.image-preview');
	const docFrag = new DocumentFragment();
	const uploadbtn = document.querySelector('#upload');

	if ([...files].length >= 7 || uploadFiles.length + [...files].length >= 7) {
		alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
		return;
	}


	// 파일 타입 검사
	[...files].forEach(file => {
		if (!file.type.match("image/.*") || file.type.match("image/svg.*")) {
			alert('이미지 파일만 업로드가 가능합니다.');
			return
		}

		// 파일 갯수 검사
		if ([...files].length < 7 && uploadFiles.length + 1 < 7) {
			uploadFiles.push(file);
			const reader = new FileReader();
			reader.onload = (e) => {
				console.log(e.target)
				const preview = createElement(e, file);
				preview.classList.add("animation-init");
				imagePreview.insertBefore(preview, uploadbtn)
				setTimeout(function() {
					preview.classList.add("animation-fade");
				}, 30);


			};
			reader.readAsDataURL(file);
		}
	});
}

function createElement(e, file) {
	const li = document.createElement('li');
	const img = document.createElement('img');
	img.setAttribute('src', e.target.result);
	img.setAttribute('data-file', file.name);
	img.setAttribute('class', "previewimg")
	li.appendChild(img);
	$(li).on("click", function(e) { $.deleteFile(e); })
	return li;
}
function createElement2(e, file) {
	const li = document.createElement('li');
	const img = document.createElement('img');
	img.setAttribute('src', e);
	img.setAttribute('data-file', file.name);
	img.setAttribute('class', "previewimg")
	li.appendChild(img);
	$(li).on("click", function(e) { $.deleteFile(e); })
	return li;
}

$.deleteFile = function(e) {

	savename = $(e.currentTarget).find("img").attr("data-file");

	isdel = confirm("파일을 지우시겠습니까?")
	if (isdel) {
		$.each(uploadFiles, function(i, v) {
			if (savename == v.name) {
				uploadFiles.splice(i, 1);
				$(e.currentTarget).remove();
				return false;
			}
		})
	} else {
		return;
	}

}


function modifyImageLoad(tboard_id) {
	$.ajax({
		url: `${path}/ModifyImage.do`,
		type: "post",
		data: { tboard_id: tboard_id },

		success: function(res) {		
			res.forEach(function(v){		
				console.log(v);
				a=("data:image/jpeg;base64,"+v.file)
				var file = base64ToFile(v)
				uploadFiles.push(file);
				var preview = createElement2(a, file);
				preview.classList.add("animation-init");
				imagePreview.insertBefore(preview, uploadbtn);
				setTimeout(function() {
					preview.classList.add("animation-fade");
				}, 30);
			})
			
		},
		error: function(xhr) {
			alert("상태: " + xhr.status);
		},
		dataType:"json"
	});
}


base64ToFile=function(data){
	filedata="data:image/*;base64,"+data.file;
	var bstr = atob(filedata.split(",")[1]);
	var n = bstr.length;
	var u8arr = new Uint8Array(n);
	
	while(n--) {
		u8arr[n] = bstr.charCodeAt(n);
	}
	
	return new File([u8arr], data.saveName, {type:"text/xml"});
}




window.onload=function(){
	uploadFiles = [];
	realUpload = document.querySelector('.real-upload');
    upload = document.querySelector('.upload');
    imagePreview = document.querySelector('.image-preview');
    docFrag = new DocumentFragment();
    uploadbtn =  document.querySelector('#upload');
    
    
    
    upload.addEventListener('click', () => realUpload.click());

      realUpload.addEventListener('change', getImageFiles);
      
      $("#cancle").on("click",function(){ 	  
    	  sessionStorage.clear();
    	  location.href=`${path}/tboardInfo.do?id=${tboard_id}` 		
      })
      
      
      
      
      $(".ssbtn").on("click",function(){
		  state=$(this).text();
		  $(".ssbtn").removeClass("activeBtn")
		  $(this).addClass("activeBtn");
	  })
      
      
      $("#modify").on("click",function(){ 	  
    	  	
    	  	price=$("#price").val()
    	  	category=$("#category :selected").attr("id")
    	  	title=$("#title").val()
    	  	content=$("#content").val()
    	  	
    	  	
    	  	if(title==""){
    	  		alert("제목을 입력해 주세요.")
    	  		return ;
    	  	}
    	  	
    	  	
      	  	if(typeof state == "undefined"||state==""||state==null){
    	  		alert("판매구매 상태를 확인해 주세요.")
    	  		return ;
    	  	}
    	  	
    	  	
    	  	
    	  	
    	  	pcheck =/^[0-9]+$/;
    	  	if(price==""){
    	  		alert("가격을 입력해주세요.");
    	  		return ;
    	  	}else if(!pcheck.test(price)){
    	  		alert("숫자만 입력 가능합니다.")
    	  		return ;
    	  	}
    	  	
    	  	if(content==""){
    	  		alert("내용을 입력해 주세요")
    	  		return;
    	  	}
    	  	
    	  	
    	  	formData = new FormData();
    	  	
    	  	formData.append("category",category)
    	  	formData.append("price",price)
    	  	formData.append("state",state)
    	  	formData.append("title",title)		
    	  	formData.append("content",content)
    	  	formData.append("tboard_id",tboard_id)
    	  			
    	  	$.each(uploadFiles,function(i,v){
    	  		formData.append('files',v);
    	  	})
    	  	
    	  	$.ajax({
				url: `${path}/tboardUpdate.do`,
				type: "post",
				processData: false,  // file전송시 필수
    	    	contentType: false,  // file전송시 필수
				data: formData,
				success : function(res){
					if("true"==res){
						alert("수정 되었습니다.")
					}else{
						alert("수정에 실패했습니다.")
					}
					location.href=`${path}/tboardInfo.do?id=${tboard_id}`
				},
				error : function(xhr){
					alert("상태: "+xhr.status)
				}
			})

    	  	
    	  	
    	  	
      })
}