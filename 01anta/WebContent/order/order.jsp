<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath }/js/jquery-1.8.2.min.js" type="text/javascript"></script>

<!-- 引入自定义css文件 style.css -->
<!-- <link rel="stylesheet" href="css/style.css" type="text/css" /> -->
<style>
td img {
	width: 60px;
	height: 60px;
}

body {
	width: 960px;
	margin: 0px auto;
}

#login {
	height: 32px;
	width: 960px;
	margin: 0px auto;
	text-align: right;
	padding-top: 8px;
	color: gray;
	font-size: 15px;
	font-family: "宋体"
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

#header {
	height: 60px;
	width: 960px;
	margin: 0px auto;
}

#body {
	width: 960px;
	margin: 0px auto;
}

p a img {
	width: 127px;
	height: 46px;
	margin-right: 25px;
}

#jixu, #qingkong {
	text-align: left;
	color: black;
}

#jixu:hover, #qingkong:hover {
	color: #dc3545;
}

table {
	margin: 0px auto;
	border-collapse: collapse;
	border: 0px;
	width: 960px;
}

.jiajian {
	width: 16px;
	height: 16px;
}

td {
	padding: 10px;
	text-align: center;
	height: 50px;
	font-size: 13px;
	vertical-align: middle;
}

.warning {
	text-align: center;
}

#orderId {
	text-align: left;
}

td p {
	margin: 0px;
	color: #000000;
}

td a:link, td a:visited {
	/*td空格里面的a*/
	text-decoration: none;
	color: white;
	text-align: center;
	font-family: "宋体";
}

.price {
	color: #000;
}
#tables1,#tables1 td,#tables1 th{
border: 0.6px solid #DBDBDB;
}
#shouhuo{
	margin-left: 20px;
	width: 100px;
}

</style>

<script type="text/javascript">
function confirmOrder() {
    //提交表单
    $("#orderForm").submit();
}
function shouhuo() {
	location.href="${pageContext.request.contextPath }/MessageServlet?m=list";
}
$(function() {
	$("#shouhuo").hover(function() {
		$(this).css("color","#D6211A");
		$(this).css("cursor","pointer");
	},function() {
		$(this).css("color","");
	});
});
</script>
</head>

<body>
	<div id="login">您好！${user.uname}，安踏官方商城欢迎您！</div>
	<div id="header">
		<a href="${pageContext.request.contextPath }/HomePageServlet?m=homePageList"><img id="imglogn" src="${pageContext.request.contextPath }/img/logo.png" /></a>
		<img id="imglogn1" src="${pageContext.request.contextPath }/img/222.png" />
	</div>
	<div id="body">
		<table id="tablehead" border="0px" >
			<tr style="margin-top: 15px;">
				<!--  <td> <img id="imgchuli" src="${pageContext.request.contextPath }/img/chuli.jpg" />请在<font color="#ed145b">20分00秒</font>内去结账，并在下单后 20 分钟内完成支付
                        </td> -->
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
			</tr>
		</table>

		<div class="container">
			<div class="row">
				<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
					<strong>订单详情</strong>
					<table id="tables1" style="width: 960px">
						<tbody>
							<tr id="orserId">
								<th colspan="5">订单编号:${order.oid }</th>
							</tr>
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
							</tr>

							 <c:forEach items="${order.orderitems }" var="item">

							<tr class="active">
								<td width="60" width="40%"><img src="${pageContext.request.contextPath }/${item.product.minphoto }" width="70"
									height="60">
								<!-- ${pageContext.request.contextPath }/${orderItem.product.pimage} -->
								</td>
								<td width="30%"><a style="color: #000000;" href="">${item.product.pname }</a></td>
								<td width="20%"><p>￥${item.product.price }</p></td>
								<td width="10%"><p>${item.num }</p></td>
								<td width="15%"><p>￥${item.total }</p></td>
							</tr>

							 </c:forEach> 


						</tbody>
					</table>
				</div>

				<div style="margin-top: 20px;position: relative;left: 30px;">
					商品金额: <strong style="color: #ff6600;">￥${order.sum }元</strong>
				</div>

			</div>
			
			<div>
				<hr />
				
				<div id="shouhuo" onclick="shouhuo()">管理收货地址</div>
				
				<hr />
				
				<form id="orderForm" class="form-horizontal" action="OrderServlet?m=payorder" method="post"
					style="margin-top: 5px; margin-left: 0px;">
					<!-- method的名字 通过表单提交 -->
					<input type="hidden" name="method" value="confirmOrder">
					<!-- 传递订单oid -->
					<input type="hidden" name="oid" value="${order.oid }">
					<!-- 订单Id -->

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-1 control-label" style="width: 120px">姓名</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="inputPassword3"
								name="oname" placeholder="请输收货人" value="${mname }">
						</div>
					</div>
					
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-1 control-label">电话</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="confirmpwd"
								name="otel" placeholder="请输入联系方式"
								value="${user.utel }">
						</div>
					</div>
					
					<div class="form-group">
						<label for="username" class="col-sm-1 control-label">地址</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="address"
								name="oaddress" value="${user.uaddress }" placeholder="请输收货地址">
						</div>
					</div>

					<hr />

					<div style="margin-top: 5px; margin-left: 0px;">
						<strong>选择银行：</strong>
						<p>
							<br /> 
							<input type="radio" name="pay" value="工商银行"checked="checked" />工商银行
							 <img src="${pageContext.request.contextPath }/img/yinhanggongshang.png" align="middle" />&nbsp;&nbsp; 
							 <input type="radio" name="pay" value="中国银行" />中国银行 
							 <img src="${pageContext.request.contextPath }/img/yinhangzhongguo.png" align="middle" />&nbsp;&nbsp;
							<input type="radio" name="pay" value="农业银行 " />农业银行 
							 <img src="${pageContext.request.contextPath }/img/yinhangnongye.png" align="middle" /><br> 
							<input type="radio" name="pay" value="交通银行 " />交通银行 
							 <img src="${pageContext.request.contextPath }/img/yinhangjiaotong.png" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pay" value="建设银行" />建设银行
							 <img src="${pageContext.request.contextPath }/img/yinhangjianshe.png" align="middle" /> 
							<input type="radio" name="pay" value="邮政储蓄银行" />邮政储蓄银行 
							 <img src="${pageContext.request.contextPath }/img/yinhangyouzheng.png" align="middle" /> <br /> 
							<input type="radio" name="pay" value="兴业银行" />兴业银行 
							 <img src="${pageContext.request.contextPath }/img/yinhangxingye.png" align="middle" />&nbsp;&nbsp; 
							<input type="radio" name="pay" value="招商银行" />招商银行 
						     <img src="${pageContext.request.contextPath }/img/yinhangzhaoshang.png" align="middle" />

						</p>
						<hr />
						<p style="text-align: right; margin-right: 100px;">
							<a href="javascript:;" onclick="confirmOrder()">

								<button type="button" class="btn btn-danger btn-lg" >&nbsp;去&nbsp;付&nbsp;款&nbsp;</button>

							</a>
						</p>
						<hr />
					</div>
				</form>

			</div>

		</div>
</body>

</html>