<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form align="center" action="${pageContext.request.contextPath }/PersonServlet?m=update" enctype="multipart/form-data" method="post" >
	<input type="hidden" name="id" value="${person.id }">
	姓名：<input type="text" name="name" value="${person.name }" > 
	年齡：<input type="text" name="age" value="${person.age }">
	生日：<input type="text" name="birthday" value="${person.birthday }">
	吃<input type="checkbox" name="hobbies" ${person.hobbies.contains("吃")?"checked='checked'":""}  value="吃"/>
	喝<input type="checkbox" name="hobbies" ${person.hobbies.contains("喝")?"checked='checked'":""}  value="喝"/>
	玩<input type="checkbox" name="hobbies" ${person.hobbies.contains("玩")?"checked='checked'":""}  value="玩"/>
	乐<input type="checkbox" name="hobbies" ${person.hobbies.contains("乐")?"checked='checked'":""}  value="乐"/>
	<input type="radio" name="sex" ${person.sex.contains("男")?"checked='checked'":""} value="男" id="sex">男
    <input type="radio" name="sex" ${person.sex.contains("女")?"checked='checked'":""} value ="女" id="sex">女<br>
    <br>
    <input type="file" name="photo" value="${person.photopath }">
    <br>
	
	<input type="submit" value="提交">
	
	</form>

</body>
</html>