<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
<style>
	#fileZone{
		background-color: #ff0;
		width: calc(100% - 50px);
		min-height: 70%;
		border: 2px solid #fff;
		background-color: #efefef;
		border-radius: 10px;
		box-shadow: 2px 2px 5px #777;
		box-sizing: border-box;
		padding: 20px;
	}
	
	#searchSec{
		width:80%;
		margin:0 auto;
		height: 40px;
		padding-left: 20px;
		line-height:40px;
		box-sizing: border-box;
		margin-bottom: 20px;
		padding: 5px;
	}
	#searchSec label {
		display:inline-block;
		width: 20%;
		text-align: center;
		height: 40px;
		line-height: 40px;
		font-weight: bold;
		background-color: #fff;
		border-bottom : 5px solid #036;
		box-sizing: border-box;
		vertical-align: middle;
	}
	#searchSec input[type=text]{
		width: 80%;
		border:0;
		height: 40px;
		background-color: transparent;
		background-color: #fff;
		border-bottom : 5px solid #036;
		vertical-align: middle;
	}
	
	.file{
		width: auto;
		height: 30px;
		padding : 10px;
		background-color: #fff;
		box-shadow: 1px 1px 5px #555;
		text-align: center;
		line-height: 30px;
		float:left;
		margin-left: 10px;
		margin-bottom : 10px;
		border-radius: 5px;
		font-size: 0.8em;
	}
	
	#fileZone a:hover .file{
		box-shadow: 0px 0px 3px #555;		
	}
	/* 
        <div id="message">
        	<div><i class="fa fa-cloud-upload" aria-hidden="true"></i></div>
        	<p>파일을 업로드 하려면 여기에 드롭 하세요</p>
        </div> */
        
	#message {
		position: fixed;
		bottom: 100px;
		left:50%;
		background-color: #09f;
		padding: 10px;
		box-sizing: border-box;
		border-radius: 10px;
		box-shadow: 2px 2px 5px #036;
		display: none;
	}
	#message p, #message div i {
		color: #fff;
	}
	#message div{
		width:50px;
		margin:0 auto;
		text-align:center;
		font-size: 50px;
		margin-bottom: 10px;
	}
</style>
        <!-- 0. include부분 -->
        <nav>
            <ul>sad
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li class="active"><a href="#"><i class="fa fa-floppy-o"></i>&nbsp;<span>웹하드</span></a></li>
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
	        	<a href="<c:url value='/webhard/${file.fileName }'/>"><div class="file">
	        		<i class="fa fa-floppy-o"></i> <span>${file.fileOriName } (업로드자  : ${file.empName })</span>
	        	</div></a>
        	</c:forEach>
        </div>
        <div id="message">
        	<div><i class="fa fa-cloud-upload" aria-hidden="true"></i></div>
        	<p>파일을 업로드 하려면 여기에 드롭 하세요</p>
        </div>
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
	});
</script>