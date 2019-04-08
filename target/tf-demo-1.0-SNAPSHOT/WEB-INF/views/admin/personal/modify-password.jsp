<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改密码</title>
		<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
	</head>
	<body>

		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
			
					<form id="createForm" class="form-horizontal">
						<input type="hidden" name="id" value="${id}" />
					  	<div class="form-group form-group-first">
							<label for="orginalPassword" class="col-sm-2 control-label">旧密码</label>
							<div class="col-sm-8">
					  			<input type="password" class="form-control" id="orginalPassword" name="orginalPassword" value=""
									   placeholder="请输入原密码" required maxlength="20"/>
							</div>
					  	</div>
						<div class="form-group">
							<label for="newPassword" class="col-sm-2 control-label">新密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="newPassword" name="newPassword" value=""
									   placeholder="请输入新密码" required minlength="6" maxlength="20"/>
							</div>
						</div>
						<div class="form-group">
							<label for="againNewPassword" class="col-sm-2 control-label">再次输入新密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="againNewPassword" name="againNewPassword" value=""
									   placeholder="请再次输入新密码" equalTo="#newPassword" required maxlength="20"/>
							</div>
						</div>
					  	<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<a class="btn btn-default" href="javascript:reset()">恢复默认</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" class="btn btn-primary" value="修改" />
							</div>
					  	</div>
					  	
					</form>
				
				</div>
			</div>
		</div>
		<script type="text/javascript">
			changeTitle('修改密码');
			$(function() {
                initForm('#createForm', '${ctx}/admin/modify-password',
                    function(json) {
                        var resp = $.parseJSON(json);
                        if(resp.code == 'OK') {
                            window.parent.layer.msg('修改成功', {icon: 1});
                            reset();
                        }else {
                            window.parent.layer.msg(resp.message, {icon: 2});
                        }
                    });
			});
			function reset() {
                $('#createForm')[0].reset();
			}
		</script>
	</body>
</html>
