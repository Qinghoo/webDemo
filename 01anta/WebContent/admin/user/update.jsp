<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<script type="text/javascript">
window.onload = function(){
	var form =document.getElementById("form1");
	form.onsubmit=function(event){
		for(i=0;i<form.length-1;i++){
			if (form[i].value == "") {
				alert("请将用户信息填写完整再提交！");
				event.preventDefault();
				return;
			}
		}
	};
}
</script>
</head>
<body>
 <form id="form1" style="text-align: center;" action="${pageContext.request.contextPath }/AdminUserServlet?m=update" method="POST" role="form"> 
   
        <div class="form-group" style="text-align: center;">
            <input type="hidden" name="id" value="${user.uid }">
			<label for="">密码</label> 
			<input style="width: 20%; margin-left: auto; margin-right: auto;"
				type="password" class="form-control" id="password" value="${user.upwd }" name="password" placeholder="密码"> 
			<label for="">真实姓名</label> 
			<input style="width: 20%; margin-left: auto; margin-right: auto;"
				type="text" class="form-control" id="name" value="${user.uname }" name="name" placeholder="真实姓名"> <label for="">邮箱</label>
			<input style="width: 20%; margin-left: auto; margin-right: auto;" type="text"
				class="form-control" id="email" value="${user.uemail }" name="email" placeholder="邮箱"> <label for="">手机号</label>
			<input style="width: 20%; margin-left: auto; margin-right: auto;" type="text"
				class="form-control" id="phone" value="${user.utel }" name="phone" placeholder="手机号"> <label for="">地址</label>
			<input style="width: 20%; margin-left: auto; margin-right: auto;" type="text"
				class="form-control" id="addr" value="${user.uaddress}" name="addr" placeholder="地址"> 
				<br>
        </div>



        <button type="submit" class="btn btn-primary">提交</button>
    </form>

</body>
</html>