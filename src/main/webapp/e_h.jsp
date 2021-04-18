<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>查看个人信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/validate.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">

    <style>
        /*处理头像*/
        .userPic {
            width: 80px;
            height: 80px;
            margin: 30px auto;
            border-radius: 50%;
            overflow: hidden;
            box-shadow: 0px 0px 3px #000;
        }

        .userPic div {
            width: 70px;
            height: 70px;
            margin: 5px;
            border-radius: 50%;
            overflow: hidden;
        }

        .userPic img:hover {
            transform: rotate(12deg);
        }

    </style>
</head>

<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}"/>


<div class="userPic">
    <div>
        <img id="uimage" name="uimage" src="${user.uimage}" width="70" height="70">
    </div>
</div>


<%--<div class="form-group user_name">
    <div class="info">欢迎&nbsp;${user.username}</div>
</div>--%>


<%--<div class="body" style="display: inline-block">
    <div style="position:relative; margin-top: -8px;">
        <ul class="layui-nav layui-nav-tree layui-bg-green" lay-filter="test">
            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">基本资料</a>
                <dl class="layui-nav-child">
                    <dd><a href="edit_self.jsp">修改个人信息</a></dd>
                    <dd><a href="edit_password.jsp">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="/order?method=viewMyOrders">我的订单</a>
            </li>

        </ul>
    </div>
</div>--%>


</body>
</html>

