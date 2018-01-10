<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/9
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>添加图书</title>
    <%@include file="../common/head.jsp" %>
</head>
<body>
${sessionScope.get("username")}, 欢迎您！
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>添加新闻</h2>
        </div>
        <form action="/uploadImg" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="titleKey">标题</label>
                <input type="text" class="form-control" id="titleKey" name="title" placeholder="标题">
            </div>
            <div class="form-group">
                <label for="titleKey">标题</label>
                <input type="file"  name="items_pic"/>
            </div>

            <button type="submit" id="saveBtn" class="btn btn-success">
                <span class="glyphicon glyphicon-student"></span>
                保存新闻
            </button>


        </form>

    </div>
</div>

<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript" src="/resources/script/wangEditor.min.js"></script>



<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/resources/script/jquery-3.2.1.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="/resources/script/dataExchange.js" type="text/javascript"></script>

</body>
</html>
