// 댓글 리스트
$.pcommentListServer = function(page){
	$.ajax({
		 url: `${mypath}/pcommentList.do`,
		 type : 'post',
		 data : {"pboardId" : 64,
		 		 "page":page}, // tboard_id
		 dataType : 'json',
		 success : function(res){
			$.each(res, function(i,v){
				pcontent = v.pcomment_content;
//				cont = cont.replaceAll(/\n/g, "<br>");
				level = v.level
				if(level>3){
					level=3;
				}
				var code= "";
				if(v.pcomment_isremove=='n'){
					
					code += `<div class="b${level}" id="${v.pcomment_id}">
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span  id="writer">${v.mem_id}</span>&nbsp;&nbsp;
								<span id="content">${pcontent}</span>
								<span id="cdate">${v.pcomment_cdate}</span>
								<input type="button" name="p_insert" idx="${v.pcomment_id}" class="action" value="답글달기">
								<input type="button" name="p_delete" idx="${v.pcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="p_modify" idx="${v.pcomment_id}" class="action" value="댓글수정">
							</div>`;
					
				}else if(v.pcomment_isremove=='y'){
					code += `<div class="b${level}" id="${v.pcomment_id}">
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span  id="writer">${v.mem_id}</span>&nbsp;&nbsp;
								<span id="content">삭제된 댓글 입니다.</span>
								<span id="cdate">${v.pcomment_cdate}</span>
								<input type="button" name="p_insert" idx="${v.pcomment_id}" class="action" value="답글달기">
								<input type="button" name="p_delete" idx="${v.pcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="p_modify" idx="${v.pcomment_id}" class="action" value="댓글수정">
							</div>`;
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
	$.ajax({
		url: `${mypath}/pcommentInsert.do`,
		type: 'post',
		data: { "pboardId": 64, // pboard_id
				"memId" : qkrwjdtn2, 	// mem_id
				"pcontent" : pcontent},
		success : function(res){
			if(res!=null&&res!=""&& typeof res!="undefined"){
				code = "";
				code += `<div class="b1" id="${res.pcomment_id}">
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span  id="writer">${res.mem_id}</span>&nbsp;&nbsp;
								<span id="content">${res.pcomment_content}</span>
								<span id="cdate">${res.pcomment_cdate}</span>
								<input type="button" name="p_insert" idx="${res.pcomment_id}" class="action" value="답글달기">
								<input type="button" name="p_delete" idx="${res.pcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="p_modify" idx="${res.pcomment_id}" class="action" value="댓글수정">
						</div>`;
				
				$('#pctLayer').append(code);
				
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
		data : {"pboardId": 64,
				"memId" :qkrwjdtn2,
				"pcontent" : reContent,
				"pcommentPid" : pcommentPid},
		dataType : 'json',
		success : function(res){
			level="";
			code="";
			if(pcommentLevel=='b1'){
				level=2;
			}else if(pcommentLevel=='b2'){
				level=3;
			}else{
				level=3
			}
			code += `<div class="b${level}" id="${res.pcomment_id}">
					<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
					<span  id="writer">${res.mem_id}</span>&nbsp;&nbsp;
					<span id="content">${res.pcomment_content}</span>
					<span id="cdate">${res.pcomment_cdate}</span>
					<input type="button" name="p_insert" idx="${res.pcomment_id}" class="action" value="답글달기">
					<input type="button" name="p_delete" idx="${res.pcomment_id}" class="action" value="댓글삭제">
					<input type="button" name="p_modify" idx="${res.pcomment_id}" class="action" value="댓글수정">
					</div>`;
			
			
			parentcomment.after(code)
			
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
				"pcommentId" : tidx
				},
		dataType : 'json',
		success : function(res){
			if(res==1){
				target.find("#content").text("삭제된 댓글 입니다.")
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
				"pcommentId" : tidx,
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



