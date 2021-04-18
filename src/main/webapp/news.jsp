<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新闻</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />
</head>

<style>

    .container {
        width: 100%;
    }

    .content {
        width: 100%;
        font-size: 17px;
        line-height: 30px;
        text-align: center;
    }

    .new_title {
        margin-top: 20px;
    }

    .news_type {
        font-size: 14px;
        margin-left: 28%;
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .new_content {
        text-align: left;
        width: 1200px;
        margin-left: 12%;
    }

    .footer {
        position: absolute;
        width: 100%;
        height: 35px;
        bottom: 30px;
    }


</style>
<body>
<div class="container">
    <div>
        <jsp:include page="header.jsp"></jsp:include>
    </div>

    <div class="content">
        <h2 class="new_title">${news.new_title}</h2>
        <div class="news_type">新闻类型：${news.new_type}&nbsp;&nbsp;&nbsp;&nbsp;发布日期：${news.new_date}</div>
        <div class="new_content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${news.new_content}</div>
    </div>

    <div class="rule footer">
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</div>


</body>

<script src="layui/layui.js"></script>


</html>
