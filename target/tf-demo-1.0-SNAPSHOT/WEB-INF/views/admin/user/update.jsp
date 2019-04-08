<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改用户</title>
		<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
	</head>
	<body>

		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
			
					<form id="createForm" class="form-horizontal">
						<input type="hidden" name="id" value="${entity.id}" />
					  	<div class="form-group form-group-first">
							<label for="username" class="col-sm-2 control-label">登录名</label>
							<div class="col-sm-8">
					  			<input type="text" class="form-control" id="username" name="username" readonly
									   placeholder="请输入登录名(必填)" required maxlength="20" value="${entity.username}"
								 	remote="${ctx}/admin/sys-user/exist?property=username&id=${entity.id}" />
							</div>
					  	</div>
						<div class="form-group">
							<label for="realName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="realName" name="realName"
									   placeholder="请输入姓名(必填)" required maxlength="10" value="${entity.realName}"/>
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-8">
								<select id="gender" name="gender" class="form-control">
									<option value="Male">男</option>
									<option value="Female">女</option>
								</select>
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
							<label for="deptId" class="col-sm-2 control-label">部门</label>
							<div class="col-sm-8">
								<select id="deptId" name="deptId" class="form-control">
									<c:forEach items="${depts}" var="dept">
										<option value="${dept.id}">${dept.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="tel" class="col-sm-2 control-label">联系电话</label>
							<div class="col-sm-8">
								<input type="telephone" class="form-control" id="tel" name="tel" isPhone="true"
									   placeholder="请输入联系电话" maxlength="20" value="${entity.tel}"/>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-8">
								<input type="email" class="form-control" id="email" name="email"
									   placeholder="请输入邮箱" maxlength="20" value="${entity.email}"/>
							</div>
						</div>
					  	<div class="form-group">
							<label for="description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-8">
					  			<textarea id="description" name="description" class="form-control"
										  rows="3" maxlength="100">${entity.description}</textarea>
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
			changeTitle('修改用户');
			$(function() {
			    $('#gender').val('${entity.gender}');
                $('#deptId').val('${entity.deptId}');
                $('#roleId').val('${roleId}');

				initForm('#createForm', '${ctx}/admin/sys-user/update',
					function(json) {
						var resp = $.parseJSON(json);
						if(resp.code == 'OK') {
							changeUrl('${ctx}/admin/sys-user');
                            topLayer.msg('修改成功', {icon: 1});
						}else {
                            topLayer.msg(resp.message, {icon: 2});
						}
					});
			});
		</script>
	</body>
</html>
