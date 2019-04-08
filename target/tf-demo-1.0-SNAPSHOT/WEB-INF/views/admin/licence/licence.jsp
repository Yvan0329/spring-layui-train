<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>系统授权</title>
	<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
	<script type="text/javascript" src="${staticPath}/admin/lib/layer/layer.js"></script>
</head>
<body>
<div class="tpanel">
	<div class="panel-content">
		<div class="container-fluid">
			<form id="createForm" class="form-horizontal">
				<div class="form-group form-group-first">
					<label class="col-sm-2 control-label">机器码</label>
					<div class="col-sm-8">
						<textarea class="form-control" readonly>${machineCode}</textarea>
					</div>
				</div>
				<div class="form-group form-group-first">
					<label for="code" class="col-sm-2 control-label">授权码</label>
					<div class="col-sm-8">
						<textarea class="form-control" id="code" name="code" required placeholder="请输入授权码"></textarea>
					</div>
				</div>
				<div class="form-group form-group-first">
					<div class="col-sm-12" style="text-align: center;">
						<input type="submit" class="btn btn-primary" value="系统授权" />
					</div>
				</div>

			</form>

		</div>
	</div>
</div>
<script type="text/javascript">
    $(function() {
        initForm('#createForm', '${ctx}/licence/register',
            function(json) {
                var resp = $.parseJSON(json);
                if(resp.code == 'OK') {
                    layer.msg('授权成功', {icon: 1});
                    window.location.href = '${ctx}/';
                }else {
                    layer.msg(resp.message, {icon: 2});
                }
            });
    });
</script>

</body>
</html>
