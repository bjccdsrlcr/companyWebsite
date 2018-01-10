<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/9
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="main-block article col-sm-10 col-sm-offset-1">
        <h2 class="text-center">${solutions.sol_name}</h2>
        <h5 class="article-mark">
            <a href="javascript:;" class="pull-right back" onclick="backToSolution()">返回列表&nbsp;>></a>
        </h5>
        <div class="article-content">
            <p>
                ${solutions.intro}
            </p>
        </div>
    </div>
</div>

<script type="text/javascript">
    function backToSolution(){
       loadPage('/solutions/solutionShowList')
    }
</script>