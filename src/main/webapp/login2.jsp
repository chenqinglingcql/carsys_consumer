<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
    <blockquote class="layui-elem-quote layui-quote-nm">
        Tips：为了更方便您的使用，请先登录或注册！
    </blockquote>
    <%--<button data-method="confirmTrans" class="layui-btn">配置一个透明的询问框</button>--%>
    <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal layui-bg-green">登录</button>
</div>

<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {
            /*setTop: function(){
                var that = this;
                //多窗口模式，层叠置顶
                layer.open({
                    type: 2 //此处以iframe举例
                    ,title: '登陆界面'
                    ,area: ['500px', '300px']
                    ,shade: 0
                    ,maxmin: true
                    ,offset: [ //为了演示，随机坐标
                        Math.random()*($(window).height()-300)
                        ,Math.random()*($(window).width()-390)
                    ]
                    ,content: '//layer.layui.com/test/settop.html'
                    ,btn: ['继续弹出', '全部关闭'] //只是为了演示
                    ,yes: function(){
                        $(that).click();
                    }
                    ,btn2: function(){
                        layer.closeAll();
                    }

                    ,zIndex: layer.zIndex //重点1
                    ,success: function(layero){
                        layer.setTop(layero); //重点2
                    }
                });
            }
            ,confirmTrans: function(){
                //配置一个透明的询问框
                layer.msg('大部分参数都是可以公用的<br>合理搭配，展示不一样的风格', {
                    time: 20000, //20s后自动关闭
                    btn: ['明白了', '知道了', '哦']
                });
            }
            ,*/offset:function(){
                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,width:'300px'
                    ,height:'auto'
                    ,shade: 0.1
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btnAlign: 'c'
                    ,closeBtn:2
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content:'<div class="login" style="border-radius: 5px;width: 300px;height: 330px;background-color: #ffffff;" >\n' +
                        '    <div style="background-color: #009688">\n' +
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
                    ,success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').attr({
                            href: '_blank'
                            ,target: '_blank'
                        });
                    }
                });
            }

        };

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });
</script>

</body>
</html>