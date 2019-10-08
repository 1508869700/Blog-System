<%--
CreatedbyIntelliJIDEA.
User:chenya
Date:2019-06-09
Time:12:37
TochangethistemplateuseFile|Settings|FileTemplates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>博主登陆</title>
    <script src="../static/js/jquery.js"></script>
    <script src="../static/bootstrap/js/bootstrap.js"></script>
    <link href="../static/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css"
          rel="stylesheet">
    <link href="../static/bootstrap/css/bootstrap-theme.css" rel="stylesheet"/>
    <link href="../static/signin.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../static/style.css">
</head>
<body>
<div class="container">
    <form class="form-signin" action="/crm/blogger/dologin" method="post">
        <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title">博主登陆</h3>
                <c:if test="${requestScope.error!=null}">
                    <div><%=request.getAttribute("error")%></div>
                </c:if>
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Username"
                               id="username" name="account" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="Password"
                               id="password" name="password" maxlength="8"/>
                    </div>
                    <div class="form-group">
                        <label class="checkbox">
                            <input type="checkbox" name="remember" value="1"/>记住我
                        </label>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">登录
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>