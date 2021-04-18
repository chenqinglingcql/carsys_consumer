<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/1/31
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>查询结果页面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
</head>
<style>
    *{
        padding: 0px;
        margin: 0px;
    }

    .info{
        margin-left: 42px;
    }

    span{
        line-height: 25px;
        font-size: 15px;
        color: #9F9F9F;
        font-family: 新宋体;
    }

    .search_index{
        background-color: #009688;
        width:100%;
    }
    /*太湖图片*/
    .taihu{
        width:100%;
        height: 400px;
        background:url("img/taihu2.jpg") no-repeat ;
        background-size: 100%;
    }
    .goupiaoxuzhi{
        padding: 10px;
        margin-left: -15px;
        background: none;
        border:none;
        color: #f1f1f1;
    }
    .goupiaoxuzhi:hover{
        color: #009688;
    }
    .help{
        padding: 10px 10px;
        float: right;
        margin-top: -100px;
        margin-right: 400px;
    }
    p,p>span{
        color: whitesmoke;
    }
    p>span>img{
        width:35px;
        height: 35px;
    }
    .title>th{

    }


</style>
<body style="width: 100%">
<%@ page isELIgnored="false"%>
<div class="container"  style="width: 100%;">
    <%--头部--%>
    <div>
        <jsp:include page="header.jsp"></jsp:include>
    </div>
    <%--购票流程--%>
    <div class="info" style="width: 100%;position: relative; margin-left: 0px;">
        <div  class="taihu"></div>
        <%--购票须知--%>
        <div class="search_index">
            <div>
                <p><img src="img/logo_wuxi.png" style="height: 60px;" ></p>
                <p><img style="width: 25px;height: 25px" src="img/xszn.png"><input type="button" onclick="goupiaoxuzhi()" value="【网上购票须知】<<" class="goupiaoxuzhi" id="goupiaoxuzhi" ><img style="width: 25px;height: 25px" src="img/shouzhi.png"></p>
            </div>
            <div class="help">

                <p>
                    <span><img src="img/shubiao.png">选择客票</span>
                    <span><img src="img/denglu.png">登录</span>
                    <span><img src="img/tijiaoziliao.png">填写资料</span>
                    <span><img src="img/zhifu.png">网上支付</span>
                    <span><img src="img/tijiaoziliao.png">购票完成</span>
                </p>
                <p style="padding:15px;font-size: 16px;color: white">购票流程</p>
            </div>
        </div>
    </div>

</div>

<script src="layui/layui.js"></script>
<%--购票须知弹窗--%>
<script>
    /*日期插件*/
    layui.use('laydate',function () {
        var laydate=layui.laydate;
        laydate.render({
            elem:'#laydate'
        });
    });
    /*购物须知弹窗*/
    function goupiaoxuzhi() {
        layui.use('layer',function () {
            var layer=layui.layer;
            layer.open({
                type:1,
                /*按钮*/
                btn:['我知道了'],
                /*按钮居中放置*/
                btnAlign:'c',
                title:'网上购票须知',
                /*弹出动画：1 从上到下 5：渐显*/
                anim:5,
                /*是否出现滚动*/
                scrollbar:true,
                /*是否显示关闭按钮*/
                closeBtn:1,
                area:['400px','400px'],
                //位置
                offset:['200px','600px'],
                content:'<div style="padding: 20px">\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">一、购票范围</div>\n' +
                    '            <span>本网站购票系统24小时为您提供无锡客运有限公司所属无锡汽车客运站、新世纪站、无锡华东城、无锡招商城等始发的各线客票（有特殊通知时除外），网上售票日期为网上出现的可售票日期。目前本网站仅发售普通客票，不发售军票等优惠票，如需购买请带好相关证件到车站售票窗口购买。</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">二、订票提交</div>\n' +
                    '            <span>当您在确认购票张数后，请您填写正确的个人信息（姓名、联系方式）以便于在班次变动时能及时与您取得联系。由于网上发售的客票资源有限，您需购买的客票超过限额时，请您拨打客服热线：0510-82588188，我们会给您提供及时的帮助！网上购票系统限购当前时间二小时后的客票。</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">三、付款时限</div>\n' +
                    '            <span> 订票成功后请在10分钟内付款，否则系统将自动取消您的订票。</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">四、购买流程</div>\n' +
                    '            <span>本网站购票可通过银联、支付宝和移动手机三种方式支付，旅客在订票成功后即可向本网站提交购票申请， 10分钟内选择以上三种支付方式中的任何一种完成支付，网站在得到银行的确认消息后，将正式为购票者记账，并将购票成功的信息反馈，同时给出《行程单》，请您务必按照操作流程及时记录您的订单号和取票密码，然后打印行程单，凭行程单或订单号可直接到检票口检票乘车！</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；"> 五、取票办法</div>\n' +
                    '            <span>您可以使用行程单或订单号直接到检票口检票上车，如需换取客票，凭网上购票时系统给出的订单号和取票密码到下列地点换取客票。换取客票后需凭客票乘车，原行程单自动作废。您的购票订单号和取票密码请注意保密，如由于您的泄密造成损失，本站概不负责。</span>\n' +
                    '        </p>\n' +
                    '    </div>'
            })
        });
    }
</script>


</body>
</html>
