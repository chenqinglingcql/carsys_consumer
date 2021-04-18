<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/3/11
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>热点旅游城市</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/tourist.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />

    <%-- 引入在线iconfont--%>
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_2396675_oj58aq826k.css">
</head>
<body>
<%--头部--%>
<div class="rule header">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<%--购票流程--%>
<%--购票须知--%>
<div class="infoTop"><i class="iconfont icon-tixing"></i></div>
<div class="infoDown" onclick="goupiaoxuzhi()" id="goupiaoxuzhi">
    <div>购票须知</div>
</div>

<div class="rule container">
    <div style="width: 716px;height: 280px">
        <p>南京</p>
        <img src="img/nanjin%20(5).jpg" width="735" height="400" style="margin-left:-20px;margin-top: -30px">
        <a onclick="view('无锡','南京')" class="layui-btn">预订</a>
    </div>
    <div>
        <img src="img/nanjin%20(1).jpg" width="390" height="300" style="margin-left:-20px;margin-top: -10px">
    </div>
    <div>
        <img src="img/nanjin%20(2).jpg" width="390" height="300" style="margin-left:-20px;margin-top: -10px">
    </div>
    <div>
        <img src="img/nanjin%20(3).jpg" width="390" height="300" style="margin-left:-20px;margin-top: -10px">
    </div>
    <div>
        <img src="img/nanjin%20(4).jpg" width="420" height="300" style="margin-left:-35px;margin-top: -10px">
    </div>
</div>
<div class="rule container1">
    <div>
        <img src="img/suzhou%20(1).jpg" width="390" height="300" style="margin-left:-20px;margin-top: -10px">
    </div>
    <div>
        <img src="img/suzhou%20(2).jpg" width="390" height="300" style="margin-left:-20px;margin-top: -10px">
    </div>
    <div>
        <img src="img/suzhou%20(3).jpg" width="390" height="300" style="margin-left:-20px;margin-top: -10px">
    </div>
    <div>
        <img src="img/suzhou%20(4).jpg" width="390" height="300" style="margin-left:-20px;margin-top: -10px">
    </div>
    <div style="width: 716px;height: 280px">
        <p>苏州</p>
        <img src="img/suzhou.jpg" width="735" height="450" style="margin-top: -50px">
        <a onclick="view('无锡','苏州')" class="layui-btn">预订</a>
    </div>
</div>
<div class="rule container1">
    <div style="width: 716px;height: 280px">
        <p>上海</p>
        <img src="img/shanghai.jpg" width="735" height="340" style="margin-left:-20px;margin-top: -10px">
        <a onclick="view('无锡','上海')" class="layui-btn">预订</a>
    </div>
    <div>
        <img src="img/shanghai1%20(1).jpg" width="390" height="300" style="margin-left:-20px;">
    </div>
    <div>
        <img src="img/shanghai1%20(2).jpg" width="390" height="300" style="margin-left:-20px;margin-top: -10px">
    </div>
    <div>
        <img src="img/shanghai1%20(3).jpg" width="390" height="300" style="margin-left:-20px;">
    </div>
    <div>
        <img src="img/shanghai1%20(4).jpg" width="390" height="300" style="margin-left:-20px;">
    </div>
</div>
<div class="rule container1">
    <div>
        <img src="img/wuhu%20(2).jpg" width="390" height="300" style="margin-left:-20px;">
    </div>
    <div>
        <img src="img/wuhu%20(1).jpg" width="390" height="320" style="margin-left:-20px;">
    </div>
    <div>
        <img src="img/wuhu%20(1).png" width="390" height="300" style="margin-left:-20px;">
    </div>
    <div>
        <img src="img/wuhu%20(4).jpg" width="390" height="310" style="margin-bottom: -70px">
    </div>
    <div style="width: 716px;height: 280px">
        <p>芜湖</p>
        <img src="img/wuhu%20(3).jpg" width="735" height="450" style="margin-left:-20px;margin-top: -40px">
        <a onclick="view('无锡','芜湖')" class="layui-btn">预订</a>
    </div>
</div>
<div class="rule container1">
    <div style="width: 716px;height: 280px">
        <p>杭州</p>
        <img src="img/hangzhou%20(4).jpg" width="735" height="400" style="margin-left:-20px;margin-top: -10px">
        <a onclick="view('无锡','杭州')" class="layui-btn">预订</a>
    </div>
    <div>
        <img src="img/hangzhou%20(1).jpg" width="390" height="300" style="margin-left:-20px;">
    </div>
    <div>
        <img src="img/hangzhou%20(2).jpg" width="410" height="300" style="margin-left:-20px;margin-top: -10px">
    </div>
    <div>
        <img src="img/hangzhou%20(3).jpg" width="410" height="300" style="margin-left:-20px;">
    </div>
    <div>
        <img src="img/hangzhou.jpeg" width="430" height="300" style="margin-left:-70px;margin-top: -20px">
    </div>
</div>
<%--<div class="rule container1">
    <div>
        <img src="img/wuxi5.jpg" width="440" height="300" style="margin-left:-20px;">
    </div>
    <div>
        <img src="img/wuxi.jpg" width="460" height="340" style="margin-left:-40px;margin-top: -40px">
    </div>
    <div>
        <img src="img/wuxi4.jpg" width="390" height="300" style="margin-left:-20px;">
    </div>
    <div>
        <img src="img/wuxi3.jpg" width="390" height="310" style="margin-bottom: -70px">
    </div>
    <div style="width: 716px;height: 280px">
        <p>无锡</p>
        <img src="img/wuxi2.jpg" width="735" height="580" style="margin-left:-20px;margin-top: -120px">
    </div>
</div>--%>

<%--尾部--%>
<div class="footer">
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>

<script>
    function view(depart_city, dest_city) {
        var date = new Date();
        var day = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
        window.location.href = "/ticket?method=viewTicketByDepartDest&depart_city=" + depart_city + "&dest_city=" + dest_city + "&depart_date=" + day;
    }

</script>
<script>
    /*购物须知弹窗*/
    function goupiaoxuzhi() {
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.open({
                type: 1,
                /*按钮*/
                btn: ['我知道了'],
                /*按钮居中放置*/
                btnAlign: 'c',
                title: '网上购票须知',
                /*弹出动画：1 从上到下 5：渐显*/
                anim: 5,
                /*是否出现滚动*/
                scrollbar: true,
                /*是否显示关闭按钮*/
                closeBtn: 1,
                area: ['400px', '400px'],
                //位置
                offset: ['120px', '600px'],
                content: '<div style="padding: 20px">\n' +
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

</html>
