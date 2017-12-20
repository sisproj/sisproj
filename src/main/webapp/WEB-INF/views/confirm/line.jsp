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

</head>
<body>
	<div id="cf_ch_line">
		<div class="cf_ch_dh">결재라인 지정</div>	
		<p>조직도에서 더블클릭하거나 좌측의 저장된 결재라인 선택</p>
		<div id="cf_ch_savedline">
			<div class="dh"><i class="fa fa-sitemap">저장된 결재라인</i></div>
			<ul>
				<c:forEach var="slVo" items="${slVoList}">
				<li id="${slVo.saveNo }">
					<i class="fa fa-folder-o"></i> ${slVo.saveName }
				</li>
				</c:forEach>
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
				<tbody id="confirmers">
					
				</tbody>
			</table>
		</div>
		<div class="clr"></div>
		<div id="cf_ch_linebtn">
			<input type="button" id="ins_cfer" value="결재라인 지정">
			<input type="button" id="cf_win_close" value="취소">
		</div>
	</div>
</body>
</html>