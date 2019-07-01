<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>

<frameset  rows="123,*,115" frameborder="0" border="0" framespacing="0">

	<frame style="width: 100%" src="../image/biaoti.png" name="topFrame" scrolling="NO" noresize no-repeat> 
	<frameset cols="200px,*" frameborder="0" border="1" framespacing="0">
		<frame src="${pageContext.request.contextPath}/admin/left_tree.jsp" name="leftFrame"  bordercolor="#000" noresize scrolling="YES" >
		<frame src="${pageContext.request.contextPath}/admin/main.jsp" name="mainFrame" style="background: gary;" noresize scrolling="YES">
	</frameset>
	<frame src="../image/bottom.png" name="bottomFrame" scrolling="NO" noresize>
</frameset>
</html>