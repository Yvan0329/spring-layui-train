<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>系统访问日志</title>
	<%@include file="/WEB-INF/layouts/index-header.jsp"%>
</head>
<body>

<div class="tpanel">
	<div class="panel-content">
		<div class="container-fluid">
			<div id="tool">
				<form id="searchForm" class="form-inline" style="margin-top:20px;margin-bottom:20px;">
					<div class="form-group">
						<label class="">URL：</label>
						<input type="text" name="search_LIKES_url" class="form-control"/>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary radius" onclick="search('#searchForm','#table')">
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
    changeTitle('系统访问日志');

    $(function() {
        $('#table').bootstrapTable({
            url: '${ctx}/admin/access-log/page-list',
            striped : true,
            pagination : true,
            pageNumber : 1,
            pageSize : 25,
            mobileResponsive : true,
            checkOnInit : true,
            sidePagination : 'server',
            idField : 'id',
            uniqueId : 'id',
            pageList : [10, 25, 50, 100],
            checkbox : true,
            clickToSelect : true,
            queryParams : queryParams,
            responseHandler : responseHandler,
            columns: [/*{
                field: 'ck',
                checkbox : true
            },*/{
                title: '#',
                width : 50,
                align : 'center',
                formatter: snFormatter
            },{
                field: 'url',
                sortable : true,
                title: 'URL',
                align : 'left'
            },{
                field: 'method',
                title: 'METHOD',
                align : 'center'
            },{
                field: 'ip',
                title: '访问IP',
                align : 'center'
            }, {
                field: 'requestTime',
                sortable : true,
                title: '请求时间',
                'class' : 'nowrap',
                align : 'center'
            },{
                field: 'consuming',
                sortable : true,
                title: '耗时(毫秒)',
                'class' : 'nowrap',
                align : 'center'
            }]
        });

    });

</script>

</body>
</html>