<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
	<style type="text/css">
	img{
		width: 50px;
		height: 50px;		
	}
	</style>
</head>
<script type="text/javascript" src="kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function del(power,id) {
	if (power==1 || power==3) {
		var r=confirm("确定要删除本行数据吗？");
		if (r==true)
		  {
		  location.href="ProductServlet?m=del&id="+id;
		  alert("已经删除！");
		  }
		else
		  {
		  alert("取消删除!");
		  }
	} else {
		alert("抱歉，您的权限不足");
	}
}
 function query() {
		var name=document.getElementById("name").value;
		location.href="ProductServlet?m=list&name="+name;
	}
 function addp(power) {
	 if (power==1 || power==2) {
			location.href="${pageContext.request.contextPath }/ProductServlet?m=toAdd";
		} else {
			alert("抱歉，您的权限不足");
		}
}
 function updatep(power,id) {
		if (power==1 || power==3) {
			location.href="ProductServlet?m=getById&id="+id;
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
		<input type="text" name="name" id="name" value="${name }" placeholder="请输入商品名称">
		<button onclick="query()">查询</button>
	</div>

	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>序号</th>
				<th>商品名称</th>
				<th>商品价格</th>
				<th>商品展示图</th>
				<th>商品库存</th>
				<th>商品分类</th>
				<th>编辑</th>
				<th>删除</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="d">
				<tr>
					<td>${d.pid}</td>
					<td>${d.pname}</td>
					<td>${d.price}</td>
					<td><img src='${d.minphoto}'></td>
					<td>${d.stock}</td>
					<td>${d.name}</td>
					<td><a href="#" onclick="updatep(${admin.power},${d.pid })">修改</a></td>
					<td><a href="#" onclick="del(${admin.power},${d.pid})">删除</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="12" align="center"><a href=ProductServlet?m=list&curPage=1&name=${name}>首页</a>
					<a href=ProductServlet?m=list&curPage=${page.prevPage }&name=${name }>上一页</a> <a
					href=ProductServlet?m=list&curPage=${page.nextPage }&name=${name }>下一页</a> <a
					href=ProductServlet?m=list&curPage=${page.pageCount }&name=${name }>尾页</a></td>
			</tr>
			<tr>
				<td colspan="12" align="center"><a href="#" onclick="addp(${admin.power})">添加</a></td>
			</tr>
		</tbody>
	</table>
</body>
</html>