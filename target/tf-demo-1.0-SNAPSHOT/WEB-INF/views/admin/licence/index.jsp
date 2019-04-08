<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>授权信息</title>
	<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
</head>
<body>
<div class="tpanel">
	<div class="panel-content">
		<div class="container-fluid">

			<form id="createForm" class="form-horizontal">
				<div class="form-group form-group-first">
					<label class="col-sm-2 control-label">当前授权</label>
					<div class="col-sm-8">
						<label class="control-label">
						<c:if test="${licence.type eq 'TIME_POINT'}">
							于<fmt:formatDate value="${licence.expiredTime}" pattern="yyyy-MM-dd HH:mm:ss" />到期
						</c:if>
						<c:if test="${licence.type eq 'TIME_LENGTH'}">
							可使用${licence.effectiveTimeLength}天
						</c:if>
							</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">绑定CPU</label>
					<div class="col-sm-8">
						<label class="control-label">
						<c:if test="${licence.bindCpu}">是</c:if>
						<c:if test="${not licence.bindCpu}">否</c:if>
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">绑定硬盘</label>
					<div class="col-sm-8">
						<label class="control-label">
						<c:if test="${licence.bindDisk}">是</c:if>
						<c:if test="${not licence.bindDisk}">否</c:if>
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">绑定网卡</label>
					<div class="col-sm-8">
						<label class="control-label">
						<c:if test="${licence.bindMac}">是</c:if>
						<c:if test="${not licence.bindMac}">否</c:if>
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">机器码</label>
					<div class="col-sm-8">
						<textarea class="form-control" readonly>${machineCode}</textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="code" class="col-sm-2 control-label">重新授权</label>
					<div class="col-sm-8">
						<textarea class="form-control" id="code" name="code" required placeholder="请输入授权码"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<input type="submit" class="btn btn-primary" value="重新授权" />
					</div>
				</div>

			</form>

		</div>
	</div>
</div>
<script type="text/javascript">
    changeTitle('授权信息');
    $(function() {
        initForm('#createForm', '${ctx}/admin/licence/register',
            function(json) {
                var resp = $.parseJSON(json);
                if(resp.code == 'OK') {
                    window.parent.layer.msg('授权成功', {icon: 1});
                    window.location.reload();
                }else {
                    window.parent.layer.msg(resp.message, {icon: 2});
                }
            });
    });
</script>

</body>
</html>
