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
<%
    try {
        Integer counts = (Integer) application.getAttribute("counts");
        if(counts==null && counts==0)
            counts=1;
        else
            counts++;
        application.setAttribute("counts",counts);
    }
    catch (Exception e)
    {}

%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>详情</title>
    <%--        引入jquery--%>
    <script type="text/javascript" src="../../static/js/jquery.js"></script>
    <%--&lt;%&ndash;    引入样式&ndash;%&gt;--%>
    <link href="../../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../../static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../static/layui/css/layui.css"/>
    <script type="text/javascript" src="../../static/dynamicline.js"></script>
</head>
<body>
<jsp:include page="comm/top.jsp"/>
<script type="text/javascript" src="../../static/dynamicline.js"></script>
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
    <hr style="height: 3px;border: none;background-color: #ddd;background-image: repeating-linear-gradient(-45deg, #fff, #fff 4px, transparent 4px, transparent 8px);"/>
    <br/>
    <br/>
    <br/>
    </div>
</div>



<div class="container" align="center">
<%--    没什么用的表单--%>
    <form class="form-group" style="width:50%;">
        <div class="form-group" style="text-align:center;">
            <textarea id="comment_content"
                      class="form-control"
                      style="height: 150px; text-align:center;" disabled>请先登陆再评论
            </textarea>
        </div>
        <br/>
        <div class="form-group" style="text-align:right">
            <button type="button" class="layui-btn" data-toggle="modal" data-target="#login">评论</button>
        </div>
    </form>

    <br/>
    <div>
        <ul>
            <!-- 先遍历留言信息-->
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


<!-- 注册窗口 -->
<div id="register" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">注册</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="/crm/userRegister/${article.id}" method="post">
                    <div class="form-group">
                        <label>用户名</label>
                        <input id="usernameRegister" name="username" class="form-control" type="text" placeholder="你的名字">
                    </div>

                    <span id="errorUsername" style="color:red"></span>

                    <div class="form-group">
                        <label>邮箱</label>
                        <input name="email" class="form-control" type="email" placeholder="例如:123@123.com">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input name="password" class="form-control" type="password" placeholder="至少6位字母或数字">
                    </div>



                    <div class="text-right">
                        <button class="btn btn-primary" type="submit">提交</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 登录窗口 -->
<div id="login" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">登录</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="/crm/userLogin/${article.id}" method="post">
                    <div class="form-group">
                        <label>用户名</label>
                        <input id="username" name="username" class="form-control" type="text" placeholder="">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input id="password" name="password" class="form-control" type="password" placeholder="">
                    </div>

                    <span id="error" style="color:red"></span>

                    <div class="text-right">
                        <button id="loginbutton" class="btn btn-primary" type="button">登录</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">还没有账号？点我注册</a>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
//创建异步对象
function createXMLHttpRequest() {
  try {
    return new XMLHttpRequest();
  }
  catch (e) {
    alert("哥们，你浏览器太老了吧");
    throw e;
  }
}
//文档加载完就执行
window.onload = function() {
  var btn = document.getElementById("loginbutton");
  btn.onclick = function () {
    // 1.得到异步对象
    var xmlHttp = createXMLHttpRequest();
    // 2.打开服务器的连接
    var u = '${article.id}';
    xmlHttp.open("POST","/crm/userLogin",true);
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    // 3.发出请求
    var str1 = document.getElementById("username").value;
    var str2 = document.getElementById("password").value;
    var str = "username=" + str1 + "&" + "password=" + str2;
    xmlHttp.send(str);
    // 4.给xmlHttp的onreadystatechange事件注册监听
    xmlHttp.onreadystatechange = function () {
      if(xmlHttp.readyState == 4 && xmlHttp.status == 200)
      {

        var text = xmlHttp.responseText;
        var span = document.getElementById("error");
        if(text == "0")
          span.innerHTML = "用户名或者密码错误";
        else
        {
          var url = "/crm/toArticle?id=" + u;
          window.location.href=url;
        }
      }
    }
  }

  var usernameRegister = document.getElementById("usernameRegister")
  usernameRegister.onblur = function () {
    // 1.得到异步对象
    var xmlHttp = createXMLHttpRequest();
    // 2.打开服务器的连接
    xmlHttp.open("POST","/crm/usernameRegister",true);
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    // 3.发出请求
    var str = document.getElementById("usernameRegister").value;
    xmlHttp.send("username="+ str);
    // 4.给xmlHttp的onreadystatechange事件注册监听
    xmlHttp.onreadystatechange = function () {
      if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
        var text = xmlHttp.responseText;
        var span = document.getElementById("errorUsername");
        if(text == "0")
          span.innerHTML = "用户名已被注册!";
        else
          span.innerHTML = "";
      }
    }
  }
}

</script>


</body>
</html>
