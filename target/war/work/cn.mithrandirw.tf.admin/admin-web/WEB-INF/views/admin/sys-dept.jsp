<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>系统部门</title>
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
							<h5>部门</h5>
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
										<button type="button" class="btn btn-primary" onclick="createMenu()" style="padding-left:12px;padding-right:12px;">创建部门</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<div class="col-sm-9">
					
					<div class="tpanel">
						<div class="panel-title">
							<h5 id="menuFormTitle">创建部门</h5>
						</div>
						<div class="panel-content">
							<div class="container-fluid">
								<form id="menuForm" class="form-horizontal">
									<input id="id" name="id" type="hidden" />
								  	<div class="form-group form-group-first">
										<label for="name" class="col-sm-2 control-label">部门名称</label>
										<div class="col-sm-10">
								  			<input type="text" class="form-control" name="name" id="name" placeholder="部门名称"
												required maxlength="20" remote="${ctx}/admin/sys-dept/exist?property=name"/>
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
												保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
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
    changeTitle('系统部门');

    jQuery(function() {
        loadMenuTree();
        $('.dd').nestable({maxDepth : 3});
    });

    function createMenu() {
        $('#menuForm')[0].reset();
        validator.resetForm();
        $('#menuFormTitle').text('创建部门');
        $('#description').text('');
        $('#id').val('');
        $('#name').attr('remote','${ctx}/admin/sys-dept/exist?property=name');
    }
    function modifyMenu(id,e) {
        $.getJSON('${ctx}/admin/sys-dept/get?id=' + id,function(resp) {
            if(resp.code == 'OK') {
                $('#menuFormTitle').text('编辑部门');
                $('#menuForm')[0].reset();
                validator.resetForm();
				$('#id').val(resp.body.id);
                $('#name').val(resp.body.name);
                $('#name').attr('remote','${ctx}/admin/sys-dept/exist?property=name&id='+resp.body.id);
                $('#description').text(resp.body.description);
			}else {
                window.parent.layer.msg('获取部门信息失败:' + resp.message, {icon: 2});
			}
		});
        stopBubble(e);
	}
	function loadMenuTree() {
        generateNestableTree('${ctx}/admin/sys-dept/list','.dd','modifyMenu','deleteMenu');
	}

    function deleteMenu(id,e) {
        topBootbox.prompt({
            title: "请输入您的管理密码以确定删除此系统部门",
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
                    $.post('${ctx}/admin/sys-dept/careful-delete',{id:id,password:result},function(resp) {
                        if(resp.code == 'OK') {
                            window.parent.layer.msg('删除成功', {icon: 1});
                            loadMenuTree();
                            createMenu();
                        }else {
                            window.parent.layer.msg('删除失败:' + resp.message, {icon: 2});
                        }
                    },'json');
                }
            }
        });
        stopBubble(e);
    }

    function saveSort() {
        var json = $('.dd').nestable('serialize');
        topLayer.load();
        $.ajax({
            type: "POST",
            url: '${ctx}/admin/sys-dept/save-sort',
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

    var validator;
    $(function() {
        validator = $('#menuForm').validate({
            focusCleanup:true,
            focusInvalid:false,
            errorClass: "unchecked",
            validClass: "checked",
            errorElement: "span",
            submitHandler:function(form){
                var url = "${ctx}/admin/sys-dept/create";
                if($('#id').val().length > 0) {
                    url = "${ctx}/admin/sys-dept/update";
                }
                $(form).ajaxSubmit({
                    type:"post",
                    url:url,
                    beforeSubmit: function() {
                        topLayer.load();
                    },
                    success: function(r) {
                        var resp = $.parseJSON(r);
                        topLayer.closeAll('loading');
                        if(resp.code == 'OK') {
                            window.parent.layer.msg('保存成功', {icon: 1});
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
