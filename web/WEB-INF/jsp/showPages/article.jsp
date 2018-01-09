<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/8
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="main-block article col-sm-10 col-sm-offset-1">
        <h2 class="text-center">${news.title}</h2>
        <h5 class="article-mark">
            类别:
            <c:forEach items="${newsTypeList}" var="sk">
                <span class="type">${sk.type_name}</span>
            </c:forEach>
            发布者: <span class="author">${news.author}</span>
            发布时间: <span class="date">${news.date}</span>
            <a href="javascript:;" class="pull-right back" onclick="backToNews()">返回新闻列表&nbsp;>></a>
        </h5>
        <div class="article-content">
            ${news.text}
        </div>
        <div class="comments content">
            <h3 class="comments-title"><strong>相关评论</strong> <span>Comments</span></h3>
            <div class="comments-body">
                <div class="input-area">
                    <div class="col-sm-2 text-center">
                        <img src="assets/images/user2.png" alt="" width="100" height="100" />
                    </div>
                    <div class="col-sm-10">
                        <h4 class="clearfix hidden">
                            <span class="comments-name pull-left ">Admin</span>
                            <span class="comments-date pull-right ">2018-01-01</span>
                        </h4>
                        <div class="comments-content">
                            <div class="col-sm-10 no-padding">
                                <textarea class="comment-text" ></textarea>
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-primary btn-sm pull-left" onclick="comment(${news.fid})">提交评论</button>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="comments-list">
                    <c:forEach items="${commentsList}" var="sk">
                        <li>
                            <div class="col-sm-2 text-center ">

                                <img src="/resources/assets/images/user2.png" alt="" width="100" height="100" />
                            </div>
                            <div class="col-sm-10">
                                <h4 class="clearfix text-blue">
                                    <span class="comments-name pull-left">${sk.user_name}</span>
                                    <span class="comments-date pull-right">${sk.date}</span>
                                </h4>
                                <div class="comments-content">
                                    <p>${sk.text}</p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>

            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    function comment(newsId){
        var text = $('.comment-text').val();
        //var fid = $('#newsId').val();
        console.log(newsId);
        $.ajax({
            type: 'post',
            url: '/comments/addComments',
            data:{
                "text": text,
                "fid": newsId
            },
            success:function (result) {
                console.log(result);
                alert('评论成功');
                // 可以刷新一下页面.
            }
        });

    }

    function backToNews(){
        loadPage("/news/newsPubList");
//        $('.wrapper').load('assets/html/news.html');
//        window.location.hash = "news.html";
    }
</script>