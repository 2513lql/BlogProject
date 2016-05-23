<%--
  Created by IntelliJ IDEA.
  User: LQL
  Date: 2016/5/9
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>blogkind</title>



    <!-- Bootstrap -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">


    <script type="text/javascript">


        window.onload = function(){

            dividePage(${recordsCount},-1);

        };


        function dividePage(recordsCount,blogKindId) {
            $("#callBackPager").extendPagination({
                totalCount: recordsCount,  //记录总条数
                showCount: 5,   //分页栏显示的页码数
                limit: 3,              //每页显示记录数
                callback: function (curr, limit, totalCount) {
                    getBlogByCurrentPage(curr,blogKindId);
                }
            });
        }

        /**
         *  点击全部博文的处理
         */
        function getAllBlogs(currentPage,kindName){

            resetBlogKindTitle(kindName);
            $.ajax({
                async: false,
                url: "/blog/getallblogs.action",
                data: {'currentPage': currentPage,'pageSize':3,'blogKindId':-1},
                type: "POST",
                dataType: "json",//服务器返回数据类型
                success: function (data) {
                    var recordsCount = data["recordsCount"];
                    dividePage(recordsCount,-1);
                    parseData(data);
                }
            });
        }


        function getBlogsByKind(currentPage,blogKindId,kindName){
            resetBlogKindTitle(kindName);
            $.ajax({
                async: false,
                url: "/blog/getallblogs.action",
                data: {'currentPage': currentPage,'pageSize':3,'blogKindId':blogKindId},
                type: "POST",
                dataType: "json",//服务器返回数据类型
                success: function (data) {
                    var recordsCount = data["recordsCount"];
                    dividePage(recordsCount,blogKindId);
                    parseData(data);
                }
            });
        }

        function getBlogByCurrentPage(currentPage,blogKindId) {
            $.ajax({
                async: false,
                url: "/blog/currentpageblogs.action",
                data: {'currentPage': currentPage,'pageSize':3,'blogKindId':blogKindId},
                type: "POST",
                dataType: "json",//服务器返回数据类型
                success: function (data) {
                    parseData(data);
                }
            });
        }

        function parseData(data) {
            var blogs = data["data"];
            var html = '';
            for (var i = 0; i < blogs.length; i++) {
                html += '<div class="panel panel-info"> <div class="panel-heading"> <h4><a href="/blog/blogdetail.action?blogId='+blogs[i]["blogId"]+'">';
                html += blogs[i]["blogTitle"] + '</a> </h4> </div> <div class="panel-body"> <p>';
                html += blogs[i]["blogText"] + '</p> </div> <div class="panel-footer"> <div class="row"> <div class="col-md-2">评论次数:';
                html += blogs[i]["isComented"] + '</div> <div class="col-md-2">浏览次数:';
                html += blogs[i]["viewTimes"] + '</div> <div class="col-md-4">发表时间：';
                html += blogs[i]["publishDate"] + '</div> <div class="col-md-4"></div> </div> </div> </div>';
            }
            $("#blogsContainer").html(html);
        }

        function resetBlogKindTitle(kindName){

            $("#blogKindTitle").text(kindName);
        }

    </script>

</head>

<body>

<%@include file="/WEB-INF/views/header.jsp" %>

<div class="container" style="min-height: 532px;">



    <div class="row">
        <div class="col-md-3">
            <div class="elemarintop">
                <div class="list-group">
                    <a href="#" onclick="getAllBlogs(1,'全部博文')" class="list-group-item active">
                        全部博文
                    </a>
                    <c:forEach items="${blogKinds}" var="blogkind">
                        <a onclick="getBlogsByKind(1,${blogkind.kindId},'${blogkind.kindName}')" class="list-group-item">${blogkind.kindName}</a>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="col-md-9">

            <div class="row" class="elemarintop">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div  class="panel-heading textcenter">
                            <h3 id="blogKindTitle">全部博文</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div  id="blogsContainer">

                <c:forEach items="${blogs}" var="blog">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>
                                <a href="/blog/blogdetail.action?blogId=${blog.blogId}">
                                        ${blog.blogTitle}
                                </a>
                            </h4>
                        </div>
                        <div class="panel-body">
                            <p>${blog.blogText}</p>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-md-2">评论次数:${blog.commentTimes}</div>
                                <div class="col-md-2">浏览次数:${blog.viewTimes}</div>
                                <div class="col-md-4">发表时间：${blog.publishDate}</div>
                                <div class="col-md-4"></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="textcenter" id="callBackPager">

            </div>
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
</body>
</html>
