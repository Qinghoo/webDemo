<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
</head>
<body>
	<form style="text-align: center;" action="${pageContext.request.contextPath }/UserServlet?m=add"
		method="POST" role="form">

		<div class="form-group" style="text-align: center;">
			<label for="">用户名</label> <input style="width: 20%; margin-left: auto; margin-right: auto;"
				type="text" class="form-control" id="username" name="username" placeholder="用户名"> <label
				for="">密码</label> <input style="width: 20%; margin-left: auto; margin-right: auto;"
				type="password" class="form-control" id="password" name="password" placeholder="密码"> <label
				for="">真实姓名</label> <input style="width: 20%; margin-left: auto; margin-right: auto;"
				type="text" class="form-control" id="name" name="name" placeholder="真实姓名"> <label for="">邮箱</label>
			<input style="width: 20%; margin-left: auto; margin-right: auto;" type="text"
				class="form-control" id="email" name="email" placeholder="邮箱"> <label for="">手机号</label>
			<input style="width: 20%; margin-left: auto; margin-right: auto;" type="text"
				class="form-control" id="phone" name="phone" placeholder="手机号"> <label for="">地址</label>
			<input style="width: 20%; margin-left: auto; margin-right: auto;" type="text"
				class="form-control" id="addr" name="addr" placeholder="地址"> 
			<!-- <select name="cid">
				<option value="1">激活</option>
				<option value="0">未激活</option>
			</select> -->
		</div>



		<button type="submit" class="btn btn-primary">提交</button>
	</form>

</body>
</html>