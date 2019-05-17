<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.get(
		"CompanyServlet",
		{m:"list"},
		function(data) {
			for (var i = 0; i < data.length; i++) {
				var d= data[i];
				$("#tb").append(" <tr><td>"+d.id+"</td><td>"+d.name+"</td><td>"+d.sname+"</td> <td><img src="+d.filepath+"></img></td><td><a href=update.jsp?id="+d.id+">修改</a>&nbsp&nbsp<a href='' onclick='del("+d.id+")'>删除</a></td></tr>")
			}
			
		},
		"json"
		)
	});


function del(id) {
	var r=confirm("确定要删除本行数据吗？");
	if (r==true)
	  {
		
	  location.href="CompanyServlet?m=del&id="+id;
	  
	  alert("已经删除！");
	  }
	else
	  {
	  alert("取消删除!");
	  }
}
</script>
</head>
<body>

	<table border="1" align="center" cellspacing="0" id="tb">
	  <tr>
	    <th>序号</th>
	    <th>公司名称</th>
	    <th>法人姓名</th>
	    <th>照片</th>
	    <th>操作</th>
	  </tr>
	   
		<%--   <td><a href=${pageContext.request.contextPath }/Servlet0?m=findStudentById&id=${t.id}>修改</a>
		  &nbsp&nbsp&nbsp
		  <a href="#" onclick="del(${t.id})">删除</a>
		  </td>
		  </tr>
  		
		  <tr>
		  <td colspan="9" align="center">
		  <a href=add.jsp >添加</a>
		  </td>
		  </tr> --%>

</table>
</body>
</html>