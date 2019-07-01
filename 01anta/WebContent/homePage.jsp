<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/homePage.js"></script>
    <link rel="stylesheet" href="css/homePage.css">
</head>

<body>
    <!-- 顶端导航界面 -->
    <div class="nav">
        <div class="nav-top">
            <div class="log"><a href="${pageContext.request.contextPath }/HomePageServlet?m=homePageList"><img src="img/首页log.png" alt="安踏商城，永不止步"></a></div>
            <div class="log-box">
                <c:if test="${user==null }">
                	<a href="${pageContext.request.contextPath }/use/UseServlet?m=noPassword">登录</a>
	                <span>|</span>
	                <a href="${pageContext.request.contextPath }/use/regist.jsp">注册</a>
                </c:if>
                <c:if test="${user!=null }">
                	<div style="font-size: 12px;color: #000000;font-family: "Microsoft YaHei";">${user.uname },您好&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/use/UseServlet?m=logOut" id="tuichu">退出登录</a></div>                
                	</c:if>
            </div>
            <ul class="nav-menu-top">
                <li><a href="order/OrderServlet?m=list">我的订单&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
                <li><a href="personal.jsp">个人中心&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
                <li><a href="">手机商城&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
                <li><a href="">企业团购&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
                <li><a href="CartServlet?m=cartlist">购物车</a></li>
            </ul>
        </div>
        <div class="nav-bot">
            <div class="nav-bot-in">
                <div id="all-style">
                    <a href="${pageContext.request.contextPath }/ClassifyServlet?m=list">
                        所有商品分类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: 800;font-size: 17px">﹀</span>
                    </a>
                </div>
                <ul class="nav-menu-bot">
                    <li class="erji"><a href="">首页</a></li>
                    <div style="position: absolute"></div>
                    <li class="erji"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=1">跑步</a></li>
                    <div class="submenu" style="left: 295px">
                        <div class="submenu-left"><img src="img/跑步分类.jpg"></div>
                        <div class="submenu-right">
                            <c:forEach items="${paobu}" var="d">
                            	<div class="title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                            </c:forEach>
                        </div>
                    </div>
                    <li class="erji"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=2">篮球</a></li>
                    <div class="submenu" style="left: 371px">
                        <div class="submenu-left"><img src="img/篮球分类.jpg"></div>
                        <div class="submenu-right">
                            <c:forEach items="${lanqiu}" var="d">
                            	<div class="title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                            </c:forEach>
                        </div>
                    </div>
                    <li class="erji"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=3">足球</a></li>
                    <div class="submenu" style="left: 447px">
                        <div class="submenu-left"><img src="img/足球分类.jpg"></div>
                        <div class="submenu-right">
                            <c:forEach items="${zuqiu}" var="d">
                            	<div class="title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                            </c:forEach>
                        </div>
                    </div>
                    <li class="erji"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=4">健身</a></li>
                    <div class="submenu" style="left: 523px">
                        <div class="submenu-left"><img src="img/健身分类.jpg"></div>
                        <div class="submenu-right">
                           <c:forEach items="${jianshen}" var="d">
                            	<div class="title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                            </c:forEach>
                        </div>
                    </div>
                    <li class="erji"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=5">休闲</a></li>
                    <div class="submenu" style="left: 599px">
                        <div class="submenu-left"><img src="img/休闲分类.jpg"></div>
                        <div class="submenu-right">
                            <c:forEach items="${xiuxian}" var="d">
                            	<div class="title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                            </c:forEach>
                        </div>
                    </div>
                    <li class="erji"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=6">配件</a></li>
                    <div class="submenu" style="left: 599px">
                        <div class="submenu-left"><img src="img/配件分类.jpg"></div>
                        <div class="submenu-right">
                            <c:forEach items="${peijian}" var="d">
                            	<div class="title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                            </c:forEach>
                        </div>
                    </div>
                    <li class="erji"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=7">儿童</a></li>
                    <div class="submenu" style="left: 599px">
                        <div class="submenu-left"><img src="img/儿童分类.jpg"></div>
                        <div class="submenu-right">
                            <c:forEach items="${ertong}" var="d">
                            	<div class="title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                            </c:forEach>
                        </div>
                    </div>
                </ul>
                <img src="img/KT4UNI定制.png" style="width: 110px;height: 30px;margin: 3px 0 0 7px">
                <input type="text" placeholder=" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜&nbsp;索&nbsp;商&nbsp;品&nbsp;.&nbsp;.&nbsp;.">
            </div>
        </div>
    </div>


    <div id="tianchong"></div>

    <!-- 所有商品分类的二级菜单 -->
    <div id="all-style-submenu">
        <ul>
            <li class="" style="height: 60px">
                <div class="style-title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=1">跑步</a></div>
                <c:forEach items="${paobu}" var="d">
					<div class="style-normal"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                </c:forEach>
            </li>
            <li style="height: 60px">
                <div class="style-title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=2">篮球</a></div>
                <c:forEach items="${lanqiu}" var="d">
					<div class="style-normal"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                </c:forEach>
            </li>
            <li style="height: 60px">
                <div class="style-title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=3">足球</a></div>
                <c:forEach items="${zuqiu}" var="d">
					<div class="style-normal"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>&nbsp;
                </c:forEach>
            </li>
            <li style="height: 60px">
                <div class="style-title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=4">健身</a></div>
                <c:forEach items="${jianshen}" var="d">
					<div class="style-normal"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                </c:forEach>
            </li>
            <li style="height: 80px">
                <div class="style-title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=5">休闲</a></div>
                <c:forEach items="${xiuxian}" var="d">
					<div class="style-normal"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                </c:forEach>
            </li>
            <li style="height: 60px">
                <div class="style-title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=6">配件</a></div>
                <c:forEach items="${peijian}" var="d">
					<div class="style-normal"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                </c:forEach>
            </li>
            <li style="height: 60px">
                <div class="style-title"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=type&tid=7">儿童</a></div>
                <c:forEach items="${ertong}" var="d">
					<div class="style-normal"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=secondType&stid=${d.stid }">${d.stname}</a></div>
                </c:forEach>
            </li>
        </ul>
    </div>

    <!-- 右侧固定栏 -->
    <div id="right-fix">
        <div id="right-main">
            <div id="shopcart">
                <div id="shopcart-border">
                    <img src="img/右侧购物车1.png"">
                    <div class="text"><a href="CartServlet?m=cartlist">购物车</a></div>
                </div>
            </div>
            <div class="icon"><img src="img/右侧心.png" style="height: 20px;"></div>
            <div class="tankuang" style="top: 375px">我的收藏</div><div class="sanjiao" style="top: 366px">◆</div>
            <div class="icon"><img src="img/phone.png"></div>
            <div class="tankuang" style="top: 423px">400-858-2020</div><div class="sanjiao" style="top: 414px">◆</div>
            <div class="icon"><img src="img/右侧客服.png"></div>
            <div class="tankuang" style="top: 471px">在线客服</div><div class="sanjiao" style="top: 462px">◆</div>
            <div class="icon"><img src="img/右侧二维码.png"></div>
            <div class="erweima"><img src="img/右侧二维码图.jpg"></div><div class="sanjiao1">◆</div>
        </div>
    </div>





    <!-- 轮播图 -->
    <div id="lunbo">
        <div class="img-wrap">
            <ul>
                <li class="item" style="display: block;"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=list"><img src="img/安踏618.jpg" /></a></li>
                <li class="item"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=list"><img src="img/放肆街头.jpg" /></a></li>
                <li class="item"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=list"><img src="img/领航.jpg" /></a></li>
                <li class="item"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=list"><img src="img/KT4.jpg" /></a></li>
            </ul>
        </div>
        <div class="lr-tab">
            <div class="left btn"><img class="jiantou" src="img/left_btn.png"></div>
            <div class="right btn"><img class="jiantou" src="img/right_btn.png"></div>
        </div>
        <div class="tab-btn">
            <ul>
                <li class="bottom-btn active"></li>
                <li class="bottom-btn"></li>
                <li class="bottom-btn"></li>
                <li class="bottom-btn"></li>
            </ul>
        </div>
    </div>

    <!-- 商品展示一区 -->
    <div id="product-one">
        <div id="one-1">
            <img src="img/篮球明星战靴.jpg" id="img">
            <div class="cover" style="width: 580px;height: 400px;top: 40px;"></div>
            <div class="btn-one" style="top: 220px;left: 310px;"><a href="ClassifyServlet?m=type&tid=2">立即选购</a></div>
            <div class="font-top"><a href="ClassifyServlet?m=type&tid=2">篮球明星战靴</a></div>
            <div class="font-bot"><a href="ClassifyServlet?m=type&tid=2">汤普森四代&nbsp;|&nbsp;要疯系列&nbsp;|&nbsp;篮球服装</a></div>
        </div>
        <div id="one-2">
            <img src="img/跑步系列.jpg">
            <div class="cover" style="width: 580px;height: 400px;top: 40px;"></div>
            <div class="btn-one" style="top: 220px;right: 310px;"><a href="ClassifyServlet?m=type&tid=1">立即选购</a></div>
            <div class="font-top"><a href="ClassifyServlet?m=type&tid=1">跑步系列</a></div>
            <div class="font-bot"><a href="ClassifyServlet?m=type&tid=1">闪能科技跑鞋&nbsp;|&nbsp;夏季新款&nbsp;|&nbsp;舒适气垫&nbsp;|&nbsp;跑步服装</a></div>
        </div>
        <div id="one-3">
            <img src="img/时尚潮服系列.jpg">
            <div class="cover" style="width: 385px;height: 311px;bottom: 79px;"></div>
            <div class="btn-one" style="top: 670px;left: 220px;"><a href="ClassifyServlet?m=type&tid=5">立即选购</a></div>
            <div class="font-top"><a href="ClassifyServlet?m=type&tid=5">时尚潮服系列</a></div>
        </div>
        <div id="one-4">
            <img src="img/2019年夏上新.jpg">
            <div class="cover" style="width: 385px;height: 311px;bottom: 79px;"></div>
            <div class="btn-one" style="top: 670px;left: 620px;"><a href="ClassifyServlet?m=type&tid=4">立即选购</a></div>
            <div class="font-top"><a href="ClassifyServlet?m=type&tid=4">2019年夏上新</a></div>
        </div>
        <div id="one-5">
            <img src="img/复古呈新.jpg">
            <div class="cover" style="width: 385px;height: 311px;bottom: 79px;"></div>
            <div class="btn-one" style="top: 670px;right: 220px;"><a href="ClassifyServlet?m=type&tid=2">立即选购</a></div>
            <div class="font-top"><a href="ClassifyServlet?m=type&tid=2">复古呈新&nbsp;&nbsp;&nbsp;安踏休闲系列</a></div>
        </div>
    </div>

    <!-- 商品展示二区 -->
    <div id="product-two">
        <div id="two-title">
            <a href="" id="t1">A-FLASHFOAM闪能科技</a>
            <a href="" id="t2">轻量化EVA高回弹复合材料，安踏自主研发，为跑者提供充足动力</a>
        </div>
        <div id="two-1">
            <img src="img/星环气垫跑鞋.jpg">
            <div class="two-top">星环气垫跑鞋</div>
            <div class="two-bot">新款SEEED全掌气垫星环跑鞋潮运动鞋</div>
            <div class="two-btn"><a href="DetailedServlet?m=product&pid=10">立刻购买</a></div>
        </div>
        <div id="two-2">
            <img src="img/春上新.jpg">
            <div class="two-top">A-SPORTS春上新</div>
            <div class="two-bot">新升级运动面料、轻质有型，让你运动中激发潜能，提升运动表现</div>
            <div class="two-btn"><a href="DetailedServlet?m=product&pid=55">立刻购买</a></div>
        </div>
    </div>

    <!-- 商品展示三区 -->
    <div id="product-three" style="height: 1000px;">
        <div id="three-main" style="height: 900px;">
            <!-- 一排四个 -->
            <c:forEach items="${list }" var="d">
	            <div class="product-box" style="height: 380px;">
	                <div class="product-img" style="height: 280px;margin-top:4px;"><a href="${pageContext.request.contextPath }/DetailedServlet?m=product&pid=${d.pid}"><img src="${d.minphoto }" style="width: 280px;height: 280px;"></a></div>
	                <div class="three-top">${d.pname }</div>
	                <div class="three-bot">￥${d.price }</div>
	            </div>
            </c:forEach>
        </div>
        <div id="more"><a href="${pageContext.request.contextPath }/ClassifyServlet?m=list">选购更多商品&nbsp;&nbsp;&nbsp;>></a></div>
    </div>

    <!-- 底部 -->
    <div id="footer">
        <div id="footer-main">
            <div id="footer-left">
                <ul class="f-ul">
                    <li id="first-li">用户指南</li>
                    <li><a href="">新用户注册</a></li>
                    <li><a href="">购物流程</a></li>
                    <li><a href="">尺码对照表</a></li>
                    <li><a href="">支付方式</a></li>
                    <li><a href="">包装形式</a></li>
                    <li><a href="">配送方式</a></li>
                    <li><a href="">配送费用</a></li>
                </ul>
                <ul class="f-ul">
                    <li id="first-li">会员政策</li>
                    <li><a href="">积分政策</a></li>
                    <li><a href="">会员政策</a></li>
                    <li><a href="">用户协议</a></li>
                    <li><a href="">发票制度</a></li>
                </ul>
                <ul class="f-ul">
                    <li id="first-li">售后服务</li>
                    <li><a href="">订单查询</a></li>
                    <li><a href="">快递查询</a></li>
                    <li><a href="">退换货政策</a></li>
                    <li><a href="">退换货流程</a></li>
                    <li><a href="">退款方式</a></li>
                </ul>
                <ul class="last-ul">
                    <li id="first-li">联系我们</li>
                    <li><a href="">企业团购</a></li>
                    <li><a href="">商务合作</a></li>
                </ul>
            </div>
            <div id="footer-right">
                <div id="ask">在线咨询</div>
                <div id="tel">400-858-2020</div>
                <div id="service"><a href="">在线客服</a></div>
                <div id="wechat">微信咨询</div>
                <div id="wechat-img">
                    <img src="img/底部微信二维码.png">
                </div>
            </div>
        </div>
        <div id="footer-bot">
            <div class="copyright">COPYRIGHT 2012-2019</div>
            <div class="company-name">厦门安踏电子商务有限公司</div>
            <img src="img/police.jpg" id="police">
            <div class="company-icp">闽ICP备11020421号</div>
            <div id="bot-ul">
                <ul>
                    <li><a>营业执照</a></li>
                    <li><a>开户许可证</a></li>
                    <li><a>网站地图</a></li>
                    <li><a>标签</a></li>
                    <li><a>友情链接</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>

</html>