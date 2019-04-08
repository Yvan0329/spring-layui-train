<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>创建资源</title>
		<link rel="stylesheet" href="${staticPath}/admin/tf/reset.css" />
		<link href="${staticPath}/admin/iconfont/iconfont.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" href="${staticPath}/admin/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${staticPath}/admin/tf/tf.panel.css" />
		<link rel="stylesheet" href="${staticPath}/admin/tf/content.css" />

		<style type="text/css">
			.ibox-content {
				clear: both;
			}
			.ibox-content {
				background-color: #fff;
				color: inherit;
				padding: 15px 20px 20px;
			}
			#vertical-timeline {
				position: relative;
				padding: 0;
				margin-top: 2em;
				margin-bottom: 2em;
			}
			.vertical-container {
				width: 90%;
				max-width: 1170px;
				margin: 0 auto;
			}
			.vertical-timeline-block:first-child {
				margin-top: 0;
			}
			.vertical-timeline-block {
				position: relative;
				margin: 2em 0;
			}
			.navy-bg {
				background-color: #1ab394;
				color: #fff;
			}
			.vertical-timeline-icon {
				position: absolute;
				top: 0;
				left: 0;
				width: 40px;
				height: 40px;
				border-radius: 50%;
				font-size: 16px;
				border: 3px solid #f1f1f1;
				text-align: center;
			}
			.dark-timeline .vertical-timeline-content, .dark-timeline.center-orientation .vertical-timeline-content {
				background: #f5f5f5;
			}
			.vertical-timeline-content {
				position: relative;
				margin-left: 60px;
				background: #fff;
				border-radius: .25em;
				padding: 1em;
			}
			.blue-bg {
				background-color: #1c84c6;
				color: #fff;
			}
			.lazur-bg {
				background-color: #23c6c8;
				color: #fff;
			}
			.yellow-bg {
				background-color: #f8ac59;
				color: #fff;
			}
			.lazur-bg {
				background-color: #23c6c8;
				color: #fff;
			}
			.dark-timeline .vertical-timeline-content:before {
				border-color: transparent #f5f5f5 transparent transparent;
			}

			.vertical-timeline-content::before {
				content: '';
				position: absolute;
				top: 16px;
				right: 100%;
				height: 0;
				width: 0;
				border: 7px solid transparent;
				border-right: 7px solid #fff;
			}
			#vertical-timeline::before {
				content: '';
				position: absolute;
				top: 0;
				left: 18px;
				height: 100%;
				width: 4px;
				background: #f1f1f1;
			}
			.ibox-content h1, .ibox-content h2, .ibox-content h3, .ibox-content h4, .ibox-content h5, .ibox-title h1, .ibox-title h2, .ibox-title h3, .ibox-title h4, .ibox-title h5 {
				margin-top: 5px;
			}
			@media only screen and (min-width: 768px)
			.vertical-timeline-content h2 {
				font-size: 18px;
			}
			.vertical-timeline-content h2 {
				font-weight: 400;
				margin-top: 4px;
			}
			h2 {
				font-size: 24px;
			}
			h1, h2, h3, h4, h5, h6 {
				font-weight: 100;
			}
				@media only screen and (min-width: 768px)
				.vertical-timeline-content p {
					font-size: 13px;
				}
				.vertical-timeline-content p {
					margin: 1em 0;
					line-height: 1.6;
				}
					.vertical-timeline-content .btn {
						float: right;
					}
					.float-e-margins .btn {
						margin-bottom: 5px;
					}
					.btn-primary {
						background-color: #1ab394;
						border-color: #1ab394;
						color: #FFF;
					}
					.btn {
						border-radius: 3px;
					}
					.vertical-timeline-content .vertical-date {
						float: left;
						font-weight: 500;
					}
					.vertical-timeline-content:after {
						content: "";
						display: table;
						clear: both;
					}
		</style>

		<script src="${staticPath}/admin/tf/jquery.min.js"></script>
		<script src="${staticPath}/admin/lib/jquery.form/jquery.form.min.js"></script>
		<script src="${staticPath}/admin/lib/jquery.form/jquery.validate.min.js"></script>
		<script src="${staticPath}/admin/lib/jquery.form/messages_zh.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="${staticPath}/admin/tf/content.js" ></script>
	</head>
	<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				当前有可更新版本！最新版本为V4.3.2 点击查看详情
			</div>
		</div>
	</div>

	<div class="ibox-content" id="ibox-content">

		<div id="vertical-timeline" class="vertical-container dark-timeline">
			<div class="vertical-timeline-block">
				<div class="vertical-timeline-icon navy-bg">
					<i class="fa fa-briefcase"></i>
				</div>

				<div class="vertical-timeline-content">
					<h2>会议</h2>
					<p>上一年的销售业绩发布会。总结产品营销和销售趋势及销售的现状。
					</p>
					<a href="#" class="btn btn-sm btn-primary"> 更多信息</a>
					<span class="vertical-date">
                                        今天 <br>
                                        <small>2月3日</small>
                                    </span>
				</div>
			</div>

			<div class="vertical-timeline-block">
				<div class="vertical-timeline-icon blue-bg">
					<i class="fa fa-file-text"></i>
				</div>

				<div class="vertical-timeline-content">
					<h2>给张三发送文档</h2>
					<p>发送上年度《销售业绩报告》</p>
					<a href="#" class="btn btn-sm btn-success"> 下载文档 </a>
					<span class="vertical-date">
                                        今天 <br>
                                        <small>2月3日</small>
                                    </span>
				</div>
			</div>

			<div class="vertical-timeline-block">
				<div class="vertical-timeline-icon lazur-bg">
					<i class="fa fa-coffee"></i>
				</div>

				<div class="vertical-timeline-content">
					<h2>喝咖啡休息</h2>
					<p>喝咖啡啦，啦啦啦~~</p>
					<a href="#" class="btn btn-sm btn-info">更多</a>
					<span class="vertical-date"> 昨天 <br><small>2月2日</small></span>
				</div>
			</div>

			<div class="vertical-timeline-block">
				<div class="vertical-timeline-icon yellow-bg">
					<i class="fa fa-phone"></i>
				</div>

				<div class="vertical-timeline-content">
					<h2>给李四打电话</h2>
					<p>给李四打电话分配本月工作任务</p>
					<span class="vertical-date">昨天 <br><small>2月2日</small></span>
				</div>
			</div>

			<div class="vertical-timeline-block">
				<div class="vertical-timeline-icon lazur-bg">
					<i class="fa fa-user-md"></i>
				</div>

				<div class="vertical-timeline-content">
					<h2>公司年会</h2>
					<p>发年终奖啦，啦啦啦~~</p>
					<span class="vertical-date">前天 <br><small>2月1日</small></span>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		window.parent.changeTitle('系统升级');
	</script>
	</body>
</html>
