<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="../inc/top.jsp" %>
    <link rel="stylesheet" href="<c:url value='/resources/css/pagecss/webhard_detail.css'/>">
        <!-- 0. include부분 -->
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li><a href="<c:url value='/webhard/main.do'/>"><i class="fa fa-floppy-o"></i>&nbsp;<span>웹하드</span></a></li>
                <li><a href="<c:url value='/webhard/requireList.do'/>"><i class="fa fa-list-alt"></i>&nbsp;<span>요청 게시판</span></a></li>
                <li><a href="<c:url value='/webhard/write.do'/>"><i class="fa fa-pencil-square-o"></i>&nbsp;<span>요청 글 쓰기</span></a></li>
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
        <div id="requireDetail">
			<div id="divTitle">
				<span id="title">${wbVo.webTitle }</span>
				<span id="regdate"><fmt:formatDate value="${wbVo.webRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
			</div>
			<div id="divContent">
				${wbVo.webContent }
			</div>
			<div id=btns>
				<c:if test="${sessionScope.empVo.empNo == wbVo.empNo }">
					<a class="button" href="<c:url value='/webhard/edit.do?webNo=${wbVo.webNo }'/>" id="editbtn">수정</a>
					<a class="button" href="<c:url value='/webhard/delete.do?webNo=${wbVo.webNo }'/>" id="deletebtn">삭제</a>
				</c:if>
				<a class="button" href="<c:url value='/webhard/requireList.do'/>" id="listbtn">목록</a>
			</div>
		</div>
		<div id="cf_comment">
			<h3><i class="fa fa-commenting-o"></i> 댓글 (${fn:length(commVoList) })</h3>
			<!-- 상단등록창 -->
			<form name="comm_wr" id="comm_wr" method="post" action="<c:url value='/webhard/writeComm.do'/>">
				<input type="hidden" name="webNo" value="${wbVo.webNo }">
				<textarea name="commContent" id="con" placeholder="줄바꿈이 되지 않습니다."></textarea>
				<input type="submit" class="bold" value="등록">
			</form>
			<!-- 상단등록창 끝 -->
			<!-- 댓글리스트 -->
			<!-- 반복 -->
			<c:if test="${!empty commVoList }">
				<c:forEach var="commVo" items="${commVoList }" varStatus="status">
					<div class="selcomm" id="${commVo.commNo }">
						<div class="comm_info">
							<span class="comm_reg bold">${commVo.empName }</span> 
							<span class="comm_reg"><fmt:formatDate value="${commVo.commRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							<span id="comm-${status.index }">
							<c:if test="${sessionScope.empVo.empNo == commVo.empNo }">
								<a class="comm_delete bold" href="<c:url value='/webhard/deleteComm.do?commNo=${commVo.commNo }&webNo=${wbVo.webNo }'/>">삭제</a>&nbsp;&nbsp;&nbsp;
								<a class="comm_edit bold" id="btn_e-${status.index }" href="#comm-${status.index }">수정</a>&nbsp;&nbsp;&nbsp;<!-- 1부분 아이디 반복문 i로 돌리기 -->
							</c:if>
							</span>
						</div>
						<div class="comm_content" id="comm_con-${status.index }">
							<div class="comm_con">${commVo.commContent }</div>
							<!-- 수정용 -->
							<form name="comm_ed" class="comm_ed" method="post" action="<c:url value='/webhard/editComm.do'/>">
								<textarea name="commContent">${commVo.commContent }</textarea>
								<input type="hidden" name="webNo" value="${wbVo.webNo }">
								<input type="hidden" name="commNo" value="${commVo.commNo }">
								<input type="submit" class="bold" value="댓글 수정">
							</form>
							<!-- 수정용 끝 -->
						</div>
						<div class="clr"></div>
					</div>	
				</c:forEach>
			</c:if>
			<!-- 반복 끝 -->
			<!-- 댓글리스트 끝 -->
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
<script>
	$(function(){
		$('#deletebtn').click(function(){
			if(!confirm('이 글을 정말 삭제 하시겠습니까?')){
				return false;
			}
		});
		
		$('.comm_delete').click(function(){
			if(!confirm('정말 댓글을 삭제 하시겠습니까?')){
				return false;
			}
		});
		
		$('a.comm_edit').click(function(){
			var getId = $(this).attr('id');
			var start = getId.indexOf('-');
			var num = getId.substring(start+1);
			var btn = '#comm-'+num;
			var con = '#comm_con-'+num+' .comm_con';
			var frm = '#comm_con-'+num+' .comm_ed';
			$(con).hide();
			$(btn).hide();
			$(frm).show();
		});
		$('form.comm_ed').submit(function(){
			var cont = $(this).find('textarea[name=commContent]').val();
			if(cont==''){
				return false;
			}
		});
	});
</script>