/**
 * 
 */

 function listPageServer(cpage){
	 stext = $('.notice_search').val().trim();
	 $.ajax({
		 url : `${mypath}/NoticeList.do`,
		 type : 'post',
		 data : {
			 "stext" : stext,
			 "cpage" : cpage
		 },
		 success : function(res){
			 
			 code = '<table class="notice_table">';
			 code += `<tr>
				 		<th>제목</th>
				 		<th class="notice_writer">작성자</th>
				 		<th class="notice_date">작성일</th>
				 	  </tr>`
			 $.each(res.datas, function(i, v){
				  code += `	<tr>
					 			<td class="${v.nboard_id}"><a class="n_title" href="${mypath}/NoticeView.do?nbId=${v.nboard_id}">${v.nboard_title}</a></td>
					 			<td>관리자</td>
					 			<td>${v.nboard_cdate}</td>
					 		</tr>`
			 })
			 
			 code += `</table>`
			 $('.con_notice_main').html(code);
			 
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
			 
			 $('.notice_page').html(pager);
			 
		 },
		 error : function(xhr){
			 alert("상태 : " + xhr.status);
		 },
		 dataType : 'json'
	 })
 }