<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>系统菜单</title>
		<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
		<link rel="stylesheet" href="${staticPath}/admin/lib/nestable/jquery.nestable.css" />
		<link rel="stylesheet" href="${staticPath}/admin/lib/Font-Awesome/css/font-awesome.min.css" />
		<style type="text/css">
			body {
			    padding:20px;
			}
			.tpanel .panel-title {
				border-bottom: 1px solid #E7EAEC;
			}
			.dd-handle {
				background: #FFF;
			}
			.dd-handle .op {
				position: absolute;right:10px;top:0px;bottom:0px;line-height:32px;
			}
			.dd-handle .op div {
				display:inline-block;
				margin-left:5px;
			}
			.dd-handle .op div.modify {
				color:#19AA8D;
			}
			.dd-handle .op div.delete {
				color:#F57575;
			}
			.tpanel .panel-content {
				padding-top:10px;
			}
		</style>
		<script src="${staticPath}/admin/tf/wg_listToTree1.1.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/nestable/jquery.nestable.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/tf/tf.nestable.js"></script>
		
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3">
					<div class="tpanel">
						<div class="panel-title">
							<h5>菜单</h5>
						</div>
						<div class="panel-content">
							<div class="container-fluid">
								<div class="dd">  

								</div>
								<div class="row" style="padding-top:15px;padding-bottom:15px;">
									<div class="col-sm-6">
										<button type="button" class="btn btn-default" onclick="saveSort()" style="padding-left:12px;padding-right:12px;">保存顺序</button>
									</div>
									<div class="col-sm-6">
										<button type="button" class="btn btn-primary" onclick="createMenu()" style="padding-left:12px;padding-right:12px;">创建菜单</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<div class="col-sm-9">
					
					<div class="tpanel">
						<div class="panel-title">
							<h5 id="menuFormTitle">创建菜单</h5>
						</div>
						<div class="panel-content">
							<div class="container-fluid">
								<form id="menuForm" class="form-horizontal">
									<input id="id" name="id" type="hidden" />
								  	<div class="form-group form-group-first">
										<label for="name" class="col-sm-2 control-label">菜单名称</label>
										<div class="col-sm-10">
								  			<input type="text" class="form-control" name="name" id="name" placeholder="菜单名称"
												required maxlength="20" />
										</div>
								  	</div>
									<div class="form-group">
										<label for="url" class="col-sm-2 control-label">菜单地址</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="url" id="url" placeholder="菜单地址"
												   maxlength="200" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">图标</label>
										<div class="col-sm-10" id="iconDiv">

										</div>
									</div>
									<div class="form-group">
										<label for="dataState" class="col-sm-2 control-label">是否启用</label>
										<div class="col-sm-10">
											<select class="form-control" id="dataState" name="dataState">
												<option value="Enable">启用</option>
												<option value="Disable">禁用</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="i18n" class="col-sm-2 control-label">国际化</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="i18n" id="i18n" placeholder="国际化"
												   maxlength="20" />
										</div>
									</div>
								  	<div class="form-group">
										<label for="description" class="col-sm-2 control-label">描述</label>
										<div class="col-sm-10">
								  			<textarea class="form-control" id="description" name="description" rows="3" maxlength="100"></textarea>
										</div>
								  	</div>
								  	<div class="form-group">
										<div class="col-sm-2"></div>
										<div class="col-sm-10">
											<button type="submit" class="btn btn-primary">
												保&nbsp;&nbsp;&nbsp;&nbsp;存
											</button>
										</div>
								  	</div>
								  	
								</form>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
<script type="text/javascript">
    changeTitle('系统菜单');
    jQuery(function() {
        loadMenuTree();
        loadIconfont();
        $('.dd').nestable({maxDepth : 3});
    });
    function createMenu() {
        $('#menuForm')[0].reset();
        $('#menuFormTitle').text('创建菜单');
        $('#id').val('');
        $('#description').text('');
    }
    function loadIconfont() {
        $.getJSON('${staticPath}/admin/iconfont/iconfont.json',function(icons) {
            var html = '';
            html += '<label class="control-label" style="margin-right:10px;">';
            html += '<input type="radio" checked name="iconCls" checked value=""/>&nbsp;&nbsp;';
            html += '无';
            html += '</label>';
            for(var i in icons) {
            	html += '<label class="control-label" style="margin-right:10px;">';
                html += '<input type="radio" name="iconCls" value="' + icons[i] + '"/>&nbsp;&nbsp;';
                html += '<span class="iconfont ' + icons[i] + '"></span>';
                html += '</label>';
			}
			$('#iconDiv').html(html);
		});
	}
    function modifyMenu(id,e) {
        $.getJSON('${ctx}/admin/sys-menu/get?id=' + id,function(resp) {
            if(resp.code == 'OK') {
                $('#menuFormTitle').text('编辑菜单');
                $('#menuForm')[0].reset();
                validator.resetForm();
				$('#id').val(resp.body.id);
                $('#name').val(resp.body.name);
                $('#url').val(resp.body.url);
                $('#description').text(resp.body.description);
                $('#i18n').val(resp.body.i18n);
                $('input[name="iconCls"][value="' + resp.body.iconCls + '"]').prop('checked','checked');
                $('#dataState').val(resp.body.dataState);
			}else {
                topLayer.msg('获取菜单信息失败:' + resp.message, {icon: 2});
			}
		});
        stopBubble(e);
	}
	function loadMenuTree() {
        generateNestableTree('${ctx}/admin/sys-menu/list','.dd','modifyMenu','deleteMenu');
	}

    function saveSort() {
        var json = $('.dd').nestable('serialize');
        topLayer.load();
        $.ajax({
            type: "POST",
            url: '${ctx}/admin/sys-menu/save-sort',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(json),
            dataType: "json",
            success: function (resp) {
                topLayer.closeAll('loading');
                if(resp.code == 'OK') {
                    topLayer.msg('保存成功', {icon: 1});
                    createMenu();
                    loadMenuTree();
                }else {
                    topLayer.msg(resp.message, {icon: 2});
                }
            },
            error: function (message) {
                topLayer.closeAll('loading');
                topLayer.msg(message, {icon: 2});
            }
        });
    }

    function deleteMenu(id,e) {
        topBootbox.prompt({
            title: "请输入您的管理密码以确定删除此系统菜单",
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
            inputType: 'password',
            callback: function (result) {
                if(result) {
                    $.post('${ctx}/admin/sys-menu/careful-delete',{id:id,password:result},function(resp) {
                        if(resp.code == 'OK') {
                            topLayer.msg('删除成功', {icon: 1});
                            loadMenuTree();
                            createMenu();
                        }else {
                            topLayer.msg('删除失败:' + resp.message, {icon: 2});
                        }
                    },'json');
                }
            }
        });

        stopBubble(e);
    }


    var validator;
    $(function() {
        validator = $('#menuForm').validate({
            focusCleanup:true,
            focusInvalid:false,
            errorClass: "unchecked",
            validClass: "checked",
            errorElement: "span",
            submitHandler:function(form){
                var url = "${ctx}/admin/sys-menu/create";
                if($('#id').val().length > 0) {
                    url = "${ctx}/admin/sys-menu/update";
                }
                $(form).ajaxSubmit({
                    type:"post",
                    url:url,
                    beforeSubmit: function() {
                        topLayer.load();
                    },
                    success: function(r) {
                        var resp = $.parseJSON(r);
                        window.parent.layer.closeAll('loading');
                        if(resp.code == 'OK') {
                            topLayer.msg('保存成功', {icon: 1});
                            createMenu();
                            loadMenuTree();
                        }else {
                            topLayer.msg(resp.message, {icon: 2});
                        }
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
