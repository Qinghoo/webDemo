<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
</head>
<body>
	<form style="text-align: center;"
		action="${pageContext.request.contextPath }/SecondCategoryServlet?m=update" method="POST"
		role="form">

		<div class="form-group" style="text-align: center;">
			<input type="hidden" name="id" value="${secondcategory.id }"> <label for="">二级类别名称</label> 
			<input style="width: 20%; margin-left: auto; margin-right: auto;" type="text" class="form-control"
				id="name" name="name" value="${secondcategory.name }" placeholder="填入二级类别名称">
		</div>
		请选择一级分类： 
		<select name="cid">
			
			<%-- <c:forEach items="${list}" var="c">
			<p>${c.name}</p>
			<option value="${c.id}">${c.name}</option>
			</c:forEach> --%>
			<c:forEach items="${list}" var="category">
				<option value="${category.id}" <c:if test="${category.id==secondcategory.cid}">selected="selected"</c:if>> ${category.name}</option>
			</c:forEach>
		</select> <br>



		<button type="submit" class="btn btn-primary">提交</button>
	</form>

</body>
</html>