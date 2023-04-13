$.tcommentListServer = function(){
	 $.ajax({
		 url: `${mypath}/tcommentList.do`,
		 type : 'post',
		 data : {"tboardId" : 48}, // tboard_id
		 dataType : 'json',
		 success : function(res){
			 /* alert("성공"); */
			var code= "";
			//var code2="";
			$.each(res, function(i,v){
				$('#tctLayer').empty();
				console.log(v);
				tcontent = v.tcomment_content;
//				cont = cont.replaceAll(/\n/g, "<br>");
				level = v.level

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
					
				}else if(v.tcomment_isremove=='y' && v.hasparent=='y'){
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
				}
				
				$('#tctLayer').append(code);
			})
			
		 },
		 error  : function(xhr){
			 alert(xhr.status);
		 }
	 })
 }

$.tcommentWriteServer = function() {
	$.ajax({
		url: `${mypath}/tcommentInsert.do`,
		type: 'post',
		data: { "tboardId": 48, // tboard_id
				"memId" : 1,
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

$.retcommentWriteServer = function(){
	$.ajax({
		url : `${mypath}/tcommentInsert.do`,
		type : 'post',
		data : {"tboardId": 48,
				"memId" : 1,
				"tcontent" : reContent,
				"tcommentPid" : tcommentPid},
		dataType : 'json',
		success : function(res){
			$('#tctLayer').empty();
			$.tcommentListServer();
		},
		error : function(xhr){
			alert(xhr.status);
		}
	})
}

$.tcommentDeleteServer=function(target){
	$.ajax({
		url : `${mypath}/tcommentDelete.do`,
		type : 'post',
		data : {
				"tcommentId" : tidx
				},
		dataType : 'json',
		success : function(res){

			$.tcommentListServer();
		},
		error : function(xhr){
			alert(xhr.status);
		}
	})
}

$.tcommentPagetServer=function(){
	$.ajax({
		url : `${mypath}/tcommentPage.do`,
		type : 'post',
		
	})
}