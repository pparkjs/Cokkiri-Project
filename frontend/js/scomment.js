// 댓글 리스트
$.scommentListServer = function(page) {
	$.ajax({
		url: `${path}/scommentList.do`,
		type: 'post',
		data: {
			"sboardId": boardId, // sboard_id
			"page": page
		},
		dataType: 'json',
		success: function(res) {
			//var code2="";
				console.log(res);
			$.each(res, function(i, v) {
				scontent = v.scomment_content;
				//				cont = cont.replaceAll(/\n/g, "<br>");
				level = v.level
				if (level > 3) {
					level = 3;
				}
				var code = "";
				//console.log(v.level)
				dimg="";
				if(level!=1){
					dimg=`<img src="${path}/images/대댓글.png" width="15px" height="15px">`;
				}
				if (v.scomment_isremove == 'n') { // 삭제 안된 거 일때
				
				 
					code += `<div class="dw a${level}" id="${v.scomment_id}">
								<img alt="기본프로필.png" src="${path}/images/기본프로필.png" width="40px" height="40px">`
				 if(v.mem_id == boardWriterId){					
					code +=		`<span  class="writer" class="writer">익명(글쓴이)</span>&nbsp;&nbsp;`
				 }else{
					code +=		`<span  class="writer" class="writer">익명${v.scomment_writer}</span>&nbsp;&nbsp;`
				 }
					code +=		`<span class="cdate">${v.scomment_cdate}</span><br>
								${dimg}<span class="content">${scontent}</span><br><br>
								<input type="button" name="s_insert" idx="${v.scomment_id}" class="action" value="답글달기">&nbsp;`
				if(v.mem_id==memId){	//로그인한 내가 쓴건지 비교
						
					code+=			`<input type="button" name="s_delete" idx="${v.scomment_id}" class="action" value="댓글삭제">&nbsp;
								<input type="button" name="s_modify" idx="${v.scomment_id}" class="action" value="댓글수정">
							`
					}
					code+=`</div>`
				} else if (v.scomment_isremove == 'y') { //삭제 된 거 일때
					code += `<div class="dw a${level}" id="${v.scomment_id}">
								<img alt="기본프로필.png" src="${path}/images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span  class="writer" class="writer">익명${v.scomment_writer}</span>&nbsp;&nbsp;
								<span class="cdate">${v.scomment_cdate}</span><br> 
								${dimg}<span class="content">삭제된 댓글입니다.</span><br><br>`
					code+=`</div>`
				}

				$('#tctLayer').append(code);
			})

		},
		error: function(xhr) {
			alert('상태: ' + xhr.status);
		}
	})
}

// 댓글 등록
$.scommentWriteServer = function() {
	$.ajax({
		url: `${path}/scommentInsert.do`,
		type: 'post',
		data: {
			"sboardId": boardId, // sboard_id
			"scontent": scontent,
			"boardWriterId" : boardWriterId
		},

		success: function(res) {
			if (res != null && res != "" && typeof res != "undefined") {
				$.scommentListServer(1);
				page=1;
				$("#tctLayer").empty();
				$('#sInsert textarea').val("");
			}
		},
		error: function(xhr) {
			alert(xhr.status);
		},
		dataType: 'json'
	})
}

// 대댓글 등록
$.retcommentWriteServer = function() {
	$.ajax({
		url: `${path}/scommentInsert.do`,
		type: 'post',
		data: {
			"sboardId": boardId,
			"scontent": reContent,
			"scommentPid": scommentPid,
			"boardWriterId" : boardWriterId
		},
		dataType: 'json',
		success: function(res) {
			level = "";
			code = "";
			console.log(res)
			if (pcommentLevel.indexOf('a1')!=-1) {
				level = 2;
			} else if (pcommentLevel.indexOf('a2')!=-1) {
				level = 3;
			} else {
				level = 3
			}
			dimg="";
			if(level!=1){
					dimg=`<img src='${path}/images/대댓글.png' width="15px" height="15px">`;
				}
			code += `<div class="dw a${level}" id="${res.scomment_id}">
								<img alt="기본프로필.png" src="${path}/images/기본프로필.png" width="40px" height="40px">&nbsp;
								<span class="writer">익명${res.scomment_writer}</span>&nbsp;&nbsp;
								<span class="cdate">${res.scomment_cdate}</span><br>
								${dimg}<span class="content">${reContent}</span><br><br>
								<input type="button" name="s_insert" idx="${res.scomment_id}" class="action" value="답글달기">&nbsp;`
					
					if(res.mem_id==memId){	 //로그인한 아이디오비교
						
					code+=			`<input type="button" name="s_delete" idx="${res.scomment_id}" class="action" value="댓글삭제">&nbsp;
								<input type="button" name="s_modify" idx="${res.scomment_id}" class="action" value="댓글수정">
							`
					}
				code+=`</div>`
				
			parentcomment.after(code)

		},
		error: function(xhr) {
			alert(xhr.status);
		}
	})
}

// 댓글 삭제
$.scommentDeleteServer = function() {
	$.ajax({
		url: `${path}/scommentDelete.do`,
		type: 'post',
		data: {
			"scommentId": sidx //댓글 작성자의 아이디
		},
		dataType: 'json',
		success: function(res) {
			if (res == 1) {
				target.find(".content").text("삭제된 댓글 입니다.")
				target.find("input").remove();
				target.find('.content').next('br').remove();
			} else {
				alert("다른사람의 댓글입니다.")
			}

		},
		error: function(xhr) {
			alert(xhr.status);
		}
	})
}

// 댓글 수정
$.scommentUpdateServer = function(target) {
	//	secret = $('#is_private').prop('checked');
	//	console.log(secret);
	$.ajax({
		url: `${path}/scommentUpdate.do`,
		type: 'post',
		data: {
			"scommentId": sidx,
			"scontent": scontent,
			//				"issecret" : secret
		},
		dataType: 'json',
		success: function(res) {

			if (res > 0) {
				sparent.text(scontent);
			}
		},
		error: function(xhr) {
			alert(xhr.status);
		}
	})
}

