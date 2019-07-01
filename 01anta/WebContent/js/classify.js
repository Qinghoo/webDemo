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


    // 商品筛选
    $(".c-normal").find("a").hover(function(){
        $(this).css("color","#D6211A");
    },function(){
        $(this).css("color","#666666"); 
    });


    //分页按钮
    $(".p-btn").hover(function(){
        $(this).css("color","#D6211A");
    },function(){
        $(this).css("color","#666666"); 
    });
});



function weiye(currPage,m,tid,stid) {
location.href="ClassifyServlet?m="+m+"&currPage="+currPage+"&tid="+tid+"&stid="+stid;
}