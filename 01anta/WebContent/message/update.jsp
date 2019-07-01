<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<style type="text/css">
	form{
		width: 300px;
		margin: 100px auto;
	}
	.form-group{
		width: 200px;
		margin: 10px auto; 
	}
	#add{
		width: 200px;
		height: 30px;
		line-height: 30px;
		position:relative;
		left: 100px;
		font-size: 18px;
   		color: #888888;
    	font-family: "Microsoft YaHei";
	}
</style>
</head>
<body>
<form action="${pageContext.request.contextPath }/MessageServlet?m=update" method="post">
	<div id="add">修改收货地址</div>
	<input type="hidden" name="mid" value="${message.mid}">
	<div class="form-group">
		收货人：<input type="text" name="mname" class="form-control" value="${message.mname}">
	</div>
	<div class="form-group">
		联系电话：<input type="text" name="mtel" class="form-control" value="${message.mtel}">
	</div>
	<div class="form-group">
		收货地址：<input type="text" name="maddress" class="form-control" value="${message.maddress}">
	</div>
	<button class="btn btn-danger btn-lg" type="submit" style="position:relative;left: 110px;width: 80px">提交</button>
</form>
</body>
</html>