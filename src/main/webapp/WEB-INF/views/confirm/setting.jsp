<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../inc/top.jsp" %>
<link href="<c:url value='/resources/css/pagecss/confirm_setting.css'/>" rel="stylesheet" type="text/css">
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
				<li><a href="<c:url value='/confirm/adm/typeform.do'/>"><i class="fa fa-cog"></i>&nbsp;<span>결재 양식 관리</span></a></li>
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
						<img src="<c:url value=''/>" alt="사인"><br>
						<span id="signfname">app_sign.gif</span><br><br>
						<form name="updateSign" id="updateSign" method="post" action="#" enctype="multipart/form-data">
							<input type="hidden" name="oldfilename" value="">
							<input type="file" name="upfile" id="upfile" value="" accept="image/*">
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
								<a href="#">
									<div id="${slVo.saveNo }">
										<i class="fa fa-folder-open"></i> ${slVo.saveName }
									</div>
								</a>
							</c:forEach>
						</div>
						<div id="line_detail">
							<h3>[기안용]상세정보</h3>
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
							<form id=confirmers_save action="<c:url value='/confirm/confirmLine.do'/>">
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
<script type="text/javascript" src="<c:url value='/resources/js/pagejs/confirm_setting.js'/>"></script>
<script type="text/javascript">
$(function(){
	var sessempNo = '${eVo.empNo }';

	$('#savelinebtn input[type=button]').click(function(){
		$('#save_line').attr('class','on');
		$('#cf_line').attr('class', 'newline');
		$('#organ').css('height','500px');
		$('#orgUp').hide();
		$('#orgDown').show();
		$('#organbody').show();

		var status = $('#cf_line').attr('class'); //왼쪽라인에서 선택시 class="favorite", 조직도에서 선택시 class="newline"
		if(status=="newline"){
			$('#detailbtn input[type=button]').hide();
			$('#saveLine').show();
		} else if(status=="favorite"){
			$('#detailbtn input[type=button]').hide();
			$('#editLine').show();		
			$('#deleteLine').show();		
		}
		
		$('#line_detail h3').text('신규 결재라인 등록');
	});	
	
	var order = 0;
	//조직도에서 사원 리스트 더블클릭시 리스트에 추가
	$('#organbody ul li ul li').dblclick(function(){
		var empNo = $(this).attr('id');
		var windowStat = $('#save_line').attr('class'); //결재라인선택 창열렸을때 on 닫히면 off
		
		if(windowStat=='on'){
			if(empNo == sessempNo){
				alert('자기자신은 선택할 수 없습니다.');
				return false;
			}
			
			if(status == 'favorite' && empNo != sessempNo){
				if(confirm('현재 선택된 결재라인이 선택해제 됩니다.')){
					$('#cf_line a div i').prop('class','fa fa-folder');
					$('#line_detail table tbody').html('');
					$('#cf_line').removeClass();
					order=0;
				} else {
					return false;
				}	
			}			
			
			if(order<1){
				//초기 본인 세팅
				$('#line_detail table tbody').prepend("<tr class='t1'><td>1</td></tr>");
				$('#line_detail table tbody tr.t1').append("<td>${eVo.deptName }</td><td>${eVo.posName }</td><td>${eVo.empName }</td><input type='hidden' name='confirmerNo' class='confirmerNo' value='${eVo.empNo }'>");
				order+=2;
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
		}
	});//end 더블클릭 event
	
	//결재라인 지정 window에 선택된 결재자 더블클릭시 리스트에서 제거
	$('body').on('dblclick','#line_detail table tbody tr',function(){
		var thissel = $(this).find('input[type=hidden]').val();
		if(thissel == sessempNo){
			alert('본인은 삭제 할 수 없습니다.');
			return false;
		} else {
			$(this).remove();
			order-=1;
			giveOrder();
		}
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