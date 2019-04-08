<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
   <title>系统设置</title>
	<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
   <style type="text/css">
	   	body {
			/*background-color: #f3f3f4;
		    padding:20px;*/
		}
		.nav {
			background:#f3f3f4;
		}
		.tab-content {
			background:#FFF;
		}
		.nav-tabs>li>a {
			color:#999;
		}
   </style>
</head>
<body>

			<ul id="myTab" class="nav nav-tabs">
				<li class="active">
			   		<a href="#base-settings" data-toggle="tab">基本设置</a>
			   	</li>
				<li>
					<a href="#email-settings" data-toggle="tab">邮件设置</a>
				</li>
			   	<%--<li>
			   		<a href="#filterrequest-settings" data-toggle="tab">安全设置</a>
			   	</li>

			   	<li>
			   		<a href="#other-settings" data-toggle="tab">其他设置</a>
			   	</li>--%>
			</ul>
			<div id="myTabContent" class="tab-content">
			   <div class="tab-pane fade in active" id="base-settings">
			      <form id="baseSettingsForm" class="form-horizontal">
					  	<div class="form-group form-group-first">
							<label for="siteName" class="col-sm-2 control-label">站点名称</label>
							<div class="col-sm-8">
					  			<input type="text" class="form-control" name="siteName" id="siteName" placeholder="站点名称"
									required maxlength="30" value="${baseSettings.siteName}" />
							</div>
					  </div>
					  <div class="form-group">
							<label for="copyright" class="col-sm-2 control-label">版权信息</label>
							<div class="col-sm-8">
					  			<input type="text" class="form-control" name="copyright" id="copyright" placeholder="版权信息"
									   required maxlength="100" value="${baseSettings.copyright}" />
							</div>
					  </div>
					  	<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<input type="reset" class="btn btn-default" value="默认" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" class="btn btn-primary" value="保存" />
							</div>
					  	</div>
					  	
					</form>
			   </div>
				<div class="tab-pane fade" id="email-settings">
					<form id="emailSettingsForm" class="form-horizontal">
						<div class="form-group form-group-first">
							<label for="mailHost" class="col-sm-2 control-label">SMTP服务器</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="mailHost" name="mailHost" value="${emailConfig.mailHost}"
									   required maxlength="50" placeholder="请输入SMTP服务器地址">
							</div>
						</div>
						<div class="form-group">
							<label for="mailPort" class="col-sm-2 control-label">SMTP端口</label>
							<div class="col-sm-8">
								<input type="number" class="form-control" id="mailPort" name="mailPort" value="${emailConfig.mailPort}"
									   min="1" max="65535" digits="true" placeholder="请输入SMTP端口" />
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">邮箱账号</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="username" name="username" value="${emailConfig.username}"
									   required maxlength="50" placeholder="请输入邮箱账号" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">邮箱密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="password" name="password" value="${emailConfig.password}"
									   required maxlength="50" placeholder="请输入邮箱密码" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<button type="reset" class="btn btn-default">默认</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" id="testMail" class="btn btn-default">测试</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="submit" class="btn btn-primary">保存</button>
							</div>
						</div>

					</form>
				</div>
			   <%--<div class="tab-pane fade" id="filterrequest-settings">
			      <form class="form-horizontal">
					  	<div class="form-group form-group-first">
							<label for="inputPassword" class="col-sm-2 control-label">允许访问后台的IP列表：</label>
							<div class="col-sm-10">
					  			<textarea class="form-control" rows="3"></textarea>
							</div>
					  	</div>
					  	<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">后台登录失败最大次数</label>
							<div class="col-sm-10">
					  			<input type="text" class="form-control" id="inputPassword" placeholder="Password" />
							</div>
					  	</div>
					  	<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<button type="button" class="btn btn-default">返回</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-primary">保存</button>
							</div>
					  	</div>
					  	
					</form>
			   </div>

			   <div class="tab-pane fade" id="other-settings">
			      <form class="form-horizontal">
					  	<div class="form-group form-group-first">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
					  			<p class="form-control-static">email@example.com</p>
							</div>
					  	</div>
					  	<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
					  			<input type="password" class="form-control" id="inputPassword" placeholder="Password">
							</div>
					  	</div>
					  	<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">禁用</label>
							<div class="col-sm-10">
					  			<input type="password" class="form-control" id="inputPassword" placeholder="Password" disabled />
							</div>
					  	</div>
					  	<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">只读</label>
							<div class="col-sm-10">
					  			<input type="password" class="form-control" id="inputPassword" placeholder="Password" readonly />
							</div>
					  	</div>
					  	<div class="form-group">
					  		<label for="inputPassword" class="col-sm-2 control-label">单选</label>
							<div class="col-sm-10">
								<label class="check-label"><input type="radio" name="iCheck">选项一</label>
								<label class="check-label"><input type="radio" name="iCheck" checked>选项二</label>
							</div>
					  	</div>
					  	<div class="form-group">
					  		<label for="inputPassword" class="col-sm-2 control-label">多选</label>
							<div class="col-sm-10">
								<label class="check-label"><input type="checkbox">选项一</label>
								<label class="check-label"><input type="checkbox" checked>选项二</label>
							</div>
					  	</div>					  	
					  	
					  	<div class="form-group">
						  	<label for="inputPassword" class="col-sm-2 control-label">下拉列表</label>
							<div class="col-sm-10">
					  			<select class="form-control">
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								</select>
							</div>
						</div>
					  	<div class="form-group">
							<div class="col-sm-12" style="text-align: center;">
								<button type="button" class="btn btn-default">返回</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-primary">保存</button>
							</div>
					  	</div>
					  	
					</form>
			   </div>--%>
			</div>


			<script type="text/javascript">
                changeTitle('系统设置');
                $(function() {
                    initForm('#baseSettingsForm', '${ctx}/admin/sys-settings/base-settings',
                        function(json) {
                            var resp = $.parseJSON(json);
                            if(resp.code == 'OK') {
                                topLayer.msg('保存成功', {icon: 1});
                            }else {
                                topLayer.msg(resp.message, {icon: 2});
                            }
                        });

                    initForm('#emailSettingsForm', '${ctx}/admin/sys-settings/email-config',
                        function(json) {
                            var resp = $.parseJSON(json);
                            if(resp.code == 'OK') {
                                topLayer.msg('保存成功', {icon: 1});
                            }else {
                                topLayer.msg(resp.message, {icon: 2});
                            }
                        });

                    $('#testMail').click(function() {
                        var ok = $('#emailSettingsForm').valid();
                        if(ok) {
                            $('#emailSettingsForm').ajaxSubmit({
                                type:"post",
                                url : '${ctx}/admin/sys-settings/test-email-config',
                                beforeSubmit: function() {
                                    topLayer.load();
                                },
                                success: function(r) {
                                    topLayer.closeAll('loading');
                                    var resp = $.parseJSON(r);
                                    if(resp.code == 'OK') {
                                        topLayer.msg('已发送测试邮件，请查收！', {icon: 1});
                                    }else {
                                        topLayer.msg(resp.message, {icon: 2});
                                    }
                                }
                            });
						}
					});
                });
			</script>

</body>
</html>