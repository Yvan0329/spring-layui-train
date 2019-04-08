<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>创建培训</title>
    <link rel="stylesheet" href="${staticPath}/layui/css/layui.css"/>
    <script src="${staticPath}/layui/layui.js"></script>
    <script src="${staticPath}/admin/tf/jquery.min.js"></script>
    <script type="text/javascript" src="${staticPath}/admin/tf/content.js"></script>
    <script src="${staticPath}/admin/lib/jquery.form/jquery.form.min.js"></script>
    <script src="${staticPath}/admin/lib/jquery.form/jquery.validate.min.js"></script>
    <script src="${staticPath}/admin/lib/jquery.form/jquery.validate.extend.js"></script>
</head>
<body>

<div class="tpanel" style="padding-top: 30px;padding-right: 30px">
    <div class="panel-content">
        <div class="container-fluid">
            <form id="createForm" class="layui-form" action="${ctx}/admin/train/create">
                <div class="layui-form-item">
                    <label class="layui-form-label">名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="description" required lay-verify="required" placeholder="请输入描述" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-inline layui-form-item">
                    <label class="layui-form-label">分类</label>
                    <div class="layui-input-block">
                        <select name="sort" lay-verify="required">
                            <option value=""></option>
                            <option value="0">北京</option>
                            <option value="1">上海</option>
                            <option value="2">广州</option>
                            <option value="3">深圳</option>
                            <option value="4">杭州</option>
                        </select>
                    </div>
                </div>

                <div class="layui-inline layui-form-item">
                    <label class="layui-form-label">标志</label>
                    <div class="layui-input-block">
                        <select name="flag" lay-verify="required">
                            <option value=""></option>
                            <option value="0">北京</option>
                            <option value="1">上海</option>
                            <option value="2">广州</option>
                            <option value="3">深圳</option>
                            <option value="4">杭州</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">选中</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="choiced" lay-skin="switch" lay-verify="required">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">隐藏</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="visible" lay-skin="switch" lay-verify="required">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">删除</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="deleted" lay-skin="switch" lay-verify="required">
                    </div>
                </div>

                <div class="layui-inline layui-form-item">
                    <label class="layui-form-label">日期</label>
                    <div class="layui-input-block">
                        <input type="text" name="date" id="date1" autocomplete="off" class="layui-input" lay-verify="required">
                    </div>
                </div>

                <div class="layui-inline layui-form-item">
                    <label class="layui-form-label">日期时间</label>
                    <div class="layui-input-block">
                        <input type="text" name="datetime" id="date2" autocomplete="off" class="layui-input" lay-verify="required">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">方面</label>
                    <div class="layui-input-block">
                        <input type="radio" name="side" value="0" title="正面" lay-verify="required">
                        <input type="radio" name="side" value="1" title="反面" lay-verify="required">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <input type="radio" class="layui-input" name="state" value="0" id="rbNone" title="无" lay-verify="required"/>
                        <input type="radio" class="layui-input" name="state" value="1" id="rbAdd" title="添加" lay-verify="required"/>
                        <input type="radio" class="layui-input" name="state" value="2" id="rbCopy" title="复制" lay-verify="required"/>
                        <input type="radio" class="layui-input" name="state" value="3" id="rbEdit" title="编辑" lay-verify="required"/>
                        <input type="radio" class="layui-input" name="state" value="4" id="rbView" title="详细" lay-verify="required"/>
                        <input type="radio" class="layui-input" name="state" value="5" id="rbOther" title="其他" lay-verify="required"/>
                    </div>
                </div>

                <div class="layui-inline layui-form-item">
                    <label class="layui-form-label">数量</label>
                    <div class="layui-input-block">
                        <input type="number" name="quantity" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required"/>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <a href="javascript:window.history.back();" class="layui-btn layui-btn-primary">返回</a>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date1'
        });

        //日期
        laydate.render({
            elem: '#date2'
            , type: 'datetime'
        });

        initForm('#createForm', '${ctx}/admin/train/create',
            function (json) {
                var resp = $.parseJSON(json);
                if (resp.code == 'OK') {
                    changeUrl('${ctx}/admin/train');
                    topLayer.msg('保存成功', {icon: 1});
                } else {
                    topLayer.msg(resp.message, {icon: 2});
                }
            });
    });
</script>
</body>
</html>
