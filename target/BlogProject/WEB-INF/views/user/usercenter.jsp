<%--
  Created by IntelliJ IDEA.
  User: LQL
  Date: 2016/5/13
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>用户中心</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
    <script type="text/javascript" src="../../../js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../../../js/xheditor-1.2.2.min.js"></script>
    <script type="text/javascript" src="../../../js/zh-cn.js"></script>

    <script type="text/javascript">

        function showEditIcon(id) {
            var icon = document.getElementById(id);
            icon.style.display = "block";
        }
        function hideEditIcon(id) {
            var icon = document.getElementById(id);
            icon.style.display = "none";
        }

        function setEvent() {
            var blogManageBlogKind = document.getElementById("blogManageBlogKind");
            var blogPublishBtn = document.getElementById("blogPublishBtn");
            addEvent(blogManageBlogKind, 'change', handleBlogKindChange);
            addEvent(blogPublishBtn,'click',checkBlog);

        }

        function handleBlogKindChange() {
            var selectedItem = document.getElementById("blogManageBlogKind").value;
            getBlogsByBlogKind(selectedItem, 1);
        }
        function parseBlogData(data) {
            var blogs = data["data"];
            var html = '';
            for (var i = 0; i < blogs.length; i++) {
                html += '<tr><td>';
                html += '<a href="/blog/blogdetail.action?blogId=' + blogs[i]["blogId"] + '">';
                html += blogs[i]["blogTitle"] + '</a></td>';
                html += '<td>' + blogs[i]["publishDate"] + '</td>';
                html += '<td>' + blogs[i]["viewTimes"] + '</td>';
                html += '<td>' + blogs[i]["commentTimes"] + '</td>';
                html += '<td><a href="/blog/editblog.action?blogId=' + blogs[i]["blogId"] + '">' + '编辑</a>';
                html += '&nbsp';
                html += '<a onclick="deleteBlogById(' + blogs[i]["blogId"] + ')">删除</a></td></tr>'
            }
            $("#blogsContainer").html(html);
        }
        window.onload = function () {
            setEvent();
            dividePage(${recordsCount}, -1);
        };

        function dividePage(recordsCount, blogKindId) {
            $("#blogKindIdHidden").val(blogKindId);
            $("#callBackPager").extendPagination({
                totalCount: recordsCount,  //记录总条数
                showCount: 5,   //分页栏显示的页码数
                limit: 10,              //每页显示记录数
                callback: function (curr, limit, totalCount) {
                    $("#currentPageHidden").val(curr);
                    getBlogByCurrentPage(curr, blogKindId);
                }
            });
        }

        function getBlogsByBlogKind(blogKindId, currentPage) {
            $.ajax({
                async: false,
                url: "/blog/getallblogs.action",
                data: {'currentPage': currentPage, 'pageSize': 10, 'blogKindId': blogKindId},
                type: "POST",
                dataType: "json",//服务器返回数据类型
                success: function (data) {
                    var recordsCount = data["recordsCount"];
                    dividePage(recordsCount, blogKindId);

                    parseBlogData(data);
                }
            });
        }

        function getBlogByCurrentPage(currentPage, blogKindId) {
            $.ajax({
                async: false,
                url: "/blog/currentpageblogs.action",
                data: {'currentPage': currentPage, 'pageSize': 10, 'blogKindId': blogKindId},
                type: "POST",
                dataType: "json",//服务器返回数据类型
                success: function (data) {
                    parseBlogData(data);
                }
            });
        }


        function deleteBlogById(blogId) {
            var currentPage = $("#currentPageHidden").val();
            var blogKindId = $("#blogKindIdHidden").val();
            $.ajax({
                async: false,
                url: "/blog/deleteblog.action",
                data: {'currentPage': currentPage, 'pageSize': 10, 'blogKindId': blogKindId, 'blogId': blogId},
                type: "POST",
                dataType: "json",//服务器返回数据类型
                success: function (data) {
                    console.log(data);
                    parseBlogData(data);
                }
            });
        }

        function checkBlog() {
            var blogKind = document.getElementById("blogPublishBlogKind").value;
            var html = '<div class="alert alert-danger" style="width: 40%;height: 30px;padding: 10px" role="alert">';
            if (blogKind == -1) {
                html += '请选择文章类别</div>';
                $("#publishInfo").html(html);
                return;
            }
            var blogTitle = document.getElementById("blogTitle").value;
            if(blogTitle == null || blogTitle.mytrim().length == 0){
                html += '请输入文章标题</div>';
                $("#publishInfo").html(html);
                return;
            }
            var blogContent = document.getElementById("blogContent").value;
            if(blogContent == null || blogContent.mytrim().length == 0){
                html += '请编辑文章内容</div>';
                $("#publishInfo").html(html);
                return;
            }
        }

        function publishBlog(blogKind,blogTitle,blogContent){
            alert("文章发表成功");
        }
    </script>

</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>


<div class="modal fade" id="mymodalimg">
    <div class="modal-dialog">
        <div class="modal-content modal-sm">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title"></h4>
            </div>

            <div class="modal-body">
                <div class="input-group col-xs-12">
                    <input type="text" class="form-control" placeholder="用户名或邮箱" aria-describedby="basic-addon1">
                </div>
                <div class="input-group col-xs-12" style="margin-top: 15px;">
                    <input type="password" class="form-control" placeholder="密码" aria-describedby="basic-addon2">
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


<div class="container" style="min-height: 532px;">
    <div class="row">
        <div class="col-md-1">
        </div>

        <div class="col-md-10">
            <div class="row">
                <div class="col-md-3" style="background-color: cadetblue;">

                    <div class="headImg textcenter" onmouseout="hideEditIcon('editImgIcon')"
                         onmouseover="showEditIcon('editImgIcon')">

                        <div style="position: relative;">

                            <img src="${userinfo.pictureUrl}" alt="..." style="margin-top: 10px" width="150px"
                                 height="180"
                                 class="img-rounded">
                            <span class="glyphicon glyphicon-edit iconstyle" id="editImgIcon"
                                  style="position: absolute;z-index: 2;top: 130px;left: 110px;"></span>
                        </div>
                        <div style="margin-top: 10px"><span>css</span>|<span>css</span></div>
                        <div style="margin-top: 10px"><span>用户名:${userinfo.userName}</span></div>
                    </div>

                </div>
                <div class="col-md-9" onmouseover="showEditIcon('editInfoIcon')"
                     onmouseout="hideEditIcon('editInfoIcon')" style="background-color: #E9E9E9">
                    <div class="row">

                        <!--用户基本信息-->
                        <div class="col-md-8" style="background-color: darkgray;height: 250px;padding-top: 20px;">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="myemail" class="col-sm-3 control-label">邮箱</label>

                                    <div class="col-sm-8">
                                        <input type="email" disabled class="form-control" id="myemail"
                                               placeholder="Email" value="${userinfo.email}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="profession" class="col-sm-3 control-label">职业</label>

                                    <div class="col-sm-8">
                                        <input type="text" disabled class="form-control" id="profession"
                                               placeholder="profession" value="${userinfo.profession}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="address" class="col-sm-3 control-label">地址</label>

                                    <div class="col-sm-8">
                                        <input type="text" value="${userinfo.address}" disabled class="form-control"
                                               id="address" placeholder="地址">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="registeDate" class="col-sm-3 control-label">注册时间</label>

                                    <div class="col-sm-8">
                                        <input type="text" value="${userinfo.registeDate}" disabled class="form-control"
                                               id="registeDate"
                                               placeholder="注册时间">
                                    </div>
                                </div>
                            </form>
                            <span class="glyphicon glyphicon-edit iconstyle" id="editInfoIcon"
                                  style="float: right;"></span>
                        </div>

                        <!--用户简介-->
                        <div class="col-md-4 textcenter" style="background-color: #4A515B;height: 250px;">
                            <h4>个人简介</h4>

                            <p>
                                ${userinfo.introduction}
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-md-1">
        </div>
    </div>

    <hr>
    <!--tab页面-->
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#basicMsg" data-toggle="tab">
                        文章管理
                    </a>
                </li>
                <li><a href="#operationMsg" data-toggle="tab">发表文章</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="basicMsg">
                    <div class="row">
                        <div class="col-md-3" style="padding-top: 20px;padding-bottom: 20px;">
                            <span>文章类别:</span>
                            <select class="form-control" id="blogManageBlogKind">
                                <option value="-1">全部文章</option>
                                <c:forEach items="${blogKinds}" var="blogKind">
                                    <option value="${blogKind.kindId}">${blogKind.kindName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-9">

                        </div>
                    </div>
                    <%--<p>自强学堂是一个提供最新的web技术的站点，我们将将国外的精华教程收集到国内, 让每个人享受平等学习的机会!我们的目标是只要你坚持来自强学堂,我们提供的教程就能让你变得更强!</p>--%>
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 40%;">标题</th>
                            <th style="width: 20%;">发表时间</th>
                            <th style="width: 10%;">浏览</th>
                            <th style="width: 10%;">评论</th>
                            <th style="width: 20%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="blogsContainer">
                        <c:forEach items="${blogs}" var="blog">
                            <tr>
                                <td><a href="/blog/blogdetail.action?blogId=${blog.blogId}"> ${blog.blogTitle}</a></td>
                                <td> ${blog.publishDate}</td>
                                <td> ${blog.viewTimes}</td>
                                <td>${blog.commentTimes}</td>
                                <td>
                                    <a href="/blog/editblog.action?blogId=${blog.blogId}">编辑</a>
                                    <a onclick="deleteBlogById(${blog.blogId})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="textcenter" id="callBackPager">
                        分页导航
                    </div>
                    <input type="hidden" id="currentPageHidden" value="1"/>
                    <input type="hidden" id="blogKindIdHidden" value="-1"/>
                </div>
                <div class="tab-pane fade" id="operationMsg">
                    <div class="row">
                        <div class="col-md-3" style="padding-top: 20px;padding-bottom: 20px;">
                            <span>文章类别:</span>
                            <select class="form-control" id="blogPublishBlogKind">
                                <option value="-1">文章分类</option>
                                <c:forEach items="${blogKinds}" var="blogKind">
                                    <option value="${blogKind.kindId}">${blogKind.kindName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6" style="padding-top: 20px;padding-bottom: 20px;">
                            <span>文章标题:</span>
                            <input type="text" id="blogTitle" class="form-control" placeholder="文章标题">
                        </div>
                        <div class="col-md-3">
                        </div>
                    </div>
                    <form method="post" action="#">
                        <textarea id="blogContent" name="editor" class="xheditor" rows="20" style="width: 80%;height: 400px">

                        </textarea><br/><br/>
                    </form>
                    <div class="row">
                        <div class="col-md-2">
                            <button class="btn btn-primary" id="blogPublishBtn" type="button">发表文章</button>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-primary" id="blogSaveBtn" type="button">保存到草稿</button>
                        </div>
                        <div class="col-md-8" id="publishInfo">
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>

    <%--<%@include file="/WEB-INF/views/footer.jsp" %>--%>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!--分页导航条-->
    <script src="/js/extendPagination.js"></script>
    <!--项目js文件-->
    <script src="../../../js/blogproject.js"></script>
</body>


</html>
