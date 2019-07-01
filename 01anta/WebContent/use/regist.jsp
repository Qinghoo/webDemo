<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安踏注册</title>
</head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<style type="text/css">
.login {
	width: 40%;
	height: auto;
	margin: 60px auto;
	padding: 10px 30px;
	border: solid 0px gray;
	/*aqua*/
	/* background-color: gray; */
	background-color: #ffffff;
	color: gray;
}

.title {
	text-align: center;
	/* background-color: coral; */
	/*  border-bottom: 1px gray dashed; */
	font-size: 20px;
	padding: 15px 30px;
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
		Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif
}

.logo {
	padding-left: 30px;
	color: gray;
	float: left;
}

.content {
	padding: 15px 0px;
}

.btn {
	width: 180px;
	text-align: center;
	margin: 5px auto;
}

.yanzheng {
	width: 200px;
}

.form-inline {
	margin-bottom: 20px;
}

#header {
	width: 1349px;
	height: 85px;
	margin: 0 auto;
}

#logo {
	width: 960px;
	height: 140px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-left: auto;
	margin-right: auto;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js"></script>
<script type="text/javascript">
	function check() {
		var name = document.getElementById("exampleInputName");
		if (name.value == "")
			pass2.setCustomValidity("Please enter your username");
	}

	$(function() {
		$("#form1").validate({
			rules : {
				utel : {
					required : true,
					remote : "UseServlet?m=validUtel"
				}
			},
			messages : {
				utel : {
					remote : "该电话号码已存在"
				}

			}
		})

		/* 验证手机号 */
		$("#utel").blur(function() {
			var mob = $("#utel").val();
			if (mob == "" || mob == null) {
				$("#warntel").html("  请输入11位手机号");
			} else if (mob.length != 11 && mob != Number) {
				$("#warntel").html("  手机号格式有误，须11位数字");
			} else {
				$("#warntel").html("");

			}
		});
		/* 这是验证邮箱的格式 */
		$("#exampleInputEmail1")
				.blur(
						function() {
							var re = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
							var mob = $("#exampleInputEmail1").val();
							if (mob == "" || mob == null) {
								$("#warnEmail").html("  请输入邮箱账号");
							} else if (!re.test(mob)) {
								$("#warnEmail").html("  邮箱账号格式有误");
							} else {
								$("#warnEmail").html("");

							}
						});
		/* 这是验证密码的格式 */
		$("#exampleInputPassword1").blur(function() {
			var mob = $("#exampleInputPassword1").val();
			if (mob == "" || mob == null) {
				$("#warnPswd").html("  请输入密码");
			} else if (mob.length<6||mob.length>11) {
				$("#warnPswd").html("  密码格式有误，6-11位");
			} else {
				$("#warnPswd").html("");

			}
		});
		$("#actualInputName").blur(function() {
			var mob = $("#actualInputName").val();
			reg = /^([\u4e00-\u9fa5]){2,7}$/; //只能是中文，长度为2-7位

			if (mob == "" || mob == null) {
				$("#warnactualName").html("  请输入真实姓名");
			} else if (!reg.test(mob)) {
				$("#warnactualName").html("  姓名格式有误");
			} else {
				$("#warnactualName").html("");

			}
		});
		/* 这是验证码相关的js代码 */
		/* $("#yanzhenginput").blur(function() {
			var yan = $("#yanzhenginput").val();
			if (yan == "" || yan == null) {
				$("#warnyanzheng").html("请输入验证码");
			} else {
				$("#warnyanzheng").html("");
			}
		}); */
		$("#uaddress").blur(function() {
			var yan = $("#uaddress").val();
			if (yan == "" || yan == null) {
				$("#warnuaddress").html("请输入验证码");
			} else {
				$("#warnuaddress").html("");
			}
		});
		/* 这是再次获取验证码的方法 */
		/*  $("#img").click(function(){
		 	//alert("aa");
		     var img=$("#img");
		     alert(img.src);
		     img.src="ValidCodeServlet?time="+new Date().getTime();

		         }); */

	});
	function xx(img) {
		img.src = "${pageContext.request.contextPath }/ValidCodeServlet?time="
				+ new Date().getTime();
	}
</script>
<body>
	<div class="login">
		<div class="title">
			<span class="glyphicon glyphicon-pencil logo"></span> <a style="margin-bottom: 120px"
				href="shouye.html"> <img src="http://antauni.obs.cn-north-1.myhwclouds.com/common/logo.png" /></a><br>
			<br> <span>注册页面</span>
		</div>
		<div class="content">
			<form id="form1" action="UseServlet?m=add" method="POST">
				<!-- 这是提交的form表单 -->
				<div class="form-group">
					<label for="utel1">手机号<span style="color: red;" id="warntel"></span></label> <input type="text"
						class="form-control" name="utel" id="utel" " 
						 placeholder="enter your tel"
						required="required"> <font color="red">${err_utel}</font>
				</div>

				<div class="form-group">
					<label for="exampleInputEmail1">邮箱<span style="color: red;" id="warnEmail"></span></label> <input
						type="email" class="form-control" name="uemail" id="exampleInputEmail1"
						" 
						 placeholder="Email" required="required">
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1">密码<span style="color: red;" id="warnPswd"></span></label> <input
						type="password" class="form-control" name="upwd" id="exampleInputPassword1"
						placeholder="Password" required="required">
				</div>

				<div class="form-group">
					<label for="actualInputName">真实姓名<span style="color: red;" id="warnactualName"></span></label>
					<input type="text" class="form-control" name="uname" id="actualInputName"
						placeholder="enter your username" required="required">
				</div>

				<!-- 激活码隐藏 -->
				 <div class="form-inline" style="display: none;">
					<input type="text" class="form-control" name="validcode" id="yanzhenginput"
					 placeholder="Picture verification code" required="required" value="qqqq">
						
					<!-- 这是从servlet接收的验证码 -->
					<img src="${pageContext.request.contextPath }/ValidCodeServlet" style="width: 80px; height: 40px;" id="img" onclick="xx(this)"/>
					<font color="red">${err_code}</font>
				</div>

				<div class="form-group">
					<label for="exampleInputName1" >地址<span style="color: red;" id="warnuaddress"></span></label> <input type="text" class="form-control" id="uaddress"
						name="uaddress" placeholder="enter you address">
				</div>
				<%-- <span style="color: red;">${message}</span> --%>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-danger btn-lg">注册</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>