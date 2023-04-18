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
					dimg=`<img src='images/대댓글.png' width="15px" height="15px">`;
				}
				dsrc='images/기본프로필.png'
				if(v.memberVO.mem_image!=null&&v.memberVO.mem_image!=""&&typeof v.memberVO.mem_image!="undefined"){
					dsrc=path+"/profileImageView.do?mem_id="+v.memberVO.mem_id
				}
				
				if(v.pcomment_isremove=='N'){
					
					code += `<div class="dw a${level}" id="${v.pcomment_id}">
								<img id="profile" alt="기본프로필.png" src="${dsrc}" width="40px" height="40px">
								<span class="writer">${v.memberVO.mem_nickname}</span>&nbsp;&nbsp;
								<span class="cdate">${v.pcomment_cdate}</span><br>
								${dimg}<span class="content">${pcontent}</span><br><br>
								<input type="button" name="p_insert" idx="${v.pcomment_id}" class="action" value="답글달기">&nbsp;
								<input type="button" name="p_delete" idx="${v.pcomment_id}" class="action" value="댓글삭제">&nbsp;
								<input type="button" name="p_modify" idx="${v.pcomment_id}" class="action" value="댓글수정">&nbsp;
							</div><br>`;
					
				}else if(v.pcomment_isremove=='Y'){
					code += `<div class="dw a${level}" id="${v.pcomment_id}">
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span  class="writer" class="writer">${v.memberVO.mem_nickname}</span>&nbsp;&nbsp;
								<span class="cdate">${v.pcomment_cdate}</span><br>
								${dimg}<span class="content">삭제된 댓글 입니다.</span><br><br>
								
							</div><br>`;
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
				$("#tctLayer").empty();
				$('#tInsert textarea').val("");
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
			level="";
			code="";
			if(ppcommentLevel=='a1'){
				level=2;
			}else if(ppcommentLevel=='a2'){
				level=3;
			}else{
				level=3
			}
			dimg="";
			if(level!=1){
					dimg=`<img src='images/대댓글.png' width="15px" height="15px">`;
				}
			dsrc='images/기본프로필.png'
			if(res.memberVO.mem_image!=null&&res.memberVO.mem_image!=""&&typeof res.memberVO.mem_image!="undefined"){
				dsrc=path+"/profileImageView.do?mem_id="+res.memberVO.mem_id
			}
			code += `<div class="dw a${level}" id="${res.pcomment_id}">
					<img alt="기본프로필.png" src="${dsrc}" width="40px" height="40px">&nbsp;
					<span  class="writer" class="writer">${res.memberVO.mem_nickname}</span>
					<span class="cdate">${res.pcomment_cdate}</span><br>
					${dimg}<span class="content">${reContent}</span><br><br>
					<input type="button" name="p_insert" idx="${res.pcomment_id}" class="action" value="답글달기">&nbsp;
					<input type="button" name="p_delete" idx="${res.pcomment_id}" class="action" value="댓글삭제">&nbsp;
					<input type="button" name="p_modify" idx="${res.pcomment_id}" class="action" value="댓글수정">&nbsp;
					</div><br>`;
			
			
			pparentcomment.after(code)
			
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
				target.find("#content").text("삭제된 댓글 입니다.")
				target.find('input').remove();
			}else{
				alert("실패")
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
			
			if(res > 0){
				pparent.html(pcontent);
			}
		},
		error : function(xhr){
			alert(xhr.status);
		}
	})
}



