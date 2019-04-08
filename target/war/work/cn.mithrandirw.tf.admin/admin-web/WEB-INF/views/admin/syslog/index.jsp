<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>系统日志</title>
	<%@include file="/WEB-INF/layouts/index-header.jsp"%>
</head>
<body>

<div class="tpanel">
	<div class="panel-content">
		<div class="container-fluid">
			<div id="tool">
				<form id="searchForm" class="form-inline" onsubmit="return search('#searchForm','#table')" style="margin-top:20px;margin-bottom:20px;">
					<div class="form-group">
						<label class="">类型：</label>
						<input type="text" name="search_LIKES_type" class="form-control"/>
					</div>
					<div class="form-group">
						<label class="">内容：</label>
						<input type="text" name="search_LIKES_content" class="form-control"/>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary radius">
							<span class="glyphicon glyphicon-search"></span> 查询
						</button>
					</div>
				</form>
			</div>
			<table id="table"></table>
		</div>
	</div>
</div>

<script type="text/javascript">
    changeTitle('系统日志');

    $(function() {
        $('#table').bootstrapTable({
            url: '${ctx}/admin/syslog/page-list',
            idField : 'id',
            striped : true,
            pagination : true,
            pageNumber : 1,
            pageSize : 25,
            sidePagination : 'server',
            uniqueId : 'id',
            queryParams : queryParams,
            responseHandler : responseHandler,
            columns: [
			{
				title: '#',
				width : 50,
				align : 'center',
				formatter: snFormatter
			},
			{
				field: 'createdTime',
				title: '时间',
				align : 'center'
			},
			{
				field: 'type',
				title: '类型',
				align : 'center'
			},
			{
				field: 'content',
				title: '内容',
				align : 'center'
			}]
        });

    });

</script>

</body>
</html>
