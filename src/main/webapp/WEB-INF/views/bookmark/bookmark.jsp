<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="bookmarkbtn">
    <i class="fa fa-bookmark" aria-hidden="true"></i>
    <span class="bold" style="display:none" id="${bookmark}">Bookmark</span>
</div>
<ul>
    <!-- 북마크 리스트 -->
    <li>
        <hr>
    </li>
    <c:if test="${!empty list }">
	    <c:forEach var="map" items="${list }">    
		    <li><a href="<c:url value='${map.URL }'/>">${map.ICON }<span style="display:none">&nbsp;${map.STR }</span></a></li>
	    </c:forEach>
    </c:if>
    <!-- 북마크 리스트 끝 -->
</ul>