<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>

<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>登录 - ${baseSettings.siteName}</title>

	<script type="text/javascript">
        if(window.top != window) {
            alert("您太久没有操作，系统已为您自动退出登录！");
            window.top.location.reload();
        }
	</script>

	<link href="${staticPath}/admin/iconfont/iconfont.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" href="${staticPath}/admin/lib/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${staticPath}/admin/tf/login/css/htmleaf-demo.css">
	<style type="text/css">
		.form-bg{

		}
		#loginForm {
			border:1px solid #eee;
		}
		.form-horizontal{
			background: #fff;
			padding-bottom: 20px;
			/*border-radius: 15px;*/
			text-align: center;
		}
		.form-horizontal .heading{
			display: block;
			font-size: 35px;
			font-weight: 700;
			padding: 35px 0;
			border-bottom: 1px solid #f0f0f0;
			margin-bottom: 30px;
		}
		.form-horizontal .form-group{
			padding: 0 40px;
			margin: 0 0 25px 0;
			position: relative;
		}
		.form-horizontal .form-control{
			background: #f0f0f0;
			border: none;
			/*border-radius: 20px;*/
			box-shadow: none;
			padding: 0 20px 0 45px;
			height: 40px;
			transition: all 0.3s ease 0s;
		}
		.form-horizontal .form-control:focus{
			background: #e0e0e0;
			box-shadow: none;
			outline: 0 none;
		}
		.form-horizontal .form-group i{
			position: absolute;
			top: 12px;
			left: 60px;
			font-size: 17px;
			color: #c8c8c8;
			transition : all 0.5s ease 0s;
		}
		.form-horizontal .form-control:focus + i{
			color: #19aa8d;
		}
		.form-horizontal .icon-yiwen{
			display: inline-block;
			position: absolute;
			top: 12px;
			right: 50px;
			font-size: 16px;
			color: #c8c8c8;
			transition: all 0.5s ease 0s;
		}
		.form-horizontal .icon-yiwen:hover{
			color: #808080;
		}
		.form-horizontal .main-checkbox{
			float: left;
			width: 20px;
			height: 20px;
			background: #19aa8d;
			border-radius: 50%;
			position: relative;
			margin: 5px 0 0 5px;
			border: 1px solid #19aa8d;
		}
		.form-horizontal .main-checkbox label{
			width: 20px;
			height: 20px;
			position: absolute;
			top: 0;
			left: 0;
			cursor: pointer;
		}
		.form-horizontal .main-checkbox label:after{
			content: "";
			width: 10px;
			height: 5px;
			position: absolute;
			top: 5px;
			left: 4px;
			border: 3px solid #fff;
			border-top: none;
			border-right: none;
			background: transparent;
			opacity: 0;
			-webkit-transform: rotate(-45deg);
			transform: rotate(-45deg);
		}
		.form-horizontal .main-checkbox input[type=checkbox]{
			visibility: hidden;
		}
		.form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
			opacity: 1;
		}
		.form-horizontal .text{
			float: left;
			margin-left: 7px;
			line-height: 20px;
			padding-top: 5px;
			text-transform: capitalize;
		}
		.form-horizontal .btn{
			float: right;
			font-size: 14px;
			color: #fff;
			background: #19aa8d;
			/*border-radius: 30px;*/
			padding: 10px 25px;
			border: none;
			text-transform: capitalize;
			transition: all 0.5s ease 0s;
		}
		@media only screen and (max-width: 479px){
			.form-horizontal .form-group{
				padding: 0 25px;
			}
			.form-horizontal .form-group i{
				left: 45px;
			}
			.form-horizontal .btn{
				padding: 10px 20px;
			}
		}
	</style>
	<script src="${staticPath}/admin/tf/jquery.min.js"></script>
	<script type="text/javascript" src="${staticPath}/admin/lib/jquery.cookie/jquery.cookie.js"></script>
	<script type="text/javascript" src="${staticPath}/admin/lib/layer/layer.js"></script>
	<script type="text/javascript" src="${staticPath}/admin/lib/bootstrap-3.3.7-dist/js/bootstrap.js" ></script>
	<script type="text/javascript" src="${staticPath}/admin/lib/bootbox-4.4.0/bootbox.js" ></script>
	<!--[if IE]>
	<script src="http://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body style="background:url(${staticPath}/admin/tf/login/signup-bg.png);background-size: cover;">
<div style="height:60px;">

</div>

<div class="demo form-bg" style="padding: 20px 0;padding-top:70px;position:absolute;top:60px;bottom:40px;left:0px;right:0px;">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<form id="loginForm" class="form-horizontal">
					<span class="heading">${baseSettings.siteName}</span>
					<div class="form-group">
						<input type="text" class="form-control" name="username" id="username" placeholder="用户名或电子邮件">
						<i class="iconfont icon-huiyuan"></i>
					</div>
					<div class="form-group help">
						<input type="password" class="form-control" name="password" id="password" placeholder="密　码">
						<i class="iconfont icon-mima"></i>
						<a href="#" class="iconfont icon-yiwen"></a>
					</div>
					<div class="form-group">
						<div class="main-checkbox">
							<input type="checkbox" value="true" id="checkbox1" name="rememberMe"/>
							<label for="checkbox1"></label>
						</div>
						<span class="text">记住密码</span>
						<a class="btn btn-default" href="javascript:login()">登录</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div style="position:absolute;bottom:0px;left:0px;right:0px; height:40px;text-align:center;line-height:40px;color:#666;font-size:13px;">
	${baseSettings.copyright}
</div>
<script type="text/javascript">
    function login() {
        requestLogin();
    }
    function requestLogin() {
        $.post('${ctx}/admin/login',$('#loginForm').serialize(),function(resp) {
            if(resp.code == 'OK') {
                $.cookie('url', null);
                $.cookie('title', null);
                window.location.href = '${ctx}/admin/index';
            }else {
                window.parent.layer.msg(resp.message, {icon: 2});
            }
        },'json');
	}
	$(function() {
        $('#loginForm').keyup(function(event){
            if(event.which == 13
				&& $('#username').val().length > 0
				&& $('#password').val().length > 0)
                login();
        });
	});
</script>
</body>
</html>