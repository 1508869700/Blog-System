<%--
  Created by IntelliJ IDEA.
  User: chenya
  Date: 2019-06-12
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>陈响的个人网站主页</title>
    <meta charset="utf-8"/>
    <meta name="description" content="翁天信（Dandy Weng）的个人网站主页。我是一个自学者，爱好旅行、摄影、设计和编程。"/>
    <meta property="og:title" content="翁天信 · Dandy Weng 的个人网站主页">
    <meta property="og:description" content="翁天信（Dandy Weng）的个人网站主页。我是一个自学者，爱好旅行、摄影、设计和编程。">
    <meta property="og:image" content="static/img/鸡你太美.png">
    <meta property="og:url" content="https://www.dandyweng.com">
    <meta property="og:type" content="webpage"/>
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@wengtianxin">
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, viewport-fit=cover"/>
    <link rel="stylesheet" href="https://v7.res.dandyweng.com/style.css" type="text/css"/>
    <link rel="prefetch" href="https://v7.res.dandyweng.com/fonts/SourceHanSerifCN-SemiBold.woff2">
    <link rel="prefetch" href="static/img/鸡你太美.png">
    <script src="https://v7.res.dandyweng.com/vendors.js" defer></script>
    <script src="https://v7.res.dandyweng.com/main.js" defer></script>
</head>

<body>
<script type="text/javascript" src="static/dynamicline.js"></script>
<section id="intro">
    <header>
        <h1 id="heading">你好，<br/>我是陈响<br/>20172694。</h1>
        <h2 id="subheading">爱好唱、跳、Rap和篮球。</h2>
        <div id="slice-left" class="slice left"></div>
        <div id="slice-right" class="slice right"></div>
    </header>
</section>

<section id="content">
    <p id="text-become-autodidact">作为自学者，我喜欢自己去学习新技术。</p>
    <p id="text-learn-from">我想做一名后端开发工程师甚至是架构师，<br/>而不是一个只会应对业务代码的CURD工程师。</p>

    <p id="traveling">旅行是从大自然学习的最佳方式。<br/>走遍世界，对我而言不仅仅是个梦想。</p>

    <div id="globe-container">
        <canvas id="globe"></canvas>
    </div>
</section>

<section id="photography">
    <p>旅行，让我爱上摄影；<br/>摄影，让我更爱旅行。</p>

    <div id="group">
        <img id="photo-a" src="https://v7.res.dandyweng.com/images/8b6df735.jpg"/>
        <img id="photo-b" src="https://v7.res.dandyweng.com/images/f7e20fb5.jpg"/>
        <img id="photo-c" src="https://v7.res.dandyweng.com/images/dc4a72be.jpg"/>
        <img id="photo-d" src="https://v7.res.dandyweng.com/images/c76d0cd3.jpg"/>
        <img id="photo-e" src="https://v7.res.dandyweng.com/images/1739332d.jpg"/>
        <img id="photo-f" src="https://v7.res.dandyweng.com/images/99117f15.jpg"/>
        <img id="photo-g" src="https://v7.res.dandyweng.com/images/dd84e443.jpg"/>
        <img id="photo-h" src="https://v7.res.dandyweng.com/images/83b278df.jpg"/>
    </div>
</section>


<section id="toindex">
    <div class="container">
        <div style="text-align:center">
            <a href="/crm/views" class="btn btn-default btn-lg active" role="button">进入博客</a>
        </div>
    </div>
</section>

<section id="more">
    <div class="container">
        <div id="guestbook" class="item">
            <h2>写新留言</h2>
            <div class="item-content">
                <div id="new-message">
                    <div id="step-1" class="inner-container">
                        <textarea id="message-content" placeholder="有什么想对我说的？畅所欲言吧"
                                  oninput="guestbook.contentDidChange(this)"></textarea>
                        <p>留言会公开显示，请勿在留言内容写下微信号等私人联系方式，谨防诈骗。如果你不想发布公开留言，也可以发送邮件到 <a
                                href="mailto:dandyweng@dandyweng.com">dandyweng@dandyweng.com</a>
                            与我联系。</p>
                        <button id="next-step-button" class="inactive" onclick="guestbook.next()">
                            留言
                        </button>
                    </div>
                    <div id="step-3" class="inner-container">
                        <h3>你的留言已经保存。</h3>
                        <p>为防止广告信息，所有留言都会在审核之后才会公开显示。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>

</html>
