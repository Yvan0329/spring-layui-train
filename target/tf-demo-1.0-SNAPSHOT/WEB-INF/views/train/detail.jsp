<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Train详情</title>
    <%@include file="/WEB-INF/layouts/detail-header.jsp" %>
</head>
<body>

<div class="tpanel">
    <div class="panel-content">
        <div class="container-fluid">

            <form id="createForm" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">名称</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            ${entity.name}
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">描述</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            ${entity.description}
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">分类</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            ${entity.sort}
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">选中</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            ${entity.choiced}
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">删除</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            ${entity.deleted}
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">隐藏</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            ${entity.visible}
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">方面</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            ${entity.side}
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">状态</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            ${entity.state}
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">标志</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            ${entity.flag}
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">日期</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            <fmt:formatDate value="${entity.date}" pattern="yyyy-MM-dd"/>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">日期时间</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            <fmt:formatDate value="${entity.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">数量</label>
                    <div class="col-sm-8">
                        <label class="control-label detail-label">
                            ${entity.quantity}
                        </label>
                    </div>
                </div>

            </form>

        </div>
    </div>
</div>
</body>
</html>
