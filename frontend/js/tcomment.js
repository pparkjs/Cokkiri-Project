// 댓글 리스트
$.tcommentListServer = function(page) {
	$.ajax({
		url: `${path}/tcommentList.do`,
		type: 'post',
		data: {
			"tboardId": tboard_id, // tboard_id
			"page": page,
		},
		dataType: 'json',
		success: function(res) {
			/* alert("성공"); */
			//var code2="";
			$.each(res, function(i, v) {
				tcontent = v.tcomment_content;
				//				cont = cont.replaceAll(/\n/g, "<br>");
				level = v.level
				if (level > 3) {
					level = 3;
				}
				var code = "";
				//console.log(v.level)
				dimg="";
				if(level!=1){
					dimg=`<img src='images/대댓글.png' width="15px" height="15px">`;
					code += `<div class="dw a${level} son"  id="${v.tcomment_id}">`	
				}else{
						code += `<div class="dw a${level}" id="${v.tcomment_id}">`
				}
				dsrc='images/기본프로필.png'
				if(v.memberVO.mem_image!=null&&v.memberVO.mem_image!=""&&typeof v.memberVO.mem_image!="undefined"){
					dsrc=path+"/profileImageView.do?mem_id="+v.memberVO.mem_id
					
				}
				
				if (v.tcomment_isremove == 'n') {
					code += `
								<img id="profile" alt="기본프로필.png" src="${dsrc}" width="40px" height="40px">
								<span  class="writer" class="writer">${v.memberVO.mem_nickname}</span>
								<span class="cdate">${v.tcomment_cdate}</span><br>
								${dimg}<span class="content">${tcontent}</span><br><br>
								<input type="button" name="t_insert" idx="${v.tcomment_id}" class="action" value="답글달기">`
				if(v.mem_id==smem_id){	
						
					code+=			`<input type="button" name="t_delete" idx="${v.tcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="t_modify" idx="${v.tcomment_id}" class="action" value="댓글수정">
							`
					}
					code+=`</div>`
				} else if (v.tcomment_isremove == 'y') {
					code += `
								<img id="profile" alt="기본프로필.png" src="${dsrc}" width="40px" height="40px">
								<span  class="writer" class="writer">${v.memberVO.mem_nickname}</span>
								<span class="cdate">${v.tcomment_cdate}</span><br> 
								${dimg}<span class="content">삭제된 댓글입니다.</span><br><br>`

					code+=`</div>`
				}
				$('#tctLayer').append(code);
			})

		},
		error: function(xhr) {
			alert(xhr.status);
		}
	})
}

$.tcommentListServer2 = function(page) {
	$.ajax({
		url: `${path}/tcommentList.do`,
		type: 'post',
		data: {
			"tboardId": tboard_id, // tboard_id
			"page": page,
		},
		dataType: 'json',
		success: function(res) {
			/* alert("성공"); */
			//var code2="";
			$.each(res, function(i, v) {
				tcontent = v.tcomment_content;
				//				cont = cont.replaceAll(/\n/g, "<br>");
				level = v.level
				if (level > 3) {
					level = 3;
				}
				var code = "";
				//console.log(v.level)
				dimg="";
				if(level!=1){
					dimg=`<img src='images/대댓글.png' width="15px" height="15px">`;
					code += `<div class="dw a${level} son"  id="${v.tcomment_id}">`	
				}else{
						code += `<div class="dw a${level}" id="${v.tcomment_id}">`
				}
				dsrc='images/기본프로필.png'
				if(v.memberVO.mem_image!=null&&v.memberVO.mem_image!=""&&typeof v.memberVO.mem_image!="undefined"){
					dsrc=path+"/profileImageView.do?mem_id="+v.memberVO.mem_id
					
				}
				
				if (v.tcomment_isremove == 'n') {
					code += `
								<img id="profile" alt="기본프로필.png" src="${dsrc}" width="40px" height="40px">
								<span  class="writer" class="writer">${v.memberVO.mem_nickname}</span>
								<span class="cdate">${v.tcomment_cdate}</span><br>
								${dimg}<span class="content">${tcontent}</span><br><br>
								<input type="button" name="t_insert" idx="${v.tcomment_id}" class="action" value="답글달기">`
				if(v.mem_id==smem_id){	
						
					code+=			`<input type="button" name="t_delete" idx="${v.tcomment_id}" class="action" value="댓글삭제">
								<input type="button" name="t_modify" idx="${v.tcomment_id}" class="action" value="댓글수정">
							`
					}
					code+=`</div>`
				} else if (v.tcomment_isremove == 'y') {
					code += `
								<img id="profile" alt="기본프로필.png" src="${dsrc}" width="40px" height="40px">
								<span  class="writer" class="writer">${v.memberVO.mem_nickname}</span>
								<span class="cdate">${v.tcomment_cdate}</span><br> 
								${dimg}<span class="content">삭제된 댓글입니다.</span><br><br>`

					code+=`</div>`
				}
				$('#tctLayer').append(code);
			})

		},
		error: function(xhr) {
			alert(xhr.status);
		}
	})
}


// 댓글 등록
$.tcommentWriteServer = function() {
	$.ajax({
		url: `${path}/tcommentInsert.do`,
		type: 'post',
		data: {
			"tboardId": tboard_id, // tboard_id
			"tcontent": tcontent
		},

		success: function(res) {
			if (res != null && res != "" && typeof res != "undefined") {
				$.tcommentListServer(1);
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
$.retcommentWriteServer = function() {
	$.ajax({
		url: `${path}/tcommentInsert.do`,
		type: 'post',
		data: {
			"tboardId": tboard_id,
			"tcontent": reContent,
			"tcommentPid": tcommentPid
		},
		dataType: 'json',
		success: function(res) {
			page=1;
			$.tcommentListServer2(1)

		},
		error: function(xhr) {
			alert(xhr.status);
		}
	})
}

// 댓글 삭제
$.tcommentDeleteServer = function() {
	$.ajax({
		url: `${path}/tcommentDelete.do`,
		type: 'post',
		data: {
			"tcommentId": tidx
		},
		dataType: 'json',
		success: function(res) {
			if (res == 1) {
				target.find(".content").text("삭제된 댓글 입니다.")
				target.find("input").remove();
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
$.tcommentUpdateServer = function(target) {
	//	secret = $('#is_private').prop('checked');
	//	console.log(secret);
	$.ajax({
		url: `${path}/tcommentUpdate.do`,
		type: 'post',
		data: {
			"tcommentId": tidx,
			"tcontent": tcontent,
			//				"issecret" : secret
		},
		dataType: 'json',
		success: function(res) {

			if (res > 0) {
				tparent.text(tcontent);
			}
		},
		error: function(xhr) {
			alert(xhr.status);
		}
	})
}

