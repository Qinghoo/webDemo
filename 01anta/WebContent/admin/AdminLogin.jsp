 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#p1{
	position: fixed;
	top: 320px;
	left: 750px;
}
#p2{
	position: fixed;
	top: 350px;
	left: 750px;
}
#p3{
	position: fixed;
	top: 390px;
	left: 850px;
}
</style>
</head>
<base href="${pageContext.request.contextPath}/">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript">
$(function () {
	$("#form1").validate({
		rules:{
			username:{
				required:true,
				remote:"AdminServlet?m=validUsername"
			},
			password:{
				required:true,
				remote:{
					url:"AdminServlet?m=validPassword",
					type:"POST",
					dataType:"json",
					data:{
						username:function(){
							return $("#username").val();
						},
						password:function(){
							return $("#password").val();
						}
					}
				}
			}
		},
		messages:{
			username:{
				remote:"该用户不存在"
			},
			password:{
				remote:"密码错误"
			}
			
		}
	})
})
</script>
<body style="margin: 0px;background: url('img/管理界面图.jpg');">
<div align="center" style="margin-top: 200px;">
<form id="form1" action="AdminServlet?m=login" method="post" align="center">
		<p id="p1">管理员账号：<input type="text" name="username" id="username"></p>
		<p id="p2">管理员密码：<input type="password" name="password" id="password"></p>
		<p id="p3"><input type="submit" value="提交">	</p>
</form>
</div>
</body>
</html>