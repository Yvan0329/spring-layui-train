<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>系统操作日志</title>
	<%@include file="/WEB-INF/layouts/index-header.jsp"%>
</head>
<body>

<div class="tpanel"
	<div class="panel-content">
		<div class="container-fluid">
			<%--<div id="tool">
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
			</div>--%>
			<table id="table"></table>
		</div>
	</div>
</div>

<script type="text/javascript">
    changeTitle('系统操作日志');

    $(function() {
        $('#table').bootstrapTable({
            url: '${ctx}/admin/operate-log/page-list?sort=created_time&order=desc',
            striped : true,
            pagination : true,
            pageNumber : 1,
            pageSize : 25,
            sidePagination : 'server',
            mobileResponsive : true,
            checkOnInit : true,
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
                field: 'name',
                title: '操作人',
                align : 'center',
				formatter : function(value, row, index) {
                    return value + '（' + row.username + '）';
				}
            },{
                field: 'type',
                title: '操作类型',
                align : 'center'
            },{
                field: 'content',
                title: '操作内容',
                align : 'left',
                formatter:function(value,row,index) {
                    var ret = '<span title="' + value + '">';
                    if(value.length > 30) {
                        ret += value.substring(0,30) + '...';
                    }else {
                        ret += value;
					}
					ret += '</span>';
                    return ret;
                }
            }, {
                field: 'ip',
                searchable : true,
                title: '访问IP',
                'class' : 'nowrap',
                align : 'center'
            }, {
                field: 'createdTime',
                searchable : true,
                title: '操作时间',
                'class' : 'nowrap',
                align : 'center'
            }]
        });
    });

</script>

</body>
</html>