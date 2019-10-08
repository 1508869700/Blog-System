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
    <%--    引入jquery--%>
    <%--    引入jquery--%>
    <script type="text/javascript" src="static/js/jquery.js"></script>
    <%--&lt;%&ndash;    引入样式&ndash;%&gt;--%>
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/layui/css/layui.css"/>
    <script type="text/javascript" src="static/dynamicline.js"></script>
</head>
<body>
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
        <div id="content" class="panel-body">
            <span><pre>${article.content}</pre></span>
        </div>
        <br/>
        <br/>
        <br/>
    </div>
</div>


<div>
    <br/>
    <div>
        <ul>
            <!-- 先遍历留言信息 -->
            <c:forEach items="${commentList}" var="comment">
                <!-- 如果留言信息是在本文章下的才显示 -->
                <c:if test="${comment.forarticleid eq article.id}">
                    <li style="border-top: 1px dotted #01AAED">
                        <br/>                 
                        <div style="text-align: left;color:#444">                     
                            <div>
                                <span style="color:#01AAED">${comment.username}</span>             
                            </div>
                            <div>${comment.content}</div>
                            <br>
                            <br>
                            <div><a role="button" class="btn btn-danger btn-xs" onclick="confirmDel(${comment.id})">删除评论</a></div>                   
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


<script type="text/javascript">
  function confirmDel(param)
  {
    if(window.confirm("您确定要删除该条评论吗？")){
      var str = "/crm/comment/delete/" + param;
      document.location = str
    }
  }
</script>


</body>
</html>
