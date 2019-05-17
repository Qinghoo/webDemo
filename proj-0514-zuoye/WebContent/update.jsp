<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	var id="${param.id}";
	alert(id);
	$.get(
	"CompanyServlet",
	{m:"findById",id:id},
	function (d) {
		$("#id").val(d.id);
		$("#name").val(d.name);
		$("#sname").val(d.sname);
	},
	"json"
	);
	
});
function tijiao() {
	//var forData=new FormData();
	var formData=new FormData($("#form1")[0]);
	$.ajax({
		  url:"CompanyServlet?m=update",
		  type:"Post",
		  data:formData,
		  async:false,
		  processData: false,
		  contentType: false, 
		  success:function(result){
			 
			location.href="list.jsp";
			 
		  },
		  error: function(e) {
          	alert("aaaa");
          }

	  });
}

</script>
</head>
<body>
<form id=form1 align="center" enctype="multipart/form-data" >
<input type="hidden" name="id" id="id">
公司名称<input type="text" name="name" id="name"><br><br>
法人姓名<input type="text" name="sname" id="sname"><br><br>
上传文件 <input type="file" name="filepath" id="filepath"><br><br> 
<input type="button" value="提交" id="tijaio" onclick="tijiao()">

</form>
</body>
</html>