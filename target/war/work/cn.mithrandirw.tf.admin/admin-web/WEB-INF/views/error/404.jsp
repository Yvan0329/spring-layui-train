<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/layouts/taglib.jsp" %>

<html>
<head>
    <title>404</title>
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
    <h1 style="margin-bottom:0px;">404</h1>
    <h3 class="font-bold">页面未找到！</h3>

    <div class="error-desc">
        抱歉，页面好像去火星了~
    </div>
</div>

</body>
</html>
