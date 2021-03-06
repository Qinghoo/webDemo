<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/detailed.js"></script>
    <link rel="stylesheet" href="css/detailed.css">
</head>

<body>
    <!-- 顶端导航界面 -->
    <div class="nav">
        <div class="nav-top">
            <div class="log"><a href="${pageContext.request.contextPath }/HomePageServlet?m=homePageList"><img src="img/首页log.png" alt="安踏商城，永不止步"></a></div>
            <div class="log-box">
                <c:if test="${user==null }">
                	<a href="${pageContext.request.contextPath }/use/login.jsp">登录</a>
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
                        所有商品分类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                            style="font-weight: 800;font-size: 17px">﹀</span>
                    </a>
                </div>
                <ul class="nav-menu-bot">
                    <li class="erji"><a href="HomePageServlet?m=homePageList">首页</a></li>
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
                        <div class=" text"><a href="CartServlet?m=cartlist">购物车</a></div>
            </div>
        </div>
        <div class="icon"><img src="img/右侧心.png" style="height: 20px;"></div>
        <div class="tankuang" style="top: 375px">我的收藏</div>
        <div class="sanjiao" style="top: 366px">◆</div>
        <div class="icon"><img src="img/phone.png"></div>
        <div class="tankuang" style="top: 423px">400-858-2020</div>
        <div class="sanjiao" style="top: 414px">◆</div>
        <div class="icon"><img src="img/右侧客服.png"></div>
        <div class="tankuang" style="top: 471px">在线客服</div>
        <div class="sanjiao" style="top: 462px">◆</div>
        <div class="icon"><img src="img/右侧二维码.png"></div>
        <div class="erweima"><img src="img/右侧二维码图.jpg"></div><div class="sanjiao1">◆</div>
    </div>
    </div>


    <!-- 定位栏 -->
    <div id="dingwei"><a href="">首页</a><span>＞</span><a href="">所有分类</a></div>

    <!-- 主体-上部 -->
    <form action="CartServlet?m=addcart" method="post" id="form1">
    <input type="hidden" name="pid" value="${product.pid }">
	    <div id="main-top">
	        <div id="mt-left">
	            <span class="jiantou">︿</span>
	            <img class="mt-left-img" src="${s[0] }">
	            <img class="mt-left-img" src="${s[1] }">
	            <img class="mt-left-img" src="${s[2] }">
	            <img class="mt-left-img" src="${s[3] }">
	            <span class="jiantou">﹀</span>
	        </div>
	        <div id="mt-middle">
	            <img class="mt-mid-img" src="${s[0] }" >
	        </div>
	        <div id="mt-right">
	            <div id="pname">${product.pname }</div>
	            <div id="fivestar"><img src="img/五星好评.png" ><span>款号：92925562</span></div>
	            <div><img src="img/好货热卖.png" style="width: 100%"></div>
	            <div id="price"><span style="font-size: 18px">￥</span><span>${product.price }</span></div>
	            <div id="p1">价格说明（此说明仅当出现价格比较时有效）</div>
	            <div id="p2">划线价格：划线的价格可能是商品的专柜吊牌价或正品零售价指导价或该商品的曾经展示过的销售价等，仅供您参考。</div>
	            <div id="p2">未划线价格：未划线的价格是商品在官网上的销售标价，具体的成交价格可能因为会员使用优惠券发生变化，最终以订单结算页价格为准。</div>
	            <div id="pay">
	                <span>数量:</span>
	                <select name="count" id="count">
	                    <option value="1">1</option>
	                    <option value="2">2</option>
	                    <option value="3">3</option>
	                    <option value="4">4</option>
	                    <option value="5">5</option>
	                </select>
	                <div id="cart" onclick="tijiao()">加入购物车
	                </div>
	                <div id="mai" onclick="tijiao()">立即购买</div>
	            </div>
	            <div id="share"></div>
	        </div>
	    </div>
	</form>

    <!-- 主体-可能喜欢 -->
    <div id="main-like">
        <div id="like-title">您可能还喜欢</div>
        <div id="like-img">
        	<c:forEach items="${mayLikeList}" var="d">
            	<a href="${pageContext.request.contextPath }/DetailedServlet?m=product&pid=${d.pid}"><img src="${d.minphoto }"></a>
			</c:forEach> 

        </div>
    </div>



    <!-- 主体-商品展示 -->
    <div id="main-product">
        <div id="xijie">产品细节</div>
        <div id="xiaosanjiao">◆</div>
        <div id="xijie-img">${product.maxphoto }</div>
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