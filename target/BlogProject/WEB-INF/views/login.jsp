<%--
  Created by IntelliJ IDEA.
  User: LQL
  Date: 2016/5/13
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
  <div class="container">
    <form class="form-horizontal">
      <div class="form-group">
        <label for="myemail" class="col-sm-2 control-label">邮箱</label>
        <div class="col-sm-8">
          <input type="email" readonly class="form-control" id="myemail" placeholder="Email">
        </div>
      </div>
      <div class="form-group">
        <label for="profession" class="col-sm-2 control-label">职业</label>
        <div class="col-sm-8">
          <input type="text" readonly class="form-control" id="profession" placeholder="profession">
        </div>
      </div>
      <div class="form-group">
        <label for="address" class="col-sm-2 control-label">地址</label>
        <div class="col-sm-8">
          <input type="text" readonly class="form-control" id="address" placeholder="地址">
        </div>
      </div>

      <div class="form-group">
        <label for="registeDate" class="col-sm-2 control-label">注册时间</label>
        <div class="col-sm-8">
          <input type="text" readonly class="form-control" id="registeDate" placeholder="注册时间">
        </div>
      </div>
    </form>
  </div>
</body>
</html>
