 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript">
$(function () {
	$("#form1").validate({
		rules:{
			username:{
				required:true,
				remote:"${pageContext.request.contextPath}/AdminServlet?m=validUsername"
			},
			password:{
				required:true,
				remote:{
					url:"${pageContext.request.contextPath}/AdminServlet?m=validPassword",
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
<body style="background: #d80;margin: 0px">
<div align="center" style="margin-top: 200px;">
管理员登录
<br>
<br>
<form id="form1" action="${pageContext.request.contextPath}/AdminServlet?m=login" method="post" align="center">
管理员用户名：<input type="text" name="username" id="username"><br>
管理员密码：<input type="text" name="password" id="password">
<br>
<input type="submit" value="提交">
</form>
</div>
</body>
</html>