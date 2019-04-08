<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>系统权限</title>
		<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
		<link rel="stylesheet" href="${staticPath}/admin/lib/nestable/jquery.nestable.css" />
		<link rel="stylesheet" href="${staticPath}/admin/lib/Font-Awesome/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${staticPath}/admin/lib/chosen/chosen.min.css" />
		<link rel="stylesheet" href="${staticPath}/admin/lib/zTree_v3-3.5.28/css/metroStyle/metroStyle.css" />
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
		<script type="text/javascript" src="${staticPath}/admin/lib/chosen/chosen.jquery.min.js" ></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/nestable/jquery.nestable.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/tf/tf.nestable.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/zTree_v3-3.5.28/js/jquery.ztree.core.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/zTree_v3-3.5.28/js/jquery.ztree.excheck.js"></script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3">
					<div class="tpanel">
						<div class="panel-title">
							<h5>权限</h5>
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
										<button type="button" class="btn btn-primary" onclick="createMenu()" style="padding-left:12px;padding-right:12px;">创建权限</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<div class="col-sm-9">
					
					<div class="tpanel">
						<div class="panel-title">
							<h5 id="menuFormTitle">创建权限</h5>
						</div>
						<div class="panel-content">
							<div class="container-fluid">
								<form id="menuForm" class="form-horizontal">
									<input id="id" name="id" type="hidden" />
								  	<div class="form-group form-group-first">
										<label for="name" class="col-sm-2 control-label">权限名称</label>
										<div class="col-sm-10">
								  			<input type="text" class="form-control" name="name" id="name" placeholder="权限名称"
												required maxlength="20" />
										</div>
								  	</div>
									<div class="form-group">
										<label for="code" class="col-sm-2 control-label">权限代码</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="code" id="code" placeholder="权限代码"
												   required maxlength="20" remote="${ctx}/admin/sys-perm/exist?property=code" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">显示菜单</label>
										<div class="col-sm-10">
											<div id="tree" class="ztree"></div>
										</div>
									</div>
									<div class="form-group">
										<label for="urls" class="col-sm-2 control-label">可访问资源</label>
										<div class="col-sm-10">
											<select id="urls" name="urls" class="form-control" multiple style="height:300px;">
												<c:forEach items="${urls}" var="url">
													<option value="${url.id}">${url.description}(${url.url})</option>
												</c:forEach>
											</select>
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
    changeTitle('系统权限');
    var zTreeObj;
    var validator;
    jQuery(function() {
        loadMenuTree();
        loadMenuTree2();
        $('.dd').nestable({maxDepth : 2});

        validator = $('#menuForm').validate({
            focusCleanup:true,
            focusInvalid:false,
            errorClass: "unchecked",
            validClass: "checked",
            errorElement: "span",
            submitHandler:function(form){
                var url = "${ctx}/admin/sys-perm/create-perm";
                if($('#id').val().length > 0) {
                    url = "${ctx}/admin/sys-perm/update-perm";
                }
                var nodes = zTreeObj.getCheckedNodes(true);
                var nodeIds = new Array();
                for(var i in nodes) {
					nodeIds.push(nodes[i].id);
				}
                $(form).ajaxSubmit({
                    type:"post",
                    data : {menus:nodeIds},
                    url:url,
                    beforeSubmit: function() {
                        topLayer.load();
                    },
                    success: function(r) {
                        var resp = $.parseJSON(r);
                        topLayer.closeAll('loading');
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
    /*$("#urls").chosen();*/
    function createMenu() {
        $('#menuForm')[0].reset();
        validator.resetForm();
        zTreeObj.checkAllNodes(false);
        $('#description').text('');
        $('#id').val('');
        $('#menuFormTitle').text('创建权限');
        $('#code').attr('remote','${ctx}/admin/sys-perm/exist?property=code');
    }
    function saveSort() {
        var json = $('.dd').nestable('serialize');
        topLayer.load();
        $.ajax({
            type: "POST",
            url: '${ctx}/admin/sys-perm/save-sort',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(json),
            dataType: "json",
            success: function (resp) {
                topLayer.closeAll('loading');
                if(resp.code == 'OK') {
                    window.parent.layer.msg('保存成功', {icon: 1});
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
    function modifyMenu(id,e) {
        $.getJSON('${ctx}/admin/sys-perm/get?id=' + id,function(resp) {
            if(resp.code == 'OK') {
                $('#menuFormTitle').text('编辑权限');
                $('#menuForm')[0].reset();
                validator.resetForm();
				$('#id').val(resp.body.id);
                $('#name').val(resp.body.name);
                $('#code').val(resp.body.code);
                $('#code').attr('remote','${ctx}/admin/sys-perm/exist?property=code&id=' + resp.body.id);
                $('#description').text(resp.body.description);
                zTreeObj.checkAllNodes(false);
                for(var i in resp.body.menuIds) {
                    var node = zTreeObj.getNodeByParam("id", resp.body.menuIds[i], null);
                    zTreeObj.checkNode(node, true, true);
				}
                $('#urls').val(resp.body.urlIds);
			}else {
                topLayer.msg('获取权限信息失败:' + resp.message, {icon: 2});
			}
		});
        stopBubble(e);
	}
	function loadMenuTree() {
        generateNestableTree('${ctx}/admin/sys-perm/list','.dd','modifyMenu','deleteMenu');
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
                    $.post('${ctx}/admin/sys-perm/careful-delete',{id:id,password:result},function(resp) {
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

    function loadMenuTree2() {
        $.getJSON('${ctx}/admin/sys-menu/list-enable',function(result) {
            if(result.code == 'OK') {
                var data = convert(result.body);
                // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
                var setting = {
                    check : {
                        enable : true,
						chkStyle : 'checkbox',
						chkboxType : { "Y" : "p", "N" : "ps" }
					}
				};
                zTreeObj = $.fn.zTree.init($("#tree"), setting, data);
            }
        });
    }
    function convert(data) {
        var param = {
            list:data,
            inParams:{
                pid:"parentId",
                rootId : null,
                id:'id'
            },
            outParams:{
                children:"children",
                pid:"pid",
                name:'name',
                id:'id'
            },
            sort:{
                orderBy:["sort"],
                sort:"asc"
            }
        };
        var tree = wg_listToTree(param);
        return tree;
    }
</script> 
	</body>
</html>
