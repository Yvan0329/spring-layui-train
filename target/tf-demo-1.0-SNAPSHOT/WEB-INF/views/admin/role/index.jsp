<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>角色管理</title>
		<%@include file="/WEB-INF/layouts/index-header.jsp"%>
	</head>
	<body>
		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
					<div id="tool">
						<form id="searchForm" class="form-inline" onsubmit="return search('#searchForm','#table')"
							  style="margin-top:20px;margin-bottom:20px;">
							<div class="form-group">
								<label class="">角色名称：</label>
								<input type="text" name="search_LIKES_name" class="form-control" />
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary radius">
								  <span class="glyphicon glyphicon-search"></span> 查询
								</button>
								<a class="btn btn-success radius" href="${ctx}/admin/sys-role/create">
								  <span class="glyphicon glyphicon-cog"></span> 创建角色
								</a>
							</div>
						</form>
					</div> 
					<table id="table"></table>
				</div>
			</div>
		</div>

		<script type="text/javascript">
            changeTitle('角色管理');
        $(function() {
            $('#table').bootstrapTable({
                url: '${ctx}/admin/sys-role/list',
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
                    field: 'name',
                    sortable : true,
                    title: '角色名称',
                    align : 'left'
                },{
                    field: 'description',
                    title: '描述',
                    align : 'left'
                }, {
                    field: 'requestTime',
                    title: '操作',
                    'class' : 'nowrap',
                    align : 'center',
                    formatter : operateFormatter
                }]
            });

        });

		function del(id) {
			carefulDelete('${ctx}/admin/sys-role/careful-delete',id,'请输入您的管理密码以确定删除此系统角色');
		}

		function tip() {
            window.parent.layer.msg('开发者具有最高权限', {icon: 6});
		}

        function operateFormatter(value,row,index) {
            var content = '';
            if(row.code == 'Developer') {
            	content += '<a href="javascript:tip()" title="开发者具有最高权限"><i class="iconfont icon-caidanfenpeiquanxian"></i></a>';
			}else {
                content += '<a href="${ctx}/admin/sys-role/assign-perm?id=' + row.id + '" title="分配权限"><i class="iconfont icon-caidanfenpeiquanxian"></i></a>';
			}
            content += '&nbsp;&nbsp;&nbsp;&nbsp;';
            content += '<a href="${ctx}/admin/sys-role/update?id=' + row.id + '" title="编辑"><i class="iconfont icon-iconfontcolor32"></i></a>';
            if(row.code != 'Developer' && row.code != 'SuperAdmin' && row.code != 'Admin') {
                content += '&nbsp;&nbsp;&nbsp;&nbsp;';
                content += '<a href="javascript:del(' + row.id + ')" title="删除"><i class="iconfont icon-shanchu"></i></a>';
            }
            return content;
        }
	</script>

	</body>
</html>
