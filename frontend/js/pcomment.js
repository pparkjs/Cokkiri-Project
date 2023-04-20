// 댓글 리스트
$.pcommentListServer = function(page){
	$.ajax({
		 url: `${mypath}/pcommentList.do`,
		 type : 'post',
		 data : {"pboardId" : pboard_id, // pboard_id
		 		 "page": page
		 		 }, 
		 dataType : 'json',
		 success : function(res){
//			 console.log(res);
			$.each(res, function(i,v){
				pcontent = v.pcomment_content;
//				cont = cont.replaceAll(/\n/g, "<br>");
				level = v.level
				if(level>3){
					level=3;
				}
				var code= "";
				dimg=""
				if(level!=1){
					dimg=`<img src='${mypath}/images/대댓글.png' width="15px" height="15px">`;
					code += `<div class="dw a${level} son"  id="${v.pcomment_id}">`	
				}else{
						code += `<div class="dw a${level}" id="${v.pcomment_id}">`
				}
				dsrc='images/기본프로필.png'
				if(v.memberVO.mem_image!=null&&v.memberVO.mem_image!=""&&typeof v.memberVO.mem_image!="undefined"){
					dsrc=mypath+"/profileImageView.do?mem_id="+v.memberVO.mem_id
				}
				
				if(v.pcomment_isremove=='N'){
					
					code += `
								<img id="profile" alt="기본프로필.png" src="${dsrc}" width="40px" height="40px">
								<span class="writer">${v.memberVO.mem_nickname}</span>
								<span class="cdate">${v.pcomment_cdate}</span><br>
								${dimg}<span class="content">${pcontent}</span><br><br>
								<input type="button" name="p_insert" idx="${v.pcomment_id}" class="action" value="답글달기">`
			   if(v.mem_id==memId){	
						
					code+=		`<input type="button" name="p_delete" idx="${v.pcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="p_modify" idx="${v.pcomment_id}" class="action" value="댓글수정">
							`
					}
					code+=`</div>`
				}else if(v.pcomment_isremove=='Y'){
					code += `
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">
								<span  class="writer" class="writer">${v.memberVO.mem_nickname}</span>
								<span class="cdate">${v.pcomment_cdate}</span><br>
								${dimg}<span class="content">삭제된 댓글 입니다.</span><br><br>`
								
					code+=`</div>`		
				}
				
				$('#pctLayer').append(code);
			})
			
		 },
		 error  : function(xhr){
			 alert(xhr.status);
		 }
	})
}


$.pcommentListServer2 = function(page){
	$.ajax({
		 url: `${mypath}/pcommentList.do`,
		 type : 'post',
		 data : {"pboardId" : pboard_id, // pboard_id
		 		 "page": page
		 		 }, 
		 dataType : 'json',
		 success : function(res){
//			 console.log(res);
			$('#pctLayer').empty();
			$.each(res, function(i,v){
				pcontent = v.pcomment_content;
//				cont = cont.replaceAll(/\n/g, "<br>");
				level = v.level
				if(level>3){
					level=3;
				}
				var code= "";
				dimg=""
				if(level!=1){
					dimg=`<img src='${mypath}/images/대댓글.png' width="15px" height="15px">`;
					code += `<div class="dw a${level} son"  id="${v.pcomment_id}">`	
				}else{
						code += `<div class="dw a${level}" id="${v.pcomment_id}">`
				}
				dsrc='images/기본프로필.png'
				if(v.memberVO.mem_image!=null&&v.memberVO.mem_image!=""&&typeof v.memberVO.mem_image!="undefined"){
					dsrc=mypath+"/profileImageView.do?mem_id="+v.memberVO.mem_id
				}
				
				if(v.pcomment_isremove=='N'){
					
					code += `
								<img id="profile" alt="기본프로필.png" src="${dsrc}" width="40px" height="40px">
								<span class="writer">${v.memberVO.mem_nickname}</span>
								<span class="cdate">${v.pcomment_cdate}</span><br>
								${dimg}<span class="content">${pcontent}</span><br><br>
								<input type="button" name="p_insert" idx="${v.pcomment_id}" class="action" value="답글달기">`
			   if(v.mem_id==memId){	
						
					code+=		`<input type="button" name="p_delete" idx="${v.pcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="p_modify" idx="${v.pcomment_id}" class="action" value="댓글수정">
							`
					}
					code+=`</div>`
				}else if(v.pcomment_isremove=='Y'){
					code += `
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">
								<span  class="writer" class="writer">${v.memberVO.mem_nickname}</span>
								<span class="cdate">${v.pcomment_cdate}</span><br>
								${dimg}<span class="content">삭제된 댓글 입니다.</span><br><br>`
								
					code+=`</div>`		
				}
				
				$('#pctLayer').append(code);
			})
			
		 },
		 error  : function(xhr){
			 alert(xhr.status);
		 }
	})
}

// 댓글 등록
$.pcommentWriteServer = function(){
	console.log(pcontent)
	$.ajax({
		url: `${mypath}/pcommentInsert.do`,
		type: 'post',
		data: { "pboardId": pboard_id, // pboard_id
				"pcontent" : pcontent},
				
		success : function(res){
			if(res!=null&&res!=""&& typeof res!="undefined"){
				$.pcommentListServer(1);
				page=1;
				$("#pctLayer").empty();
				$('#pInsert textarea').val("");
			}
		},
		error: function(xhr) {
			alert(xhr.status);
		},
		dataType: 'json'
	})		
}

// 대댓글 등록
$.repcommentWriteServer = function(){
	$.ajax({
		url : `${mypath}/pcommentInsert.do`,
		type : 'post',
		data : {"pboardId": pboard_id,
				"pcontent" : reContent,
				"pcommentPid" : pcommentPid},
		dataType : 'json',
		success : function(res){
			page=1;
			$.pcommentListServer2(1)
		},
		error : function(xhr){
			alert(xhr.status);
		}
	})
}

// 댓글 삭제
$.pcommentDeleteServer=function(){
	$.ajax({
		url : `${mypath}/pcommentDelete.do`,
		type : 'post',
		data : {
				"pcommentId" : pidx
				},
		dataType : 'json',
		success : function(res){
			if(res==1){
				target.find(".content").text("삭제된 댓글 입니다.")
				target.find('input').remove();
//				target.find('.content').next('br').remove();
			}else{
				alert("다른사람의 댓글입니다.")
			}

		},
		error : function(xhr){
			alert(xhr.status);
		}
	})
}

// 댓글 수정
$.pcommentUpdateServer = function(target){
	$.ajax({
		url : `${mypath}/pcommentUpdate.do`,
		type : 'post',
		data : {
				"pcommentId" : pidx,
				"pcontent" : pcontent,
		},
		dataType : 'json',
		success : function(res){
			 console.log(pcontent)
			if(res > 0){
				pparent.text(pcontent);
			}
		},
		error : function(xhr){
			alert(xhr.status);
		}
	})
}



