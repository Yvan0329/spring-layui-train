<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改属性</title>
		<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
	</head>
	<body>

		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
			
					<form id="createForm" class="form-horizontal">
						<input type="hidden" name="id" value="${entity.id}" />
					  	<div class="form-group form-group-first">
							<label for="name" class="col-sm-2 control-label">属性名称</label>
							<div class="col-sm-8">
					  			<input type="text" class="form-control" id="name" name="name" value="${entity.name}"
									   placeholder="请输入属性名称(必填)" required maxlength="50"
									remote="${ctx}/admin/sys-prop/exist?property=name&id=${entity.id}" />
							</div>
					  	</div>
						<div class="form-group">
							<label for="type" class="col-sm-2 control-label">数据类型</label>
							<div class="col-sm-8">
								<select class="form-control" id="type" name="type">
									<option value="Number">数字</option>
									<option value="Boolean">布尔型</option>
									<option selected value="String">字符串</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="value" class="col-sm-2 control-label">属性值</label>
							<div class="col-sm-8" id="value-group">
								<input id="value" type="hidden" />
							</div>
						</div>
					  	<div class="form-group">
							<label for="description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-8">
					  			<textarea id="description" name="description" class="form-control"
										  rows="3" maxlength="100">${entity.description}</textarea>
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
			changeTitle('修改属性');

            function switchType() {
                switch($('#type').val()) {
                    case 'Number':
                        $('#value-group').html('<input type="number" class="form-control" id="value" name="value"' +
                            ' placeholder="请输入属性值(必填)" required maxlength="100"/>');
                        $('#value').val('${entity.value}');
                        break;
                    case 'Boolean':
                        $('#value-group').html('<label><input type="radio" value="true" id="value" name="value"/> true</label>'
                            + '&nbsp;&nbsp;&nbsp;&nbsp;'
                            + '<label><input type="radio" value="false" name="value"/> false</label>');
                        $("input[name='value'][value='${entity.value}']").attr('checked','checked');
                        break;
                    case 'String':
                        $('#value-group').html('<input type="text" class="form-control" id="value" name="value"' +
                            ' placeholder="请输入属性值(必填)" required maxlength="8000"/>');
                        $('#value').val('${entity.value}');
                        break;
                }

            }
			$(function() {
			    $('#type').change(switchType);

			    var type = '${entity.type}';
			    $('#type').val(type);
                switchType();

                initForm('#createForm', '${ctx}/admin/sys-prop/update',
                    function(json) {
                        var resp = $.parseJSON(json);
                        if(resp.code == 'OK') {
                            changeUrl('${ctx}/admin/sys-prop');
                            topLayer.msg('保存成功', {icon: 1});
                        }else {
                            topLayer.msg(resp.message, {icon: 2});
                        }
                    });
			});
		</script>
	</body>
</html>
