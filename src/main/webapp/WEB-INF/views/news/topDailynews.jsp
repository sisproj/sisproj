<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){

		$('.col1').show();
		$('.col2').hide();
		$('.col3').hide();
		
		$('.top1').hover(function(){
			$('.col1').show();
			$('.col2').hide();
			$('.col3').hide();
		});
		$('.top2').hover(function(){
			$('.top1').removeClass('selecttop');
			$('.col1').hide();
			$('.col2').show();
			$('.col3').hide();
		});
		$('.top3').hover(function(){
			$('.top1').removeClass('selecttop');
			$('.col1').hide();
			$('.col2').hide();
			$('.col3').show();
		});
	});
</script>

<style>
.rank{
margin-bottom: 15px;
}
.rank:last-child{
margin-bottom: 0;
}
.rankNum{

display:inline-block;
margin-left:2px;
border: 1px solid silver;
width:20px;
height:20px; 
font-size: 13px;
text-align: center;

}

.rankMainDiv {
	width: 400px;
}

.rankMenuDiv ul{
	margin : 0;
	padding:0;
	width:400px;
	display:block;
	list-style: none;
	height: 30px;
	box-sizing: border-box;
}
.rankMenuDiv ul li{
	display:block;
	float:left;
	border:1px solid silver; 
	border-radius: 10px 10px 0 0;
	box-sizing: border-box; 

}
.rankMenuDiv ul li a{
	display:block;
	text-decoration: none;
	width:100%;
	height: 32px;
	color:white;
	line-height : 30px;
	text-align: center;
	box-sizing: border-box;
}

.rankMenuDiv ul li:first-child,
.rankMenuDiv ul li:last-child{
	width: 5%;
	border: 1px solid transparent;
	border-bottom: 1px solid silver;
}
.rankMenuDiv ul li:nth-child(2),
.rankMenuDiv ul li:nth-child(3),
.rankMenuDiv ul li:nth-child(4){
	width: 30%;
	background-color: #069;
	border : 1px solid silver;
	border-bottom: 1px solid silver;
}

.rankMenuDiv ul li:nth-child(2):hover,
.rankMenuDiv ul li:nth-child(3):hover,
.rankMenuDiv ul li:nth-child(4):hover{
	background-color: #fff;
	border-bottom: 1px solid transparent;
}
.rankMenuDiv ul li:nth-child(2):hover a,
.rankMenuDiv ul li:nth-child(3):hover a,
.rankMenuDiv ul li:nth-child(4):hover a{
	color: #069;
}


.rankMenuDiv ul li:nth-child(2){

	border-bottom: 1px solid transparent;
}

.rankcontentDiv {
	display: block;
	width: 400px;
	clear:both;
	border:1px solid silver
	;
	border-top:0;
	background-color: #fff;
}
.selecttop{
	background-color: #fff !important;
	border-bottom: 1px solid transparent !important;
}
.selecttop a{
	color:#069 !important;
}
</style>
<body>
<div class="rankMainDiv">
	<div class="rankMenuDiv">
		<ul class="rankmenu">
			<li><a href="#"></a></li>
			<li class="top1 selecttop"><a href="#">추천순</a></li>
			<li class="top2"><a href="#">댓글순</a></li>
			<li class="top3"><a href="#">조회수순</a></li>
			<li><a href="#"></a></li>
		</ul>
	</div>
	<!-- 좋아요순 -->
	<c:if test="${empty likelist }">
		<label>등록된 글이 없습니다.</label>
	</c:if>
	<c:if test="${!empty likelist }">
		<!-- 반복시작 -->
	<div class="rankcontentDiv col1">
		<c:set var="num" value="0" />
		<c:forEach var="vo" items="${likelist }">
			<c:set var="num" value="${num+1 }" />
			<div class="rank">
				<span class="ranktitle"> <span class="rankNum">${num }</span>
					<a href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">${fn:substring(vo.newsTitle,0,28) }...</a>
				</span>
			</div>
		</c:forEach>
	</div>
	</c:if>
	<!-- 반복끝 -->
	
	
</div>

	<!-- 댓글순 -->
	<c:if test="${empty comlist }">
		<label>등록된 글이 없습니다.</label>
	</c:if>
	<c:if test="${!empty comlist }">
		<!-- 반복시작 -->
	<div class="rankcontentDiv col2" style="display: none;">
		<c:set var="num" value="0" />
		<c:forEach var="map" items="${comlist }">
			<c:set var="num" value="${num+1 }" />
			<div class="rank">
				<span class="ranktitle"> <span class="rankNum">${num }</span>
					<a href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">${fn:substring(map['NEWS_TITLE'],0,28) }...</a>
				</span>
			</div>
		</c:forEach>
		
	</div>
	</c:if>
	
	<!-- 조회수순 -->
	<c:if test="${empty readlist }">
		<label>등록된 글이 없습니다.</label>
	</c:if>
	<c:if test="${!empty readlist }">
		<!-- 반복시작 -->
	<div class="rankcontentDiv col3" style="display: none;">
		<c:set var="num" value="0" />
		<c:forEach var="vo" items="${readlist }">
			<c:set var="num" value="${num+1 }" />
			<div class="rank">
				<span class="ranktitle"> <span class="rankNum">${num }</span>
					<a href="<c:url value='/news/newsDetail.do?newsNo=${vo.newsNo }'/>">${fn:substring(vo.newsTitle,0,28) }...</a>
				</span>
			</div>
		</c:forEach>
	</div>
	</c:if>
	
	
</body>
</html>