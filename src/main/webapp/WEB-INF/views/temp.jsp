<%--
  Created by IntelliJ IDEA.
  User: LQL
  Date: 2016/5/10
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<%--<button class="btn btn-primary" type="button">点击我</button>--%>
<%--<div class="modal fade" id="mymodal">--%>
    <%--<div class="modal-dialog">--%>
        <%--<div class="modal-content modal-sm">--%>

            <%--<div class="modal-header">--%>
                <%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span--%>
                        <%--class="sr-only">Close</span></button>--%>
                <%--<h4 class="modal-title">登陆系统</h4>--%>
            <%--</div>--%>

            <%--<div class="modal-body">--%>
                <%--<div class="input-group col-xs-12">--%>
                    <%--<input type="text" class="form-control" placeholder="用户名或邮箱" aria-describedby="basic-addon1">--%>
                <%--</div>--%>
                <%--<div class="input-group col-xs-12" style="margin-top: 15px;">--%>
                    <%--<input type="password" class="form-control" placeholder="密码" aria-describedby="basic-addon2">--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<div class="modal-footer">--%>
                <%--<button type="button" class="btn btn-primary btn-block">登陆</button>--%>
                <%--<button type="button" class="btn btn-default btn-block" data-dismiss="modal">关闭</button>--%>
            <%--</div>--%>


        <%--</div>--%>
        <%--<!-- /.modal-content -->--%>
    <%--</div>--%>
    <%--<!-- /.modal-dialog -->--%>
<%--</div>--%>
<%--<!-- /.modal -->--%>


<button class="btn btn-primary" id="btn2" type="button">点击我</button>
<div class="modal fade" id="mymodalimg">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">头像修改</h4>
            </div>

            <div class="modal-body textcenter">
                <form class="form-horizontal">
                    <div class="form-group textcenter">
                        <label for="imgFile">选择图片</label>
                        <input type="file" id="imgFile">
                        <p class="help-block">仅支持JPG,GIF,PNG格式;文件小于5M</p>
                    </div>
                </form>
                <div>
                    <img src="img1.jpg" alt="img" width="150px" height="180px"/>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary btn-block">登陆</button>
                <button type="button" class="btn btn-default btn-block" data-dismiss="modal">关闭</button>
            </div>


        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<%--<table class="table table-hover table-bordered table-striped">--%>
<%--<thead>--%>
<%--<tr>--%>
<%--<th>文章标题</th>--%>
<%--<th>文章内容</th>--%>
<%--<th>浏览次数</th>--%>
<%--<th>浏览次数</th>--%>
<%--</tr>--%>
<%--</thead>--%>
<%--<tbody>--%>
<%--<tr>--%>
<%--<td>标题一 </td>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--<td>内容一</td>--%>
<%--</tr>--%>


<%--</tbody>--%>
<%--</table>--%>

<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-transition.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>
<script>
    $(function () {
        $("#btn2").click(function () {
            $("#mymodalimg").modal("toggle");
        });
    });

//    function showEditImgWindow(){
//        document.getElementById("mymodalimg").madal("toggle");
//        $("#mymodalimg").madal("toggle");
//    }

</script>

</body>
</html>
