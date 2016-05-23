<%--
  Created by IntelliJ IDEA.
  User: LQL
  Date: 2016/5/9
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>main</title>

  <!-- Bootstrap -->
  <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">


</head>
<body>
<%@include file="header.jsp" %>

<div class="container">

  <div class="row">

    <div class="col-md-9">

      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active slideimgheight">
            <img src="/imges/img1.jpg" width="100%" alt="...">

            <div class="carousel-caption">
              ...
            </div>
          </div>
          <div class="item slideimgheight">
            <img src="/imges/img2.jpg" width="100%" alt="...">

            <div class="carousel-caption">
              ...
            </div>
          </div>
          <div class="item slideimgheight">
            <img src="/imges/img3.jpg" width="100%" alt="...">

            <div class="carousel-caption">
              ...
            </div>
          </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>

      </div>


      <div class="col-md-4 elemarintop">
        <a href="#" class="thumbnail">
          <img src="/imges/img1.jpg" alt="img1" style="height: 180px;width: 100%; display: block;"/>
        </a>

        <div class="caption">
          <h3>
            BootStrap学习教程
          </h3>

          <p>Bootstrap框架是一个优秀的前端框，就算您是一位后端程序员或者你是一位不懂设计的前端人员，
            你也能依赖于Bootstrap制作做优美的网站...
          </p>
          <a href="#" class="btn btn-primary">开始学习</a>
          <a href="#" class="btn btn-primary">正在学习</a>
        </div>
      </div>
      <div class="col-md-4 elemarintop">
        <a href="#" class="thumbnail">
          <img src="/imges/img1.jpg" alt="img1" style="height: 180px;width: 100%; display: block;"/>
        </a>

        <div class="caption">
          <h3>
            BootStrap学习教程
          </h3>

          <p>Bootstrap框架是一个优秀的前端框，就算您是一位后端程序员或者你是一位不懂设计的前端人员，
            你也能依赖于Bootstrap制作做优美的网站...
          </p>
          <a href="#" class="btn btn-primary">开始学习</a>
          <a href="#" class="btn btn-primary">正在学习</a>
        </div>
      </div>
      <div class="col-md-4 elemarintop">
        <a href="#" class="thumbnail">
          <img src="/imges/img1.jpg" alt="img1" style="height: 180px;width: 100%; display: block;"/>
        </a>

        <div class="caption">
          <h3>
            BootStrap学习教程
          </h3>

          <p>Bootstrap框架是一个优秀的前端框，就算您是一位后端程序员或者你是一位不懂设计的前端人员，
            你也能依赖于Bootstrap制作做优美的网站...
          </p>
          <a href="#" class="btn btn-primary">开始学习</a>
          <a href="#" class="btn btn-primary">正在学习</a>
        </div>
      </div>

    </div>

    <div class="col-md-3">
      <div class="list-group">
        <a href="#" class="list-group-item active">
          Cras justo odio
        </a>
        <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
        <a href="#" class="list-group-item">Morbi leo risus</a>
        <a href="#" class="list-group-item">Porta ac consectetur ac</a>
        <a href="#" class="list-group-item">Vestibulum at eros</a>
      </div>
    </div>

  </div>
</div>




<%@include file="footer.jsp"%>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>



</body>
</html>
