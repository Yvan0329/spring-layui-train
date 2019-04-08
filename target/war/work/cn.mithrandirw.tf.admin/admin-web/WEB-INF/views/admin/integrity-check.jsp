<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>系统检查</title>
		<%@include file="/WEB-INF/layouts/detail-header.jsp"%>

		<style type="text/css">
			#console {
				font-size:12px;
				color:#AAA;padding:5px;background-color: #2d2d2d;width:100%;height:400px;overflow-y: scroll;
			}
		</style>
	</head>
	<body>

		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid" style="padding:20px;">
					<a class="btn btn-primary" href="javascript:check()" style="margin-bottom:10px;">执行检查</a>
					<ul>
						<c:forEach items="${rules}" var="rule">
							<li><span>${rule.name}</span> <i class="status"></i><a href="javascript:checkRule('${rule.id}')">执行</a></li>
						</c:forEach>
					</ul>
					<div id="console">
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			changeTitle('系统检查');

			function wsHandler(data) {
			    $('#console').html($('#console').html() +
					new Date().Format("yyyy-MM-dd hh:mm:ss") + '&nbsp;&nbsp;&nbsp;&nbsp;' + data + '<br/>');
			}

			function check() {
                $('#console').html('');
			    $.get('${ctx}/admin/integrity-check/check',function(r) {
					if(r.code == 'OK') {
					}else {
                        topLayer.msg(resp.message, {icon: 2});
					}
				}, 'json');
			}
            function checkRule(id) {
                $('#console').html('');
                $.get('${ctx}/admin/integrity-check/check-rule',{id: id},function(r) {
                    if(r.code == 'OK') {
                    }else {
                        topLayer.msg(resp.message, {icon: 2});
                    }
                }, 'json');
            }
		</script>
	</body>
</html>
