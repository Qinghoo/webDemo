<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
</head>
<body>
 <form style="text-align: center;" action="${pageContext.request.contextPath }/AdminServlet?m=update" method="POST" role="form"> 
   
        <div class="form-group" style="text-align: center;">
            <input type="hidden" name="id" value="${admin.id }">
            <label for="">管理员用户名</label>
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="text" class="form-control" id="name" name="name" value="${admin.username }" placeholder="填入管理员用户名">
            <label for="">管理员密码</label>
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="password" class="form-control" id="password" name="password" value="${admin.password }" placeholder="填入管理员密码">
        </div>



        <button type="submit" class="btn btn-primary">提交</button>
    </form>

</body>
</html>