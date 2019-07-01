// 轮播图JS
$(function () {
    var index = 2;
    //------点击底部小圆点
    $(".bottom-btn").click(function () {
        index = $(this).index();                                //获取当前是第几个小圆点
        $(this).addClass("active").siblings().removeClass("active");   //给小圆点添加鼠标经过的class
        $(".item").eq(index).fadeIn().siblings().fadeOut();     //fadeIn是淡入    图片淡入淡出效果
    });
    //------右箭头
    $(".lr-tab .right").click(function () {
        index++;
        if (index > 4) index = 0;            //当到最后一张图，再跳转到第一张
        $(".item").eq(index).fadeIn().siblings().fadeOut();
        $(".bottom-btn").eq(index).addClass("active").siblings().removeClass("active");
    });
    //------左箭头
    $(".lr-tab .left").click(function () {
        index--;
        if (index < 0) index = 4;
        $(".item").eq(index).fadeIn().siblings().fadeOut();
        $(".bottom-btn").eq(index).addClass("active").siblings().removeClass("active");
    });
    //-------鼠标离开图片，再进行自动轮播
    function autoplay() {
        time = setInterval(function () {
            index++;
            if (index > 4) index = 0;
            $(".item").eq(index).fadeIn().siblings().fadeOut();
            $(".bottom-btn").eq(index).addClass("active").siblings().removeClass("active");
        }, 4000);
    }
    autoplay();                 //这里调用自动轮播函数，也就是默认的效果
    $("#banner").hover(function () {
        clearInterval(time);    //鼠标经过banner区域，清除计时器
    }, autoplay);                //这里是鼠标退出banner区域，再进行轮播
});



$(function () {
    // 顶部导航栏鼠标悬停
    $(".nav-menu-top").find("a").hover(function(){
        $(this).css("color","#DD0000");
    },function(){
        $(this).css("color","#000000");
    });

    $(".log-box").find("a").hover(function(){
        $(this).css("color","#DD0000");
        $(this).css("cursor","pointer");
    },function(){
        $(this).css("color","#000000");
    });


    //商品区鼠标悬停事件
    //鼠标指向图片，显示阴影和按钮
    $(".cover").hover(function () {
        $(this).css("opacity", "0.4");
        $(this).next().css("opacity", "1");
    }, function () {
        $(this).css("opacity", "0");
        $(this).next().css("opacity", "0");
    });

    //鼠标指向按钮，显示阴影和按钮，同时按钮样式改变
    $(".btn-one").mouseenter(function () {
        $(this).prev().css("opacity", "0.4");
        $(this).css("opacity", "1");
        $(this).css("background-color", "#FFFFFF");
        $(this).children().css("color", "#000000");
    });
    $(".btn-one").mouseleave(function () {
        $(this).css("background-color", "");
        $(this).children().css("color", "#FFFFFF");
    });

    //选购更多商品
    $("#more").hover(function () {
        $(this).css("background-color", "#d00");
        $(this).children().css("color","#FFFFFF");
    }, function () {
        $(this).css("background-color", "");
        $(this).children().css("color","#333333");
    });


    //二级菜单实现
    $("#all-style").hover(function () {
        $("#all-style-submenu").show();
    },function () {
        $("#all-style-submenu").hide();
    });

    $("#all-style-submenu").hover(function () {
        $(this).show();
    },function () {
        $(this).hide();
    });

    $("#all-style-submenu").find("li").hover(function () {
        $(this).css("background-color","#D6211A");
    },function() {
        $(this).css("background-color","");  
    });

    $("#all-style-submenu").find("a").hover(function(){
        $(this).css("text-decoration","underline");
    },function(){
        $(this).css("text-decoration","none");
    });
    
    $(".nav-menu-bot").children("li.erji").hover(function () {
        $(this).next().show();
        $(this).css("background-color","#333333");
    },function () {
        $(this).next().hide();
        $(this).css("background-color","");
    });
   
    $(".submenu").hover(function () {
        $(this).show();
        $(this).prev().css("background-color","#333333");
    },function () {
        $(this).hide();
        $(this).prev().css("background-color","");
    });

    $(".title").find("a").hover(function(){
        $(this).css("color","#DD0000");
    },function(){
        $(this).css("color","#000000");
    });
    
    


    // 右边固定栏
    $("#shopcart").hover(function(){
        $(this).css("background-color","#D6211A");
    },function(){
        $(this).css("background-color","");
    });

    $(".icon").hover(function(){
        $(this).css("background-color","#D6211A");
        $(this).nextUntil(".icon").slideDown(250);
    },function(){
        $(this).css("background-color","");
        $(this).nextUntil(".icon").hide();
    });

});
