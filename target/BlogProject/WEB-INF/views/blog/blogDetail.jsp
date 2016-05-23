<%--
  Created by IntelliJ IDEA.
  User: LQL
  Date: 2016/5/11
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>blogDetail</title>
  <!-- Bootstrap -->
  <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div class="container" style="min-height: 532px;">
  <p>
    ${blog.blogText}
  </p>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
