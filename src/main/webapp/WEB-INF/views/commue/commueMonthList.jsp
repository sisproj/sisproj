<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="commueTop.jsp" %>
	<div id="diMo">
	    	 <table id="MoList" border="1" >
	    		<colgroup>    			
	    			<col width="4%;">
	    			<col width="3%;">		
	    			<col width="3%;">	
	    		</colgroup>
	    		<tr id="fEmp">
	    			<th>사원</th>
	    			<th>상태</th>    			
	    		<c:forEach var="i" begin="1" end="30">
	    				<td style="text-align: center;">${i }</td>  				    							
	    		</c:forEach>				
	    		</tr>  			
	    		<tr>
	    			<!-- 사원이름 / 부서이름 / 직급 -->
	    			<th rowspan="3">김길동  인사팀  과장</th>	     			   
	    			<th>출근</th>  				
   				<c:forEach var="i" begin="1" end="6">		    							
	    				<td>08:1${i}</td>    					
	    		</c:forEach>	
	    		</tr>
	    		<tr>
	    			<th>퇴근</th>  		
   					<c:forEach var="i" begin="1" end="6">	
		    			<td>17:1${i}</td>    			
    				</c:forEach>	   
	    		</tr>
	    		<tr>
	    			<th>상태</th>
	    			<c:forEach begin="1" end="15">	
   					<td>출근</td>
   					<td>퇴근</td>
 					</c:forEach>	   	
	    		</tr>
	    	</table>
	    </div>	
	<span style="color: red;">지각</span>
	<span style="color: blue;">출근</span>
	<span style="color: green;">퇴근</span>   
<%@include file="commueBottom.jsp" %>