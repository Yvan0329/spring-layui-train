<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
        <script type="text/javascript">
            var _ctx = '${ctx}';
            var _staticPath = '${staticPath}';
        </script>
		<link rel="stylesheet" href="${staticPath}/admin/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${staticPath}/admin/lib/webuploader-0.1.5/webuploader.css" />
        <link rel="stylesheet" href="${staticPath}/admin/tf/file-mgr/css/style.css" />
        <link rel="stylesheet" href="${staticPath}/admin/tf/file-mgr/css/demo.css" />
	</head>
	<body>
    <div id="uploader" class="wu-example">
        <div class="queueList">
            <div id="dndArea" class="placeholder">
                <div id="filePicker" class="webuploader-container"><div class="webuploader-pick">点击选择图片</div><div id="rt_rt_1bepd38m51r6goo5142r80q8n1" style="position: absolute; top: 0px; left: 448px; width: 168px; height: 44px; overflow: hidden; bottom: auto; right: auto;"><input type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="image/*"><label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label></div></div>
                <p>或将照片拖到这里，单次最多可选300张</p>
            </div>
            <ul class="filelist"></ul></div>
        <div class="statusBar" style="display:none;">
            <div class="progress" style="display: none;">
                <span class="text">0%</span>
                <span class="percentage" style="width: 0%;"></span>
            </div><div class="info">共0张（0B），已上传0张</div>
            <div class="btns">
                <div id="filePicker2" class="webuploader-container"><div class="webuploader-pick">继续添加</div><div id="rt_rt_1bepd38n1s641e5k8a8jsk1int6" style="position: absolute; top: 0px; left: 0px; width: 1px; height: 1px; overflow: hidden;"><input type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="image/*"><label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label></div></div><div class="uploadBtn state-pedding">开始上传</div>
            </div>
        </div>
    </div>

    <script src="${staticPath}/admin/tf/jquery.min.js"></script>
    <script src="${staticPath}/admin/lib/webuploader-0.1.5/webuploader.js"></script>
    <script src="${staticPath}/admin/tf/file-mgr/js/demo.js"></script>
	</body>
</html>
