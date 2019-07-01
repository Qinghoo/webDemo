<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安踏购物车</title>
</head>
<style>
img {
	width: 60px;
	height: 60px;
}

body {
	width: 80%;
	margin: 0px auto;
}

#login {
	height: 32px;
	width: 960px;
	margin: 0px auto;
	text-align: right;
	padding-top: 8px;
	color: grey;
	font-size: 13px;
}

#imglogn {
	height: 48px;
	width: 260px;
}

#imgchuli {
	height: 20px;
	width: 20px;
	vertical-align: middle;
}

#imgbaoyou {
	height: 25px;
	width: 300px;
	vertical-align: middle;
	text-align: left;
}

#imglogn1 {
	height: 60px;
	width: 337px;
	float: right;
}

#tablehead tr td {
	padding: 0px;
	margin: 0px;
}

.img1 {
	height: 25px;
	width: 25px;
	vertical-align: middle;
}

.span1 {
	color: #000;
	vertical-align: middle;
	line-height: 45px;
}

div a:link, div a:visited {
	text-decoration: none;
	color: #dc3545;
	text-align: center;
	font-family: "宋体";
	font-size: 13px;
}

#header {
	height: 60px;
	width: 960px;
	margin: 0px auto;
}

#body {
	width: 960px;
	margin: 0px auto;
}

#footer {
	width: 960px;
	margin: 0px auto;
	margin-top: 120px;
}

p a img {
	width: 127px;
	height: 46px;
	margin-right: 25px;
}

.sum {
	text-align: center;
	font-weight: bold;
	height: 30px;
	font-size: 20px;
	color: #dc3545;
}

#jixu, #qingkong {
	text-align: left;
	color: black;
}

#jixu:hover, #qingkong:hover {
	color: #dc3545;
}

table {
	margin: 0px auto;
	border-collapse: collapse;
	border: 0px;
	width: 80%;
}

.jiajian {
	width: 16px;
	height: 16px;
}

td {
	padding: 10px;
	text-align: center;
	height: 50px;
	font-size: 13px;
}

td p {
	margin: 0px;
	color: #000000;
}

#td1 {
	text-align: right;
}

#jiesuan {
	background: #dc3545;
	height: 48px;
	width: 145px;
	font-size: 20px;
	padding: 15px;
}

td a:link, td a:visited {
	/*td空格里面的a*/
	text-decoration: none;
	color: white;
	text-align: center;
	font-family: "宋体";
}

.price {
	color: #000;
}
#table1,#table1 td {
	
	border: 0.6px solid #DBDBDB;
}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
        $(function () {

        });

        /* function quanxuan(obj) {/*全选CheckBox方法
            var chek1 = document.getElementsByName("chek1");
            if (obj.checked) {

                for (var i = 0; i < chek1.length; i++) {
                    chek1[i].checked = "checked"
                        .checked = "checked"
                }
            } else {
                for (var i = 0; i < chek1.length; i++) {
                    chek1[i].checked = ""
                }
            }
            sum();
            			
        } */

       /*  function sum() {/*金额求和方法
            var price = document.getElementsByName("price");
            var count = document.getElementsByName("count");
            var tom = document.getElementById("inputsum");
            /*  var chek1 = document.getElementsByName("chek1"); 
            var countsum = document.getElementById("countsum");
            var countsum2 = 0;
            var sum = 0;
            for (var i = 0; i < price.length; i++) {
                /* if (chek1[i].checked) { 
                sum = sum + price[i].innerHTML * count[i].value;
                countsum2 = countsum2 + parseInt(count[i].value);

                /* } 
            }
            tom.value = sum.toFixed(2);
            countsum.value = countsum2;


        } */

        /* function change(numId, flag) {/*改变商品数量
            var tom = document.getElementById(numId);

            if (flag == 'add') {
                tom.value++;
                location.href = "${pageContext.request.contextPath}/product?m=changeProductFromCart&pid=" + tom.value;//找到session中的cart 去除id为pid的商品

            }
            if (flag == 'min') {
                if (tom.value > 1) {
                    tom.value = tom.value - 1;
                    location.href = "${pageContext.request.contextPath}/product?m=changeProductFromCart&pid=" + tom.value;//找到session中的cart 去除id为pid的商品
                }
            }
            sum();
        } */

        function delete1(pid) {/*删除单行商品*/
            if (confirm("你是否要删除该项")) {
                location.href = "${pageContext.request.contextPath}/CartServlet?m=delcart&pid=" + pid;//找到session中的cart 去除id为pid的商品
            }
        }


        function deleteSelectRow() {/*清空所有的商品*/
            if (confirm("你是否要清空购物车")) {
                location.href = "${pageContext.request.contextPath}/CartServlet?m=clear";//此链接传过去直接清除session中的cart
            }
        }

    </script>
</head>

<body>
	<div id="login">
		您好！欢迎来到安踏官方商城！
		  <c:if test="${user==null}">
            <a href="${pageContext.request.contextPath }/use/login.jsp">请登录</a>
            <a href="${pageContext.request.contextPath }/use/regist.jsp">免费注册</a>
        </c:if> 
		<c:if test="${user!=null}">
			<a href="${pageContext.request.contextPath }/index.jsp">${user.uname}</a> 欢迎您!&nbsp;&nbsp;&nbsp;
        </c:if>

		<a href="order/OrderServlet?m=list">我的订单</a>
	</div>
	<div id="header">
		<a href="${pageContext.request.contextPath}/HomePageServlet?m=homePageList"><img id="imglogn" src="${pageContext.request.contextPath }/img/logo.png" /></a>
		<img id="imglogn1" src="${pageContext.request.contextPath }/img/111.png" />
	</div>
	<div id="body">
		<table id="tablehead" border="0px">
			<tr style="margin-top: 15px;">
				<!--  <td> <img id="imgchuli" src="${pageContext.request.contextPath }/img/chuli.jpg" />请在<font color="#ed145b">20分00秒</font>内去结账，并在下单后 20 分钟内完成支付
                </td> -->
				<td></td>
				<td><span class="span1"><img class="img1"
						src="${pageContext.request.contextPath }/img/zhengpin.png" /> 全商城正品保证</span></td>
				<td><span class="span1"><img class="img1"
						src="${pageContext.request.contextPath }/img/tuihuo.png" /> 15天无条件退货</span></td>
				<td><span class="span1"><img class="img1"
						src="${pageContext.request.contextPath }/img/baoyou.png" /> 全场满2件或满299包邮</span></td>
			</tr>
			<tr>
				<td style="font-size: 25px;"><img class="img1"
					src="${pageContext.request.contextPath }/img/cart.png" />&nbsp&nbsp&nbsp我的购物车</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>

		<c:if test="${map==null}">
			购物车没得东西，快去<a href="HomePageServlet?m=homePageList">购物</a>吧！
        </c:if>
		<c:if test="${map!=null}">
        

		<table id="table1" style="width: 960px">
			<tr>
				<th><img class="img1" src="${pageContext.request.contextPath }/img/cart1.png" /> 商品编号</th>
				<th>商品图片</th>
				<th>商品信息
				</td>
				<th width="25%">数量</th>
				<th width="15%">价格(元)</th>
				<th width="5%">操作</th>
			</tr>
			<!--  这里开始循环 -->
			<c:forEach items="${map}" var="map">
				<tr id="tr1">
					<td>${map.key}</td>
					<td><img name="shangpintupian" src="${map.value.product.minphoto}" />
					<!-- 这是商品的图片路径 --></td>
					<td><a style="color: #000000;" href="ProServlet?m= &pid=${map.key}"
						name="tdname">${map.value.product.pname}</a></td>
					<td><button onclick="location.href='CartServlet?m=jian&pid=${map.key}'">-</button>
					<input name="count" type="text" id="input1" value="${map.value.count}"
						size="2" readonly="readonly" />
						<button onclick="location.href='CartServlet?m=jia&pid=${map.key}'">+</button></td>
					<td>
						<p class="price" name="price">${map.value.product.price}</p>
					</td>

					<td><img class="jiajian" src="${pageContext.request.contextPath }/img/delete.png"
						onclick="delete1(${map.key})" /></td>
				</tr>
			</c:forEach>
			<tr>
				<td style="font-size: 15px;" width="130px"><a id="jixu"
					href="${pageContext.request.contextPath }/HomePageServlet?m=homePageList">继续购物 </a> &nbsp;||&nbsp; <a id="qingkong"
					href="javascript:deleteSelectRow();"> 清空 </a></td>

				<td colspan="2" style="font-size: 15px;" id="td1" colspan="1">
				</td>

				<td style="font-size: 15px;" width="240px">￥ <input
					class="sum" type="text" id="inputsum" value="${cart.total}" border="0px"
					size="4px" readonly="readonly" /> 元
				</td>

				<td id="td2" colspan="2"><a id="jiesuan"
					href="order/OrderServlet?m=add">提交订单</a></td>

			</tr>
		</table>
		</c:if>
	</div>

</body>

</html>