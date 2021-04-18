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
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mySelf.css">

</head>

<body>

<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}"/>


<!-- 引入header.jsp -->
<div class="rule header">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<%--背景部分--%>
<div class="rule img">
    <img src="img/view.jpg" width="1560" height="1016" style="margin-top: 45px;opacity: 0.8">
</div>


<div class="form">
    <form id="myForm" class="form-horizontal" method="post" action="edit_self.jsp">
        <%--基本信息展示--%>
        <div class="form-group">
            <label class="control-label">姓名</label>
            <div class="info">
                ${user.name}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">身份证号</label>
            <div class="info">
                ${user.person_id}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">邮箱</label>
            <div class="info">
                ${user.email}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">电话</label>
            <div class="info">
                ${user.telephone}
            </div>
        </div>

        <div class="form-group opt">
            <label class="control-label">性别</label>
            <div class="info">
                ${user.sex}
            </div>
            <%-- 出现错误信息 --%>
            <%--<lable for="sex" class="error" style="display:none">性别必选</lable>--%>
        </div>
        <div class="form-group">
            <label class="control-label">出生日期</label>
            <div class="info">
                ${user.birthday}
            </div>
        </div>
        <div class="form-group">
            <input type="submit" width="100px" value="修改个人信息" class="submit"
                   style="border-radius:5px;border:none;background-color: #ff7600; height: 35px; width: 150px;font-weight:500;color: white;">
        </div>
    </form>

    <c:if test="${msg!=null}">
        <script>
            alter("${msg}");
        </script>
    </c:if>
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
<script type="text/javascript">
    //将文件流以url形式读取，实现图片实时显示：
    function showPreview(source) {
        var file = source.files[0];
        if (window.FileReader) {
            var fr = new FileReader();
            fr.onloadend = function (e) {
                document.getElementById("uimage").src = e.target.result;
            }
            fr.readAsDataURL(file);
        }
    }
</script>


</html>




