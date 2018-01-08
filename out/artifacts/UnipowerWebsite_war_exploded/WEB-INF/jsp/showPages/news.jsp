<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <c:forEach items="${newsTypeList}" var="sk">
                    <button class="btn btn-primary" onclick="chooseNewsByType(${sk.fid})">${sk.type_name}</button>
                </c:forEach>
            </div>
            <ul class="news-list">
                <c:forEach items="${newsPubList}" var="sk">
                    <li>
                        <h4 class="news-title">
                            <a href="javascript:void(0)" onclick="getNewsById(${sk.fid})">${sk.title}</a>
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
//    $('.news-list').on('click', '.news-title>a', function() {
//        $('.wrapper').load('assets/html/article.html');
//        window.location.hash = "article.html";
//        $('.wrapper').removeClass('slideInRight');
//        setTimeout(function() {
//            $('.wrapper').addClass('slideInRight');
//        }, 100)
//    });

    $('#news-type').on('click','.btn',function(){
        $(this).addClass('active').siblings('.btn').removeClass('active')
    });
    function getNewsById(fid) {
        //$('.wrapper').load('');
        window.location.hash = "article.jsp";
        $('.wrapper').removeClass('slideInRight');
        setTimeout(function() {
            $('.wrapper').addClass('slideInRight');
        }, 100)
    }
    function chooseNewsByType(fid) {
        $.ajax({
            type: 'post',
            url: '/news/getNewsByType',
            data:{
                'type_id': fid
            },
            success:function (result) {
                console.log(result);
                var html = '';
                for(var i = 0; i < result.length; i++){
                    html+= '<li>'+
                            '<h4 class="news-title">'+
                            '<a href="javascript:void(0)">'+result[i].title+'</a>'+
                            '<span class="pull-right">'+result[i].date+'</span>'+
                            '</h4>'+
                            '<p class="news-intro">'+result[i].author+'</p>'+
                            '</li>'
                }
                    $('.news-list').html(html);
            }
        })
    }
</script>