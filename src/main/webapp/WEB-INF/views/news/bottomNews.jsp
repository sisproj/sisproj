<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div id="news">
	<c:if test="${!empty mainlist }">
		<c:forEach var="vo" items="${mainlist}">
				<div><a href="<c:url value='/news/newsDetailcnt.do?newsNo=${vo.newsNo }'/>">${fn:substring(vo.newsTitle,0,70) }</a></div>
		</c:forEach>
	</c:if>
</div>
</body>
</html>