<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/9
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content main-block">
    <div class="container">
        <h2><strong>公司荣耀</strong></h2>
        <h4 class="text-center">Certificate of Honor</h4>
        <div id="carousel-hornor" class="carousel slide carousel-slider">
            <!-- 小圆点 -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-hornor" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-hornor" data-slide-to="1"></li>
                <li data-target="#carousel-hornor" data-slide-to="2"></li>
                <li data-target="#carousel-hornor" data-slide-to="3"></li>
                <li data-target="#carousel-hornor" data-slide-to="4"></li>
            </ol>
            <!-- 图片区 -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="/resources/assets/images/honour/1.png" />
                </div>
                <div class="item">
                    <img src="/resources/assets/images/honour/4.png" />
                </div>
                <div class="item">
                    <img src="/resources/assets/images/honour/3.png" />
                </div>
                <div class="item">
                    <img src="/resources/assets/images/honour/2.png" />
                </div>
                <div class="item">
                    <img src="/resources/assets/images/honour/5.png" />
                </div>
            </div>

            <a class="carousel-control left" href="#carousel-hornor" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control right" href="#carousel-hornor" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('#carousel-hornor').carousel({
        interval:1000
    });
</script>