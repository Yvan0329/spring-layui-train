<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<title>管理后台 - ${baseSettings.siteName}</title>

		<script type="text/javascript">
			var _ctx = '${ctx}';
            var _staticPath = '${staticPath}';
		</script>

		<link rel="stylesheet" href="${staticPath}/admin/tf/reset.css" />
		<link rel="stylesheet" href="${staticPath}/admin/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<link href="${staticPath}/admin/tf/index.css" type="text/css" rel="stylesheet" />
		<link href="${staticPath}/admin/iconfont/iconfont.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" href="${staticPath}/admin/tf/tf.accordion.css" />
		<link rel="stylesheet" type="text/css" href="${staticPath}/admin/tf/tf.navtabs.css" />
		<link rel="stylesheet" href="${staticPath}/admin/tf/tf.titlebar.css" />

		<style type="text/css">
			iframe {border:none;}
			.header .title {
				position:absolute;
				display: inline-block;
				font-size: 18px;
				height:100%;
				text-overflow: ellipsis;
				color: #666;
				line-height: 60px;
				left:30px;
			}
			/*保持对话框永远在最顶层*/
			.bootbox {
				z-index: 2147483647;
			}
			.modal-backdrop {
				z-index: 2147483646;
			}
		</style>

	</head>
	<body>
	    <div class="sidebar">
	    	<div class="wrapper">
		    	<div class="logo-wrapper">
		    		<img class="logo" src="${staticPath}/admin/img/logo.png" />
		    	</div>
				<div class="expand-menu">
					${baseSettings.siteName}
					<a class="toggle" href="javascript:void(0);">
						<span class="iconfont icon-chanpinguanli" style="color:#19aa8d;font-size:20px;"></span>
					</a>
				</div>
		    	<div class="menu-wrapper">
		    		<ul class="accordion"></ul>
		    	</div>
	    	</div>
	    </div>
	    <div class="main-body">
	    	<div class="wrapper">
		        <div class="header">
					<div id="title" class="title">主页</div>
		        	<!--titlebar-->
		        	<ul class="titlebar">
						<li>
							<a href="javascript:void(0);"><i></i><span>${name}</span></a>
						</li>
						<%--<li>
							<a href="javascript:void(0);"><span><i class="iconfont icon-xiaoxi"></i></span></a>
							<ul class="dropdown">
								<li><a href="javascript:void(0);">个人信息</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0);">修改密码</a></li>
							</ul>
						</li>--%>
						<li>
							<a href="javascript:void(0);"><span><i class="iconfont icon-shezhi"></i></span></a>
							<ul class="dropdown">
								<li><a href="javascript:modifyUserInfo();">个人信息</a></li>
								<li><a href="javascript:modifyPassword();">修改密码</a></li>
								<li class="divider"></li>
								<li><a href="javascript:logout();">退出</a></li>
							</ul>
						</li>
					</ul>
					<!--titlebar-->
		        </div>
		        <div class="content">
		        	<%--<div class="nav-tabs"></div>--%>
					<iframe id="contentFrame" name="contentFrame" width="100%" height="100%" frameborder="0"></iframe>
		        </div>
		        <div class="footer">
		        	<div class="copyright">${baseSettings.copyright}</div>
		        </div>
	        </div>
	    </div>
	    
	    
		<script src="${staticPath}/admin/tf/jquery.min.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/jquery.cookie/jquery.cookie.js"></script>
		<script src="${staticPath}/admin/tf/wg_listToTree1.1.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/scrollbar/divscroll.js"></script>
		<script src="${staticPath}/admin/tf/tf.accordion.js"></script>
		<script src="${staticPath}/admin/tf/tf.navtabs.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/layer/layer.js"></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/bootstrap-3.3.7-dist/js/bootstrap.js" ></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/bootbox-4.4.0/bootbox.js" ></script>
		<script type="text/javascript" src="${staticPath}/admin/lib/websocket/sockjs.min.js" ></script>

		<script type="text/javascript">
			function modifyPassword() {
                layer.load();
                $('#contentFrame').attr('src','${ctx}/admin/modify-password');
                $('#contentFrame').load(function() {
                    layer.closeAll('loading');
                });
			}
            function modifyUserInfo() {
                layer.load();
                $('#contentFrame').attr('src','${ctx}/admin/modify-userinfo');
                $('#contentFrame').load(function() {
                    layer.closeAll('loading');
                });
            }
			function logout() {
                bootbox.confirm({
                    title : "提示",
                    message: "您确定要退出本系统吗?",
                    onEscape : true,
                    backdrop : true,
                    animate : true,
                    buttons: {
                        confirm: {
                            label: '退出',
                            className: 'btn-success'
                        },
                        cancel: {
                            label: '取消',
                            className: ''
                        }
                    },
                    callback: function (result) {
                        if(result) {
                            $.cookie('url', null);
                            $.cookie('title', null);
                            $.post('${ctx}/admin/logout',function(resp) {
								window.location.reload();
                            });
                        }
                    }
                });
			}

			$(function() {
                var url = $.cookie('url');
                if(url && url != 'null') {
                    $('#contentFrame').attr('src',url);
				}else {
                    $('#contentFrame').attr('src','${ctx}/${homePage}');
				}
                var title = $.cookie('title');
                if(title && title != 'null') {
                    changeTitle(title)
                }

				var oldTitle = '';
                var menuTitle = '';

                var navTabs = $('.nav-tabs').navtabs({index:'__panel.html'});
                $('#contentFrame').load(function() {
					layer.closeAll('loading');
					if($('#title').html() == oldTitle) {
					    changeTitle(menuTitle);
					}
                });
                $('.accordion').accordion({url:'${ctx}/admin/menu',onClick : /*navTabs.addTab*/function(title,url) {
                    if(!$('.expand-menu').is(":hidden")) {
                        $('.menu-wrapper').hide();
					}
					layer.load();
                    oldTitle = $('#title').html();
                    menuTitle = title;
                    changeUrl(url);
				}});
			});

			function changeTitle(title) {
                $('#title').html(title);
                $.cookie('title', title);
			}
			function changeUrl(url) {
                $.cookie('url', url);
                $('#contentFrame').attr('src',url);
			}
		</script>
		
		<!--titlebar-->
		<script type="text/javascript">
			$(function() {
                var delayClose = false;
			    $('.titlebar li > a').click(function() {
                    var dropdown = $(this).next();
                    var isShow = false;
                    if(dropdown.length && !dropdown.is(':hidden')) isShow = true;
			        $('.titlebar .active').removeClass('active');
					$('.titlebar .dropdown').hide();
                    delayClose = false;

					if(dropdown.length) {
					    if(isShow) {
                            dropdown.hide();
						}else {
                            $(this).addClass('active');
                            dropdown.show();
                        }
					}
				});

				$('.titlebar li').mouseout(function() {
                    var that = $(this);
                    delayClose = true;
                    setTimeout(function () {
                        if(!delayClose) return;
                        that.children('a').removeClass('active');
                        that.find('.dropdown').hide();
                        delayClose = false;
                    }, 500);
				});
				$('.titlebar .dropdown').mouseout(function(event) {
					var s = event.toElement || event.relatedTarget;
					if (!this.contains(s)) {
                        delayClose = false;
						$(this).hide();
						$(this).prev().removeClass('active');
					}
				}).mouseover(function() {
                    delayClose = false;
				});
			});
		</script>
		<!--titlebar-->
		<script type="text/javascript">
            var ws = null;
            var url = 'ws://' + document.location.host + '${ctx}/admin/websocket?userId=${userId}';
            var transports = [];
            function connect() {
                //ws = (url.indexOf('sockjs') != -1) ?new SockJS(url, undefined, {protocols_whitelist: transports}) : new WebSocket(url);
                if ('WebSocket'in window) {
                    ws= new WebSocket(url);
                }else {
                    ws = new SockJS(url);
                }
                //websocket = new SockJS("http://localhost:8084/SpringWebSocketPush/sockjs/websck");
                ws.onopen = function () {
                    console.log('connect success');
                    ws.send('hello');
                };
                ws.onmessage = function (event) {
                    console.log('receive:' + event.data);
                    try {
                    	indexWsHandler(event.data);
                    }catch(e) {
                        console.log(e);
					}
                    var func = $("#contentFrame")[0].contentWindow.wsHandler;
					if(func) {
                        func(event.data);
					}
                };
                ws.onclose = function (event) {
                    console.log('connection close');
                };
            }
            connect();

            function indexWsHandler(data) {

			}
		</script>
	</body>
</html>
