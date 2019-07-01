<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单页</title>
<style>
/*  body {
            width: 80%;
            margin-left: auto;
            margin-right: auto;
        } */
.fenye {
	text-align: center;
	
	text-decoration: none;
	color: #dc3545;
	text-align: center;
	font-family: "宋体";
	font-size: 13px;
}

img {
	width: 60px;
	height: 60px;
}

body {
	width: 80%;
	margin: 0px auto;
}

#login {
	height: 32px;
	width: 960px;
	margin: 0px auto;
	text-align: right;
	padding-top: 8px;
	color: grey;
	font-size: 13px;
}

#imglogn {
	height: 48px;
	width: 260px;
}

#imgchuli {
	height: 20px;
	width: 20px;
	vertical-align: middle;
}

#imgbaoyou {
	height: 25px;
	width: 300px;
	vertical-align: middle;
	text-align: left;
}

#imglogn1 {
	height: 60px;
	width: 337px;
	float: right;
}

#tablehead {
	width: 100%;
}

#tablehead tr td {
	padding: 0px;
	margin: 0px;
}

.img1 {
	height: 25px;
	width: 25px;
	vertical-align: middle;
}

.span1 {
	color: #000;
	vertical-align: middle;
	line-height: 45px;
}

div a:link, div a:visited {
	text-decoration: none;
	color: #dc3545;
	text-align: center;
	font-family: "宋体";
	font-size: 13px;
}

#header {
	height: 60px;
	width: 960px;
	margin: 0px auto;
}

#body {
	width: 960px;
	margin: 0px auto;
}

#footer {
	width: 960px;
	margin: 0px auto;
	margin-top: 120px;
}

p a img {
	width: 127px;
	height: 46px;
	margin-right: 25px;
}

.sum {
	text-align: center;
	font-weight: bold;
	height: 30px;
	font-size: 20px;
	color: #dc3545;
}

#jixu, #qingkong {
	text-align: left;
	color: black;
}

#jixu:hover, #qingkong:hover {
	color: #dc3545;
}

table {
	margin: auto;
	border-collapse: collapse;
	border: 0px;
	width: 90%;
}

td {
	padding: 10px;
	text-align: center;
	height: 50px;
	font-size: 13px;
}

td p {
	margin: 0px;
	color: #000000;
}

.price {
	color: #000;
}
#tables1,#tables1 td,#tables1 th{
border: 0.6px solid #DBDBDB;
}
</style>
</head>

<body>


	<div id="login">
		您好！欢迎来到安踏官方商城！
		<!--  <c:if test="${user==null}">
                    <a href="#">请登录</a>
                    <a href="#">免费注册</a>
                </c:if> -->
		<c:if test="${user!=null}">
			<a href="#">${user.uname}</a> 欢迎您!&nbsp;&nbsp;&nbsp;
                </c:if>

		<a href="OrderServlet?m=list">我的订单</a>
	</div>
	<div id="header">
		<a href="${pageContext.request.contextPath }/HomePageServlet?m=homePageList"><img id="imglogn" src="${pageContext.request.contextPath }/img/logo.png" /></a>
		<img id="imglogn1" src="${pageContext.request.contextPath }/img/333.png" />
	</div>
	<div id="body">
		<table id="tablehead" border="0px" >
			<tr style="margin-top: 15px;">
				<!--  <td> <img id="imgchuli" src="${pageContext.request.contextPath }/img/chuli.jpg" />请在<font color="#ed145b">20分00秒</font>内去结账，并在下单后 20 分钟内完成支付
                        </td> -->
				<td></td>
				<td></td>
				<td><span class="span1"><img class="img1"
						src="${pageContext.request.contextPath }/img/zhengpin.png" /> 全商城正品保证</span></td>
				<td><span class="span1"><img class="img1"
						src="${pageContext.request.contextPath }/img/tuihuo.png" /> 15天无条件退货</span></td>
				<td><span class="span1"><img class="img1"
						src="${pageContext.request.contextPath }/img/baoyou.png" /> 全场满2件或满299包邮</span></td>
			</tr>
			<tr>
				<td style="font-size: 25px;"><img class="img1"
					src="${pageContext.request.contextPath }/img/cart.png" />&nbsp&nbsp&nbsp我的订单</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>


		<c:forEach items="${list}" var="order">

			<table class="table table-striped table-hover" id="tables1" style="width: 960px">
				<thead>
					<tr style="background-color: #DBDBDB">
						<td>订单编号：${order.oid}</td>
						<td>收货地址：${order.oaddress}</td>
						<td>联系方式：${order.otel}</td>
						<td>总计金额：${order.sum}</td>
						<c:if test="${(order.state).equals('待支付')}">
							<td colspan="2"><a href="OrderServlet?m=payMoney&oid=${order.oid}">付款</a></td>
						</c:if>	
						<c:if test="${(order.state).equals('待发货')}">
							<td colspan="2" style="color:blue">待发货</td>
						</c:if>
						<c:if test="${(order.state).equals('待收货')}">
							<td colspan="2"><a href="OrderServlet?m=updateState&oid=${order.oid}">确认收货</a></td>
						</c:if>	
						<c:if test="${(order.state).equals('完成订单')}">
							<td colspan="2" style="color:green">完成订单</td>
						</c:if>					
                   
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>商品编号</th>
						<th>商品名称</th>
						<th>商品图片</th>
						<th>商品价格</th>
						<th>商品数量</th>
						<th>商品小计</th>
					</tr>
					<c:forEach items="${order.orderitems}" var="d">
						<tr>
							<td>${d.pid}</td>
							<td>${d.product.pname}</td>
							<td><img src="${pageContext.request.contextPath }/${d.product.minphoto}"></td>
							<td>${d.product.price}</td>
							<td>${d.num}</td>
							<td>${d.total}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</c:forEach>
		<br>
		<br>
		<div class="fenye">
			<a href=OrderServlet?m=list&curPage=1&name=${name}>首页</a> 
			<a href=OrderServlet?m=list&curPage=${page.prevPage }&name=${name }>上一页</a>
			<a href=OrderServlet?m=list&curPage=${page.nextPage }&name=${name }>下一页</a>
			<a href=OrderServlet?m=list&curPage=${page.pageCount }&name=${name }>尾页</a>
			${page.currentPage}/${page.pageCount}
		</div>
		<div style="height: 100px"></div>
</body>

</html>
</html>