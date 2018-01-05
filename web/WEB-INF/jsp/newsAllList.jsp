<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/3
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>所有新闻列表页面</title>
    <%@include file="common/head.jsp" %>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>新闻列表</h2>
            ${username}, 欢迎您， ${sessionScope.get("username")}
        </div>



        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th><a id="bookID">标题</a>
                    </th>
                    <th><a id="name">日期</a>
                    </th>
                    <th><a id="number">作者</a>
                    </th>
                    <th>详细</th>
                </tr>
                </thead>
                <tbody id="bookList">
                <c:forEach items="${list}" var="sk">
                    <tr>
                        <td>${sk.title}</td>
                        <td>${sk.date}</td>
                        <td>${sk.author}</td>
                        <td><a class="btn btn-info" href="/news/newsId=${sk.fid}/detail" >详细</a></td>
                        <td><a class="btn btn-info" href="/news/newsId=${sk.fid}/isPub" >发布</a></td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>


    </div>
</div>



<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/resources/script/jquery-3.2.1.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="/resources/script/dataExchange.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</body>
</html>


