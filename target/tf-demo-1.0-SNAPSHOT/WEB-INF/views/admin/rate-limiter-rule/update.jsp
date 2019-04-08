<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑限流规则</title>
    <%@include file="/WEB-INF/layouts/edit-header.jsp"%>

    <style type="text/css">
        .detail-label {font-weight:normal;text-align:left !important;}
    </style>
</head>
<body>

<div class="tpanel">
    <div class="panel-content">
        <div class="container-fluid">

            <form id="createForm" class="form-horizontal">
                <input type="hidden" name="id" value="${entity.id}" />
                <div class="form-group form-group-first">
                    <label for="uri" class="col-sm-2 control-label">URI</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control"
                               id="uri" name="uri"
                               value="${entity.uri}"
                               placeholder="请输入URI(必填)" required

                               minlength="0" maxlength="1000"
                        />
                    </div>
                </div>

                <div class="form-group">
                    <label for="permitsPerSecond" class="col-sm-2 control-label">每秒产生许可数量</label>
                    <div class="col-sm-8">
                        <input type="number" class="form-control"
                               id="permitsPerSecond" name="permitsPerSecond"

                               value="${entity.permitsPerSecond}"

                               placeholder="请输入每秒产生许可数量(必填)" required
                               min="0" max="9999999999"
                        />
                    </div>
                </div>

                <div class="form-group">
                    <label for="acquirePermits" class="col-sm-2 control-label">每次获取许可数量</label>
                    <div class="col-sm-8">
                        <input type="number" class="form-control"
                               id="acquirePermits" name="acquirePermits"

                               value="${entity.acquirePermits}"
                               digits="true"
                               placeholder="请输入每次获取许可数量(必填)" required
                               min="0" max="9999999999"
                        />
                    </div>
                </div>

                <div class="form-group">
                    <label for="warmupPeriod" class="col-sm-2 control-label">预热时间</label>
                    <div class="col-sm-1">
                        <label class="control-label detail-label"><input type="checkbox" name="warmup" id="warmup" onclick="checkWarmup()" value="true"> 开启</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" disabled
                               id="warmupPeriod" name="warmupPeriod"

                               value="${entity.warmupPeriod}"
                               digits="true"
                               placeholder="请输入预热时间"
                               min="0" max="9999999999"
                        />

                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" id="warmupTimeUnit" name="warmupTimeUnit" disabled>
                            <option value="DAYS">天</option>
                            <option value="HOURS">小时</option>
                            <option value="MINUTES">分钟</option>
                            <option value="SECONDS">秒</option>
                            <option value="MILLISECONDS">毫秒</option>
                            <option value="MICROSECONDS">微秒</option>
                            <option value="NANOSECONDS">纳秒</option>
                        </select>
                    </div>

                </div>

                <div class="form-group">
                    <label for="timeout" class="col-sm-2 control-label">超时时间</label>
                    <div class="col-sm-1">
                        <label class="control-label detail-label"><input type="checkbox" name="isTry" id="isTry" onclick="checkIsTry()" value="true"> 开启</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="number" class="form-control"
                               id="timeout" name="timeout" disabled

                               value="${entity.timeout}"
                               digits="true"
                               placeholder="请输入超时时间"
                               min="0" max="9999999999"
                        />
                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" id="timeoutUnit" name="timeoutUnit" disabled>
                            <option value="DAYS">天</option>
                            <option value="HOURS">小时</option>
                            <option value="MINUTES">分钟</option>
                            <option value="SECONDS">秒</option>
                            <option value="MILLISECONDS">毫秒</option>
                            <option value="MICROSECONDS">微秒</option>
                            <option value="NANOSECONDS">纳秒</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12" style="text-align: center;">
                        <a class="btn btn-default" href="javascript:back();">返回</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" class="btn btn-primary" value="保存" />
                    </div>
                </div>

            </form>

        </div>
    </div>
</div>

<script type="text/javascript">
    changeTitle('编辑限流规则');
    $(function() {

        $('#warmupPeriod').val('${entity.warmupPeriod}');
        $('#warmupTimeUnit').val('${entity.warmupTimeUnit}');
        if('${entity.warmupPeriod}' != '' || '${entity.warmupTimeUnit}' != '') {
            $('#warmup').attr('checked', true);
            $('#warmupPeriod').attr('disabled', false);
            $('#warmupTimeUnit').attr('disabled', false);
        }

        $('#timeout').val('${entity.timeout}');
        $('#timeoutUnit').val('${entity.timeoutUnit}');
        if('${entity.timeout}' != '' || '${entity.timeoutUnit}' != '') {
            $('#isTry').attr('checked', true);
            $('#timeout').attr('disabled', false);
            $('#timeoutUnit').attr('disabled', false);
        }

        initForm('#createForm','${ctx}/admin/rate-limiter-rule/update',function(r) {
            var resp = $.parseJSON(r);
            if(resp.code == 'OK') {
                changeUrl('${ctx}/admin/rate-limiter-rule');
                topLayer.msg('保存成功', {icon: 1});
            }else {
                topLayer.msg(resp.message, {icon: 2});
            }
        });
    });

    function checkWarmup() {
        var warmup = $('#warmup').is(':checked');
        if(!warmup) {
            $('#warmupPeriod').val('');
            $('#warmupTimeUnit').val('');
            $('#warmupPeriod').attr('disabled', true);
            $('#warmupTimeUnit').attr('disabled', true);
        }else {
            $('#warmupPeriod').attr('disabled', false);
            $('#warmupTimeUnit').attr('disabled', false);
        }
    }
    function checkIsTry() {
        var isTry = $('#isTry').is(':checked');
        if(!isTry) {
            $('#timeout').val('');
            $('#timeoutUnit').val('');
            $('#timeout').attr('disabled', true);
            $('#timeoutUnit').attr('disabled', true);
        }else {
            $('#timeout').attr('disabled', false);
            $('#timeoutUnit').attr('disabled', false);
        }
    }
</script>
</body>
</html>
