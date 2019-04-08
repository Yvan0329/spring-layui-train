<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>分配权限</title>
		<%@include file="/WEB-INF/layouts/edit-header.jsp"%>
		<style type="text/css">
			.row {
				margin-right: 15px;
				margin-left: 15px;
				padding-top:30px;
				padding-bottom:30px;
				border-bottom: 1px dashed #CCC;
			}
			.no-dashed {
				border-bottom: none;
			}
			.perm {
				display:inline-block;
				padding:10px 20px;
			}
			.perm label {
				color:#666;
				font-weight:normal;
			}
			.catalog label {
				font-weight: bold;
			}
		</style>
	</head>
	<body>

		<div class="tpanel">
			<div class="panel-content">
				<form id="assignForm">
					<input type="hidden" name="id" value="${id}" />
				<div class="container-fluid">
					<c:forEach items="${perms}" var="perm">
						<div class="row">
							<div class="col-sm-2">
								<div class="perm catalog"><label title="${perm.description}"><input class="perm-catalog" type="checkbox" name="permIds" ${perm.isBind ? 'checked':''} value="${perm.id}" /> ${perm.name}</label></div>
							</div>
							<div class="col-sm-10">
								<c:forEach items="${perm.childrens}" var="childPerm">
									<div class="perm"><label title="${childPerm.description}"><input class="child-perm" type="checkbox" name="permIds" ${childPerm.isBind ? 'checked':''} value="${childPerm.id}" /> ${childPerm.name}</label></div>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
					<div class="row no-dashed">
						<div class="col-sm-12">
							<div class="col-sm-12" style="text-align: center;">
								<a class="btn btn-default" href="javascript:back();">返回</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" class="btn btn-primary" value="保存" />
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
		<script type="text/javascript">
			changeTitle('分配权限');
			$(function() {
                $('.perm-catalog').change(function() {
                    if($(this).is(':checked')) {
                        var childPerms = $(this).parents('.row').find('input.child-perm:checkbox');
                        childPerms.prop("checked", true);
					}else {
                        var childPerms = $(this).parents('.row').find('input.child-perm:checkbox');
                        childPerms.prop("checked", false);
					}
				});
                $('input.child-perm:checkbox').change(function() {
                    if(!$(this).is(':checked')) {
                        $(this).parents('.row').find('.perm-catalog').prop("checked", false);
                    }else {
                        var parent = $(this).parent().parent().parent();
                        if(parent.find('input.child-perm:checkbox:checked').length ==
                            parent.find('input.child-perm:checkbox').length) {
                            $(this).parents('.row').find('.perm-catalog').prop("checked", true);
						}
					}
				});

                $(function() {
                    initForm('#assignForm', '${ctx}/admin/sys-role/assign-perm',
                        function(json) {
                            var resp = $.parseJSON(json);
                            if(resp.code == 'OK') {
                                changeUrl('${ctx}/admin/sys-role');
                                window.parent.layer.msg('保存成功', {icon: 1});
                            }else {
                                window.parent.layer.msg(resp.message, {icon: 2});
                            }
                        });
                });
			});
		</script>
	</body>
</html>
