<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/8
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content main-block">
    <h2><strong>新闻中心</strong></h2>
    <h4 class="text-center">News Center</h4>
    <div class="container">
        <div class="col-sm-10 col-sm-offset-1">
            <div class="type-list text-left" id="news-type">
                <button class="btn btn-primary active">所有新闻</button>
                <button class="btn btn-primary">媒体报告</button>
                <button class="btn btn-primary">公司动态</button>
                <button class="btn btn-primary">生活运动</button>
            </div>
            <ul class="news-list">

                <c:forEach items="${newsPubList}" var="sk">
                    <li>
                        <h4 class="news-title">
                            <a href="javascript:void(0)">${sk.title}</a>
                            <span class="pull-right">${sk.date}</span>
                        </h4>
                        <p class="news-intro">
                                ${sk.author}
                        </p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('.news-list').on('click', '.news-title>a', function() {
        $('.wrapper').load('assets/html/article.html');
        window.location.hash = "article.html";
        $('.wrapper').removeClass('slideInRight');
        setTimeout(function() {
            $('.wrapper').addClass('slideInRight');
        }, 100)
    })

    $('#news-type').on('click','.btn',function(){
        $(this).addClass('active').siblings('.btn').removeClass('active')
    })
</script>