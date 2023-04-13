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
				console.log(v);
				tcontent = v.tcomment_content;
//				cont = cont.replaceAll(/\n/g, "<br>");
				level = v.level
				if(level > 2){
					level == 2;
				}
				//console.log(v.level)
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
			})
			$('#tctLayer').html(code);
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
			//1
			code = "";
			/*code += `<div class="a${level}" id="${v.tcomment_id}">
							<input type="hidden" id="tcomment_id" name="tcomment_id">
							<input type="hidden" id="tboard_id" name="tboard_id">
							<img alt="기본프로필.png" src="../images/기본프로필.png" width="40px" height="40px">&nbsp;
							<span  id="writer">${v.mem_id}</span>&nbsp;&nbsp;
							<span id="content">${cont}</span>
							<span id="cdate">${v.tcomment_cdate}</span>
							<input type="button" name="t_insert" idx="${v.tcomment_id}" class="action" value="답글달기">
							<input type="button" name="t_delete" idx="${v.tcomment_id}" class="action" value="댓글삭제">
							<input type="button" name="t_modify" idx="${v.tcomment_id}" class="action" value="댓글수정">
						</div>`;
						
			$('#tctLayer').html(code);*/
			if(res > 0) {
				$.tcommentListServer();
			}
			
			$('#tInsert textarea').val("");
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
				"tcommentPid" : tcommentPid,
				"level" : 2},
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
			alert("성공");
			$(target).parents('#tctLayer').find('.a{level}').remove();
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