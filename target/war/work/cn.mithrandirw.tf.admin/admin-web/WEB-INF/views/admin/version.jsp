<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>版本信息</title>
		<%@include file="/WEB-INF/layouts/index-header.jsp"%>
	</head>
	<body>

		<div class="tpanel">
			<div class="panel-content">
				<div class="container-fluid">
					<div id="content" style="padding:50px;">

					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="${staticPath}/admin/markdown/markd.min.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/markdown/highlight.min.js"></script>
		<script type="text/javascript">
			changeTitle('版本信息');

			$(function() {
                $.get('${ctx}/version.md?timestamp=' + new Date().getTime(), function(txt) {
                    $('#content').html(marked(txt));
				});
			});
		</script>
	</body>
</html>
