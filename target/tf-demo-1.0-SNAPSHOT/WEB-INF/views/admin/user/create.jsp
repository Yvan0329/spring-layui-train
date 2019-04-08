<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>创建用户</title>
		<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
	</head>
	<body>

		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
			
					<form id="createForm" class="form-horizontal">
					  	<div class="form-group form-group-first">
							<label for="username" class="col-sm-2 control-label">登录名</label>
							<div class="col-sm-8">
					  			<input type="text" class="form-control" id="username" name="username"
									   placeholder="请输入登录名(必填)" required maxlength="20"
									remote="${ctx}/admin/sys-user/exist?property=username" />
							</div>
					  	</div>
						<div class="form-group">
							<label for="realName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="realName" name="realName"
									   placeholder="请输入姓名(必填)" required maxlength="10"/>
							</div>
						</div>
						<div class="form-group">
							<label for="roleId" class="col-sm-2 control-label">角色</label>
							<div class="col-sm-8">
								<select id="roleId" name="roleId" class="form-control">
									<c:forEach items="${roles}" var="role">
										<option value="${role.id}">${role.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="password" name="password"
									   placeholder="请输入密码(必填)" required minlength="6" maxlength="20"/>
							</div>
						</div>
						<div class="form-group">
							<label for="confirmPassword" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
									   placeholder="请再次输入密码(必填)" required maxlength="20" equalTo="#password" />
							</div>
						</div>
					  	<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<a class="btn btn-default" href="javascript:back();">返回</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" class="btn btn-primary" value="保存" />
							</div>
					  	</div>
					  	
					</form>
				
				</div>
			</div>
		</div>
		<script type="text/javascript">
			changeTitle('创建用户');
			$(function() {
                initForm('#createForm', '${ctx}/admin/sys-user/quick-create',
                    function(json) {
                        var resp = $.parseJSON(json);
                        if(resp.code == 'OK') {
                            changeUrl('${ctx}/admin/sys-user');
                            topLayer.msg('保存成功', {icon: 1});
                        }else {
                            topLayer.msg(resp.message, {icon: 2});
                        }
                    });
			});
		</script>
	</body>
</html>
