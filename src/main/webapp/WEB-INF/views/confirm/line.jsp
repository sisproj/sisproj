<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SIS - Standard Intranet System</title>

    <!-- font icon, FA -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/mainStyle.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/pagecss/confirm_line.css"/>">
    
    <!-- jquery-ui css -->
    <link rel="stylesheet" href="<c:url value="/resources/jquery-ui/jquery-ui.min.css"/>">

    <!-- jquery -->
    <script src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/jquery/jquery.easing.1.3.js"/>"></script>
    <!-- jquery-ui -->
    <script src="<c:url value="/resources/jquery-ui/jquery-ui.min.js"/>"></script>
	<!-- smart editor 2.0 -->
	<script type="text/javascript" src="<c:url value='/resources/se2/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script>
    <!-- mainjs -->
    <script src="<c:url value="/resources/js/mainjs.js"/>"></script>
</head>
<body>
	<div id="cf_ch_line">
		<div class="cf_ch_dh">선택된 결재라인</div>	
		<p>조직도에서 더블클릭하거나 좌측의 저장된 결재라인 선택</p>
		<div id="cf_ch_savedline">
			<div class="dh"><i class="fa fa-sitemap">저장된 결재라인</i></div>
			<ul>
				<li><i class="fa fa-folder-open-o"></i> 기안용</li>
				<li><i class="fa fa-folder-o"></i> 근태용</li>
			</ul>
		</div>
		<div id="cf_ch_linech">	
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
					<tr>
						<td>1</td>
						<td>인사</td>
						<td>사원</td>
						<td>홍홍홍</td>
					</tr>
					<tr>
						<td>2</td>
						<td>인사</td>
						<td>팀장</td>
						<td>김팀장</td>
					</tr>
					<tr>
						<td>3</td>
						<td>총무</td>
						<td>차장</td>
						<td>주차장</td>
					</tr>
					<tr>
						<td>4</td>
						<td></td>
						<td>대표이사</td>
						<td>오대표</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="clr"></div>
		<div id="cf_ch_linebtn">
			<input type="button" value="결재라인등록">
		</div>
	</div>
</body>
</html>