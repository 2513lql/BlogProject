<%--
  Created by IntelliJ IDEA.
  User: LQL
  Date: 2016/5/13
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>用户中心</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">

    <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>

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
//            addEvent(blogPublishBtn, 'click', checkBlog);
            blogPublishBtn.onclick = checkBlog;

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
                html += '<a href="<%=path%>/blog/blogdetail.action?blogId=' + blogs[i]["blogId"] + '">';
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
//            setEvent();
            alert("hello world");
            var blogPublishBtn = document.getElementById("blogPublishBtn");
            blogPublishBtn.onclick = checkBlog;
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
                url:"<%=path%>/blog/getallblogs.action",
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
                url: "<%=path%>/blog/currentpageblogs.action",
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
                url: "<%=path%>/blog/deleteblog.action",
                data: {'currentPage': currentPage, 'pageSize': 10, 'blogKindId': blogKindId, 'blogId': blogId},
                type: "POST",
                dataType: "json",//服务器返回数据类型
                success: function (data) {
                    parseBlogData(data);
                }
            });
        }

        function checkBlog() {
            var blogKind = document.getElementById("blogPublishBlogKind").value;
            var html = '<span style="color: #d9534f;font-size: larger;">';
            if (blogKind == -1) {
                html += '请选择文章类别</span>';
                $("#publishInfo").html(html);
                return;
            }
            var blogTitle = document.getElementById("blogTitle").value;
            if (blogTitle == null || blogTitle.trim().length == 0) {
                html += '请输入文章标题</span>';
                $("#publishInfo").html(html);
                return;
            }
            var blogContent = UE.getEditor('editor').getContent();
            if (blogContent == null || blogContent.trim().length == 0) {
                html += '请编辑文章内容</span>';
                $("#publishInfo").html(html);
                return;
            }
            publishBlog(blogKind, blogTitle, blogContent);
        }

        function publishBlog(blogKind, blogTitle, blogContent) {
            alert("hello");
            $.ajax({
                async: false,
                url: "<%=path%>/blog/publishblog.action",
                data: {'blogKind': blogKind, 'blogTitle': blogTitle, 'blogContent': blogContent},
                type: "POST",
                dataType: "json",//服务器返回数据类型
                success: function (data) {
                    window.location.reload();
                    var html = '<span class="text-success" style="font-size: larger">文章发表成功</span>';
                    $("#publishInfo").html(html);

                }
            });
        }


        function editBlogKind(kindId,kindName){

            td = document.getElementById(kindName);
            console.log(td);
            var regex = new RegExp("input",'gi');
            if(regex.test(td.innerHTML)){
                return;
            }
            old = td.innerHTML;
            oldKindName = kindName;
            var html = '<input class="blogkind-editbox" value="'+kindName+'"/>';
            html += '<span class="blogkind-editbtn"><a onclick="saveBlogKind('+kindId;
            html += ')">保存</a></span>';
            html += '<span class="blogkind-editbtn"><a onclick="cancelEditKind()">取消</a></span>';
            td.innerHTML = html;
        }

        //删除文章分类
        function deleteBlogKindById(kindId){
            $.ajax({
                async: false,
                url: "<%=path%>/blog/deleteblogkind.action",
                data:{'kindId':kindId},
                type: "POST",
                dataType: "JSON",//服务器返回数据类型
                success: function (data) {
                    window.location.reload();
                }
            });
        }

        function saveBlogKind(kindId){
            var editBox = document.getElementsByClassName("blogkind-editbox")[0];
            var newKindName = editBox.value.trim();
            var msgHtml = '<span class="alertText">';
            var tbHtml = td.innerHTML.substring(0,192);
            if(newKindName == null || newKindName.length == 0){
                msgHtml += '类别不能为空</span>';
                td.innerHTML = tbHtml + msgHtml;
                return;
            }else if(newKindName == oldKindName){
                msgHtml += '已存在该类别</span>';
                td.innerHTML = tbHtml + msgHtml;
                return;
            }else{
                $.ajax({
                    async:false,
                    url:"<%=path%>/blog/editblogkind.action",
                    data:{'kindId':kindId,'kindName':newKindName},
                    type:'POST',
                    dataType:'JSON',
                    success:function(data){
                        if(data["msg"] == "fail"){
                            msgHtml += '已存在该类别</span>';
                            td.innerHTML = tbHtml + msgHtml;
                        }else {
                            parseBlogKindData(data);
                            parseBlogKindData2(data);
                        }
                    }
                });
            }
        }

        //取消编辑
        function cancelEditKind(){
            td.innerHTML = old;
        }

        //对类别更改的html进行解析
        function parseBlogKindData(data){
            var blogKindContainer = document.getElementById("blogKindContainer");
            var blogKinds = data["blogKinds"];
            var html = '';
            for(var i = 0,len = blogKinds.length ; i < len;i++){
                html += '<tr><td id="';
                html += blogKinds[i]["kindName"] + '"><a href="#">';
                html += blogKinds[i]["kindName"] + '</a></td>';
                html += '<td>' + blogKinds[i]["blogsCount"]+'</td>';
                html += '<td><a onclick="editBlogKind(' + blogKinds[i]["kindId"] +',\'' + blogKinds[i]["kindName"]+'\')">编辑</a>';
                html += '&nbsp';
                html += '<a onclick="deleteBlogKindById(' + blogKinds[i]["KindId"] +')">删除</a>';
                html += '</td></tr>';
            }
            blogKindContainer.innerHTML = html;
        }


        //对类别选择进行解析
        function parseBlogKindData2(data){
            var blogManageBlogKind = document.getElementById("blogManageBlogKind");
            var blogPublishBlogKind = document.getElementById("blogPublishBlogKind");
            var blogKinds = data["blogKinds"];
            var html = '<option value="-1">文章分类</option>';
            for(var i = 0,len = blogKinds.length ; i < len;i++) {
                html += '<option value=">' + blogKinds[i]["kindId"] +'">' + blogKinds[i]["kindName"]+'</option>';
            }x
            blogManageBlogKind.innerHTML = html;
            blogPublishBlogKind.innerHTML = html;
        }

        //添加文章分类
        function addBlogKind(){
            var blogKindName = document.getElementById("kindNameEdit").value.trim();
            var html = '<span class="alertText">';
            if(blogKindName == null || blogKindName.length == 0){
                html += '类别不能为空</span>';
                $("#addblogkindinfo").html(html);
            }else{
                $.ajax({
                    async:false,
                    url:'<%=path%>/blog/addblogkind.action',
                    data:{'kindName':blogKindName},
                    type:'POST',
                    dataType:'JSON',
                    success:function(data){
                        if(data["msg"] == "fail"){
                            html += '该类已存在</span>';
                            $("#addblogkindinfo").html(html);
                        }else{
                            var blogKindContainer = document.getElementById("blogKindContainer");
                            var blogKind = data["blogKinds"][0];
                            console.log(blogKind);
                            var len = blogKindContainer.rows.length;
                            blogKindContainer.insertRow(len);
                            var cell0 = blogKindContainer.rows[len].insertCell(0);
                            cell0.id = blogKind["kindName"];
                            cell0.innerHTML = '<a href="#">'+blogKind["kindName"]+'</a>';
                            var cell1 = blogKindContainer.rows[len].insertCell(1);
                            cell1.innerHTML = blogKind["blogsCount"];
                            var cell2 = blogKindContainer.rows[len].insertCell(2);
                            console.log(blogKind["kindName"]);
                            cell2.innerHTML = '<a onclick="editBlogKind('+blogKind["kindId"]+',\''+blogKind["kindName"]+'\')">编辑</a>&nbsp<a onclick="deleteBlogById('+blogKind["kindId"]+')">删除</a>';
                            $("#addblogkindinfo").html("");
                            document.getElementById("kindNameEdit").value = "";
                        }
                    }
                });
            }
        }
        function removeKindInfo(){
            $("#addblogkindinfo").html("");
        }
    </script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>


<%--<div class="modal fade" id="mymodalimg">--%>
<%--<div class="modal-dialog">--%>
<%--<div class="modal-content modal-sm">--%>

<%--<div class="modal-header">--%>
<%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span--%>
<%--class="sr-only">Close</span></button>--%>
<%--<h4 class="modal-title"></h4>--%>
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
                    <a href="#blogManage" data-toggle="tab">
                        文章管理
                    </a>
                </li>
                <li><a href="#operationMsg" data-toggle="tab">发表文章</a></li>
                <li><a href="#blogKindManage" data-toggle="tab">类别管理</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="blogManage">
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
                        <script id="editor" type="text/plain" style="height:500px;"></script>
                    </form>
                    <div class="row">
                        <div class="col-md-2">
                            <button class="btn btn-primary" id="blogPublishBtn" type="button">发表文章</button>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-primary" id="blogSaveBtn" type="button">保存到草稿</button>
                        </div>
                        <div class="col-md-8" id="publishInfo" style="padding-top: 10px;">
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="blogKindManage">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 50%;">类别</th>
                            <th style="width: 20%;">文章</th>
                            <th style="width: 30%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="blogKindContainer">
                        <c:forEach items="${blogKinds}" var="blogKind">
                            <tr>
                                <td id="${blogKind.kindName}"><a href="#"> ${blogKind.kindName}</a></td>
                                <td> ${blogKind.blogsCount}</td>
                                <td>
                                    <a onclick="editBlogKind('${blogKind.kindId}','${blogKind.kindName}')">编辑</a>
                                    <a onclick="deleteBlogKindById('${blogKind.kindId}')">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-md-4">
                            <input class="blogkind-editbox" onkeypress="removeKindInfo()" name="kindName" id="kindNameEdit" required/>
                            <button class="btn btn-primary btn-sm" onclick="addBlogKind()">添加类别</button>
                        </div>
                        <div class="col-md-8" id="addblogkindinfo">

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!--分页导航条-->
<script src="/js/extendPagination.js"></script>
<!--项目js文件-->
<script src="../../../js/blogproject.js"></script>
<script>
    var ue = UE.getEditor('editor').ready(function(){
        this.setContent('内容');
    });
</script>
</body>


</html>
