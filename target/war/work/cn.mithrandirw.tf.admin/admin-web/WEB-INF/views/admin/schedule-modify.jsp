<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改任务</title>
		<%@include file="/WEB-INF/layouts/detail-header.jsp"%>
	</head>
	<body>
		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
			
					<form id="createForm" class="form-horizontal">
					  	<div class="form-group form-group-first">
							<label class="col-sm-2 control-label">任务名称</label>
							<div class="col-sm-8">
					  			<label class="detail-label">${entity.name}</label>
							</div>
					  	</div>
						<div class="form-group">
							<label for="jobGroup" class="col-sm-2 control-label">任务组</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="jobGroup" name="jobGroup"
									   placeholder="请输入任务组(必填)" required maxlength="50"/>
							</div>
						</div>
						<div class="form-group">
							<label for="cronExpression" class="col-sm-2 control-label">Cron</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="cronExpression" name="cronExpression"
									   placeholder="请输入Cron(必填)" required maxlength="50"/>
							</div>
						</div>
						<div class="form-group">
							<label for="beanId" class="col-sm-2 control-label">BeanId</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="beanId" name="beanId"
									   placeholder="请输入beanId(必填)" required maxlength="50"/>
							</div>
						</div>
						<div class="form-group">
							<label for="beanClass" class="col-sm-2 control-label">BeanClass</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="beanClass" name="beanClass"
									   placeholder="请输入beanClass(必填)" required maxlength="50"/>
							</div>
						</div>
						<div class="form-group">
							<label for="methodName" class="col-sm-2 control-label">方法名</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="methodName" name="methodName"
									   placeholder="请输入methodName(必填)" required maxlength="50"/>
							</div>
						</div>
						<div class="form-group">
							<label for="isConcurrent" class="col-sm-2 control-label">状态</label>
							<div class="col-sm-8">
								<label><input type="radio" id="isConcurrent" name="isConcurrent"/> 有</label>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<label><input type="radio" name="isConcurrent"/> 无</label>
							</div>
						</div>
					  	<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<a class="btn btn-default" href="javascript:window.history.back();">返回</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" class="btn btn-primary" value="保存" />
							</div>
					  	</div>
					  	
					</form>
				
				</div>
			</div>
		</div>
		<script type="text/javascript">
			window.parent.changeTitle('添加任务');
			$(function() {

                $('#createForm').validate({
                    focusCleanup:true,
					focusInvalid:false,
                    errorClass: "unchecked",
                    validClass: "checked",
                    errorElement: "span",
                    submitHandler:function(form){
                        $(form).ajaxSubmit({
                            type:"post",
                            url:"${ctx}/admin/schedule/create",
                            beforeSubmit: function() {
								window.parent.layer.load();
							},
                            success: function() {
                                window.parent.layer.closeAll('loading');
                                window.location.href = '${ctx}/admin/schedule';
                                window.parent.layer.msg('保存成功', {icon: 1});
							}
                        });
                        return false;
                    },
                    errorPlacement:function(error,element){
                        var s = element.parent().find("span[htmlFor='" + element.attr("id") + "']");
                        if(s!=null){
                            s.remove();
                        }
                        error.appendTo(element.parent());
                    },
                    success: function(label) {
                        label.removeClass("unchecked").addClass("checked");
                    }
                });
			});
		</script>
	</body>
</html>
