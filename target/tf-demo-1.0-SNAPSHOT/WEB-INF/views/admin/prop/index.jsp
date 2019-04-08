<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>系统属性</title>
	<%@include file="/WEB-INF/layouts/index-header.jsp"%>
</head>
<body>

<div class="tpanel">
	<div class="panel-content">
		<div class="container-fluid">
			<div id="tool">
				<form id="searchForm" class="form-inline" style="margin-top:20px;margin-bottom:20px;">
					<div class="form-group">
						<label class="">设备名称：</label>
						<input type="text" name="search_LIKES_name" class="form-control"/>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary radius" onclick="search('#searchForm','#table')">
							<span class="glyphicon glyphicon-search"></span> 查询
						</button>
						<a class="btn btn-success radius" href="${ctx}/admin/sys-prop/create">
							<span class="glyphicon glyphicon-cog"></span> 添加属性
						</a>
					</div>
				</form>
			</div>
			<table id="table"></table>
		</div>
	</div>
</div>

<script type="text/javascript">
    changeTitle('系统属性');

    $(function() {
        $('#table').bootstrapTable({
            url: '${ctx}/admin/sys-prop/page-list',
            idField : 'id',
            striped : true,
            pagination : true,
            pageNumber : 1,
            pageSize : 25,
            sidePagination : 'server',
            uniqueId : 'id',
            mobileResponsive : true,
            checkOnInit : true,
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
                field: 'name',
                sortable : true,
                title: '名称',
                align : 'left'
            },{
                field: 'type',
                title: '数据类型',
                align : 'center'
            },{
                field: 'value',
                'class': 'omitted',
                title: '值',
                align : 'left',
				formatter:function(value,row,index) {
                    if(value.length > 30) {
                        return value.substring(0,30) + '...';
					}
					return value;
				}
            },{
                field: 'description',
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
        carefulDelete('${ctx}/admin/sys-prop/careful-delete',id,'请输入您的管理密码以确定删除此系统属性');
    }

    function operateFormatter(value,row,index) {
        var content = '<a href="${ctx}/admin/sys-prop/update?id=' + row.id + '" title="编辑"><i class="iconfont icon-iconfontcolor32"></i></a>';
        content += '&nbsp;&nbsp;&nbsp;&nbsp;';
        content += '<a href="javascript:del(' + row.id + ')" title="删除"><i class="iconfont icon-shanchu"></i></a>';
        return content;
    }
</script>

</body>
</html>
