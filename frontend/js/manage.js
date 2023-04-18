/**
 * 
 */
 function listPageServer(cpage){
	 stext = $('.memManage_search').val().trim();
	 $.ajax({
		 url : `${mypath}/MemberList.do`,
		 type : 'post',
		 data : {
			 "stext" : stext,
			 "cpage" : cpage
		 },
		 success : function(res){
			 console.log(res.datas)
			 code = '<table class="memManage_table">';
			 code += `<tr>
				 		 <th class="memManage_id">아이디</th>
				 		 <th class="memManage_name">이름</th>
				 		 <th class="memManage_nick">닉네임</th>
				 		 <th class="memManage_birth">생년월일</th>
				 		 <th class="memManage_gend">성별</th>
				 		 <th class="memManage_email">이메일</th>
				 		 <th class="memManage_phone">전화번호</th>
				 		 <th class="memManage_addr">주소</th>
				 	  </tr>`
			 $.each(res.datas, function(i, v){
				  code += `<tr>
					 		  <td>${v.mem_id}</td>
					 		  <td>${v.mem_name}</td>
					 		  <td>${v.mem_nickname}</td>
					 		  <td>${v.mem_bir}</td>
					 		  <td>${v.mem_gend}</td>
					 		  <td>${v.mem_mail}</td>
					 		  <td>${v.mem_tel}</td>
					 		  <td>${v.mem_add}</td>
					 	  </tr>`
			 })
			 
			 code += `</table>`
			 $('.con_memManage_main').html(code);
			 
			 //페이지 처리
			 //이전
			 pager = "";
			 pager += `<ul class="pagination">`;
			 if(res.spage > 1){
				 pager += `<li id="prev_li" class="page"><a class="prev" href="#">&lt; 이전</a></li>`;
			 }
			 
			 //페이지 번호
			 for(i=res.spage; i<=res.epage; i++){
				 if(i == currentPage){
					 pager += `<li class="page active"><a id="page_click" class="pageno" href="#">${i}</a></li>`
				 }else{
					 pager += `<li class="page"><a class="pageno" href="#">${i}</a></li>`
				 }
			 }
			 
			 //다음
			 if(res.epage < res.tpage){
				 pager += `<li id="next_li" class="page"><a class="next" href="#">다음 &gt;</a></li>`
			 }
			 
			 pager += `</ul>`
			 
			 $('.memManage_page').html(pager);
			 
		 },
		 error : function(xhr){
			 alert("상태 : " + xhr.status);
		 },
		 dataType : 'json'
	 })
 }