<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/3
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/dist/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <style>
        .login-page{
            background-image: url(/resources/images/login-bg.png); background-size: 100% 100%;
        }
        .login-logo a{ color: #fff;}
        .login-box-body{ background: rgba(255,255,255,0.8);}
        .login-box-msg{ color: #068EC9; font-weight: bold;}
    </style>
</head>

<body class="login-page">
<div class="login-box">
    <div class="login-logo">
        <img src="/resources/images/logo.png" width="250" alt="" />
        <!--<a href="../../index2.html"><b>UNIPOWER</b></a>-->
    </div>
    <div class="login-box-body">
        <h4 class="login-box-msg">优普科技后台管理系统</h4>
        <form>
            <div class="form-group has-feedback">
                <input type="email" class="form-control" id="usernameKey" placeholder="用户名" />
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="passwordKey" placeholder="密码" />
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="text-center">
                    <a id="loginBtn" class="btn btn-primary btn-flat" >登&nbsp;&nbsp;录</a>
                </div>
                <%--<button type="button" id="loginBtn" class="btn btn-success">--%>
                    <%--<span class="glyphicon glyphicon-student"></span>--%>
                    <%--登&nbsp;&nbsp;录--%>
                <%--</button>--%>
            </div>
        </form>
    </div>
</div>
<script src="/resources/script/jquery-3.2.1.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/script/loginPage.js"></script>
<script>
    $(function () {
        //使用EL表达式传入参数
        websiteLoginPage.loginPage.init();
    })
</script>
</body>

</html>