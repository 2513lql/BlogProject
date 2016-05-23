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

        function getBlogByCurrentPage(currentPage,id,pageCount){

            $.ajax({
                async: false,
                url: "/blog/currentpageblogs.action",
                data: {'currentPage':currentPage},
                type: "POST",
                dataType: "json",//服务器返回数据类型
                success: function (data) {
                    parseData(data);
                }
            });
        }

        function parseData(data){
             var blogs = data["data"];
            var html = '';
            for(var i = 0 ;i < blogs.length;i++){
                html += '<div class="panel panel-info"> <div class="panel-heading"> <h4>';
                html += blogs[i]["blogTitle"] +' </h4> </div> <div class="panel-body"> <p>';
                html += blogs[i]["blogText"] +'</p> </div> <div class="panel-footer"> <div class="row"> <div class="col-md-2">评论次数:';
                html += blogs[i]["isComented"] +'</div> <div class="col-md-2">浏览次数:';
                html += blogs[i]["viewTimes"] +'</div> <div class="col-md-4">发表时间：';
                html += blogs[i]["publishDate"] +'</div> <div class="col-md-4"></div> </div> </div> </div>';
            }
            $("#blogsContainer").html(html);
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
                    <a href="#" class="list-group-item active">
                        文章类别
                    </a>
                    <c:forEach items="${blogKinds}" var="blogkind">
                        <a href="#" class="list-group-item">${blogkind.kindName}</a>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="col-md-9">
            <div class="elemarintop" id="blogsContainer">

                <c:forEach items="${blogs}" var="blog">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>
                                    ${blog.blogTitle}
                            </h4>
                        </div>
                        <div class="panel-body">
                            <p>${blog.blogText}</p>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-md-2">评论次数:${blog.isComented}</div>
                                <div class="col-md-2">浏览次数:${blog.viewTimes}</div>
                                <div class="col-md-4">发表时间：${blog.publishDate}</div>
                                <div class="col-md-4"></div>
                            </div>

                        </div>
                    </div>
                </c:forEach>

            </div>
            <div class="textcenter">
                <ul class="pagination">
                    <li id="first"><a href="#"  onclick="getBlogByCurrentPage(1,'first',${pageCount})">&laquo;第一页</a></li>
                    <c:forEach var="i" begin="1" end="${pageCount}" step="1">
                        <li id="page${i}"><a href="#"  onclick="getBlogByCurrentPage(${i},'page${i}',${pageCount})">${i}</a></li>
                    </c:forEach>
                    <li id="last"><a href="#"  onclick="getBlogByCurrentPage(${pageCount},'last',${pageCount})">最后一页&raquo;</a></li>
                </ul>
            </div>
        </div>
    </div>

</div>

<%@include file="/WEB-INF/views/footer.jsp" %>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
