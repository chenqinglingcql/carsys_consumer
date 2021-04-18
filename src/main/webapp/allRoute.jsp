<%@ page import="java.util.Date" %>
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
    <title>所有路线</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/allRoute.css">

    <%-- 引入在线iconfont--%>
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_2396675_oj58aq826k.css">
</head>

<script>
    var day;
</script>

<body>
<%@ page isELIgnored="false" %>

<%--头部部分--%>
<div class="rule header">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<div class="rule img">
    <img src="img/earth2.png" width="1560" height="569" style="margin-top: 45px;opacity: 0.8">
</div>

<%--购票流程--%>
<%--购票须知--%>
<div class="infoTop"><i class="iconfont icon-tixing"></i></div>
<div class="infoDown" onclick="goupiaoxuzhi()" id="goupiaoxuzhi">
    <div>购票须知</div>
</div>

<div class="rule main">
    <%--<div>
        <jsp:include page="h.jsp"></jsp:include>
    </div>--%>

    <%--主体--%>
    <div style="width:70%;text-align: center;margin: auto;">
        <%--若查询无结果，则显示图片--%>
        <c:if test="${requestScope.vo.list.size()==0}">
            <img src="img/notfound.png" style="width: 50px;">
        </c:if>
        <%--查询结果不为空--%>
        <c:if test="${requestScope.vo.list.size()!=0}">
            <%--表格--%>
            <div class="table">
                <table class="layui-table" style="text-align: center">
                    <colgroup>
                        <col width="100">
                        <col width="100">
                    </colgroup>
                    <thead>
                    <tr class="title">
                        <th style="text-align: center;">起点城市</th>
                        <th style="text-align: center; width: 100px"></th>
                        <th style="text-align: center;">目的城市</th>
                        <th style="text-align: center;">日期</th>
                        <th style="text-align: center;">票价</th>
                        <th style="text-align: center;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.vo.list}" var="route">
                        <tr>
                            <td>${route.route_depart_city}</td>
                            <td><img src="img/link-arrow-h.png" style="width: 50px; height:50px;opacity: 80%"></td>
                            <td>${route.route_dest_city}</td>
                            <td id="dateTd" class="dayeTD">
                                <script type="text/javascript">
                                    var date = new Date();
                                    day = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
                                    $(".dayeTD").text(day);
                                </script>
                            </td>
                            <td>￥${route.route_price}起</td>
                            <td style="text-align: center">
                                <button value="查看车票" class="layui-btn layui-btn-x"
                                        style="background-color: #ff7600;border-radius: 5px"
                                        onclick="view('${route.route_depart_city}','${route.route_dest_city}')">查看
                                </button>
                                    <%--                                    <button value="查看车票" class="layui-btn layui-btn-x" onclick="view('无锡','张家港')">查看</button>--%>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div style="width: 800px;margin:0px auto;text-align: center">
                <ul class="pagination" style="text-align: center">
                    <!--分页 -->
                        <%-- 若在第一页，则不可以点击上一页 --%>
                    <c:if test="${vo.pageNow == 1}">
                        <li class="disabled">
                            <a href="JavaScript:void(0)" aria-label="Previous"><span
                                    aria-hidden="true">&laquo;</span></a>
                        </li>
                    </c:if>
                        <%-- 若不在第一页，则可以点击上一页 --%>
                    <c:if test="${vo.pageNow != 1}">
                        <li>
                            <a href="/route?method=viewAllRoute&pageNow=${vo.pageNow-1}" aria-label="Previous"><span
                                    aria-hidden="true">&laquo;</span></a>
                        </li>
                    </c:if>

                    <c:forEach begin="1" end="${vo.myPages}" var="page">

                        <%--  若当前页码pageNow正好是page，则显示被点击的状态 --%>
                        <c:if test="${vo.pageNow == page}">
                            <li class="active">
                                <a href="JavaScript:void(0)">${page}</a>
                            </li>
                        </c:if>

                        <%--  若当前页码pageNow不是page，则显示可以点击的状态 --%>
                        <c:if test="${vo.pageNow != page}">
                            <li>
                                <a href="/route?method=viewAllRoute&pageNow=${page}">${page}</a>
                            </li>
                        </c:if>

                    </c:forEach>


                        <%-- 若在最后一页，则不可以点击下一页 --%>
                    <c:if test="${vo.pageNow == vo.myPages}">
                        <li class="disabled">
                            <a href="JavaScript:void(0)" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
                        </li>
                    </c:if>

                        <%-- 若不在最后一页，则可以点击下一页 --%>
                    <c:if test="${vo.pageNow != vo.myPages}">
                        <li>
                            <a href="/route?method=viewAllRoute&pageNow=${vo.pageNow}" aria-label="Next"> <span
                                    aria-hidden="true">&raquo;</span></a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </c:if>
        <!-- 分页结束 -->
    </div>
</div>
<%--尾部--%>
<div class="rule  footer">
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
<script src="layui/layui.js"></script>
<%--购票须知弹窗--%>
<script>

    function view(route_depart_city, route_dest_city, day) {
        var text = $("#dateTd").text();
        console.log(text)
        window.location.href = "/ticket?method=viewTicketByDepartDest&depart_city=" + route_depart_city + "&dest_city=" + route_dest_city + "&depart_date=" + text;
    }

    /*日期插件*/
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#laydate'
        });
    });

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

<script>
    function viewOne() {
        $.ajax({
            type: "get",
            url: url,
            success: function (rs) {
                $('.takeOrderForm').html(rs);
            }
        })
    }

</script>
</body>
</html>
