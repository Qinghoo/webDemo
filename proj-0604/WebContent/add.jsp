<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form align="center" action="${pageContext.request.contextPath }/PersonServlet?m=add" enctype="multipart/form-data" method="post" >
	姓名：<input type="text" name="name" ><br> 
	生日：<input type="text" name="birthday" ><br> 
	年齡：<input type="text" name="age" ><br>
	<input type="checkbox" name="hobbies" value="吃"> 吃
	<input type="checkbox" name="hobbies" value="喝"> 喝
	<input type="checkbox" name="hobbies" value="玩"> 玩
	<input type="checkbox" name="hobbies" value="乐"> 乐
	<br>
	<br>
	<input type="radio" name="sex" value="男" id="sex">男
    <input type="radio" name="sex" value ="女" id="sex">女
    <br>
    <input type="file" name="photo">
    <br>
    <input type="submit" value="提交">
	
	</form>
</body>
</html>