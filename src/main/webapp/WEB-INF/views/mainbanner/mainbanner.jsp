<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Skitter 슬라이드 쇼</title>

    <!--    Skitter Styles-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/skitter/css/skitter.styles.css" media="all" />

    <!--    Skitter JS-->
    <script src="${pageContext.request.contextPath }/resources/skitter/js/jquery.animate-colors-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/skitter/js/jquery.skitter.min.js"></script>

    <!--    Skitter 초기화-->
    <script>
        $(function() {
            $('.box_skitter_large').skitter({
                label: false,
                numbers: false,
                interval: 3000,
                theme: 'square'
            });
        });
    </script>
    <style>
        .box_skitter_large img {
            width: 1000px;
            height: 500px;
        }
    </style>
</head>

<body>
    <div id="page">
        <div id="content">
            <div class="border_box">
                <div class="box_skitter box_skitter_large">
                    <ul>
                        <li>
                            <a href="#random">
                                <img src="${pageContext.request.contextPath }/resources/skitter/img/banner1.jpg" class="random">
                            </a>
                            <div class="label_text">
                                <p>random</p>
                            </div>
                        </li>
                        <li>
                            <a href="#random">
                                <img src="${pageContext.request.contextPath }/resources/skitter/img/banner2.jpg" class="random">
                            </a>
                            <div class="label_text">
                                <p>random</p>
                            </div>
                        </li>
                        <li>
                            <a href="#random">
                                <img src="${pageContext.request.contextPath }/resources/skitter/img/banner3.jpg" class="random">
                            </a>
                            <div class="label_text">
                                <p>random</p>
                            </div>
                        </li>
                        <li>
                            <a href="#random">
                                <img src="${pageContext.request.contextPath }/resources/skitter/img/banner4.jpg" class="random">
                            </a>
                            <div class="label_text">
                                <p>random</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>            
        </div>        
    </div>
</body>

</html>