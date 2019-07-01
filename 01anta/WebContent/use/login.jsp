<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安踏登录</title>
</head>
 <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js"></script>
<style>
body {
	background: gainsboro;
}

#div_body {
	width: 854px;
	margin-left: auto;
	margin-right: auto;
	color: gray
}

#from {
	background-color: white;
	border: gray solid 1px;
	height: 1000px;
}

.mycenter {
	margin-top: 80px;
	margin-left: auto;
	margin-right: auto;
	height: 700px;
	width: 500px;
	padding: 5%;
	padding-left: 5%;
	padding-right: 5%;
}

.mycenter mysign {
	width: 440px;
}

.mycenter input, checkbox, button {
	margin-top: 2%;
	margin-left: 10%;
	margin-right: 10%;
}

.mycheckbox {
	margin-top: 10px;
	margin-left: 40px;
	margin-bottom: 10px;
	height: 10px;
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

.form-control {
	width: 330px;
	margin: 0;
}

.form-group {
	margin: 0;
}

.btn {
	width: 280px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

#tu img {
	height: 40px;
	width: 40px;
	margin-left: 13px;
}

#tu {
	margin-left: auto;
	margin-right: auto;
}

label {
	margin-left: 41.475px;
	margin-bottom: 0;
}

.myLogo {
	opacity: 0.3;
}
</style>
<script type="text/javascript">

        $(function () {
        	
        	
        	$("#from").validate({
        		rules:{
        			utel:{
        				required:true,
        				remote:"UseServlet?m=valid"
        			}
        		},
        		messages:{
        			utel:{
        				remote:"该电话号码不存在"
        			}
        		}
        		});
        	
        	
        	
            $("#exampleInputUsername").blur(function () {
                var mob = $("#exampleInputUsername").val();
                if (mob == "" || mob == null) {
                    $("#utel").html("  请输入11位手机号");
                } else if (mob.length != 11 && mob != Number) {
                    $("#utel").html("  手机号格式有误，须11位数字");
                } else {
                    $("#utel").html("");
                }
            });
            $("#exampleInputPswd1").blur(function () {
                var mob = $("#exampleInputPswd1").val();
                if (mob == "" || mob == null) {
                    $("#warnPswd").html("  请输入密码");
                } else if (mob.length < 6 || mob.length > 11) {
                    $("#warnPswd").html("  密码格式有误，6-11位");
                } else {
                    $("#warnPswd").html("");
                }
            });
            /* 这是登录方式的阴影 */
            $(".myLogo").hover(function(){
					$(this).css("opacity","40");
				},function(){
					$(this).css("opacity","0.3");
				});
        });
    </script>
<body>
	<div id="div_body">
		<form id="from" action="${pageContext.request.contextPath }/use/UseServlet?m=noPasswordLogin" method="POST">
			<!-- 这是提交的form表单 -->
			<div class="mycenter">
				<div class="mysign">
					<div class="col-lg-11 text-center ">
						<div class="title">
							<span class="glyphicon glyphicon-pencil logo"></span> 
								<a style="margin-bottom: 120px" href="${pageContext.request.contextPath }/">
								<img src="http://antauni.obs.cn-north-1.myhwclouds.com/common/logo.png" />
								</a><br>
							<br> <span>请登录 </span>|<span>
							<a href="regist.jsp"><font style="color: #dc3545">没账号？去注册</font></a></span>
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="utel" value="${utel}"
							id="exampleInputUsername" placeholder="请输入手机号" required autofocus />
						<label><span style="color: red;" id="utel"></span></label>
					</div>
					<div class="form-group"></div>
					<div class="form-group">
						<input type="password" class="form-control" id="exampleInputPswd1" value="${upwd}"
							name="upwd" placeholder="请输入密码" required autofocus /> 
							<label><span style="color: red;" id="warnPswd"></span></label>
					</div>
					
					 <span style="color: red;">${message}</span>
					
					<input type="checkbox" name="autologin" value="auto" style="margin: 20px 5px 20px 150px" /> <span>自动登录</span>
					
					
					<div style="text-align: center;">
						<button type="submit" class="btn btn-danger btn-lg">登&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp录</button>
					</div>
					
					
					
					<br> <br>
					<div class="iconAccout">
						<div class="text" style="text-align: center">你也可以使用以下账号登录</div>
						<br>
						<p id="tu" style="width: 300px; height: 40px; margin-top: 0px;">
							<a href="#"><img class="myLogo" src="${pageContext.request.contextPath }/img/wechat.png" /></a> <a
								href="#"><img class="myLogo" src="${pageContext.request.contextPath }/img/twitter.png" /></a> <a
								href="#"><img class="myLogo" src="${pageContext.request.contextPath }/img/zhifubao.png" /></a> <a
								href="#"><img class="myLogo" src="${pageContext.request.contextPath }/img/weibo.png" /></a> <a
								href="#"><img class="myLogo" src="${pageContext.request.contextPath }/img/baidu.png" /></a>
						</p>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>