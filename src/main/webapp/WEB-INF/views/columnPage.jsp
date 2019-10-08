<%--
  Created by IntelliJ IDEA.
  User: chenya
  Date: 2019-06-13
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <title>${category}</title>
    <script type="text/javascript" src="../static/js/jquery.js"></script>
    <%--&lt;%&ndash;    引入样式&ndash;%&gt;--%>
    <link href="../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../static/bootstrap/js/bootstrap.min.js"></script>
    <link href="../static/mycss.css" rel="stylesheet"/>
    <script type="text/javascript" src="../static/dynamicline.js"></script>
    <link href="../static/cutline.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../static/button/button.css"/>
</head>
<body>
<jsp:include page="comm/top.jsp"/>
<script type="text/javascript" src="../static/dynamicline.js"></script>
<!-- 图片轮播 -->
<!-- 圆点 -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- 内容 -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="../static/img/1.jpg">
            <p class="carousel-caption">
                1
            </p>
        </div>
        <div class="item">
            <img src="../static/img/2.jpg">
            <p class="carousel-caption">
                2
            </p>
        </div>
        <div class="item">
            <img src="../static/img/3.jpg">
            <p class="carousel-caption">
                3
            </p>
        </div>
    </div>

    <!-- 切换按钮 -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button"
       data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button"
       data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>




<div class="container div_divider">
    <!-- 分割线 -->
    <hr class="hr_1">
    Bigname Technology World !
    <hr class="hr_2">
    <div class="row">
        <!-- 文章列表 -->
        <div class="col-xs-9">
            <div class="list-group div_article">
                <!-- 子头栏 -->
                <a href="#" class="list-group-item active item_article_first">
                    <h4 class="list-group-item-heading">
                        My Blog! Welcome!
                    </h4>
                </a>
                <!-- 文章列表 -->

                <div class="list-group-item item_article" style="background-color:transparent;">
                    <c:forEach var="article" items="${articles}" begin="0" step="1">
                        <div class="row">
                            <div class="div_center col-xs-9">
                                <div class="list-group-item-heading div_article_title">
                                    <h3>
                                            ${article.title}
                                    </h3>
                                </div>
                                <p class="list-group-item-text div_article_content">
                                    <span class="summary">${article.summary}</span><br><br>
                                </p>
                                <p><a href="/crm/detail/${article.id}/${article.category}"
                                      class="button blue glossy glass" data-icon="✈">阅读博客</a></p><br><br>
                            </div>
                        </div>
                        <hr class="style-five"/>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>