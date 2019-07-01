<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>订单管理</title>
</head>
<script src="js/jquery-1.8.2.min.js"></script>
<script>
    /* AJAX异步提交数据 */

    function show(oid) {
        var btn = document.getElementById("btn");

        if (btn.value == "订单详情") {
            $.get(
                "AdminServlet",
                { m: "lll", id: oid },
                function (d) {
                     $("#tbody").html(d); 
                     btn.value="关闭";
                },
                "html"
                
            );
        } else {
            $.get(
                "AdminServlet",
                { m: "lll", id: oid },
                function (d) {
                     $("#tbody").html(""); 
                     btn.value="订单详情";
                },
                "html"
                
            );
        }

    }


</script>

<body>




    <c:forEach items="${order }" var="order">

        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <td>订单编号：${order.oid}</td>
                    <td>收货地址：${order.addr}</td>
                    <td>联系方式：${order.phone}</td>
                    <td>总计金额：${order.sum}</td>
                    <!-- <c:if test="${order.state==1}">
                            <td><a href="">付款</a></td>
                        </c:if> -->
                    <!-- <c:if test="${order.state==2}" >
                            <td>已付款</td>
                        </c:if>
                        <c:if test="${order.state==3}" >
                            <td>已发货</td>
                        </c:if>
                        <c:if test="${order.state==4}" >
                            <td><a href="这里是确认收货所对应的servlet">确认收货</a></td>
                        </c:if> -->
                    <td><input type="button" value="订单详情" id="btn" onclick="show(1)" /></td>
                </tr>
            </thead>
            <tbody id="tbody">

            </tbody>
        </table>
    </c:forEach>
    <div class="fenye">
        <a href=OrderServlet?m=list&curPage=1&name=${name}>首页</a>
        <a href=OrderServlet?m=list&curPage=${page.prevPage }&name=${name }>上一页</a>
        <a href=OrderServlet?m=list&curPage=${page.nextPage }&name=${name }>下一页</a>
        <a href=OrderServlet?m=list&curPage=${page.pageCount }&name=${name }>尾页</a></div>
</body>

</html>