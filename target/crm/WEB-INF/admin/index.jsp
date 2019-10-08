<%--
  Created by IntelliJ IDEA.
  User: chenya
  Date: 2019-06-09
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>博客管理</title>
    <script src="static/js/jquery.js"></script>
    <script src="static/bootstrap/js/bootstrap.js"></script>
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="static/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>
    <script type="text/javascript" src="static/dynamicline.js"></script>
    <link rel="stylesheet" type="text/css" href="static/button/button.css"/>
</head>
<body leftmargin="0">
<script type="text/javascript" src="static/dynamicline.js"></script>
<div class="container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><h2 style="text-align: center">我的博客</h2></div>
        <div class="panel-body">
            <%--            <p style="text-align: center"><a class="btn btn-primary btn-sm" href="/blogger/write" role="button">写博客</a></p>--%>
            <p style="text-align: center"><a href="/crm/blogger/write"
                  class="button blue glossy glass" data-icon="✈"> 写博客 </a></p>
                <form class="navbar-form navbar-right" action="/crm/blogger/addCategory" method="post">
                    <div class="input-group">
                        <input name="name" type="text" class="form-control" placeholder="添加分类">
                        <span class="input-group-btn">
<%--                            <button class="btn btn-default" type="button" onclick="addCategory()">添加</button>--%>
<%--                            <a type="submit"--%>
<%--                               class="btn btn-primary btn-sm">添加</a>--%>
                            <input class="btn btn-primary btn-sm" type="submit" value="添加">
                        </span>
                    </div>
                </form>
        </div>
        <table class="table table-hover table-striped">
            <tr class="info">
<%--                <td>编号</td>--%>
                <td>标题</td>
                <td>摘要</td>
                <td>分类</td>
                <td style="text-align: center" colspan="2">操作</td>
            </tr>
            <c:forEach begin="0" var="article" items="${articles}" step="1">
                <tr>
                    <td>${article.title}</td>
                    <td><a href="/crm/toArticleManage?id=${article.id}">${article.summary}</a></td>
                    <td><a>${article.category}</a></td>
                    <td><a href="/crm/blogger/update/${article.id}">修改</a></td>
                    <td><a href="/crm/blogger/delete/${article.id}" onclick="confirmDel(${article.id})">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<script type="text/javascript">
  function confirmDel(param)
  {
    if(window.confirm("您确定要删除该博客吗？")){
      var str = "/crm/blogger/delete/" + param;
      document.location = str
    }
  }
  // function addCategory() {
  //   if(window.confirm("您确定要添加该分类吗？")){
  //     var category = document.getElementById("addCategory").value();
  //     var str = "/blogger/addCategory/" + category;
  //     document.location = str
  //   }
  // }
</script>

</body>
</html>
