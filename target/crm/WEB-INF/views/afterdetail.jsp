<%--
  Created by IntelliJ IDEA.
  User: chenya
  Date: 2019-06-17
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: chenya
  Date: 2019-06-08
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date date = new Date();
    String nowDate = sdf.format(date);
//    String bloggername = new String("20172694");
%>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>详情</title>
    <%--        引入jquery--%>
    <script type="text/javascript" src="static/js/jquery.js"></script>
    <%--&lt;%&ndash;    引入样式&ndash;%&gt;--%>
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/layui/css/layui.css"/>
    <script type="text/javascript" src="static/dynamicline.js"></script>
</head>
<body>
<jsp:include page="comm/top.jsp"/>
<script type="text/javascript" src="static/dynamicline.js"></script>
<br>
<br>
<div class="container" style="width: 800px;">
    <div class="panel panel-info">
        <br/>
        <br/>
        <!-- 文章标题概要 -->
        <div id="title" class="panel-heading">
            <h3>
                <center>『 ${article.title} 』</center>
            </h3>
            <h6 align="left">
                访客量: ${article.visit}
            </h6>
        </div>
        <br/>
        <!-- 添加Markdown的容器 -->
        <div id="article_content" class="panel-body">
            <span><pre>${article.content}</pre></span>
        </div>
        <br/>
        <br/>
        <br/>
    </div>
</div>


<div class="container" align="center">
    <form class="form-group"
          action="/crm/article/saveComment"
          method="post"
          style="width:50%;">
        <input name="username"
                       value="${sessionScope.username}"
                       hidden="hidden"/>
        <input name="date"
               value="<%=nowDate%>"
               hidden="hidden"/>
        <input name="forarticleid"
               value="${article.id}"
               hidden="hidden"/>
        <div class="form-group" style="text-align:center;">
            <textarea id="content"
                      name="content"
                      placeholder="请输入你的留言"
                      class="form-control"
                      style="height: 150px;">
            </textarea>
        </div>
        <br/>
                <div class="form-group" style="text-align:right">
                    <input type="submit" class="layui-btn" value="评论">
                </div>
        <br/>
    </form>
        <!-- 留言信息列表展示 -->
    <div>
        <ul>
            <!-- 先遍历留言信息 -->
            <c:forEach items="${requestScope.commentList}" var="comment">
                <!-- 如果留言信息是在本文章下的才显示 -->
                <c:if test="${comment.forarticleid eq article.id}">
                    <li style="border-top: 1px dotted #01AAED">
                        <br/>                 
                        <div style="text-align: left;color:#444">                     
                            <div>
                                <span style="color:#01AAED">${comment.username}</span>             
                            </div>
                            <div>${comment.content}</div>                   
                        </div>                 
                        <div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
                            <span>${comment.date}</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <hr style="margin-top: 7px;"/>               
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>


</body>
</html>
