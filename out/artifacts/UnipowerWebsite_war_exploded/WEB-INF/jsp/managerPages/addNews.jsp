<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/1 0001
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="../common/tag.jsp" %>
<!DOCTYPE html>
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
        <form>
            <div class="form-group">
                <label for="titleKey">标题</label>
                <input type="text" class="form-control" id="titleKey" name="title" placeholder="标题">
            </div>
            <div class="form-group">
                <label for="authorKey">作者</label>
                <input type="text" class="form-control" id="authorKey" name="author" placeholder="作者">
            </div>
            <div class="form-group">
                <label for="dateKey">日期</label>
                <input type="text" class="form-control" id="dateKey" name="date" placeholder="日期">
            </div>
            <div class="form-group">
                <label for="textKey">正文</label>
                <div id="textKey">
                    <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
                </div>
            </div>

            <span id="addMessage" class="glyphicon"> </span>
                <button type="button" id="saveBtn" class="btn btn-success">
                    <span class="glyphicon glyphicon-student"></span>
                    保存新闻
                </button>

                <button type="button" id="previewBtn" class="btn btn-success">
                    <span class="glyphicon glyphicon-student"></span>
                    预览
                </button>


        </form>


    </div>
    <div id="addResultModel" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    <span class="glyphicon glyphicon-studentId"> </span>提示信息：
                </h3>
            </div>

            <div class="modal-body">
                <h4 id="resultMessage"></h4>
            </div>

            <div class="modal-footer">
                <a href="#" class="btn" data-dismiss="modal">关闭</a>
            </div>
        </div>
    </div>
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

<script type="text/javascript">
    $(function () {
        //使用EL表达式传入参数
        website.addBookPage.init();
    })
</script>
</body>
</html>
