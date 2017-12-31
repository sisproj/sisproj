<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_setting.css'/>" rel="stylesheet" type="text/css">
<style type="text/css">
	
</style>
<!-- 0. include부분 -->
			<nav>
			<ul>
				<!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
				<li><a href="<c:url value='/confirm/newcho.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>새 결재 진행</span></a></li>
				<li><a href="<c:url value='/confirm/tempsave.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>임시 저장함</span></a></li>
				<li><a href="<c:url value='/confirm/await.do'/>"><i class="fa fa-hdd-o"></i>&nbsp;<span>결재 대기함</span></a></li>
				<li><a href="<c:url value='/confirm/complete.do'/>"><i class="fa fa-file-text"></i>&nbsp;<span>결재 완료함</span></a></li>
				<li><a href="<c:url value='/confirm/return.do'/>"><i class="fa fa-history"></i>&nbsp;<span>결재 반려함</span></a></li>
				<li><a href="<c:url value='/confirm/postbox.do'/>"><i class="fa fa-archive"></i>&nbsp;<span>참조 수신함</span></a></li>
				<li class="active"><a href="<c:url value='/confirm/setting.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 환경 설정</span></a></li>
				<c:if test="${sessionScope.empVo.empLev == '관리자' }">
					<li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
				</c:if>
			</ul>	
				<!-- 1.왼쪽 사이드 메뉴 지정 끝-->
				<div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
			</nav>
		</aside>
		<!-- 왼쪽 사이드 메뉴 끝 -->
		<article id="headsection">
			<!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
			<h1><i class="fa fa-cog"></i>&nbsp;결재 환경 설정&nbsp;<a href="#"><i class="fa fa-bookmark nobook" aria-hidden="true"></i></a></h1>
			<!-- 2. 페이지 이름 지정 끝 -->
		</article>	
		<article id="bodysection">
			<!-- 3. 내용 -->
			<div id="cf_settings">
				<ul>
					<li><a href="#tabs-1">결재서명등록</a></li>
					<li><a href="#tabs-2">결재라인등록</a></li>
				</ul>
				<div id="tabs-1">
					<h3>결재서명등록</h3>
					<div id="sign_img">
						<p>현재등록된 이미지</p>
						<img src="${pageContext.request.contextPath }/user_sign/${sVo.signName}" alt="등록된 이미지가 없습니다."><br>
						<span id="signfname">${sVo.signOriName }</span><br><br>
						<form name="updateSign" id="updateSign" method="post" 
							action="<c:url value='/confirm/updateSign.do'/>" enctype="multipart/form-data">
							<input type="hidden" name="oldfilename" value="${sVo.signName }">
							<input type="file" name="upfile" id="upfile" accept="image/*">
							<input type="button" id="udSign" value="등록">
						</form>
					</div>
				</div>
				<div id="tabs-2">
					<h3>결재라인등록</h3>
					<div id="savelinebtn"><span class="bold red">신규 등록을 원하시면 클릭 >>&nbsp;&nbsp;</span><input type="button" value="신규등록"></div>
					<div class="clr"></div>
					<div id="save_line">
						<div id="cf_line">
							<h3>결재라인</h3>
							<c:forEach var="slVo" items="${slVoList}">
								<a class="savedLine" href="#">
									<div id="${slVo.saveNo }">
										<i class="fa fa-folder"></i> <span>${slVo.saveName }</span>
									</div>
								</a>
							</c:forEach>
						</div>
						<div id="line_detail">
							<h3>상세정보</h3>
							<table>
								<thead>
									<tr>
										<th>순서</th>
										<th>부서</th>
										<th>직급</th>
										<th>이름</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
							<!-- 결재라인 모아 처리 -->
							<form id=confirmers_save action="#">
								<input type="hidden" name="saveNo" value="0">
								<input type="hidden" name="empNo" value="${eVo.empNo }">
								<input type="hidden" name="saveName" id="saveName">
								<input type="hidden" name="saveConfirmer" id="allConfirmers">
							</form>
							<div id="detailbtn">	
								<input type="button" id="saveLine" value="저장">&nbsp;
								<input type="button" id="editLine" value="수정">&nbsp;
								<input type="button" id="deleteLine" value="삭제">
							</div>
							<div id="inputTitle">
								<p>제목을 입력하세요.</p>
								<div><input type="text" id="getInputTitle"></div>
								<div><input type="button" id="getTitle" value="입력"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 3. 내용 끝 -->
		</article>
		<!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
		<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm.js'/>"></script>
		<!-- 4. 상단 네비 색먹이기 끝-->
		<!-- 0. include부분 끝-->

<%@ include file="../inc/bottom.jsp" %>
<div class="modal"></div>
<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm_setting.js'/>"></script>
<script type="text/javascript">

function fileCheck(obj){
	var pathpoint = obj.value.lastIndexOf(".");
	var filepoint = obj.value.substring(pathpoint+1,obj.length);
	var filetype = filepoint.toLowerCase();
	if(filetype == 'bmp'){
		alert('bmp파일은 업로드가 불가능 합니다.');
		return false;
	} else if(filetype != 'jpg' && filetype != 'jpeg' && filetype != 'gif' && filetype != 'png'){
		alert('이미지파일만 업로드가 가능합니다.');
		return false;
	} else {
		if(confirm('기존에 등록된 서명은 삭제됩니다. 진행하시겠습니까?')){
			$('#updateSign').submit();					
		}
	}
}

$(function(){	
	$('#udSign').click(function(){
		if($('#upfile').val()!=""){
			fileCheck(document.getElementById('upfile'));
		}
	});
	
	$( "#cf_settings" ).tabs();
	
	////// 전자결재라인등록 부분
	var sessempNo = '${eVo.empNo }';
	var status = "";
	
	$.btnFunc=function(){
		status = $('#cf_line').attr('class'); //왼쪽라인에서 선택시 class="favorite", 조직도에서 선택시 class="newline"
		if(status=="newline"){
			$('#detailbtn input[type=button]').hide();
			$('#saveLine').show();
			$('#changeName').hide();
		} else if(status=="favorite"){
			$('#detailbtn input[type=button]').hide();
			$('#editLine').show();		
			$('#deleteLine').show();		
			$('#changeName').show();
		}
	};
	

	$('#savelinebtn input[type=button]').click(function(){		
		if(status == 'favorite'){
			if(confirm('현재 선택된 결재라인이 선택해제 됩니다.')){
				$('#cf_line a div i').prop('class','fa fa-folder');
				$('#line_detail table tbody').html('');
				$('#cf_line').attr('class','newline');
				order=0;
			} else {
				return false;
			}	
		}	

		$('#inputTitle input[type=text]').val('');
		$('#save_line').attr('class','on');
		$('#cf_line').attr('class', 'newline');
		$('#organ').css('height','500px');
		$('#orgUp').hide();
		$('#orgDown').show();
		$('#organbody').show();
		
		$('#line_detail h3').text('신규 결재라인 등록');
		$.btnFunc();
	});	
	
	var order = 0;
	//조직도에서 사원 리스트 더블클릭시 리스트에 추가
	$('#organbody ul li ul li').dblclick(function(){
		var empNo = $(this).attr('id');
		var windowStat = $('#save_line').attr('class'); //결재라인선택 창열렸을때 on 닫히면 off
		
		if(windowStat=='on' || status == 'favorite'){
			if(empNo == sessempNo){
				alert('자기자신은 선택할 수 없습니다.');
				return false;
			}		
			
			if(status == 'favorite'){
				$('#line_detail table tbody tr').each(function(index){
					order=index+1;
				});
				order+=1;
				if(!confirm('이미 저장된 리스트 입니다. 수정하시겠습니까?')){
					order=0;
					return false;
				} else {
					status="newline";
					$('#line_detail h3').append(' 수정중...');
				}
				alert(order);
			}
			
			if(status !='favorite'){
				if(order<1){
					//초기 본인 세팅
					$('#line_detail table tbody').prepend("<tr class='t1'><td>1</td></tr>");
					$('#line_detail table tbody tr.t1').append("<td>${eVo.deptName }</td><td>${eVo.posName }</td><td>${eVo.empName }</td><input type='hidden' name='confirmerNo' class='confirmerNo' value='${eVo.empNo }'>");
					order+=2;
				}
			}
			
			var exist = 0;
			$('#line_detail table tbody tr input[type=hidden]').each(function(){
				if($(this).val()==empNo){
					exist=1;
				}
			});
	
			//현재 접속자와 조직도에서 선택한 사람이 같지 않을 경우에만 처리
			if(exist==0 && empNo != sessempNo){
				if(order==9){alert('최대 8명까지 가능 합니다.'); return false;}; //9부터는 안됨!
				$.ajax({
					url:"<c:url value='/confirm/settingConfirmer.do'/>",
					type:"get",
					data:"empNo="+empNo,
					dataType:"json",
					success:function(clVo){
						$('#line_detail table tbody').append("<tr class='t"+order+"'><td>"+order+"</td></tr>");
						$('#line_detail table tbody tr.t'+order).append("<td>"+clVo.deptName+"</td><td>"+clVo.posName+"</td><td>"+clVo.empName+"</td><input type='hidden' name='confirmerNo' class='confirmerNo' value='"+clVo.empNo+"'>");
						order+=1;
					},
					error : function(xhr,status,error){
						alert("에러발생 : "+status+"==>"+error);
					}
				});
			}
		} else {
			alert('결재 라인을 신규등록 하고자 한다면 \r [신규등록] 버튼을 클릭 후 이용하십시오');
			return false;
		}
	});//end 더블클릭 event
	
	//결재라인 지정 window에 선택된 결재자 더블클릭시 리스트에서 제거
	$('body').on('dblclick','#line_detail table tbody tr',function(){
		if(!confirm('이미 저장된 리스트 입니다. 수정하시겠습니까?')){
			return false;
		} else {
			status="newline";
			$('#line_detail h3').append(' 수정중...');
		}
		var thissel = $(this).find('input[type=hidden]').val();
		if(thissel == sessempNo){
			alert('본인은 삭제 할 수 없습니다.');
			return false;
		} else {
			$(this).remove();
			order-=1;
			giveOrder();
		}
		getConfirmers();
	});
	
	//저장 버튼 클릭시 히든에 넣고 제목입력창 띄워줌
	$('#saveLine').click(function(){
		getConfirmers();
		if($('#allConfirmers').val()==""){
			alert('결재자를 선택해주세요.');
			$('#inputTitle input[type=text]').focus();
			return false;		
		}
		$('#inputTitle').fadeIn();
		$('.modal').show();
		$('#confirmers_save').attr("action","<c:url value='/confirm/confirmLine.do'/>");
	});
	
	//제목 입력시 히든에 세팅
	$('#inputTitle input[type=text]').keyup(function(){
		$('#saveName').val($(this).val());	
	});
	
	//제목 입력창 입력버튼 클릭시 디비 저장
	$('#getTitle').click(function(){
		if($('#saveName').val()==""){
			alert('제목을 입력하세요!');
			$('#inputTitle input[type=text]').focus();
			return false
		}
		$('#confirmers_save').submit();
		$('#inputTitle').fadeOut();		
		$('.modal').hide();
	});
	
	//좌측 리스트 클릭시 오른쪽에 데이터 뿌려줌
	$('a.savedLine').click(function(){
		$('#cf_line').attr('class','favorite');
		var saveNo = $(this).find('div').attr('id');
		var saveName = $(this).find('div span').text();
		$('#line_detail h3').text('['+saveName+'] 상세정보');
		$('.savedLine div i').prop('class', 'fa fa-folder');
		$(this).find('div i').prop('class', 'fa fa-folder-open');
		
		$.ajax({
			url:"<c:url value='/confirm/settingConfirmers.do'/>",
			type:"get",
			data:"saveNo="+saveNo,
			dataType:"json",
			success : function(res){
				$('#line_detail table tbody').html('');
				$.btnFunc();
				$.each(res, function(idx, item){
					$('#line_detail table tbody').append("<tr class='"+(idx+1)+"'><td>"+(idx+1)+"</td><td>"+item.deptName+"</td><td>"+item.posName+"</td><td>"+item.empName+"</td><input type='hidden' name='confirmerNo' class='confirmerNo' value='"+item.empNo+"'>");
				});
				$('input[name=saveNo]').val(saveNo);
				$('#saveName').val(saveName);
				$('#inputTitle input[type=text]').val(saveName);
				getConfirmers();
			},
			error : function(xhr, status, error){
				alert("에러발생 : "+status+"->"+error)
			}
		});
	});
	
	//수정 버튼 클릭시 처리
	$('#editLine').click(function(){
		getConfirmers();
		if($('input[name=saveNo]').val()==""){
			alert('저장된 결재라인 선택해주세요.');
			$('#inputTitle input[type=text]').focus();
			return false;
		}
		$('#inputTitle').fadeIn();
		$('.modal').show();
		$('#confirmers_save').attr("action","<c:url value='/confirm/editLine.do'/>");
	});
	
	//삭제 버튼 클릭시 처리
	$('#deleteLine').click(function(){
		var saveNo = $('input[name=saveNo]').val();
		getConfirmers();
		if(saveNo==""){
			alert('저장된 결재라인 선택해주세요.');
			$('#inputTitle input[type=text]').focus();
			return false;
		}
		if(confirm('선택된 결재라인이 완전히 삭제됩니다.')){
			location.href="<c:url value='/confirm/deleteLine.do?saveNo="+saveNo+"'/>";
		}
	});
	
	//함수 : 앞 인덱스 맞춰 주기
	function giveOrder(){
		$('#line_detail table tbody tr').each(function(index){
			$(this).find('td:first-child').remove();
		});
		$('#line_detail table tbody tr').each(function(index){
			$(this).prepend("<td>"+(index+1)+"</td>");
			$(this).attr('class','t'+(index+1));
		});
	}
	
	//함수 : 결재자들 모아 hidden에 처리
	function getConfirmers(){
		$('#allConfirmers').val('');
		var empNos = "";
		var maxCnt = $('input.confirmerNo').length-1;
		$('input.confirmerNo').each(function(idx, item){
			empNos += $(this).val();
			if(maxCnt!=idx){
				empNos += ",";
			}
		});
		
		$('#allConfirmers').val(empNos);
	}
});
</script>