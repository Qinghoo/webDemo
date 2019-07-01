<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/dtree.css">
<style type="text/css">
body {
	background: #8fafaf;
}
</style>

</head>
<script type="text/javascript" src="../js/dtree.js"></script>
<script type="text/javascript">

</script>
<body>
<div class="dtree">


	<p><a href="javascript: d.openAll();">全部展开</a> | <a href="javascript: d.closeAll();">全部关闭</a></p>


	<script type="text/javascript">


		d = new dTree('d');


		d.add(01,-1,'菜单树');
        d.add(0101,01,'管理员管理');  
        d.add(010101,0101,'管理员管理','${pageContext.request.contextPath}/AdminServlet?m=list','','mainFrame');  

        d.add(0102,01,'一级菜单管理');  
        d.add(010201,0102,'一级菜单管理','${pageContext.request.contextPath}/CategoryServlet?m=list','','mainFrame');  

        d.add(0103,01,'二级菜单管理');  
        d.add(030101,0103,'二级菜单管理','${pageContext.request.contextPath}/SecondCategoryServlet?m=list','','mainFrame');  
		
        d.add(0104,01,'用户管理');  
        d.add(010401,0104,'用户管理','${pageContext.request.contextPath}/AdminUserServlet?m=list','','mainFrame');  

        d.add(0105,01,'商品管理');  
        d.add(010501,0105,'商品管理','${pageContext.request.contextPath}/ProductServlet?m=list','','mainFrame');  
        d.add(0106,01,'订单管理');  
        d.add(010601,0106,'订单管理','${pageContext.request.contextPath}/AdminOrderServlet?m=alllist','','mainFrame');  


		document.write(d);
	
	</script>


</div>
 

</body>
</html>