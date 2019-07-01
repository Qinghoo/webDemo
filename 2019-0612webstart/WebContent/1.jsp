<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
function beforeSubmit() {
	alert($("#editor_id").val());
}
  
</script>

</head>
<body>
		<form action="KindServlet" method="post">
		<textarea id="editor_id" name="content"
			style="width: 700px; height: 300px;">  
			<c:if test="${s==null}">
                 	这里输入内容...
  				
			</c:if>
		<c:if test="${s!=null}">
                 	${s }  
		</c:if>
        </textarea>
        <input type="submit" value="提交" onclick="beforeSubmit()"/>
	</form>

</body>
</html>