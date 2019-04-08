<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>培训</title>
    <link rel="stylesheet" href="${staticPath}/admin/tf/tf.form.css"/>
    <link rel="stylesheet" href="${staticPath}/layui/css/layui.css"/>
    <script src="${staticPath}/layui/layui.js"></script>
    <script src="${staticPath}/admin/tf/jquery.min.js"></script>
    <script type="text/javascript" src="${staticPath}/admin/tf/content.js"></script>
    <script src="${staticPath}/admin/lib/jquery.form/jquery.form.min.js"></script>
    <script src="${staticPath}/admin/lib/jquery.form/jquery.validate.min.js"></script>
    <script src="${staticPath}/admin/lib/jquery.form/jquery.validate.extend.js"></script>
</head>
<body>
<table id="table" lay-filter="test"/>
<script type="text/javascript">
    changeTitle('培训表单');

    layui.use('table', function () {
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#table'
            , height: 'full-10' //高度最大化减去差值
            , url: '${ctx}/admin/train/page-list' //数据接口
            , page: true //开启分页
            , parseData: function (res) { //res 即为原始返回的数据
                console.log(res)
                return {
                    "code": 0, //解析接口状态
                    "count": res.body.total, //解析数据长度
                    "data": res.body.rows //解析数据列表
                };
            }
            , toolbar: '<div><a class="layui-btn" href="${ctx}/admin/train/create">\n' +
                '                        <i class="layui-icon">&#xe608;</i> 添加\n' +
                '                    </a></div>'
            , defaultToolbar: []
            , loading: true
            , cols: [[ //表头
                {field: 'name', title: '名称', sort: true, fixed: 'left'},
                {field: 'description', title: '描述', sort: true, fixed: 'left'},
                {
                    field: 'date', title: '日期', sort: true, fixed: 'left', templet: function (d) {
                        var date = new Date(d.date);
                        return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
                    }
                },
                {field: 'datetime', title: '日期时间', sort: true, fixed: 'left'},
                {field: 'quantity', title: '数量', sort: true, fixed: 'left'},
                {field: 'side', title: '方面', sort: true, fixed: 'left'},
                {field: 'sort', title: '分类', sort: true, fixed: 'left'},
                {field: 'state', title: '状态', sort: true, fixed: 'left'},
                {
                    field: 'deleted', title: '删除', sort: true, fixed: 'left', templet: function (d) {
                        return d.deleted ? "是" : "否"
                    }
                },
                {
                    field: 'visible', title: '隐藏', sort: true, fixed: 'left', templet: function (d) {
                        return d.visible ? "是" : "否"
                    }
                },
                {
                    field: 'choiced', title: '选中', sort: true, fixed: 'left', templet: function (d) {
                        return d.choiced ? "是" : "否"
                    }
                },
                {title: '操作', fixed: 'right', toolbar: '#barDemo', minWidth: '170', align: 'center'}
            ]]
        });

        table.on('tool(test)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent === 'detail') { //查看
                //do somehing
                openWindow('查看详情', '${ctx}/admin/train/detail?id=' + data.id);
            } else if (layEvent === 'del') { //删除
                carefulDelete('${ctx}/admin/train/careful-delete', data.id, '请输入您的管理密码以确定删除此系统资源');
            } else if (layEvent === 'edit') { //编辑
                //do something
                window.location = '${ctx}/admin/train/update?id=' + data.id
            }
        });
    });
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
</html>
