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
                <input type="hidden" name="id" value="${entity.id}"/>
                <div class="layui-form-item">
                    <label class="layui-form-label">名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" value="${entity.name}" required placeholder="请输入名称" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="description" value="${entity.description}" required placeholder="请输入描述" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-inline layui-form-item">
                    <label class="layui-form-label">分类</label>
                    <div class="layui-input-block">
                        <select name="sort">
                            <option value=""
                                    <c:if test="${entity.sort eq ''}">selected</c:if> ></option>
                            <option value="0"
                                    <c:if test="${entity.sort eq '0'}">selected</c:if> >北京
                            </option>
                            <option value="1"
                                    <c:if test="${entity.sort eq '1'}">selected</c:if> >上海
                            </option>
                            <option value="2"
                                    <c:if test="${entity.sort eq '2'}">selected</c:if> >广州
                            </option>
                            <option value="3"
                                    <c:if test="${entity.sort eq '3'}">selected</c:if> >深圳
                            </option>
                            <option value="4"
                                    <c:if test="${entity.sort eq '4'}">selected</c:if> >杭州
                            </option>
                        </select>
                    </div>
                </div>

                <div class="layui-inline layui-form-item">
                    <label class="layui-form-label">标志</label>
                    <div class="layui-input-block">
                        <select name="flag">
                            <option value=""
                                    <c:if test="${entity.flag eq ''}">selected</c:if> ></option>
                            <option value="0"
                                    <c:if test="${entity.flag eq '0'}">selected</c:if> >北京
                            </option>
                            <option value="1"
                                    <c:if test="${entity.flag eq '1'}">selected</c:if> >上海
                            </option>
                            <option value="2"
                                    <c:if test="${entity.flag eq '2'}">selected</c:if> >广州
                            </option>
                            <option value="3"
                                    <c:if test="${entity.flag eq '3'}">selected</c:if> >深圳
                            </option>
                            <option value="4"
                                    <c:if test="${entity.flag eq '4'}">selected</c:if> >杭州
                            </option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">选中</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="choiced" lay-skin="switch"
                               <c:if test="${entity.choiced}">checked</c:if> >
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">隐藏</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="visible" lay-skin="switch"
                               <c:if test="${entity.visible}">checked</c:if> >
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">删除</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="deleted" lay-skin="switch"
                               <c:if test="${entity.deleted}">checked</c:if> >
                    </div>
                </div>

                <div class="layui-inline layui-form-item">
                    <label class="layui-form-label">日期</label>
                    <div class="layui-input-block">
                        <input type="text" name="date" id="date1" autocomplete="off" class="layui-input" value=<fmt:formatDate value="${entity.date}"
                                                                                                                               pattern="yyyy-MM-dd"/>>
                    </div>
                </div>

                <div class="layui-inline layui-form-item">
                    <label class="layui-form-label">日期时间</label>
                    <div class="layui-input-block">
                        <input type="text" name="datetime" id="date2" autocomplete="off" class="layui-input" value='<fmt:formatDate value="${entity.datetime}"
                                                                                                                                   pattern="yyyy-MM-dd HH:mm:ss"/>'>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">方面</label>
                    <div class="layui-input-block">
                        <input type="radio" name="side"
                               <c:if test="${entity.side eq 'false'}">checked</c:if> value="0" title="正面">
                        <input type="radio" name="side"
                               <c:if test="${entity.side eq 'true'}">checked</c:if> value="1" title="反面">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <input type="radio" class="layui-input" name="state"
                               <c:if test="${entity.state eq '0'}">checked</c:if> value="0" id="rbNone" title="无"/>
                        <input type="radio" class="layui-input" name="state"
                               <c:if test="${entity.state eq '1'}">checked</c:if> value="1" id="rbAdd" title="添加"/>
                        <input type="radio" class="layui-input" name="state"
                               <c:if test="${entity.state eq '2'}">checked</c:if> value="2" id="rbCopy" title="复制"/>
                        <input type="radio" class="layui-input" name="state"
                               <c:if test="${entity.state eq '3'}">checked</c:if> value="3" id="rbEdit" title="编辑"/>
                        <input type="radio" class="layui-input" name="state"
                               <c:if test="${entity.state eq '4'}">checked</c:if> value="4" id="rbView" title="详细"/>
                        <input type="radio" class="layui-input" name="state"
                               <c:if test="${entity.state eq '5'}">checked</c:if> value="5" id="rbOther" title="其他"/>
                    </div>
                </div>

                <div class="layui-inline layui-form-item">
                    <label class="layui-form-label">数量</label>
                    <div class="layui-input-block">
                        <input type="number" name="quantity" placeholder="请输入" value="${entity.quantity}" autocomplete="off" class="layui-input"/>
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

        changeTitle('编辑');
        $(function () {
            initForm('#createForm', '${ctx}/admin/train/update', function (r) {
                var resp = $.parseJSON(r);
                if (resp.code == 'OK') {
                    changeUrl('${ctx}/admin/train');
                    topLayer.msg('保存成功', {icon: 1});
                } else {
                    topLayer.msg(resp.message, {icon: 2});
                }
            });

        });
    });
</script>
</body>
</html>
