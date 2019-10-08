<%--
  Created by IntelliJ IDEA.
  User: chenya
  Date: 2019-06-08
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
<%--        引入jquery--%>
    <script type="text/javascript" src="static/js/jquery.js"></script>
    <%--&lt;%&ndash;    引入样式&ndash;%&gt;--%>
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <link href="static/mycss.css" rel="stylesheet"/>
<%--    <script type="text/javascript" src="static/dynamicline.js"></script>--%>
    <link href="static/cutline.css" rel="stylesheet"/>
    <%--    <link rel="stylesheet" type="text/css" href="static/button/style.css"/>--%>
    <link rel="stylesheet" type="text/css" href="static/button/button.css"/>

    <%--    <link rel="shortcut icon" href="../favicon.ico">--%>
    <link rel="stylesheet" type="text/css" href="static/css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/slicebox.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/custom.css"/>
    <link rel="stylesheet" href="http://www.yyyweb.com/demo/common/init.css">
    <script type="text/javascript" src="static/js/modernizr.custom.46884.js"></script>

</head>
<body>
<jsp:include page="comm/top.jsp"/>
<script type="text/javascript" src="static/dynamicline.js"></script>

<br>
<br>
<br>
<br>
<div class="container">

    <div class="wrapper">

        <ul id="sb-slider" class="sb-slider">
            <li>
                <a href="https://www.android.com/" target="_blank"><img src="static/images/1.png"
                                                                             alt="image1"/></a>
                <div class="sb-description">
                    <h3>Android</h3>
                </div>
            </li>
            <li>
                <a href="https://www.runoob.com/java/java-tutorial.html" target="_blank"><img src="static/images/2.png"
                                                                             alt="image2"/></a>
                <div class="sb-description">
                    <h3>JAVA</h3>
                </div>
            </li>
            <li>
                <a href="https://www.acm.org/" target="_blank"><img src="static/images/3.png"
                                                                             alt="image1"/></a>
                <div class="sb-description">
                    <h3>ACM</h3>
                </div>
            </li>
        </ul>

        <div id="shadow" class="shadow"></div>

        <div id="nav-arrows" class="nav-arrows">
            <a href="#">Next</a>
            <a href="#">Previous</a>
        </div>

    </div>
</div>

<script type="text/javascript" src="static/js/jquery.slicebox.js"></script>
<script type="text/javascript">
  $(function () {

    var Page = (function () {

      var $navArrows = $('#nav-arrows').hide(),
          $shadow = $('#shadow').hide(),
          slicebox = $('#sb-slider').slicebox({
            onReady: function () {

              $navArrows.show();
              $shadow.show();

            },
            orientation: 'r',
            cuboidsRandom: true,
            disperseFactor: 30
          }),

          init = function () {

            initEvents();

          },
          initEvents = function () {

            // add navigation events
            $navArrows.children(':first').on('click', function () {

              slicebox.next();
              return false;

            });

            $navArrows.children(':last').on('click', function () {

              slicebox.previous();
              return false;

            });

          };

      return {init: init};

    })();

    Page.init();

  });
</script>



<!-- 技术日记 -->
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
                    <h1 class="list-group-item-heading">
                        My Blog! Welcome!
                    </h1>
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
                                      class="button blue glossy glass" data-icon="✈">阅读博客</a></p>
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

