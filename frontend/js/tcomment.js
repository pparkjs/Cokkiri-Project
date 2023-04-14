// 댓글 리스트
$.tcommentListServer = function(page){
	 $.ajax({
		 url: `${mypath}/tcommentList.do`,
		 type : 'post',
		 data : {"tboardId" : 202, // tboard_id
		 		 "page":page,
		 		 "memId" : 1}, 
		 dataType : 'json',
		 success : function(res){
			 /* alert("성공"); */
			//var code2="";
			$.each(res, function(i,v){
				tcontent = v.tcomment_content;
//				cont = cont.replaceAll(/\n/g, "<br>");
				level = v.level
				if(level>3){
					level=3;
				}
				var code= "";
				//console.log(v.level)
				if(v.tcomment_isremove=='n'){
					
					code += `<div class="a${level}" id="${v.tcomment_id}">
								<input type="hidden" id="tcomment_id" name="tcomment_id">
								<input type="hidden" id="tboard_id" name="tboard_id">
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span  id="writer">${v.mem_id}</span>&nbsp;&nbsp;
								<span id="content">${tcontent}</span>
								<span id="cdate">${v.tcomment_cdate}</span>
								<input type="button" name="t_insert" idx="${v.tcomment_id}" class="action" value="답글달기">
								<input type="button" name="t_delete" idx="${v.tcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="t_modify" idx="${v.tcomment_id}" class="action" value="댓글수정">
							</div>`;
					
				}else if(v.tcomment_isremove=='y'){
					code += `<div class="a${level}" id="${v.tcomment_id}">
								<input type="hidden" id="tcomment_id" name="tcomment_id">
								<input type="hidden" id="tboard_id" name="tboard_id">
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span  id="writer">${v.mem_id}</span>&nbsp;&nbsp;
								<span id="content">삭제된 댓글 입니다.</span>
								<span id="cdate">${v.tcomment_cdate}</span>
								<input type="button" name="t_insert" idx="${v.tcomment_id}" class="action" value="답글달기">
								<input type="button" name="t_delete" idx="${v.tcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="t_modify" idx="${v.tcomment_id}" class="action" value="댓글수정">
							</div>`;
				}else if(v.tcomment_secret == 'true'){
					code += `<div class="a${level}" id="${v.tcomment_id}">
								<input type="hidden" id="tcomment_id" name="tcomment_id">
								<input type="hidden" id="tboard_id" name="tboard_id">
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span  id="writer">${v.mem_id}</span>&nbsp;&nbsp;
								<span id="content">비밀 댓글 입니다.</span>
								<span id="cdate">${v.tcomment_cdate}</span>
								<input type="button" name="t_insert" idx="${v.tcomment_id}" class="action" value="답글달기">
								<input type="button" name="t_delete" idx="${v.tcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="t_modify" idx="${v.tcomment_id}" class="action" value="댓글수정">
							</div>`;
				}else if(v.tcomment_secret == 'false'){
					code += `<div class="a${level}" id="${v.tcomment_id}">
								<input type="hidden" id="tcomment_id" name="tcomment_id">
								<input type="hidden" id="tboard_id" name="tboard_id">
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span  id="writer">${v.mem_id}</span>&nbsp;&nbsp;
								<span id="content">${tcontent}</span>
								<span id="cdate">${v.tcomment_cdate}</span>
								<input type="button" name="t_insert" idx="${v.tcomment_id}" class="action" value="답글달기">
								<input type="button" name="t_delete" idx="${v.tcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="t_modify" idx="${v.tcomment_id}" class="action" value="댓글수정">
							</div>`;
				}
				
				
				
				$('#tctLayer').append(code);
			})
			
		 },
		 error  : function(xhr){
			 alert(xhr.status);
		 }
	 })
 }

// 댓글 등록
$.tcommentWriteServer = function() {
	$.ajax({
		url: `${mypath}/tcommentInsert.do`,
		type: 'post',
		data: { "tboardId": 202, // tboard_id
				"memId" : 1, 	// mem_id
				"tcontent" : tcontent},

		success: function(res) {
			if(res!=null&&res!=""&& typeof res!="undefined"){
				code = "";
				code += `<div class="a1" id="${res.tcomment_id}">
								<input type="hidden" id="tcomment_id" name="tcomment_id">
								<input type="hidden" id="tboard_id" name="tboard_id">
								<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span  id="writer">${res.mem_id}</span>&nbsp;&nbsp;
								<span id="content">${res.tcomment_content}</span>
								<span id="cdate">${res.tcomment_cdate}</span>
								<input type="button" name="t_insert" idx="${res.tcomment_id}" class="action" value="답글달기">
								<input type="button" name="t_delete" idx="${res.tcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="t_modify" idx="${res.tcomment_id}" class="action" value="댓글수정">
						</div>`;
							
				$('#tctLayer').append(code);
				
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
$.retcommentWriteServer = function(){
	$.ajax({
		url : `${mypath}/tcommentInsert.do`,
		type : 'post',
		data : {"tboardId": 202,
				"memId" : 1,
				"tcontent" : reContent,
				"tcommentPid" : tcommentPid},
		dataType : 'json',
		success : function(res){
			level="";
			code="";
			if(pcommentLevel=='a1'){
				level=2;
			}else if(pcommentLevel=='a2'){
				level=3;
			}else{
				level=3
			}
			code += `<div class="a${level}" id="${res.tcomment_id}">
					<input type="hidden" id="tcomment_id" name="tcomment_id">
					<input type="hidden" id="tboard_id" name="tboard_id">
					<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
					<span  id="writer">${res.mem_id}</span>&nbsp;&nbsp;
					<span id="content">${res.tcomment_content}</span>
					<span id="cdate">${res.tcomment_cdate}</span>
					<input type="button" name="t_insert" idx="${res.tcomment_id}" class="action" value="답글달기">
					<input type="button" name="t_delete" idx="${res.tcomment_id}" class="action" value="댓글삭제">
					<input type="button" name="t_modify" idx="${res.tcomment_id}" class="action" value="댓글수정">
					</div>`;
			
			
			parentcomment.after(code)
			
		},
		error : function(xhr){
			alert(xhr.status);
		}
	})
}

// 댓글 삭제
$.tcommentDeleteServer=function(){
	$.ajax({
		url : `${mypath}/tcommentDelete.do`,
		type : 'post',
		data : {
				"tcommentId" : tidx
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
$.tcommentUpdateServer = function(target){
	secret = $('#is_private').prop('checked');
	console.log(secret);
	$.ajax({
		url : `${mypath}/tcommentUpdate.do`,
		type : 'post',
		data : {
				"tcommentId" : tidx,
				"tcontent" : tcontent,
				"issecret" : secret
		},
		dataType : 'json',
		success : function(res){
			
			if(res > 0){
				tparent.html(tcontent);
			}
		},
		error : function(xhr){
			alert(xhr.status);
		}
	})
}

