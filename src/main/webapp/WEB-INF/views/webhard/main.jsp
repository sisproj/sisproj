<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
    <link rel="stylesheet" href="<c:url value='/resources/css/pagecss/webhard_main.css'/>">
        <!-- 0. include부분 -->
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li class="active"><a href="<c:url value='/webhard/main.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>웹하드</span></a></li>
                <li><a href="#"><i class="fa fa-floppy-o"></i>&nbsp;<span>요청사항</span></a></li>
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1><i class="fa fa-floppy-o"></i>&nbsp;웹하드&nbsp;<a href="#"><i class="fa fa-bookmark"></i></a></h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
        <div id="fileZone">
        	<div id=searchSec>
        		<label>파일 검색 </label><input type="text" id="searchFile">
        	</div>
        	<c:forEach var="file" items="${list }">
	        	<a href="<c:url value='/webhard/${file.fileName }'/>"><div class="file" id="${file.fileNo }">
	        		<i class="fa fa-floppy-o"></i> <span>${file.fileOriName } (업로드자  : ${file.empName })</span>
	        	</div></a>
        	</c:forEach>
        </div>
        <div id="message">
        	<div><i class="fa fa-cloud-upload" aria-hidden="true"></i></div>
        	<p>파일을 업로드 하려면 여기에 드롭 하세요</p>
        </div>
        <div id="rightMenu">
        	<div><a href="#" id="delMenu">삭제</a></div>
        	<div><hr></div>
        	<div><a href="#" id="infoMenu">파일 상세정보</a></div>
        </div>
        <div id="fileInfo">
        	<div><i class="fa fa-times"></i></div>
        	<div><i class="fa fa-folder-open"></i></div>
        	<div>
        	
        	</div>
        </div>
        <div class="modal"></div>
        <!-- 3. 내용 끝 -->
    </article>
    <!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(7) a').addClass('active');
        });
    </script>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#fileZone').on('dragenter', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	          $(this).css({
	        	  'border':'2px dashed #f00',
	        	  'background':'rgba(255,0,0,0.1)',
	      		  'box-shadow': '2px 2px 5px transparent'
	          });
	          $('#message').fadeIn();
	     });

	     $('#fileZone').on('dragleave', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	          $(this).css({
	        	  'border':'2px solid #fff',
	      		  'background-color': '#efefef',
	      		  'box-shadow': '2px 2px 5px #777'
	          });
	          $('#message').fadeOut();
	     });
	     
	     $('#fileZone').on('dragover', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	     });

		$('#fileZone').on("drop", function(event){
	        event.preventDefault();
	        
			var files = event.originalEvent.dataTransfer.files;
	          $(this).css({
	        	  'border':'2px solid #fff',
	      		  'background-color': '#efefef',
	      		  'box-shadow': '2px 2px 5px #777'
	          });
	          $('#message').fadeOut();
			if(files.length<1){
				return false;
			} else {
				for(var i=0; i<files.length; i++){
			        var formdata = new FormData();
			        
					formdata.append('upfile', files[i]);
					
					$.ajax({
						url:"<c:url value='/webhard/upload.do'/>",
						method:"post",
						data : formdata,
						dataType:"json",
		                processData : false,
		                contentType : false,
						success: function(res){
							location.reload();
						}, error: function(xhr, status, error){
							alert("에러발생:"+status+"->"+error);
						}
					});
				}
			}
		});
		
		$('#searchFile').keyup(function(){
			var keyword = $(this).val();
			
			$('#fileZone a .file').hide();
			
			if(keyword == ""){
				$('#fileZone a .file').show();	
				return false;
			}
			
			$('#fileZone a .file').each(function(idx, item){
				$(this).find('span:contains('+keyword+')').parent().css('display','block');
			});
		});
		var fileNo = 0;
		
		$(".file").mousedown(function(e){
			window.oncontextmenu= function(){
				 return false; 
			}; 
			/* alert("x좌표 :"+e.pageX+" ; y좌표 :"+e.pageY); */ 
			if(e.which='3'){
				var positionLeft = e.clientX - 290;
				var pasitionTop = e.clientY - 150;
				
				$('#rightMenu').css({
					'top':pasitionTop,
					'left':positionLeft
				});
				
				$('#rightMenu').fadeIn();
				
				fileNo = $(this).attr('id');
			}
		});
		
		$('div:not(#rightMenu)').on('click',function(){
			$('#rightMenu').fadeOut();
			
			window.oncontextmenu= function(){
				 return true; 
			}; 
		});
		
		$('#rightMenu #delMenu').click(function(){
			if(!confirm("정말 삭제 하시겠습니까?")){
				return false;
			}
			
			$.ajax({
				url:"<c:url value='/webhard/deleteItem.do'/>",
				type:"get",
				data:"fileNo="+fileNo,
				dataType:"json",
				success:function(res){
					if(res>0){
						alert('삭제 되었습니다.');
						location.reload();
					}
				},
				error : function(xhr,status,error){
					alert("에러발생 : "+status+"=>"+error);
				}
			});
		});
		
		$('#rightMenu #infoMenu').click(function(){
			$.ajax({
				url:"<c:url value='/webhard/fileInfo.do'/>",
				type:"get",
				data:"fileNo="+fileNo,
				dataType:"json",
				success:function(res){
					$('#fileInfo div:nth-child(3)').html('');
					$('#fileInfo div:nth-child(3)').append("<ul><li>파일명</li><li>"+res.fileOriName+"</li></ul><ul><li>파일크기</li><li>"+res.fileSize+" 바이트</li></ul><ul><li>업로드자</li><li>"+res.empName+"("+res.empNo+")</li></ul><ul><li>업로드일</li><li>"+res.regdate+"</li></ul>");
					$('#fileInfo').fadeIn();
					$('.modal').show();
		        },
				error : function(xhr,status,error){
					alert("에러발생 : "+status+"=>"+error);
				}	
			});
			
		});

		$('#fileInfo div:first-child i').click(function(){
			$('#fileInfo').fadeOut();
			$('.modal').hide();
		});
		
		$('.modal').click(function(){
			$('#fileInfo').fadeOut();
			$('.modal').hide();
		});
	});
</script>