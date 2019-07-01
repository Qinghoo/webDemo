<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table>
 

<!--  <tbody>-->

	<tr style="background-color:#DBDBDB">
		<td>商品编号</td>
		<td colspan="2">商品名称</td>
		<td>商品图片</td>
		<td>商品价格</td>
		<td>商品数量</td>
		<td>商品小计</td>
	</tr>
	<c:forEach items="${list}" var="d">
		<tr class="title" style="background-color:	#F5F5F5">
			<td>${d.pid}</td>
			<td colspan="2">${d.product.pname}</td>
			<td><img img width="40" height="45" src="${d.product.minphoto}"></td>
			<td>${d.product.price}</td>
			<td>${d.num}</td>
			<td>${d.total}</td>
		</tr>
	</c:forEach>

<!--</tbody> -->
</table>