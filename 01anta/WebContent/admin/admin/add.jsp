<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			if (form[i].value == "" || form[i].value == "-请选择-") {
				alert("请将管理员信息填写完整再提交！");
				event.preventDefault();
				return;
			}
		}
	};
}
</script>
</head>
<body>
<form id="form1" style="text-align: center;" action="${pageContext.request.contextPath }/AdminServlet?m=add" method="POST" role="form"> 
   
        <div class="form-group" style="text-align: center;">
            <label for="">管理员用户名</label>
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="text" class="form-control" id="name" name="name" placeholder="填入管理员用户名">
            <label for="">管理员密码</label>
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="password" class="form-control" id="password" name="password" placeholder="填入管理员密码">
            <br/>
            <label for="">管理员身份</label>
            <select name="power">
				<option>-请选择-</option>
				<option value="1">老板</option>
				<option value="2">管理</option>
				<option value="3">维护</option>
			</select>
        </div>



        <button type="submit" class="btn btn-primary">提交</button>
    </form>

</body>
</html>