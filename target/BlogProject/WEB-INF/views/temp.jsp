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

<button id="policyBtn">策略数据框</button>
<div class="modal fade" id="policyContent">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">数据现有策略</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">

                    <div class="form-group">
                        <label for="dataIds" class="col-sm-3 control-label">策略对应数据</label>

                        <div class="col-sm-9">
                            <input type="email" disabled class="form-control" id="dataIds"
                                   placeholder="dataIds" value="${userinfo.email}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="policyName" class="col-sm-3 control-label">策略名称</label>

                        <div class="col-sm-9">
                            <input type="email" disabled class="form-control" id="policyName"
                                   placeholder="policyName" value="${userinfo.email}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">策略描述</label>

                        <div class="col-sm-9">
                            <input type="text" disabled class="form-control" id="description"
                                   placeholder="description" value="${userinfo.profession}"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="security" class="col-sm-3 control-label">安全级别</label>

                        <div class="col-sm-9">
                            <input type="text" value="${userinfo.address}" disabled class="form-control"
                                   id="security" placeholder="security">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="effect" class="col-sm-3 control-label">策略效果</label>

                        <div class="col-sm-9">
                            <input type="text" value="${userinfo.address}" disabled class="form-control"
                                   id="effect" placeholder="effect">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="userAttris" class="col-sm-3 control-label">用户属性规则</label>

                        <div class="col-sm-9">
                            <input type="text" value="${userinfo.registeDate}" disabled class="form-control"
                                   id="userAttris"
                                   placeholder="用户属性">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="network" class="col-sm-3 control-label">网络</label>

                        <div class="col-sm-9">
                            <input type="text" value="${userinfo.registeDate}" disabled class="form-control"
                                   id="network"
                                   placeholder="网络">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="time" class="col-sm-3 control-label">访问时间</label>

                        <div class="col-sm-9">
                            <input type="text" value="${userinfo.registeDate}" disabled class="form-control"
                                   id="time"
                                   placeholder="访问时间">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ipRegexp" class="col-sm-3 control-label">网段</label>

                        <div class="col-sm-9">
                            <input type="text" value="${userinfo.registeDate}" disabled class="form-control"
                                   id="ipRegexp"
                                   placeholder="网段">
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary btn-block" data-dismiss="modal">确定</button>
            </div>


        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="panel panel-default">
    <div class="panel-heading" id="panelHeadingPolicyHint">策略制定提示</div>
    <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.<br>
        3 wolf moon officia aute, non cupidatat skateboard dolor brunch.<br>
        Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,<br>
        sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.<br>
        Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.<br>
        Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table,<br>
        raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.<br>
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">数据现有访问策略</div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-8">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Remember me
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Sign in</button>
                        </div>
                    </div>
                </form>

            </div>
            <div class="col-md-4">

            </div>
        </div>

    </div>
</div>



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
<script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap.min.js"></script>
<%--<script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-transition.js"></script>--%>
<%--<script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>--%>
<script>
    $(function () {
        $("#btn2").click(function () {
            $("#mymodalimg").modal("toggle");
        });
    });


    $(function () {
        $("#hintBtn").click(function () {
            console.log("hello world");
            $("#collapseExample").collapse("toggle");
        });
    });
    $(function(){
        $("#panelHeadingPolicyHint").click(function(){
            $(".panel-body").toggle(2000);
        });
    });

    //    function showEditImgWindow(){
    //        document.getElementById("mymodalimg").madal("toggle");
    //        $("#mymodalimg").madal("toggle");
    //    }

</script>

</body>
</html>
