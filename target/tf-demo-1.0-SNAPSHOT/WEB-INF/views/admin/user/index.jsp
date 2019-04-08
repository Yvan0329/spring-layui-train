<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户管理</title>
		<%@include file="/WEB-INF/layouts/index-header.jsp"%>
	</head>
	<body>
		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
					<div id="tool">
						<form id="searchForm" class="form-inline" onsubmit="return search('#searchForm','#table')" style="margin-top:20px;margin-bottom:20px;">
							<div class="form-group">
								<label class="">名称：</label>
								<input type="text" name="name" class="form-control"/>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary radius">
								  <span class="glyphicon glyphicon-search"></span> 查询
								</button>
								<a class="btn btn-success radius" href="${ctx}/admin/sys-user/quick-create">
								  <span class="glyphicon glyphicon-cog"></span> 创建用户
								</a>
							</div>
						</form>
					</div>
					<table id="table"></table>
				</div>
			</div>
		</div>

		<script type="text/javascript">
            changeTitle('用户管理');

        $(function() {
            $('#table').bootstrapTable({
                url: '${ctx}/admin/sys-user/list-by-name',
                idField : 'id',
                striped : true,
                uniqueId : 'id',
                mobileResponsive : true,
                checkOnInit : true,
                /*checkbox : true,*/
                /*clickToSelect : true,*/
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
                    field: 'username',
                    sortable : true,
                    title: '登录名',
                    align : 'left'
                },{
                    field: 'realName',
                    sortable : true,
                    title: '姓名',
                    align : 'left'
                },{
                    field: 'gender',
                    title: '性别',
                    align : 'center'
                },{
                    field: 'tel',
                    title: '联系电话',
                    align : 'left'
                },{
                    field: 'email',
                    title: '邮箱',
                    align : 'left'
                },{
                    field: 'lastLoginTime',
                    searchable : true,
                    sortable : true,
                    title: '上次登录时间',
                    align : 'center'
                },{
                    field: 'requestTime',
                    searchable : true,
                    title: '操作',
                    'class' : 'nowrap',
                    align : 'center',
                    formatter : operateFormatter
                }]
            });
        });

		function del(id) {
            carefulDelete('${ctx}/admin/sys-user/careful-delete',id,'请输入您的管理密码以确定删除此系统用户');
		}

        function operateFormatter(value,row,index) {
            var content = '<a href="${ctx}/admin/sys-user/reset-password?id=' + row.id + '" title="重置密码"><i class="iconfont icon-iconfontcolor11"></i></a>';
            content += '&nbsp;&nbsp;&nbsp;&nbsp;';
            content += '<a href="${ctx}/admin/sys-user/update?id=' + row.id + '" title="编辑"><i class="iconfont icon-iconfontcolor32"></i></a>';
            content += '&nbsp;&nbsp;&nbsp;&nbsp;';
            content += '<a href="javascript:del(' + row.id + ')" title="删除"><i class="iconfont icon-shanchu"></i></a>';
            return content;
        }
	</script>

	</body>
</html>
