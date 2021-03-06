<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>创建角色</title>
		<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
	</head>
	<body>

		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
			
					<form id="createForm" class="form-horizontal">
					  	<div class="form-group form-group-first">
							<label for="name" class="col-sm-2 control-label">角色名称</label>
							<div class="col-sm-8">
					  			<input type="text" class="form-control" id="name" name="name"
									   placeholder="请输入角色名称(必填)" required maxlength="20"
									remote="${ctx}/admin/sys-role/exist?property=name" />
							</div>
					  	</div>
					  	<div class="form-group">
							<label for="description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-8">
					  			<textarea id="description" name="description" class="form-control"
										  rows="3" maxlength="100"></textarea>
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
			changeTitle('创建角色');
			$(function() {
                initForm('#createForm', '${ctx}/admin/sys-role/create',
                    function(json) {
                        var resp = $.parseJSON(json);
                        if(resp.code == 'OK') {
                            topBootbox.confirm({
                                title : "保存成功",
                                message: "立即为此角色分配权限?",
                                onEscape : true,
                                backdrop : true,
                                animate : true,
                                buttons: {
                                    confirm: {
                                        label: '确定',
                                        className: 'btn-success'
                                    },
                                    cancel: {
                                        label: '返回',
                                        className: ''
                                    }
                                },
                                callback: function (result) {
                                    if(result) {
                                        window.location.href = '${ctx}/admin/sys-role/assign-perm?id=' + resp.body;
                                    }else {
                                        changeUrl('${ctx}/admin/sys-role');
                                    }
                                }
                            });
                        }else {
                            topLayer.msg(resp.message, {icon: 2});
                        }
                    });
			});
		</script>
	</body>
</html>
