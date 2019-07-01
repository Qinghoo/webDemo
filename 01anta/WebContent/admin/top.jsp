<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
margin: 0;
padding: 0;
}
#userview{
	float:right;
	color:#fff;
	position:fixed;
	right: 5px;
	top: 55px;
	z-index: 20;
}
</style>
</head>
<body >
<!-- style="background: url('../image/biaoti.png');background-size: 1366px" -->
<img  src="../image/biaoti.png" style="width: 100%;position: relative;bottom: 20px"> 
<p id="userview">管理员:&nbsp;&nbsp;${admin.aname},&nbsp;欢迎您！</p>
</body>
</html>