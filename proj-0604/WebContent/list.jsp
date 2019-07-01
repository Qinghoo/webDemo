<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	/* $(function() {
		$.get(
		"PersonServlet",
		{m:"list"},
		function(data) {
			for (var i = 0; i < data.length; i++) {
				var d= data[i];
				$("#tb").append(" <tr><td>"+d.id+"</td><td>"+d.name+"</td><td>"+d.age+"</td> <td>"+d.birthday+"</td> <td>"+d.hobbies+"</td> <td>"+d.sex+"</td><td><img src="+d.photopath+"></img></td><td><a href=update.jsp?id="+d.id+">修改</a>&nbsp&nbsp<a href='' onclick='del("+d.id+")'>删除</a></td></tr>")
			}
			
		},
		"json"
		)
	});
 */

function del(id) {
	var r=confirm("确定要删除本行数据吗？");
	if (r==true)
	  {
		
	  location.href="PersonServlet?m=del&id="+id;
	  
	  alert("已经删除！");
	  }
	else
	  {
	  alert("取消删除!");
	  }
}
 function query() {
		var name=document.getElementById("name").value;
		location.href="PersonServlet?m=list&name="+name;
	}
</script>
</head>
<body>
	<input type="text" name="name" id="name" value="${name }">
	<button onclick="query()">查询</button>


	<table border="1" align="center" cellspacing="0" id="tb">
		<tr>
			<th>Id</th>
			<th>姓名</th>
			<th>年龄</th>
			<th>生日</th>
			<th>爱好</th>
			<th>性别</th>
			<th>照片</th>
			<th>操作</th>
		</tr>
			<c:forEach items="${list }" var="d">
		<tr>
				<td>${d.id}</td>
				<td>${d.name}</td>
				<td>${d.age}</td>
				<td>${d.birthday}</td>
				<td>${d.hobbies}</td>
				<td>${d.sex}</td>
				<td><img style="height: 80px;width: 100px" src="${d.photopath}"></img></td>
				<td><a href=PersonServlet?m=findPersonById&id=${d.id}>修改</a>
					&nbsp&nbsp&nbsp <a href="#" onclick="del(${d.id})">删除</a>&nbsp&nbsp&nbsp
					<a href="DownServlet?photopath=${d.photopath}" >下载</a>
					</td>
		</tr>
			</c:forEach>

		<tr>
			<td colspan="8" align="center"><a href=add.jsp>添加</a></td>
		</tr>
		<tr>
			<td colspan="8" align="center">
			<a href=PersonServlet?m=list&curPage=1&name=${name}>首页</a> 
			<a href=PersonServlet?m=list&curPage=${page.prevPage }&name=${name }>上一页</a> 
			<a href=PersonServlet?m=list&curPage=${page.nextPage }&name=${name }>下一页</a> 
			<a href=PersonServlet?m=list&curPage=${page.pageCount }&name=${name }>尾页</a></td>
		</tr>

	</table>
</body>
</html>