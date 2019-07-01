<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="${pageContext.request.contextPath }/js/jquery-1.8.2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<title>订单管理</title>
<style type="text/css">
th, td {
	text-align: center;
}

</style>
</head>
<script>
	/* AJAX异步提交数据 */

	function show(oid) {
		var but = document.getElementById("but" + oid);
		if (but.value == "订单详情") {
			$.get("AdminOrderServlet", {
				m : "find",
				oid : oid,
				time : new Date().getTime()
			}, function(d) {
				/* alert(d); */
				$("#div" + oid).html(d);
				but.value = "关     闭";
			}, "html"

			);
		} else {
			$("#div" + oid).html("");
			but.value = "订单详情";

		}
	}
	
	 function query() {
			var oid=document.getElementById("oid").value;
			location.href="AdminOrderServlet?curPage=1&m=alllist&oid="+oid;
		}
function fahuo(power,oid) {
	if (power==1 || power==2) {
		location.href="AdminOrderServlet?m=send&oid="+oid;
	} else {
		alert("抱歉，您的权限不足");
	}
}
</script>

<body>

	<div style="text-align: center">
		<br>
	</div>
	<div style="text-align: center">
		<input type="text" name="oid" id="oid" value="${oid }"
			placeholder="请输入订单编号">
		<button onclick="query()">查询</button>
	</div>
		 <br>


		<table class="table table-hover">
			<thead>
				<tr>
					<td>订单编号</td>
					<td>收货人</td>
					<td>收货地址</td>
					<td>联系方式</td>
					<td>总计金额</td>
					<td>状态</td>
					<td>操作</td>
				</tr>

			</thead>
	<c:forEach items="${list }" var="order">
	<tr></tr>
				<tr class="title">
					<td>${order.oid}</td>
					<td>${order.oname}</td>
					<td>${order.oaddress}</td>
					<td>${order.otel}</td>
					<td>${order.sum}</td>
					<td><c:if test="${(order.state).equals('待支付')}">
							未付款
						</c:if> <c:if test="${(order.state).equals('待发货')}">
							<a href="#" onclick="fahuo(${admin.power},'${order.oid }')">发货</a>
						</c:if> <c:if test="${(order.state).equals('待收货')}">
							待收货
						</c:if> <c:if test="${(order.state).equals('完成订单')}">
							完成订单
						</c:if></td>
					<td><input type="button" value="订单详情" id="but${order.oid}"
						onclick="show('${order.oid}')"></td>
				</tr>

			<tbody id="div${order.oid}"></tbody>
			</c:forEach>
		</table>
		<div style="text-align: center" class="fenye"><!--  style="float:right;clear:both"  --> 
			<a href=AdminOrderServlet?m=alllist&curPage=1&oid=${oid}>首页</a> <a
				href=AdminOrderServlet?m=alllist&curPage=${page.prevPage
				}&oid=${oid }>上一页</a> <a
				href=AdminOrderServlet?m=alllist&curPage=${page.nextPage
				}&oid=${oid }>下一页</a> <a
				href=AdminOrderServlet?m=alllist&curPage=${page.pageCount
				}&oid=${oid }>尾页</a>
		</div>
</body>

</html>