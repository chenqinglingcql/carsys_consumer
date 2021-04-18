<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/1/24
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>header</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="css/header.css">
</head>

<body>

<c:set value="${pageContext.request.contextPath}" scope="application" var="path"></c:set>
<div class="header1">
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md9">
                <ul class="layui-nav">
                    <li class="layui-nav-item"><a href="index.jsp">首页</a></li>
                    <li class="layui-nav-item">
                        <a href="info.jsp">客运服务</a>
                        <dl class="layui-nav-child"> <!-- 二级菜单 -->
                            <dd><a href="/ticket?method=viewTicketByDepartDest">在线预定</a></dd>
                            <dd><a href="/route?method=viewAllRoute">经营路线</a></dd>
                            <dd><a href="tourist.jsp">班线旅游景点推荐</a></dd>
                            <dd><a href="info.jsp">乘客须知</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="/problem?method=view&link=全部问题">常见问题</a></li>
                    <li class="layui-nav-item"><a href="info.jsp">乘客须知</a></li>
                </ul>
            </div>
            <div class="layui-col-md3">

                <ul class="layui-nav">
                    <c:if test="${sessionScope.user==null}">
                        <li class="layui-nav-item">
                            <a href="login.jsp">登录</a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="regist.jsp">注册</a>
                        </li>
                    </c:if>
                    <%--从会话中获取user对象，不为空则表明--%>
                    <c:if test="${sessionScope.user!=null}">
                        <li class="layui-nav-item">
                            <a href="">${user.username}</a>
                            <dl class="layui-nav-child">
                                <dd><a href="/order?method=viewMyOrders">我的订单</a></dd>
                                <dd><a href="/user?method=viewMySelf">个人中心<span class="layui-badge-dot"></span></a></dd>
                                <dd><a href="edit_self.jsp">修改信息</a></dd>
                                <dd><a href="${path}/user?method=logout">退了</a></dd>
                            </dl>
                        </li>
                    </c:if>

                </ul>
            </div>
        </div>
    </div>
</div>


</body>
<script src="layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
<script>
    layui.use('layer', function () { //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        //触发事件
        var active = {
            offset: function () {
                //示范一个公告层
                layer.open({
                    type: 1
                    ,
                    title: false //不显示标题栏
                    ,
                    closeBtn: false
                    ,
                    width: '300px'
                    ,
                    height: 'auto'
                    ,
                    shade: 0.1
                    ,
                    id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,
                    btnAlign: 'c'
                    ,
                    closeBtn: 2
                    ,
                    moveType: 1 //拖拽模式，0或者1
                    ,
                    content: '<div class="login" style="border-radius: 5px;width: 300px;height: 330px;padding:20px;background-color: #ffffff;" >\n' +
                        '    <div >\n' +
                        '        <img src="img/logo_wuxi.png" style="background-color: #009688;"><font style=" font-size: 18px;margin-left:20px;margin-bottom:10px;color:white;text-align: center; display: inline">用户登录</font>\n' +
                        '    </div>\n' +
                        '\n' +
                        '    <div>&nbsp;</div>\n' +
                        '    <form class="form-horizontal"  method="post" style="padding: 20px;"  action="/user?method=login" >\n' +
                        '        <div class="form-group">\n' +
                        '            <div class="col-sm-6">\n' +
                        '                <input type="text" class="layui-input" id="telephone" name="telephone" placeholder="请输入手机号/身份证号" style="width: 250px;height: 37px;border-color:#fdfdfd;" value="${user.telephone}">\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '\n' +
                        '        <div class="form-group">\n' +
                        '            <div>&nbsp;</div>\n' +
                        '            <div class="col-sm-6">\n' +
                        '                <input type="password" class="layui-input" id="password" name="password" placeholder="请输入密码" style="width: 250px;height: 37px;border-color:#fdfdfd;">\n' +
                        '            </div>\n' +
                        '            <div>&nbsp;</div>\n' +
                        '        </div>\n' +
                        '        <c:if test="${msg}!=null">\n' +
                        '            <div class="form-group">\n' +
                        '                <div class="col-sm-6">\n' +
                        '                    <span id="msg" style="color:#009688">${msg}</span>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '        </c:if>\n' +
                        '\n' +
                        '        <div class="form-group">\n' +
                        '            <div class="col-sm-offset-2 col-sm-10">\n' +
                        '                <div class="checkbox" style="padding-left: 10px;">\n' +
                        '                    <div>&nbsp;</div>\n' +
                        '                    <label>\n' +
                        '                        <input type="checkbox"  name="free" value="free"> 自动登录\n' +
                        '                    </label>\n' +
                        '                    <label>\n' +
                        '                        <input type="checkbox" name="remember" value="remember"> 记住用户名\n' +
                        '                    </label>\n' +
                        '                    <label>\n' +
                        '                        <a href="regist.jsp" style="text-decoration: none;color: black">&nbsp;立即注册</a>\n' +
                        '                    </label>\n' +
                        '                    <div>&nbsp;</div>\n' +
                        '                </div>\n' +
                        '\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '        <div class="form-group">\n' +
                        '            <div class="col-sm-offset-2 col-sm-10">\n' +
                        '                <input type="submit" value="登录" name="submit" width="200px" style="background-color: #00ab9d; height: 35px;width:200px;margin-left:20px;color: white;border: none;">\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '    </form>\n' +
                        '</div>\n'
                    ,
                    success: function (layero) {
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').attr({
                            href: '_blank'
                            , target: '_blank'
                        });
                    }
                });
            }

        };

        $('#layerDemo .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });
</script>

</html>
