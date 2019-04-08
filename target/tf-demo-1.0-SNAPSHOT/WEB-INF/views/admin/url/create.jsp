<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>创建资源</title>
		<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
	</head>
	<body>

		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
			
					<form id="createForm" class="form-horizontal">
					  	<div class="form-group form-group-first">
							<label for="url" class="col-sm-2 control-label">URL</label>
							<div class="col-sm-8">
					  			<input type="text" class="form-control" id="url" name="url"
									   placeholder="请输入URL地址(必填)" required maxlength="1024"
									   remote="${ctx}/admin/sys-url/exist?property=url"/>
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
			changeTitle('创建资源');
			$(function() {
                initForm('#createForm', '${ctx}/admin/sys-url/create',
                    function(json) {
                        var resp = $.parseJSON(json);
                        if(resp.code == 'OK') {
                            changeUrl('${ctx}/admin/sys-url');
                            topLayer.msg('保存成功', {icon: 1});
                        }else {
                            topLayer.msg(resp.message, {icon: 2});
                        }
                    });
			});
		</script>
	</body>
</html>
