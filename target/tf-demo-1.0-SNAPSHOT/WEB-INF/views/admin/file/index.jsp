<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
        <link href="${staticPath}/admin/iconfont/iconfont.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" href="${staticPath}/admin/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<style type="text/css">
			body {

			    padding:20px;
			}
			.catalog {
				background:#FFF;
				height:300px;
			}
			.file {
			    border: 1px solid #e7eaec;
			    padding: 0;
			    background-color: #fff;
			    position: relative;
			    margin-bottom: 20px;
			    margin-right: 20px;
			}
			.corner {
			    position: absolute;
			    display: inline-block;
			    width: 0;
			    height: 0;
			    line-height: 0;
			    border: .6em solid transparent;
			    border-right: .6em solid #f1f1f1;
			    border-bottom: .6em solid #f1f1f1;
			    right: 0;
			    bottom: 0;
			}
			.file .icon {
			    padding: 15px 10px;
			    text-align: center;
			}
			.file .icon, .file .image {
			    height: 100px;
			    overflow: hidden;
			}
			
			.file .file-name {
			    padding: 10px;
			    background-color: #f8f8f8;
			    border-top: 1px solid #e7eaec;
			}
			

			.file-name small {
			    color: #676a6c;
			}
			.file a:focus, .file a:hover {
				text-decoration: none;
			}

            .wrapper-content {
                padding: 20px;
            }
            .wrapper {
                padding: 0 20px;
            }

            .ibox {
                clear: both;
                margin-bottom: 25px;
                margin-top: 0;
                padding: 0;
            }
            .ibox-content {
                clear: both;
            }
            .ibox-content {
                background-color: #fff;
                color: inherit;
                padding: 15px 20px 20px;
                border-color: #e7eaec;
                -webkit-border-image: none;
                -o-border-image: none;
                border-image: none;
                border-style: solid solid none;
                border-width: 1px 0;
            }

            .file-manager {
                list-style: none outside none;
                margin: 0;
                padding: 0;
            }

            .file-manager h5 {
                text-transform: uppercase;
            }
            .file-control.active {
                text-decoration: underline;
            }
            .file-control {
                color: inherit;
                font-size: 11px;
                margin-right: 10px;
            }
            a {
                cursor: pointer;
            }
            .file-manager .hr-line-dashed {
                margin: 15px 0;
            }
            .hr-line-dashed {
                border-top: 1px dashed #e7eaec;
                color: #fff;
                background-color: #fff;
                height: 1px;
                margin: 20px 0;
            }

            .float-e-margins .btn {
                margin-bottom: 5px;
            }
            .btn-primary {
                background-color: #1ab394;
                border-color: #1ab394;
                color: #FFF;
            }

            .file-manager .hr-line-dashed {
                margin: 15px 0;
            }
            .hr-line-dashed {
                border-top: 1px dashed #e7eaec;
                color: #fff;
                background-color: #fff;
                height: 1px;
                margin: 20px 0;
            }

            .file-manager h5 {
                text-transform: uppercase;
            }
            .ibox-content h1, .ibox-content h2, .ibox-content h3, .ibox-content h4, .ibox-content h5, .ibox-title h1, .ibox-title h2, .ibox-title h3, .ibox-title h4, .ibox-title h5 {
                margin-top: 5px;
            }
            .folder-list li {
                border-bottom: 1px solid #e7eaec;
                display: block;
            }.folder-list li a {
                 color: #666;
                 display: block;
                 padding: 5px 0;
             }.folder-list li i {
                  margin-right: 8px;
                  color: #3d4d5d;
              }.file-manager h5.tag-title {
                   margin-top: 20px;
               }
            .file-manager h5 {
                text-transform: uppercase;
            }
            ol, ul {
                margin-top: 0;
                margin-bottom: 10px;
            }

            ul.notes li, ul.tag-list li {
                list-style: none;
            }


            .tag-list li a {
                font-size: 10px;
                background-color: #f3f3f4;
                padding: 5px 12px;
                color: inherit;
                border-radius: 2px;
                border: 1px solid #e7eaec;
                margin-right: 5px;
                margin-top: 5px;
                display: block;
            }
            .file-box {
                float: left;
                width: 220px;
            }
            .file {
                border: 1px solid #e7eaec;
                padding: 0;
                background-color: #fff;
                position: relative;
                margin-bottom: 20px;
                margin-right: 20px;
            }
            .file .file-name {
                position:relative;
            }
            .file .file-icon {
                position:absolute;
                right:12px;
                top:10px;
                display:none;
            }
        </style>
	</head>
	<body>
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="file-manager">
                            <h5>显示：</h5>
                            <a href="file_manager.html#" class="file-control active">所有</a>
                            <a href="file_manager.html#" class="file-control">文档</a>
                            <a href="file_manager.html#" class="file-control">视频</a>
                            <a href="file_manager.html#" class="file-control">图片</a>
                            <div class="hr-line-dashed"></div>
                            <a href="${ctx}/admin/sys-file/upload" class="btn btn-primary btn-block">上传文件</a>
                            <div class="hr-line-dashed"></div>
                            <h5>文件夹</h5>
                            <ul class="folder-list" style="padding: 0">
                                <li><a href="file_manager.html"><i class="fa fa-folder"></i> 文件</a>
                                </li>
                                <li><a href="file_manager.html"><i class="fa fa-folder"></i> 图片</a>
                                </li>
                                <li><a href="file_manager.html"><i class="fa fa-folder"></i> Web页面</a>
                                </li>
                                <li><a href="file_manager.html"><i class="fa fa-folder"></i> 插图</a>
                                </li>
                                <li><a href="file_manager.html"><i class="fa fa-folder"></i> 电影</a>
                                </li>
                                <li><a href="file_manager.html"><i class="fa fa-folder"></i> 书籍</a>
                                </li>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 animated fadeInRight">
                <div class="row">
                    <div class="col-sm-12" id="file-grid">

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10" style="text-align:right;">
                        <ul id="paginator"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${staticPath}/admin/tf/jquery.min.js"></script>
    <script src="${staticPath}/admin/lib/bootstrap-paginator/bootstrap-paginator.min.js"></script>
    <script type="text/javascript">
        window.parent.changeTitle('文件管理');
        var curPage = 1;
        function load(page) {
            $.getJSON('${ctx}/admin/sys-file/page-list?page=' + page + '&size=9',function(resp) {
                if(resp.code == 'OK') {
                    curPage = resp.body.pageNumber;
                    $('#paginator').bootstrapPaginator("setOptions",{totalPages:resp.body.pageTotal});
                    var html = '';
                    for(var i in resp.body.rows) {
                        var row = resp.body.rows[i];
                        html += '<div class="file-box">';
                        html += '<div class="file">';
                        html += '<a href="${ctx}/admin/sys-file/download?id=' + row.id + '">';
                        html += '<span class="corner"></span>';
                        html += '<div class="icon">';
                        html += '<i class="fa fa-file"></i>';
                        html += '</div>';
                        html += '<div class="file-name">';
                        html += row.fileName + ' (' + row.refCount + ')';
                        html += '<a class="file-icon" href="javascript:deleteFile(' + row.id + ')"><i class="iconfont icon-shanchu"></i></a>';
                        html += '<br>';
                        html += '<small>添加时间：' + row.createdTime + '</small>';
                        html += '</div>';
                        html += '</a>';
                        html += '</div>';
                        html += '</div>';
                    }
                    $('#file-grid').html(html);
                }
            });
        }
        $(function() {
            $('#file-grid').delegate('.file','mouseover',function() {
                $(this).find('.file-icon').show();
            }).delegate('.file','mouseout',function() {
                $(this).find('.file-icon').hide();
            });
            $('#paginator').bootstrapPaginator({
                currentPage: 1,
                totalPages: 1,
                size:"normal",
                bootstrapMajorVersion: 3,
                alignment:"right",
                numberOfPages:5,
                onPageClicked : function(event,originalEvent,type,page) {
                    load(page);
                },
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first": return "首页";
                        case "prev": return "上一页";
                        case "next": return "下一页";
                        case "last": return "末页";
                        case "page": return page;
                    }
                }
            });
            $('#paginator').bootstrapPaginator("showFirst");
            load(1);
        });

        function deleteFile(id) {
            window.parent.bootbox.prompt({
                title: "请输入您的管理密码以确定删除此文件",
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
                        $.post('${ctx}/admin/sys-file/careful-delete',{id:id,password:result},function(resp) {
                            if(resp.code == 'OK') {
                                window.parent.layer.msg('删除成功', {icon: 1});
                                load(curPage);
                            }else {
                                window.parent.layer.msg('删除失败:' + resp.message, {icon: 2});
                            }
                        },'json');
                    }
                }
            });
        }
    </script>
	</body>
</html>
