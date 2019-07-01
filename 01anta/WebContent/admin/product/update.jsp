<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<script type="text/javascript" src="kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
KindEditor.ready(function(K) {
	KindEditor.ready(function(K) {
		window.editor = K.create('#editor_id', {
			resizeType : 0,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
			uploadJson : 'kindeditor/jsp/upload_json.jsp',
			//uploadJson : "ajax/uploadImg.do",//需要加上basePath, 不然批量上传调用action时会出现路径问题 
			fileManagerJson : 'kindeditor/jsp/file_manager_json.jsp',
			allowImageUpload : true,
			allowFileManager : true,
			afterChange : function() {
				this.sync();
			}
		});
	});
});
window.onload = function(){
	var form =document.getElementById("form1");
	form.onsubmit=function(event){
		for(i=0;i<=5;i++){
			if (form[i].value == "") {
				alert("请将商品信息填写完整再提交！");
				event.preventDefault();
				return;
			}
		}
		for(i=8;i<10;i++){
			if (form[i].value == "") {
				alert("请将商品信息填写完整再提交！");
				event.preventDefault();
				return;
			}
		}
	};
}
  
</script>

</head>
<body>
	<form id="form1" style="text-align: center;"
		action="${pageContext.request.contextPath }/ProductServlet?m=update" method="POST"
		role="form" enctype="multipart/form-data">

		<div class="form-group" style="text-align: center;">
			<input type="hidden" id="pid" name="pid" value="${product.pid }"> 
			<%-- <input type="hidden" id="min" name="min" value="${product.minphoto }">测试  --%>
            <label for="">商品名称</label>${product.pid }
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="text" class="form-control" id="pname" name="pname" value="${product.pname }" placeholder="填入商品名 ">
            <label for="">商品价格</label>
            <input oninput="value=value.replace(/[^\d]/g,'')" style="width: 20%;margin-left: auto;margin-right: auto;" type="text" class="form-control" id="price" name="price" value="${product.price }" placeholder="填入价格">
            
             <label for="">商品展示图1</label>
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="file" class="form-control" id="minphoto4" name="minphoto" >
             <label for="">商品展示图2</label>
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="file" class="form-control" id="minphoto1" name="minphoto" >
             <label for="">商品展示图3</label>
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="file" class="form-control" id="minphoto2" name="minphoto" >
             <label for="">商品展示图4</label>
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="file" class="form-control" id="minphoto3" name="minphoto" >
           <!--  <label for="">商品详情图</label>
            <input style="width: 20%;margin-left: auto;margin-right: auto;" type="file" class="form-control" id="maxphoto" name="maxphoto"> -->
            <textarea id="editor_id" name="maxphoto"
			style="width: 100%; height: 200px;">  
			<c:if test="${product.maxphoto==null}">
  				
			</c:if>
			<c:if test="${product.maxphoto!=null}">
                 	${product.maxphoto }  
			</c:if>
        </textarea>
            <label for="">库存</label>
            <input oninput="value=value.replace(/[^\d]/g,'')" style="width: 20%;margin-left: auto;margin-right: auto;" type="text" class="form-control" id="stock" name="stock" value="${product.stock }" placeholder="填入库存量">
            	请选择二级分类： 
		<select name="stid">
			
			<%-- <c:forEach items="${list}" var="c">
			<p>${c.name}</p>
			<option value="${c.id}">${c.name}</option>
			</c:forEach> --%>
			<c:forEach items="${list}" var="s">
				<option value="${s.stid}" <c:if test="${s.stid==product.stid}">selected="selected"</c:if>> ${s.stname}</option>
			</c:forEach>
		</select> <br>



		<button type="submit" class="btn btn-primary">提交</button>
	</form>

</body>
</html>