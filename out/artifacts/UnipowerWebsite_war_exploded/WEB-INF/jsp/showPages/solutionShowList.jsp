<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/9
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content main-block">
    <h2><strong>解决方法</strong></h2>
    <h4 class="text-center">Solution</h4>
    <div class="container">
        <div class="case-wrap clearfix">
            <c:forEach items="${solutionsList}" var="sk">
                <div class="col-sm-4 text-center">
                    <div class="case" onclick="getSolutionById(${sk.fid})">
                        <div class="case-img" >
                            <div class="case-img" >
                                <img src="/resources/assets/images/product.jpg" width="300" height="200" alt="" />
                            </div>
                        </div>
                        <p class="text-blue">${sk.sol_name}</p>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>

<script type="text/javascript">
    $('.case-wrap').on('click', '.case', function() {
        $('.wrapper').load('/resources/assets/html/solution_detail.html');
        $('.wrapper').removeClass('slideInRight').addClass('slideInRight');
        window.location.hash = "solution.html";
    })
    function getSolutionById(fid) {
        loadPage('/solutions/solutionId='+fid+'/detail');
    }
</script>