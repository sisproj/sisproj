<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="phoneBookTop.jsp"%>
    <!-- 3. 내용 -->
    <article id="bodysection">
        <div id="divBodysection">
	        <div class="divAddrHeader">
		        <a href="#"><div><i class="fa fa-trash"></i><span> 삭제</span></div></a>
		        <a href="#"><div><i class="fa fa-envelope-o"></i><span> 메일 보내기</span></div></a>
		        <a href="#"><div><i class="fa fa-file-excel-o"></i><span> 주소록 내보내기</span></div></a>
		        <div><input type="text" placeholder="연락처 검색"><a href="#"><i id="addrSearch" class="fa fa-search"></i></a></div>
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
	        	<jsp:include page="paging.jsp"></jsp:include>
	        </div>
        </div>
    </article>
    <!-- 3. 내용 끝 -->

    <%@include file="phoneBookBottom.jsp" %>        
   