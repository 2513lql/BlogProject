<%--
  Created by IntelliJ IDEA.
  User: LQL
  Date: 2016/5/13
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>后台管理</title>

  <!-- Bootstrap -->
  <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/leftnav.css">

</head>
<body>

<%@include file="bheader.jsp"%>


<div class="container-fluid">
  <div class="row">
    <div class="col-md-2">
      <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
        <li class="active">
          <a href="#">
            <i class="glyphicon glyphicon-th-large"></i>
            首页
          </a>
        </li>
        <li>
          <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
            <i class="glyphicon glyphicon-cog"></i>
            系统管理
            <span class="pull-right glyphicon glyphicon-chevron-down"></span>
          </a>
          <ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
            <li><a href="#"><i class="glyphicon glyphicon-user"></i>用户管理</a></li>
            <li><a href="#"><i class="glyphicon glyphicon-th-list"></i>菜单管理</a></li>
            <li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>角色管理</a></li>
            <li><a href="#"><i class="glyphicon glyphicon-edit"></i>修改密码</a></li>
            <li><a href="#"><i class="glyphicon glyphicon-eye-open"></i>日志查看</a></li>
          </ul>
        </li>
        <li>
          <a href="./plans.html">
            <i class="glyphicon glyphicon-credit-card"></i>
            物料管理
          </a>
        </li>

        <li>
          <a href="./grid.html">
            <i class="glyphicon glyphicon-globe"></i>
            分发配置
            <span class="label label-warning pull-right">5</span>
          </a>
        </li>

        <li>
          <a href="./charts.html">
            <i class="glyphicon glyphicon-calendar"></i>
            图表统计
          </a>
        </li>
        <li>
          <a href="#">
            <i class="glyphicon glyphicon-fire"></i>
            关于系统
          </a>
        </li>

      </ul>
    </div>
    <div class="col-md-10">
      主窗口
    </div>
  </div>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
