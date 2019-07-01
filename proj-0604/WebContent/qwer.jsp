<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>黑马商城购物车</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="../js/jquery-1.12.4.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<style>
body {
    margin-top: 20px;
    margin: 0 auto;
}

.carousel-inner .item img {
    width: 100%;
    height: 300px;
}

font {
    color: #3164af;
    font-size: 18px;
    font-weight: normal;
    padding: 0 10px;
}
</style>
<script type="text/javascript">
    function delProductFromCart(pid) {
        if(confirm("你是否要删除该项")){
            location.href="${pageContext.request.contextPath}/product?method=delProductFromCart&pid="+pid;
        }
    }
    function clearCart() {
        if(confirm("你是否要清空购物车")){
            location.href="${pageContext.request.contextPath}/product?method=clearCart";
        }
    }
</script>
</head>

<body>
    <!-- 引入header.jsp -->
   <%--  <jsp:include page="/header.jsp"></jsp:include> --%>

    <!-- 判断购物车中是否还有商品，有商品显示商品，没有商品显示小兔子 -->
    <%-- <c:if test="${!empty cart.cartItems }"> --%>
        <div class="container">
            <div class="row">
    
                <div style="margin: 0 auto; margin-top: 10px; width: 950px;">
                    <strong style="font-size: 16px; margin: 5px 0;">订单详情</strong>
                    <table class="table table-bordered">
                        <tbody>
                            <tr class="warning">
                                <th>图片</th>
                                <th>商品</th>
                                <th>价格</th>
                                <th>数量</th>
                                <th>小计</th>
                                <th>操作</th>
                            </tr>
    
                            <%-- <c:forEach items="${cart.cartItems }" var="entry">
                                <tr class="active">
                                    <td width="60" width="40%"><input type="hidden" name="id"
                                        value="22"> <img src="${pageContext.request.contextPath }/${entry.value.product.pimage}" 
                                        width="70"  height="60"></td> 
                                         <!--${cart.cartItems }获得是Map<String,CartItem> 
                                             entry.value获得是CartItem
                                            entry.value.product获得product
                                           -->
                                    <td width="30%"><a target="_blank"> ${entry.value.product.pname}</a></td>
                                    <td width="20%">￥${entry.value.product.shop_price}</td>
                                    <td width="10%">
                                        ${entry.value.buyNum }
                                    </td>
                                    <td width="15%"><span class="subtotal">￥${entry.value.subtotal }</span></td>
                                    <!-- '${entry.value.product.pid}'必须要加单引号 不加单引号认为是一个变量  加了才会认为是一个字符串 -->
                                    <td><a href="javascript:void(0);" class="delete" onclick="delProductFromCart('${entry.value.product.pid}')">删除</a></td>
                                </tr>
                            </c:forEach> --%>
    
    
                        </tbody>
                    </table>
                </div>
            </div>
    
            <div style="margin-right: 130px;">
                <div style="text-align: right;">
                    <em style="color: #ff6600;"> 登录后确认是否享有优惠&nbsp;&nbsp; </em> 赠送积分: <em
                        style="color: #ff6600;">${cart.total }</em>&nbsp; 商品金额: <strong
                        style="color: #ff6600;">￥${cart.total }元</strong>
                </div>
                <div
                    style="text-align: right; margin-top: 10px; margin-bottom: 10px;">
                    <a href="javascript:void(0);" onclick="clearCart()" id="clear" class="clear">清空购物车</a> <a
                        href="order_info.htm"> <input type="submit" width="100"
                        value="提交订单" name="submit" border="0"
                        style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
                    </a>
                </div>
            </div>
    
        </div>
    <%-- </c:if> --%>
    <c:if test="${empty cart.cartItems }">
        <div>
            <img alt="" src="${pageContext.request.contextPath }/images/cart-empty.png">
            <a href="${pageContext.request.contextPath }" style="height: 10px;width: 20px;background-color: red;">返回首页</a>
        </div>
    </c:if>
    
    <%-- <!-- 引入footer.jsp -->
    <jsp:include page="/footer.jsp" ></jsp:include>
 --%>
</body>

</html>