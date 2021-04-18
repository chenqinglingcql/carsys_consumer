<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/2/6
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆界面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">

</head>

<body>
<img src="img/Logo.png"/>
<div class="rule loginContainer">
    <%--登录框--%>
    <div class="login">
        <span class="title">用户登录</span>
        <div>&nbsp;</div>
        <form class="form-horizontal" method="post" action="/user?method=login">
            <div class="form-group">
                <label for="telephone" class="col-sm-2 control-label" style="text-align: right;">账号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="telephone" name="telephone"
                           placeholder="请输入手机号/身份证号"
                           style="width: 250px;height: 37px;" value="${user.telephone}">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label" style="text-align: right">密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"
                           style="width: 250px;height: 37px;">
                </div>
            </div>
            <c:if test="${msg}!=null">
                <div class="form-group">
                    <div class="col-sm-6">
                        <span id="msg" style="color: #ff7600">${msg}</span>
                    </div>
                </div>
            </c:if>

            <div class="form-group">
                <%--                <div class="col-sm-offset-2 col-sm-10">--%>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="free" value="free"> 自动登录
                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label>
                        <input type="checkbox" name="remember" value="remember"> 记住用户名
                    </label>
                    <label>
                        <a href="regist.jsp">注册</a>
                    </label>
                </div>
                <%--                </div>--%>
            </div>
            <div class="form-group">
                <%--                <div class="col-sm-offset-2 col-sm-10">--%>
                <input type="submit" value="登录" name="submit" class="submit"
                       style="border-radius:5px;border:none;background-color: #ff7600; height: 35px; width: 150px;font-weight:500;color: white"
                >
                <%--                </div>--%>
            </div>
        </form>
    </div>
</div>

<%--底部--%>
<div class="rule footer">
    <jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
<script src="layui/layui.js"></script>

</html>
