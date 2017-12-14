<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="../inc/top.jsp" %>
<!-- 0. include부분 -->
<script type="text/javascript">
	$(function(){
		$('#myAddressUp').hide();
		$('.myAddress').click(function(){
			$('#myAddressDown').toggle();			
			$('#myAddressUp').toggle();
			$('#addressList ul').slideToggle();
		});
		
		$('.divAddrBody table td').hover(function(){
			$(this).parent().css('background','rgb(245,245,245)');
		},function(){
			$(this).parent().css('background','white');
		});
		
		$('#checkAll').click(function() {
			if($("#checkAll").prop("checked")) {
				//전체 checkbox들을 체크해준다 
				$("td input[type=checkbox]").prop("checked",true); 
			} else { 
				//모든 checkbox들의 체크해제
				$("td input[type=checkbox]").prop("checked",false); 
			}
		});
		
		$('.divAddrBody table tr:eq(0)').css('border-bottom','1px solid rgb(195, 195, 195)');
	});
</script>
        <nav>
            <ul>
                <!-- 1.왼쪽 사이드 메뉴 지정 // li태그에 .active지정 -->
                <li id="addressList"><a href="#"><i class="fa fa-address-book-o"></i>&nbsp;<span>내 주소록</span>
                	<i id="myAddressUp" class="myAddress fa fa-chevron-up"></i>
                	<i id="myAddressDown" class="myAddress fa fa-chevron-down"></i></a>
                	<ul>
                		<li><a href="<c:url value='/phoneBook/phoneBookList.do'/>">전체 주소록</a>
                			<ul>
                				<li><a href="#">└ 가족</a></li>
                				<li><a href="#">└ 친구</a></li>
                				<li><a href="#">└ 거래처</a></li>
                				<li><a href="#">└ 동아리</a></li>
                			</ul>
                		</li>                		
                	</ul>
                </li>
                <li><a href="<c:url value='/phoneBook/phoneBookWrite.do'/>"><i class="fa fa-user-plus"></i>&nbsp;<span>연락처 추가</span></a></li>
                <li><a href="#"><i class="fa fa-users"></i>&nbsp;<span>그룹 추가</span></a></li>
                <li><a href="<c:url value='/phoneBook/phoneBookTrash.do'/>"><i class="fa fa-trash"></i>&nbsp;<span>휴지통</span></a></li>
                <li><a href="#"><i class="fa fa-cog"></i>&nbsp;<span>환경설정</span></a></li>
            </ul>
            <!-- 1.왼쪽 사이드 메뉴 지정 끝-->
            <div id="listbtn"><p><i class="fa fa-chevron-circle-left" style="text-align: center;"></i></p></div>
        </nav>
    </aside>
    <!-- 왼쪽 사이드 메뉴 끝 -->
    <hr>
    <article id="headsection">
        <!-- 2. 페이지 이름 지정 // 북마크 지정 여부 .bookmark || .nobook -->
        <h1>
        	<i class="fa fa-phone"></i>&nbsp;주소록&nbsp;
        	<a href="#"><i class="fa fa-bookmark bookmark" aria-hidden="true"></i></a>
        </h1>
        <!-- 2. 페이지 이름 지정 끝 -->
    </article>
    <article id="bodysection">
        <!-- 3. 내용 -->
        <div id="divBodysection">
	        <div class="divAddrHeader">
		        <a href="#"><div><i class="fa fa-trash"></i><span> 휴지통 비우기</span></div></a>		        
		        <a href="#"><div><i class="fa fa-share-square-o"></i><span> 주소록으로 되돌리기</span></div></a>		        
		        <div id="selectMenu">
		        	<select>
				        <option>10개씩 보기</option>
				        <option>30개씩 보기</option>
				        <option>50개씩 보기</option>
			        </select>
		        </div>
		    </div>
	        <div class="divAddrBody">
	        	<table>
	        		<colgroup>
	        			<col width="5%">
	        			<col width="15%">
	        			<col width="15%">
	        			<col width="25%">
	        			<col width="20%">
	        			<col width="20%">
	        		</colgroup>
	        		<tr>
	        			<th><input type="checkbox" id="checkAll"></th>
	        			<th><a href="#">이름</a></th>
	        			<th>전화번호</th>
	        			<th>이메일</th>
	        			<th>회사</th>
	        			<th>그룹</th>
	        		</tr>
	        		<tr>
	        			<td><input type="checkbox"></td>
	        			<td><a href="#">이름</a></td>
	        			<td>전화번호</td>
	        			<td><a href="#">이메일</a></td>
	        			<td>회사</td>
	        			<td>그룹</td>
	        		</tr>
	        		<tr>
	        			<td><input type="checkbox"></td>
	        			<td><a href="#">이름</a></td>
	        			<td>전화번호</td>
	        			<td><a href="#">이메일</a></td>
	        			<td>회사</td>
	        			<td>그룹</td>
	        		</tr>
	        		<tr>
	        			<td><input type="checkbox"></td>
	        			<td><a href="#">이름</a></td>
	        			<td>전화번호</td>
	        			<td><a href="#">이메일</a></td>
	        			<td>회사</td>
	        			<td>그룹</td>
	        		</tr>
	        	</table>
	        </div>
	        <div class="divPaging">
	        	<p>이곳에 페이징 처리를 합시다</p>
	        </div>
	        <!-- 3. 내용 끝 -->
        </div>
    </article>
    <!-- 4. 상단 네비 색먹이기 // li태그 순서(전자결재 : 6번째) 입력 -->
    <script type="text/javascript">
        $(function () {
            $('header nav ul li:nth-child(2) a').addClass('active');
        });
    </script>
    <!-- 4. 상단 네비 색먹이기 끝-->
    <!-- 0. include부분 끝-->
    <%@include file="../inc/bottom.jsp" %>
    <style>
    	#bodysection > div{
    		background: #fff;
    		margin: 0;
    	}
    	#divBodysection{
    		background: #fff;
    		padding: 5px;
    		width: 77%;
    		margin: 20px, 0, 0, 0;
    	}
    	#addressList ul{display: none;}
    	#addressList .myAddress{
    		width:50px;
    		height:50px;
    		line-height:50px;
    		display:block;
    		float: right;    
    		text-align: center;		
    	}
    	#addressList ul li a{
    		padding-left: 30%;
    	}
    	#addressList ul li ul li a{
    		padding-left: 35%;
    	}
    	.divAddrHeader{
    		overflow: hidden;
    	}
    	.divAddrHeader div{
    		float: left;
    		border: 1px solid rgb(195, 195, 195);
    		margin-right: 20px;
    		padding: 5px;
    		background-color: white;
    	}
    	.divAddrHeader div input{
    		border: none;
    		padding: 1px 0;
    	}
    	#addrSearch{
    		color: rgb(195, 195, 195);
    	}
    	#bodysection div{
    		margin: 10px;
    	}
    	.divAddrBody{
    		height: 570px;
    		margin-top: 10px;
    	}
    	.divAddrBody table{
    		border-collapse: collapse;
    		width: 100%;
    	}
    	.divAddrBody table tr{
    		border-bottom: 1px solid rgb(245,245,245);
    		border-top: 1px solid rgb(195,195,195);
    		background-color: #fff;
    	}
    	.divAddrBody table th, td{
    		text-align: center;
    		padding: 10px;
    	}
    	.divAddrBody table th i, .addrStar{color: yellow;}
    	.divPaging{
    		border: 1px solid rgb(195, 195, 195);
    		height: 50px;
    	}
    	#selectMenu{
    		float: right;
    	}
    	#selectMenu select{
    		border: 0;
    	}		
		/* #myAddressUp{
			display: none;
		} */
		/*
		#myAddressDown{
			display:inline;
		} */
		.addrStar{display: none;}
		.addrStaro{display:inline;}
    </style>