<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>

<html>
<head>
    <title>系统繁忙，请稍后重试！</title>
    <style type="text/css">
        body {
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 13px;
            color: #676a6c;
            overflow-x: hidden;
        }
        .middle-box {
            max-width: 400px;
            z-index: 100;
            margin: 0 auto;
            padding-top: 20px;
            text-align: center;
        }
        .middle-box h1 {
            font-size: 170px;
        }
        .font-bold {
            font-weight: 600;
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="middle-box text-center animated fadeInDown">
    <h3 class="font-bold">系统繁忙，请稍后重试！<a href="javascript:location.reload()">点击刷新</a></h3>
</div>

</body>
</html>
