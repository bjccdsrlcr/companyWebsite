$(function(){
	//默认加载主页面
	loadPage('main.html');

	//菜单的选中样式动画
	$('#menu').on('mouseenter','>li',function(){
		$(this).addClass('open');
		var $sec=$(this).children('a').next('.dropdown-menu');
		if($sec.length){
			$sec.show()
		}
	}).on('mouseleave','>li',function(){
		$(this).removeClass('open');
		var $sec=$(this).children('a').next('.dropdown-menu');
		$sec.hide()
	});
	
	//浏览器后退操作
	window.onhashchange=function(){  
        var hashStr = window.location.hash.substr(1); 
        $('.wrapper').load('/resources/assets/html/'+hashStr+'');
    }; 
    
    //滚动到高度400出现回到顶部按钮
    $(window).scroll(function() {
	  	if($(this).scrollTop()>400){
	  		$('.go2top').show();
	  	}
	  	if($(this).scrollTop()<=400){
	  		$('.go2top').hide();
	  	}
	  	
	  	action();
	});
	//点击动画回滚
	$('.go2top').click(function(){
		$('html,body').animate({
			scrollTop:0
		},500)
	})
	//window.location.search='';
	
})

//回到顶部
function goTop(){
	$('html,body').animate({'scrollTop':0})
}

//加载页面
function loadPage(url){
	$('.wrapper').removeClass('animated-fast slideInUp')
	$('.wrapper').load(''+url+'',function(){
		location.hash=url;
		$('.wrapper').addClass('animated-fast slideInUp');
	});
	goTop();
}

//滚动过程中出现动画
function action(){
	$('.action').each(function(idx,ele){
		if($(this).offset().top<= $(document).scrollTop()+$(window).height()){
			var animate=$(this).data('animate');
			var delay=$(this).data('delay');
			$(this).addClass('animated '+animate);
			if(delay){
				$(this).css('animation-delay',delay)
			}
		}
	})
}
	