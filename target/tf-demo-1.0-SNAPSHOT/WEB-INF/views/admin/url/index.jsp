<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>系统资源</title>

	<%@include file="/WEB-INF/layouts/index-header.jsp"%>

</head>
<body>

<div class="tpanel">
	<div class="panel-content">
		<div class="container-fluid">
			<div id="tool">
				<form id="searchForm" class="form-inline" onsubmit="return search('#searchForm','#table')" style="margin-top:20px;margin-bottom:20px;">
					<div class="form-group">
						<label class="">URL：</label>
						<input type="text" name="search_LIKES_url" class="form-control"/>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary radius">
							<span class="glyphicon glyphicon-search"></span> 查询
						</button>
						<a class="btn btn-success radius" href="${ctx}/admin/sys-url/create">
							<span class="glyphicon glyphicon-cog"></span> 创建资源
						</a>
					</div>
				</form>
			</div>
			<table id="table"></table>
		</div>
	</div>
</div>

<script type="text/javascript">
    window.parent.changeTitle('系统资源');

    $(function() {
        $('#table').bootstrapTable({
            url: '${ctx}/admin/sys-url/page-list',
            idField : 'id',
            striped : true,
            pagination : true,
            pageNumber : 1,
            pageSize : 25,
            sidePagination : 'server',
            mobileResponsive : true,
            checkOnInit : true,
            uniqueId : 'id',
            /*checkbox : true,
            clickToSelect : true,*/
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
                searchable : true,
                sortable : true,
                title: 'URL',
                align : 'left'
            },{
                field: 'description',
                searchable : true,
                sortable : true,
                title: '描述',
                align : 'left'
            },{
                field: 'op',
                searchable : true,
                title: '操作',
                align : 'center',
                formatter : operateFormatter
            }]
        });

    });

    function del(id) {
        carefulDelete('${ctx}/admin/sys-url/careful-delete',id,'请输入您的管理密码以确定删除此系统资源');
    }

    function operateFormatter(value,row,index) {
        var content = '<a href="${ctx}/admin/sys-url/update?id=' + row.id + '" title="编辑"><i class="iconfont icon-iconfontcolor32"></i></a>';
        content += '&nbsp;&nbsp;&nbsp;&nbsp;';
        content += '<a href="javascript:del(' + row.id + ')" title="删除"><i class="iconfont icon-shanchu"></i></a>';
        return content;
    }
</script>

</body>
</html>
