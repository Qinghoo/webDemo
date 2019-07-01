<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	信息： ${message}
	<br>
	<form action="UseServlet?m=yanzheng" method="POST" >
	 
	 <input type="hidden" name="uname" value="${user.uname }">
	 <input type="hidden" name="utel" value="${user.utel }">
	 <input type="hidden" name="uemail" value="${user.uemail }">
	 <input type="hidden" name="upwd" value="${user.upwd }">
	 <input type="hidden" name="uaddress" value="${user.uaddress }">
	 
	请输入激活码：<input type="text" name="yanzheng">
    <input type="submit" value="提交">
	</form>
</body>
</html>