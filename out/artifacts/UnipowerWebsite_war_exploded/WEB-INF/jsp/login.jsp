<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2017/12/29
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
</head>
<body>
<h1 style="color:red">登录</h1>
<form>
    <div class="form-group">
        <label for="usernameKey">用户名</label>
        <input type="text" class="form-control" id="usernameKey" name="username" placeholder="用户名">
    </div>
    <div class="form-group">
        <label for="passwordKey">密码</label>
        <input type="text" class="form-control" id="passwordKey" name="password" placeholder="密码">
    </div>

    <button type="button" id="loginBtn" class="btn btn-success">
        <span class="glyphicon glyphicon-student"></span>
        Submit
    </button>
</form>


<button id="publicKey">生成密钥对</button>
<script src="/resources/script/jquery-3.2.1.min.js"></script>
<script src="/resources/script/dataExchange.js"></script>

<script type="text/javascript">
    $(function () {
        //使用EL表达式传入参数
        website.loginPage.init();
    })
</script>
</body>
</html>



