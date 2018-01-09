<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bjccdsrlcr
  Date: 2018/1/9
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 轮播图 -->
<div class="promo-block" id="promo-block">
    <div id="carousel-example-generic" class="carousel slide carousel-slider">
        <!-- 小圆点 -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- 图片区 -->
        <div class="carousel-inner" role="listbox">
            <!-- First slide -->
            <div class="item carousel-item-one active">
                <div class="center-block">
                    <div class="center-block-wrap">
                        <div class="center-block-body">
                            <h2 class="margin-bottom-20 animate-delay carousel-title-v1 animated fadeInDown">
                                广州<span class="color-blu">优普科技</span>有限公司
                            </h2>
                            <div class="animated flipInX">
                                <div class="hidden-xs">
                                    <i class="promo-like fa fa-home"></i>
                                    <div class="promo-like-text">
                                        <h2>UNIPOWER</h2>
                                        <p>Guangzhou Unipower Limited Company</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Second slide -->
            <div class="item carousel-item-two">
                <h4 class="carousel-position-one animate-delay carousel-title-v2 animated fadeInDown">
                    美好住居生活解决方案服务商
                </h4>
                <img class="carousel-position-two hidden-sm hidden-xs animate-delay" src="/resources/assets/images/img/slider/Slide2_iphone_left.png" alt="Iphone" data-animation="animated fadeInUp">
                <img class="carousel-position-three hidden-sm hidden-xs animate-delay" src="/resources/assets/images/img/slider/Slide2_iphone_right.png" alt="Iphone" data-animation="animated fadeInUp">
            </div>

            <!-- Third slide -->
            <div class="item carousel-item-three">
                <div class="center-block">
                    <div class="center-block-wrap">
                        <div class="center-block-body">
                            <h3 class="margin-bottom-20 animate-delay carousel-title-v2 animated fadeInDown" style="margin-top: -200px;">
                                提供系统安全及系统集成等解决方案
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 左右箭头 -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <i class="fa fa-angle-left" aria-hidden="true"></i>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
        </a>
    </div>
</div>

<!-- 简介 -->
<div class="about-block content content-center" id="about">
    <div class="container">
        <h2><strong>公司简介</strong></h2>
        <h4 class="main-para action" data-animate="pulse" data-delay="0.2s">
            公司成立于2006年，总部位于广州市天河软件园区金山大厦，
            分别在广西、云南、贵州、海南设立了省级办事处，
            在广东省内设立了粤东、粤西和粤北地市级办事处。
            公司致力于提供系统安全及系统集成等解决方案。
            经过十年发展，涉及基础网络、信息安全、协作、数据中心等多个技术领域，
            业务范围覆盖制造业、政府、金融、医疗、电力、商贸连锁等多个行业。
        </h4>
        <h4 class="main-para action"  data-animate="pulse" data-delay="0.4s">
            公司坚持以技术为核心的发展路线，建立了一支具有丰富经验的软件开发和专业服务团队，
            拥有高效的服务体系，不断优化深化完善IT服务，做优秀的服务商，为客户应用创造价值。
        </h4>
        <div class="ab-trio hidden">
            <img src="/resources/assets/onepage/img/trio.png" alt="" class="img-responsive">
            <div class="ab-cirlce ab-cirle-blue">
                <i class="fa fa-code"></i>
                <strong>Clean Code</strong>
            </div>
            <div class="ab-cirlce ab-cirle-red">
                <i class="fa fa-gift"></i>
                <strong>Huge Updates</strong>
            </div>
            <div class="ab-cirlce ab-cirle-green">
                <i class="fa fa-mobile"></i>
                <strong>Responsive</strong>
            </div>
        </div>
    </div>
</div>
<!-- 简介 -->

<div class="content content-center">
    <div class="container" style="padding-bottom: 20px;">
        <h2><strong>新闻动态</strong></h2>
        <h4>News & Trends</h4>
        <div class="col-sm-6 action" data-animate="slideInLeft" data-delay="0.2s">
            <div id="carousel-picture" class="carousel slide carousel-slider">
                <!-- 小圆点 -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-picture" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-picture" data-slide-to="1"></li>
                    <li data-target="#carousel-picture" data-slide-to="2"></li>
                </ol>

                <!-- 图片区 -->
                <div class="carousel-inner" role="listbox">
                    <div class="item carousel-item-one active"></div>
                    <div class="item carousel-item-two"></div>
                    <div class="item carousel-item-three"></div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 action" data-animate="slideInRight" data-delay="0.2s" style="padding-left: 30px;">
            <h4 class="text-left">最新动态 <a href="javascript:;" class="pull-right more" onclick="loadPage('/news/newsPubList')">More <i class="fa fa-arrow-right"></i></a></h4>
            <ul class="recent-list">
                <c:forEach items="${newsPubList}" var="sk">
                    <li><i class="fa fa-paperclip"></i>&nbsp;&nbsp;<a onclick="getNewsById(${sk.fid})">${sk.title}</a><span>08-15</span></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<!-- 热门产品2 -->
<div class="services-block content content-center" id="services">
    <div class="container">
        <h2><strong>热门产品</strong></h2>
        <h4>Popular Product</h4>
        <div class="row">
            <c:forEach items="${productsList}" var="sk">
                <div class="col-md-3 col-sm-3 col-xs-12 item action" data-animate="bounceIn" data-delay="0.2s">
                    <div class="img-wrap">
                        <img src="/resources/assets/images/s1.jpg" width="100%" height="200"/>
                    </div>
                    <h3><a href="javascript:;">${sk.pro_name}</a></h3>
                    <p>${sk.intro}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- Services block END -->

<!--宣传-->
<div class="message-block content content-center valign-center action" id="message-block" data-animate="slideInUp" data-delay="0.2s">
    <div class="valign-center-elem">
        <h2>
            <span>为客户提供更好服务，为股东创造更大价值，给员工更大舞台</span>
            <strong>以用户为是，以自己为非；创新精神；人单合一双赢</strong>
        </h2>
    </div>
</div>

<!--热门产品-->
<div class="prices-block content content-center hidden" id="prices">
    <div class="container">
        <h2><strong>热门产品</strong></h2>
        <h4>Popular Product</h4>
        <div class="row" style="margin-top: 20px;">
            <c:forEach items="${productsList}" var="sk">
                <div class="col-md-3 col-sm-3 col-xs-12 item action" data-animate="bounceIn" data-delay="0.2s">
                    <div class="img-wrap">
                        <img src="/resources/assets/images/s1.jpg" width="100%" height="200"/>
                    </div>
                    <h3><a href="javascript:;">${sk.pro_name}</a></h3>
                    <p>${sk.intro}</p>
                </div>
            </c:forEach>
            </div>
        </div>
    </div>
</div>


<!-- 典型案例 -->
<div class="testimonials-block content content-center margin-bottom-65 ">
    <div class="container">
        <h2><strong>典型案例</strong></h2>
        <h4>Typical Case</h4>
        <div class="carousel slide action" data-animate="flipInY" data-delay="0.2s" data-ride="carousel" id="testimonials-block">
            <div class="carousel-inner">
                <div class="active item">
                    <blockquote>
                        <p>${solutions.intro}</p>
                    </blockquote>
                    <span class="testimonials-name">${solutions.intro}</span>
                </div>
                <c:forEach items="${solutionsList}" var="sk">
                    <div class="item">
                        <blockquote>
                            <p>${sk.intro}</p>
                        </blockquote>
                        <span class="testimonials-name">${sk.sol_name}</span>
                    </div>
                </c:forEach>
            </div>
            <ol class="carousel-indicators" id="solutionsIndicators">
            </ol>
        </div>
    </div>
</div>

<!-- 合作 -->
<div class="partners-block hidden">
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-sm-3 col-xs-6">
                <img src="/resources/assets/onepage/img/partners/cisco.png" alt="cisco">
            </div>
            <div class="col-md-2 col-sm-3 col-xs-6">
                <img src="/resources/assets/onepage/img/partners/walmart.png" alt="walmart">
            </div>
            <div class="col-md-2 col-sm-3 col-xs-6">
                <img src="/resources/assets/onepage/img/partners/gamescast.png" alt="gamescast">
            </div>
            <div class="col-md-2 col-sm-3 col-xs-6">
                <img src="/resources/assets/onepage/img/partners/spinwokrx.png" alt="spinwokrx">
            </div>
            <div class="col-md-2 col-sm-3 col-xs-6">
                <img src="/resources/assets/onepage/img/partners/ngreen.png" alt="ngreen">
            </div>
            <div class="col-md-2 col-sm-3 col-xs-6">
                <img src="/resources/assets/onepage/img/partners/vimeo.png" alt="vimeo">
            </div>
        </div>
    </div>
</div>
<!-- Partners block END -->


<script>
    $(function() {
        var $myCarousel = $('#carousel-example-generic');
        $myCarousel.carousel({
            interval:2000
        });
        doAnimations($myCarousel.find('.item:first').find("[data-animation ^= 'animated']"))

        $myCarousel.on('slide.bs.carousel', function(e) {
            var $animatingElems = $(e.relatedTarget).find("[data-animation ^= 'animated']");
            doAnimations($animatingElems);
        });

        function doAnimations($dom) {
            $dom.each(function(idx, ele) {
                $(ele).addClass($(this).data('animation'));
                setTimeout(function() {
                    $(ele).removeClass($(this).data('animation'))
                }, 2000)
            })
        }

        $('#carousel-picture').carousel({
            interval:1500
        });
        $.ajax({
            type: 'get',
            url: '/getSolutionSize',
            success:function (result) {
                console.log(result);
                var html = '<li data-target="#testimonials-block" data-slide-to="0" class="active"></li>';
                for (var i = 1; i <= result.size; i++){
                    html += '<li data-target="#testimonials-block" data-slide-to="'+i+'"></li>'
                }
                console.log(html);
                $('#solutionsIndicators').html(html);
            }
        });
    });
    function getNewsById(fid) {
        loadPage("/news/newsId="+fid+"/detail");
        //window.location.hash = "article.jsp";
        $('.wrapper').removeClass('slideInRight');
        setTimeout(function() {
            $('.wrapper').addClass('slideInRight');
        }, 100)
    }
</script>
