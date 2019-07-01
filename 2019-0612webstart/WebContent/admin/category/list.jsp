<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">

</head>
<script>

function del(id) {
	var r=confirm("确定要删除本行数据吗？");
	if (r==true)
	  {
		
	  location.href="CategoryServlet?m=del&id="+id;
	  
	  alert("已经删除！");
	  }
	else
	  {
	  alert("取消删除!");
	  }
}
 function query() {
		var name=document.getElementById("name").value;
		location.href="CategoryServlet?m=list&name="+name;
	}
</script>
<body>
	<div style="text-align: center">
	<br>
	<br>
	</div>
	<div style="text-align: center">
		<input type="text" name="name" id="name" value="${name }">
		<button onclick="query()">查询</button>
	</div>

	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>序号</th>
				<th>一级分类名称</th>
				<th>编辑</th>
				<th>删除</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="d">
				<tr>
					<td>${d.id}</td>
					<td>${d.name}</td>
					<td><a href="CategoryServlet?m=getById&id=${d.id}">修改</a></td>
					<td><a href="#" onclick="del(${d.id})">删除</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="center"><a href=CategoryServlet?m=list&curPage=1&name=${name}>首页</a>
					<a href=CategoryServlet?m=list&curPage=${page.prevPage }&name=${name }>上一页</a> <a
					href=CategoryServlet?m=list&curPage=${page.nextPage }&name=${name }>下一页</a> <a
					href=CategoryServlet?m=list&curPage=${page.pageCount }&name=${name }>尾页</a></td>
			</tr>
			<tr>
				<td colspan="7" align="center"><a href=admin/category/add.jsp>添加</a></td>
			</tr>
		</tbody>
	</table>
</body>
</html>