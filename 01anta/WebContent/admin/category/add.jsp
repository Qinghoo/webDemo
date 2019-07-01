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
			if (form[i].value == "") {
				alert("请将一级分类信息填写完整再提交！");
				event.preventDefault();
				return;
			}
		}
	};
}
</script>
</head>
<body>
 <form id="form1" style="text-align: center;" action="${pageContext.request.contextPath }/CategoryServlet?m=add" method="POST" role="form"> 
   
        <div class="form-group" style="text-align: center;">
            <label for="">一级类别名称</label>
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="text" class="form-control" id="name" name="name" placeholder="填入一级类别名称">
        </div>



        <button type="submit" class="btn btn-primary">提交</button>
    </form>

</body>
</html>