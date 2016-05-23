<%--
  Created by IntelliJ IDEA.
  User: LQL
  Date: 2016/5/9
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%String userName = (String)session.getAttribute("userName");%>
<html>
<head>
  <meta charset="UTF-8">
  <title>header</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <style type="text/css">
    a{
      cursor: pointer;
    }
  </style>
  <script type="text/javascript">


    function clickLogin(){
      $("#mymodal").modal("toggle");
    }

    function checkLogin(){
      var userName = document.getElementById("userName").value;
      var password = document.getElementById("password").value;
      if(userName == null || userName.length == 0){
        $("#message").html("用户名不能为空");
      }else if(password == null || password.length == 0){
        $("#message").html("密码不能为空");
      }else{
        $.ajax({
          async: false,
          url: "/user/login.action",
          data: {"userName":userName,"password":password},
          type: "GET",
          dataType: "json",//服务器返回数据类型
          success: function (data) {
            parseData(data);
          }
        });
      }
    }

    function parseData(data){
      var result = data["result"];
      if(result == true){
        window.location.reload();
        var userName = data["userName"];
        $("#right").html("<li> <a href='#'>" + userName + "<li>");
        $("#mymodal").modal("hide");
      }else{
        var errorMsg = data["errorMsg"];
        $("#message").html(errorMsg);
      }
    }

  </script>

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container modal-sm">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">个人网站</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li class="active"><a href="/blog/main.action">首页 <span class="sr-only">(current)</span></a></li>
          <li><a href="/blog/getblogkind.action?currentPage=1&pageSize=3">我的文章</a></li>
          <%if (userName!=null){%>
          <li><a href="/user/usercenter.action?userName=<%=userName%>">个人中心</a></li>
          <%}%>
        </ul>

        <ul class="nav navbar-nav navbar-right" id="right">
          <%if (userName==null){%>
          <li><a onclick="clickLogin()">Sign In</a></li>
          <li><a href="#">Sign Up</a></li>
          <%}else {%>
          <li><a href="#"><%=userName%></a></li>
          <%}%>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
  </div>
</nav>


<!--登陆框-->
<div class="modal fade" id="mymodal">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 300px;">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">登陆系统</h4>
      </div>

      <div class="modal-body">
        <div class="input-group col-xs-12">
          <input type="text" id="userName" class="form-control" placeholder="用户名或邮箱" aria-describedby="basic-addon1">
        </div>
        <div class="input-group col-xs-12" style="margin-top: 15px;">
          <input type="password" id="password" class="form-control" placeholder="密码" aria-describedby="basic-addon2">
        </div>
                <span id="message" style="color: #d9534f;">

                </span>
      </div>

      <div class="modal-footer">
        <button type="button" onclick="checkLogin()" class="btn btn-primary btn-block">登陆</button>
        <button type="button" class="btn btn-default btn-block" data-dismiss="modal">关闭</button>
      </div>


    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>
