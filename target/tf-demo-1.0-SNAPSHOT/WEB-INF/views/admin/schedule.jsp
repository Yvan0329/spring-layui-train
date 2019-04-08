<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>系统任务</title>
	<%@include file="/WEB-INF/layouts/index-header.jsp"%>
</head>
<body>

<div class="tpanel">
	<div class="panel-content">
		<div class="container-fluid">
			<table id="table"></table>
		</div>
	</div>
</div>

<script type="text/javascript">
    changeTitle('系统任务');

    $(function() {
        $('#table').bootstrapTable({
            url: '${ctx}/admin/schedule/list',
            /*idField : 'id',*/
            striped : true,
            /*pagination : true,
            pageNumber : 1,
            pageSize : 25,
            sidePagination : 'server',
            uniqueId : 'id',*/
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
                field: 'jobName',
                title: '任务名称',
                align : 'center'
            },{
                field: 'jobGroup',
                title: '任务组',
                align : 'center'
            },{
                field: 'jobStatus',
                title: '任务状态',
                align : 'center',
				formatter : function(value,row,index) {
                    if(value == 'NORMAL') {
                        return '正常';
					}else if(value == 'PAUSED') {
                        return '暂停';
					}
					return value;
				}
            },{
                field: 'cronExpression',
                title: 'cron表达式',
                align : 'center'
            },{
                field: 'beanId',
                title: 'BeanId',
                align : 'center'
            },{
                field: 'beanClass',
                title: 'Bean类名',
                align : 'center'
            },{
                field: 'methodName',
                title: '执行方法',
                align : 'center'
            },{
                field: 'op',
                title: '操作',
                align : 'center',
                formatter : operateFormatter
            }]
        });

    });

    function del(jobName,jobGroup) {
        window.parent.bootbox.confirm({
            title : "提示",
            message: "确定删除此系统任务吗?",
            onEscape : true,
            backdrop : true,
            animate : true,
            buttons: {
                confirm: {
                    label: '删除',
                    className: 'btn-danger'
                },
                cancel: {
                    label: '取消',
                    className: ''
                }
            },
            callback: function (result) {
                if(result) {
                    $.post('${ctx}/admin/schedule/delete',{jobName:jobName,jobGroup:jobGroup},function(resp) {
                        if(resp.code == 'OK') {
                            window.parent.layer.msg('删除成功', {icon: 1});
                            $('#table').bootstrapTable('refresh');
                        }else {
                            window.parent.layer.msg('删除失败:' + resp.message, {icon: 2});
                        }
                    },'json');
                }
            }
        });
    }

    function pause(jobName,jobGroup) {
        window.parent.bootbox.confirm({
            title : "提示",
            message: "确定暂停此系统任务吗?",
            onEscape : true,
            backdrop : true,
            animate : true,
            buttons: {
                confirm: {
                    label: '暂停',
                    className: 'btn-danger'
                },
                cancel: {
                    label: '取消',
                    className: ''
                }
            },
            callback: function (result) {
                if(result) {
                    $.post('${ctx}/admin/schedule/pause',{jobName:jobName,jobGroup:jobGroup},function(resp) {
                        if(resp.code == 'OK') {
                            window.parent.layer.msg('暂停成功', {icon: 1});
                            $('#table').bootstrapTable('refresh');
                        }else {
                            window.parent.layer.msg('暂停失败:' + resp.message, {icon: 2});
                        }
                    },'json');
                }
            }
        });
    }

    function resume(jobName,jobGroup) {
        window.parent.bootbox.confirm({
            title : "提示",
            message: "确定恢复运行此系统任务吗?",
            onEscape : true,
            backdrop : true,
            animate : true,
            buttons: {
                confirm: {
                    label: '恢复',
                    className: 'btn-danger'
                },
                cancel: {
                    label: '取消',
                    className: ''
                }
            },
            callback: function (result) {
                if(result) {
                    $.post('${ctx}/admin/schedule/resume',{jobName:jobName,jobGroup:jobGroup},function(resp) {
                        if(resp.code == 'OK') {
                            window.parent.layer.msg('恢复成功', {icon: 1});
                            $('#table').bootstrapTable('refresh');
                        }else {
                            window.parent.layer.msg('恢复失败:' + resp.message, {icon: 2});
                        }
                    },'json');
                }
            }
        });
    }

    function run(jobName,jobGroup) {
        window.parent.bootbox.confirm({
            title : "提示",
            message: "确定立即执行此系统任务吗?",
            onEscape : true,
            backdrop : true,
            animate : true,
            buttons: {
                confirm: {
                    label: '执行',
                    className: 'btn-danger'
                },
                cancel: {
                    label: '取消',
                    className: ''
                }
            },
            callback: function (result) {
                if(result) {
                    $.post('${ctx}/admin/schedule/resume',{jobName:jobName,jobGroup:jobGroup},function(resp) {
                        if(resp.code == 'OK') {
                            window.parent.layer.msg('执行成功', {icon: 1});
                            $('#table').bootstrapTable('refresh');
                        }else {
                            window.parent.layer.msg('执行失败:' + resp.message, {icon: 2});
                        }
                    },'json');
                }
            }
        });
    }

    function operateFormatter(value,row,index) {
        var content = '';
        if(row.jobStatus == 'PAUSED') {
            content += '<a href="javascript:resume(\'' + row.jobName + '\',\'' + row.jobGroup + '\')" title="恢复运行"><i class="iconfont icon-jixu"></i></a>';
		}else if(row.jobStatus == 'NORMAL') {
            content += '<a href="javascript:pause(\'' + row.jobName + '\',\'' + row.jobGroup + '\')" title="暂停"><i class="iconfont icon-tag35"></i></a>';
		}
        content += '&nbsp;&nbsp;&nbsp;&nbsp;';
        content += '<a href="javascript:run(\'' + row.jobName + '\',\'' + row.jobGroup + '\')" title="立即执行"><i class="iconfont icon-zhongbo"></i></a>';
        content += '&nbsp;&nbsp;&nbsp;&nbsp;';
        /*content += '<a href="${ctx}/admin/schedule/update?name=' + row.jobName + '&group=' + row.jobGroup + '" title="编辑"><i class="iconfont icon-iconfontcolor32"></i></a>';
        content += '&nbsp;&nbsp;&nbsp;&nbsp;';*/
        content += '<a href="javascript:del(\'' + row.jobName + '\',\'' + row.jobGroup + '\')" title="删除"><i class="iconfont icon-shanchu"></i></a>';
        return content;
    }
</script>

</body>
</html>
