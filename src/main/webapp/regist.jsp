<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户注册</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/validate.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/regist.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />

</head>

</head>
<body>
<img src="img/Logo.png"/>
<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" style="position: absolute"/>


<div class="rule pic"></div>
<div class="row">
    <div class="title">用户注册</div>
    <div>&nbsp;</div>
    <div class="registList">
        <form id="registForm" class="form-horizontal" action="/user?method=regist" method="post">
            <div class="form-group">
                <label for="username" class="control-label">昵称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <div>
                    <input type="text" class="form-control" id="username" name="username" placeholder="请输入昵称">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="control-label">密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <div>
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label for="confirmpwd" class="control-label">确认密码</label>
                <div>
                    <input type="password" class="form-control" id="confirmpwd" name="confirmpwd" placeholder="请输入确认密码">
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="control-label">姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <div>
                    <input type="text" class="form-control" id="name" name="name" placeholder="请输入真实姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="person_id" class="control-label">身份证号&nbsp;</label>
                <div>
                    <input type="text" class="form-control" id="person_id" name="person_id" placeholder="请输入有效身份证号">
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="control-label">邮箱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <div>
                    <input type="email" class="form-control" id="email" name="email" placeholder="请输入邮箱">
                </div>
            </div>
            <div class="form-group">
                <label for="telephone" class="control-label">电话&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <div>
                    <input type="tel" class="form-control" id="telephone" name="telephone" placeholder="请输入联系方式">
                </div>
            </div>
            <div class="form-group">
                <label for="address" class="control-label">地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <div>
                    <input type="text" class="form-control" id="address" name="address" placeholder="请输入地址">
                </div>
            </div>

            <div class="form-group opt">
                <label for="sex1" class="control-label">性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <div>
                    <label class="radio-inline">
                        <input type="radio" id="sex1" name="sex" value="男">男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" id="sex2" name="sex" value="女">女
                    </label>
                </div>
                <%-- 出现错误信息 --%>
                <%--<lable for="sex" class="error" style="display:none">性别必选</lable>--%>
            </div>
            <div class="form-group">
                <label for="birthday" class="control-label">出生日期&nbsp;</label>
                <div>
                    <input type="date" class="form-control" id="birthday" name="birthday">
                </div>
            </div>
            <div class="form-group">
                <div>
                    <input type="submit" width="100" value="注册" class="submit"
                           style="margin-left:65px;border-radius:5px;border:none;background-color: #ff7600; height: 35px; width: 150px;font-weight:500;color: white;">
                </div>
            </div>
        </form>
    </div>
</div>


<!-- 引入footer.jsp -->
<div class="rule footer">
    <jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
<script src="layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</html>




