<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改个人信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/validate.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/edit.css">

</head>

<body>

<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}"/>

<!-- 引入header.jsp -->
<div class="rule header">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<%--背景部分--%>
<div class="rule background">
    <img src="img/edit.jpg" width="1560" height="1016" style="margin-top: 45px;opacity: 0.8">
</div>



<div class="row">
    <div class="userPicture">
        <jsp:include page="/e_h.jsp"></jsp:include>
    </div>
    <form id="updateForm" class="form-horizontal" action="/user?method=updateUser" method="post"
          enctype="multipart/form-data" >
        <div >
            <%--修改个人信息--%>
            <div class="form-group" >
                <label for="username" class="col-sm-2 control-label">昵称</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="username" name="username" placeholder="请输入昵称"
                           value="${user.username}" style="width: 200px">
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="name" name="name" placeholder="请输入真实姓名"
                           value="${user.name}"  style="width: 200px">
                </div>
            </div>
            <div class="form-group">
                <label for="person_id" class="col-sm-2 control-label">身份证号</label>
                <input type="hidden" value="${user.person_id}" id="oldPersonId">
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="person_id" name="person_id" placeholder="请输入有效身份证号"
                           value="${user.person_id}" onchange="validatePerson_id('${path}','${user.person_id}')"  style="width: 200px">
                </div>
                <span class="person_idMsg"></span>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱</label>
                <input type="hidden" value="${user.email}" id="oldEmail"/>
                <div class="col-sm-6">
                    <input type="email" class="form-control" id="email" name="email" placeholder="请输入邮箱"
                           value="${user.email}" onchange="validateEmail('${path}','${sessionScope.user.email}')"  style="width: 200px">
                </div>
                <span class="emailMsg"></span>
            </div>
            <div class="form-group">
                <label for="telephone" class="col-sm-2 control-label">电话</label>
                <input type="hidden" value="${user.telephone}" id="oldTel">
                <div class="col-sm-6">
                    <input type="tel" class="form-control" id="telephone" name="telephone" placeholder="请输入联系方式"
                           value="${user.telephone}"
                           onchange="validateTelephone('${path}','${sessionScope.user.telephone}')"  style="width: 200px">
                </div>
                <span class="telephoneMsg"></span>
            </div>


            <div class="form-group opt">
                <label for="sex" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-6">
                    <input name="sex" id="sex" type="radio" value="男"
                           <c:if test="${user.sex eq '男' }">checked="checked"</c:if>   >男
                    <input name="sex" id="sex1" type="radio" value="女"
                           <c:if test="${user.sex eq '女' }">checked="checked"</c:if>   >女

                </div>
                <%-- 出现错误信息 --%>
                <%--<lable for="sex" class="error" style="display:none">性别必选</lable>--%>
            </div>
            <div class="form-group">
                <label for="birthday" class="col-sm-2 control-label">出生日期</label>
                <div class="col-sm-6">
                    <input type="date" class="form-control" id="birthday" name="birthday" value="${user.birthday}">
                </div>
            </div>
            <div class="form-group">
                <label for="uimage" class="col-sm-2 control-label">头像</label>
                <img id="uimage"  class="NouserPic" name="uimage" width="64px" style="margin-left: 30px" height="auto" src="${user.uimage}"/>
                <div class="col-sm-6">
                    <input type="file" class="form-control" id="file" placeholder="file" name="file"
                           onchange="showPreview(this)" style="width:200px;">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" width="100px" value="提交申请"
                           style="margin-left:20px;border-radius:5px;border:none;background-color: #ff7600; height: 35px; width: 150px;font-weight:500;color: white;">
                </div>
            </div>
        </div>
    </form>
</div>

<!-- 引入footer.jsp -->
<div class="rule footer">
    <jsp:include page="footer.jsp"></jsp:include>
</div>

</body>

<script src="layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'layer'], function () {
        var element = layui.element;
        var layer = layui.layer;
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




