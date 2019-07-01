<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
            <tr>
                <th>商品编号</th>
                <th>商品名称</th>
                <th>商品图片</th>
                <th>商品价格</th>
                <th>商品数量</th>
                <th>商品小计</th>
            </tr>
            <c:forEach items="${list }" var="d">
                <tr>
                    <td>d.id</td>
                    <td>d.name</td>
                    <td>d.photo</td>
                    <td>d.price</td>
                    <td>d.count</td>
                    <td>d.xiaoji</td>
                </tr>
            </c:forEach>
</body>
</html>