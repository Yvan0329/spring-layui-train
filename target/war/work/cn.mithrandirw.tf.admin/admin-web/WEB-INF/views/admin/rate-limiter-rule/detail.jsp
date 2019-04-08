<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>限流规则详情</title>
		<%@include file="/WEB-INF/layouts/detail-header.jsp"%>
	</head>
	<body>

		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
			
					<form id="createForm" class="form-horizontal">
						<div class="form-group form-group-first">
							<label class="col-sm-2 control-label">每秒产生许可数量</label>
							<div class="col-sm-8">
								<label class="control-label detail-label">
								${entity.permitsPerSecond}
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">每次获取许可数量</label>
							<div class="col-sm-8">
								<label class="control-label detail-label">
								${entity.acquirePermits}
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">预热时间</label>
							<div class="col-sm-8">
								<label class="control-label detail-label">
								${entity.warmupPeriod}
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">预热时间单位</label>
							<div class="col-sm-8">
								<label class="control-label detail-label">
								${entity.warmupTimeUnit}
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">尝试获取</label>
							<div class="col-sm-8">
								<label class="control-label detail-label">
								${entity.isTry}
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">超时时间</label>
							<div class="col-sm-8">
								<label class="control-label detail-label">
								${entity.timeout}
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">超时时间单位</label>
							<div class="col-sm-8">
								<label class="control-label detail-label">
								${entity.timeoutUnit}
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">URI</label>
							<div class="col-sm-8">
								<label class="control-label detail-label">
								${entity.uri}
								</label>
							</div>
						</div>
					  	
					</form>
				
				</div>
			</div>
		</div>
	</body>
</html>
