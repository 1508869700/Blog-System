<%--
  Created by IntelliJ IDEA.
  User: chenya
  Date: 2019-06-08
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--<script type="text/javascript" src="static/js/jquery.js"></script>--%>
<%--&lt;%&ndash;&lt;%&ndash;    引入样式&ndash;%&gt;&ndash;%&gt;--%>
<%--<link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
<%--<script src="static/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<link rel="stylesheet" href="static/layui/css/layui.css"/>--%>
<%--<link href="../../../static/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>--%>
<div class="row">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="nv1">
                    <li class="active" id="firstPage"><a href="/crm/views">首页</a></li>
                    <li id="webPage"><a href="/crm/column/Java">Java专栏</a></li>
                    <li id="androidPage"><a href="/crm/column/Android">Android专栏</a>
                    </li>
                    <li id="rnPage"><a href="/crm/column/Linux">Linux专栏</a>
                    </li>
                    <li id="ubuntuPage"><a href="/crm/column/Database">数据库专栏</a>
                    </li>
                </ul>
                <div class="dropdown-menu-right" style="float: right">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        更多博客分类
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <c:forEach var="category" items="${sessionScope.categories}">
                            <li>
                                <a href="/crm/column/${category.name}">${category.name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>
