<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="phoneBookTop.jsp"%>

        <!-- 3. 내용 -->
    <article id="bodysection">
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
	        	<jsp:include page="paging.jsp"></jsp:include>
	        </div>
        </div>
    </article>
    <!-- 3. 내용 끝 -->
    
<%@include file="phoneBookBottom.jsp" %>    
    	
    	
    	
    	
    	
    	
    	
    	
