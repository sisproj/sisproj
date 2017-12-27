<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../inc/top.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
$(function() {
		function submitContents() {
			editor_object.getById["taNewsWrite"].exec("UPDATE_CONTENTS_FIELD", []);
		}
		var editor_object = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "taNewsWrite",
			sSkinURI : "<c:url value='/resources/se2/SmartEditor2Skin.html'/>",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});
			
			$('#newsTitle').keyup(function(){
				$('#previewTitle').text($('#newsTitle').val());
			});
			
			
	
			 setInterval(function(){
				submitContents();
				$('#previewContent').html($('#taNewsWrite').val());
				
			}, 100); 
			 
			

			 $('#savebutton').click(function(){
				submitContents();
			
				alert($('#previewContent').text());
				 if($('#newsMain').val()=='0'){
					 alert("분류를 선택해주세요");
					 return false;
				 }
				 else if($('#newsTitle').val()==''){
					 alert("제목을 입력해주세요.");
					 $('#newsTitle').focus();
					 return false;
				 }
				 else if($('#taNewsWrite').val()=='<p><br></p>'){
					 alert("내용을 입력해주세요.");
					 $('#taNewsWrite').focus();
					 return false;
				 }
				 return true;
			 });
			 
			 
			
			 
	});
</script>

<style>
#newstitleDiv {
	width: 50%;
}
#newsSlc{
width:10%;
float:left;
}
#titleDiv{
width:90%;
float:right;
}

#newsTitle{
width:90%;
float:right;
}


#se2_tool {
	width: 50%;
	float: left;
}

.newsPreview {
	width: 45%;
	float: right;
}
#newsWriteDiv{
	width:90%;
}
</style>

<!-- 0. include부분 -->
<nav>
	<ul>
		<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
		<li class="active"><a href="<c:url value='/news/news.do'/>"><i
				class="fa fa-pencil-square-o"></i>&nbsp;<span>뉴스 홈</span></a></li>
		<li><a href="#"><i class="fa fa-floppy-o"></i>&nbsp;<span>SIS
					사내뉴스</span></a></li>
		<li><a href="<c:url value='/news/photoNews.do'/>"><i
				class="fa fa-floppy-o"></i>&nbsp;<span>SIS 포토뉴스</span></a></li>


	</ul>
	<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
	<div id="listbtn">
		<p>
			<i class="fa fa-chevron-circle-left" style="text-align: center;"></i>
		</p>
	</div>
</nav>
</aside>
<!-- 왼쪽 사이드 메뉴 끝 -->
<article id="headsection">

	<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
	<h1>
		<i class="fa fa-book" aria-hidden="true"></i>&nbsp;뉴스 등록&nbsp;<a
			href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
	</h1>
	<!-- 2. 페이지 이름 지정 끝 -->
</article>
<article id="bodysection">
<br>
<div id="newsWriteDiv">
	<!-- 3. 내용 -->
	<form method="post" id="newsFrm" action="<c:url value='/news/newsWriteOk.do'/>">
		<div class="se2_tool" id="se2_tool">
			<div class="se2_text_tool husky_seditor_text_tool">
				<div id="writetopDiv">
					<div id="newsSlc">
						<select id="newsMain" name="newsMain">
							<option value="0">분류</option>
						 	<option value="Y">메인</option>
						  	<option value="N">일반</option>
						</select>
					</div>
					<div id="titleDiv"><label>제목:</label><input type="text" name="newsTitle" id="newsTitle"></div>
				</div>
				
				<textarea name="newsContent" id="taNewsWrite" rows="10" cols="100"
					style="width: 100%; height: 600px;"></textarea>
				<input type="submit" id="savebutton" value="뉴스등록" /> <input
					type="button" id="nobutton" value="취소" />
			</div>
		</div>

	</form>
	<div class="newsPreview">
		미리보기
		<h2><div id="previewTitle"></div></h2>
		<div id="previewContent"></div>
		
	</div>
	</div>
	<!-- 3. 내용 끝 -->
</article>
<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
<script type="text/javascript">
	$(function() {	
		$('header nav ul li:nth-child(9) a').addClass('active');
	});
</script>
<!-- 4. 상단 네비 색먹이기 끝-->
<!-- 0. include부분 끝-->
<%@include file="../inc/bottom.jsp"%>