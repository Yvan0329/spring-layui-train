<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>限流规则</title>
	<%@include file="/WEB-INF/layouts/index-header.jsp"%>
</head>
<body>

<div class="tpanel">
	<div class="panel-content">
		<div class="container-fluid">
			<div id="tool">
				<form id="searchForm" class="form-inline" onsubmit="return search('#searchForm','#table')" style="margin-top:20px;margin-bottom:20px;">
					<div class="form-group">
						<a class="btn btn-success radius" href="${ctx}/admin/rate-limiter-rule/create">
							<span class="glyphicon glyphicon-cog"></span> 创建
						</a>
					</div>
				</form>
			</div>
			<table id="table"></table>
		</div>
	</div>
</div>

<script type="text/javascript">
    changeTitle('限流规则');

    $(function() {
        $('#table').bootstrapTable({
            url: '${ctx}/admin/rate-limiter-rule/page-list',
            idField : 'id',
            striped : true,
            pagination : true,
            pageNumber : 1,
            pageSize : 25,
            sidePagination : 'server',
            uniqueId : 'id',
            /*checkbox : true,
            clickToSelect : true,*/
            queryParams : queryParams,
            responseHandler : responseHandler,
            columns: [/*{
                field: 'ck',
                checkbox : true
            },*/
			{
				title: '#',
				width : 50,
				align : 'center',
				formatter: snFormatter
			},
			{
				field: 'uri',
				title: 'URI',
				align : 'center'
			},
			{
				field: 'permitsPerSecond',
				title: '每秒产生许可数量',
				align : 'center'
			},
			{
				field: 'acquirePermits',
				title: '每次获取许可数量',
				align : 'center'
			},
			{
				field: 'warmupPeriod',
				title: '预热时间',
				align : 'center',
				formatter : function(value,row,index) {
				    if(value == null || row.warmupTimeUnit == null) {
				        return '-';
					}
					return value + ' ' + row.warmupTimeUnit;
				}
			},
			{
				field: 'isTry',
				title: '尝试获取',
				align : 'center'
			},
			{
				field: 'timeout',
				title: '超时时间',
				align : 'center',
                formatter : function(value,row,index) {
                    if(value == null || row.timeoutUnit == null) {
                        return '-';
                    }
                    return value + ' ' + row.timeoutUnit;
                }
			},
			{
                field: 'op',
                title: '操作',
                align : 'center',
                formatter : operateFormatter
            }]
        });

    });

    function operateFormatter(value,row,index) {
        var content = '<a href="${ctx}/admin/rate-limiter-rule/update?id=' + row.id + '" title="编辑"><i class="iconfont icon-iconfontcolor32"></i></a>';
        content += '&nbsp;&nbsp;&nbsp;&nbsp;';
        content += '<a href="javascript:del(' + row.id + ')" title="删除"><i class="iconfont icon-shanchu"></i></a>';
        return content;
    }
    function detail(id) {
        openWindow('查看详情','${ctx}/admin/rate-limiter-rule/detail?id=' + id);
    }
    function del(id,name) {
        carefulDelete('${ctx}/admin/rate-limiter-rule/careful-delete',id,'请输入您的管理密码以确定删除此系统资源');
    }
</script>

</body>
</html>
