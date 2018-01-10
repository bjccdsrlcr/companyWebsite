<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/9
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="main-block article col-sm-10 col-sm-offset-1">
        <h2 class="text-center">${products.pro_name}</h2>
        <h5 class="article-mark">
            <%--<a href="javascript:;" class="pull-right back" onclick="backToProduct()">返回产品列表&nbsp;>></a>--%>
        </h5>
        <div class="article-content">
            <p>
                ${products.intro}
            </p>

        </div>
    </div>
</div>