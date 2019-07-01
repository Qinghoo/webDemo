<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/addresslist.css">
<script src="js/jquery-1.8.2.min.js"></script>
</head>

<script type="text/javascript">
$(function() {
	$(".box").hover(function () {
        $(this).find("a").show();
        $(this).find("img").show();
    }, function () {
    	$(this).find("a").hide();
    	$(this).find("img").hide();
    });
	
	$("#add").hover(function () {
        $(this).css("color","#D6211A");
    }, function () {
        $(this).css("color","");
    });
	
	//阻止冒泡
	$(".img").click(function (event) {
		event.stopPropagation();
    });
	$(".xiugai").click(function (event) {
		event.stopPropagation();
    });
});

function xuanze(mname,maddress,mtel){
	location.href="MessageServlet?m=xuan&mname="+mname+"&mtel="+mtel+"&maddress="+maddress;
}
function update(id){
	location.href="MessageServlet?m=getBid&mid="+id;
	
}
function del(id){
	if(confirm("你确认删除该数据吗？")){
		location.href="MessageServlet?m=del&mid="+id;
	}
}
</script>


<body>
	<div id="main">
		<c:forEach items="${list}" var="list">
			<div class="box" onclick="xuanze('${list.mname}','${list.maddress }','${list.mtel }')">
				<img class="img" src="${pageContext.request.contextPath }/img/delete1.png" onclick="del(${list.mid})" />
				<div class="address">&nbsp;&nbsp;&nbsp;&nbsp;${list.maddress }</div>
				<div class="tel"><span>${list.mtel }</span></div>
				<div class="name"><span>(&nbsp;<label>${list.mname }</label>&nbsp;&nbsp;&nbsp;收&nbsp;)</span>&nbsp;&nbsp;&nbsp;<a class="xiugai" onclick="update(${list.mid})">修改</a> </div>
			</div>
		</c:forEach>
		<a id="add" href="message/add.jsp">添加收货地址</a>
	</div>
	
	
	
	<
</body>
</html>