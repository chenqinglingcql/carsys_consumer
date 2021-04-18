<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">

    <%-- 引入在线iconfont--%>
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_2396675_xfuri2tjfpa.css">

</head>

<body>

<%--头部--%>
<div class="rule header">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<c:set value="${pageContext.request.contextPath}" scope="application" var="path"></c:set>

<%--中间--%>
<div class="rule content">
    <%--交换按钮--%>
    <div class="exchange">
        <i class="iconfont icon-quanrejiaohuan-" id="exchangeInput">
        </i>
    </div>

    <%--搜索框--%>
    <div class="left">
        <div class="search">
            <p class="searchTitle">快速查询</p>
            <div>&nbsp;</div>
            <form class="form-horizontal" id="selectForm" method="post" action="/ticket?method=viewTicketByDepartDest">
                <div class="form-group">
                    <label for="depart_city" class="col-sm-2 control-label"
                           style="width:100px;text-align: right;color:#808080;">出发城市</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="depart_city" name="depart_city"
                               placeholder="请输入出发城市" style="width: 210px;height: 37px;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="dest_city" class="col-sm-2 control-label"
                           style="width:100px;text-align: right;color:#808080;">到达城市</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="dest_city" name="dest_city"
                               placeholder="请输入到达城市" style="width: 210px;height: 37px;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="depart_date" class="col-sm-2 control-label"
                           style="width:100px;text-align: right;color:#808080;">出发日期</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" id="depart_date" name="depart_date"
                               style="width: 210px;height: 37px;">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" width="100" value="搜索" name="submit"
                               style="border-radius:5px;border:none;background-color: #ff7600; height: 35px; width: 150px;font-weight:500;color: white;margin-top:10px;margin-left: 35px;"
                               class="submit">
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%--用户身份--%>
    <div class="user">
        <div class="userPic">
            <div>
                <c:if test="${user!=null}">
                    <a href="my_self.jsp">
                        <img src="${user.uimage}" width="60" height="60">
                    </a>
                </c:if>
                <c:if test="${user==null}">
                    <a href="login.jsp">
                        <img src="img/userPic.png" width="60" height="60">
                    </a>
                </c:if>

            </div>
        </div>


        <ul>
            <li>
                <a href="/order?method=viewNoPayList">
                    <i class="iconfont icon-daizhifu"></i>
                    待支付订单
                </a>
            </li>
            <li>
                <a href="/order?method=viewPayList">
                    <i class="iconfont icon-yiwancheng"></i>
                    已支付订单
                </a>
            </li>
            <li>
                <a href="/order?method=viewMyOrders">
                    <i class="iconfont icon-fenlei-mianxing"></i>
                    历史路线
                </a>
            </li>
        </ul>
    </div>

    <%--轮播图--%>
    <div class="rule banner">
        <div class="layui-carousel" id="test1">
            <div carousel-item>
                <div><img src="img/Banner1.png" style="position: absolute;left:-100px;"></div>
                <div><img src="img/Banner2.png" style="position: absolute;left:-220px;"></div>
            </div>
        </div>
    </div>
</div>


<%--下部--%>
<div class="rule down">
    <div class="downLeft">
        <div class="leftTop">
            <i class="iconfont icon-huobao"></i>
            <span>热门路线</span>
            <div class="line"></div>
        </div>

        <div class="leftDown">
            <div class="Tips">
                <div>
                    <div class="TipsTitle">无锡&nbsp;&nbsp;&nbsp;—&nbsp;&nbsp;&nbsp;南京</div>
                    <div class="TipsPrice">￥
                        <span>47.0</span>
                        <script type="text/javascript">
                            var date = new Date();
                            day = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
                            $(".dayeTD").text(day);
                        </script>
                        <a onclick="view('无锡','南京')" class="layui-btn">购买</a>
                    </div>
                </div>
                <div>
                    <div class="TipsTitle">无锡&nbsp;&nbsp;&nbsp;—&nbsp;&nbsp;&nbsp;上海</div>
                    <div class="TipsPrice">￥
                        <span>56.0</span>
                        <a onclick="view('无锡','上海')" class="layui-btn">购买</a>
                    </div>
                </div>
                <div>
                    <div class="TipsTitle">无锡&nbsp;&nbsp;&nbsp;—&nbsp;&nbsp;&nbsp;张家港</div>
                    <div class="TipsPrice">￥
                        <span>23.0</span>
                        <a onclick="view('无锡','张家港')" class="layui-btn">购买</a>
                    </div>
                </div>
                <div>
                    <div class="TipsTitle">无锡&nbsp;&nbsp;&nbsp;—&nbsp;&nbsp;&nbsp;苏州</div>
                    <div class="TipsPrice">￥
                        <span>21.0</span>
                        <a onclick="view('无锡','苏州')" class="layui-btn">购买</a>
                    </div>
                </div>
                <div>
                    <div class="TipsTitle">无锡&nbsp;&nbsp;&nbsp;—&nbsp;&nbsp;&nbsp;淮安</div>
                    <div class="TipsPrice">￥
                        <span>104.0</span>
                        <a onclick="view('无锡','淮安')" class="layui-btn">购买</a>
                    </div>
                </div>
                <div>
                    <div class="TipsTitle">无锡&nbsp;&nbsp;&nbsp;—&nbsp;&nbsp;&nbsp;杭州</div>
                    <div class="TipsPrice">￥
                        <span>87.0</span>
                        <a onclick="view('无锡','杭州')" class="layui-btn">购买</a>
                    </div>
                </div>
                <div>
                    <div class="TipsTitle">无锡&nbsp;&nbsp;&nbsp;—&nbsp;&nbsp;&nbsp;芜湖</div>
                    <div class="TipsPrice">￥
                        <span>90.0</span>
                        <a onclick="view('无锡','芜湖')" class="layui-btn">购买</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="downRight">
        <div class="rightTop">
            <i class="iconfont icon-luxian"></i>
            <span>热点新闻</span>
            <div class="line"></div>
        </div>
        <div class="rightDown">
            <div>
                <jsp:include page="newsComponent.jsp"></jsp:include>
            </div>
        </div>
    </div>
</div>

<%--下部常见问题部分--%>
<div class="rule problem">
    <a href="/problem?method=view&link=全部问题">&nbsp;&nbsp;&nbsp;常见问题&nbsp;&nbsp;&nbsp;</a>
    <a href="/problem?method=view&link=购票问题">
        <div>
            <i class="iconfont icon-busdaba"></i>
            购票
        </div>
    </a>
    <a href="/problem?method=view&link=支付问题">
        <div>
            <i class="iconfont icon-icon1"></i>
            支付
        </div>
    </a>
    <a href="/problem?method=view&link=取票问题">
        <div>
            <i class="iconfont icon-piaoju"></i>
            取票
        </div>
    </a>
    <a href="/problem?method=view&link=退票改签问题">
        <div>
            <i class="iconfont icon-tianchongxing-"></i>
            退票改签
        </div>
    </a>
    <a href="/problem?method=view&link=班次查询">
        <div>
            <i class="iconfont icon-solid-time"></i>
            班次查询
        </div>
    </a>
    <a href="/problem?method=view&link=个人账户问题">
        <div>
            <i class="iconfont icon-G_gerenzhanghujibenxinxi_grzhjbxx"></i>
            个人账户
        </div>
    </a>
    <a href="/problem?method=view&link=其他问题">
        <div>
            <i class="iconfont icon-youhuiquan"></i>
            其他问题
        </div>
    </a>
</div>


<%--下部广告杂物模块--%>
<div class="rule adv">
    <div class="advList">
        <div>
            <div>
                <i class="iconfont icon-videocameraadd"></i>
                <p>权威报道</p>
            </div>
        </div>
        <div>
            <div>
                <i class="iconfont icon-shizhong"></i>
                <p>全程服务</p>
            </div>
        </div>
        <div>
            <div>
                <i class="iconfont icon-diqiu"></i>
                <p>全面覆盖</p>
            </div>
        </div>
        <div>
            <div>
                <i class="iconfont icon-piao"></i>
                <p>方便快捷</p>
            </div>
        </div>
    </div>
</div>

<div class="rule adv2">
    <div class="adv2List">
        <div style="flex-grow: 0.8">
            <div class="iconfontdiv">
                <i class="iconfont icon-kefu"></i>
                <p>24h为您服务</p>
            </div>
        </div>
        <div>
            <ul>
                <li><span>客运服务</span></li>
                <li><a href="/ticket?method=viewTicketByDepartDest">在线预定</a></li>
                <li><a href="/route?method=viewAllRoute">经营路线</a></li>
                <li><a href="tourist.jsp">班线旅游景点推荐</a></li>
            </ul>
        </div>
        <div>
            <ul>
                <li><span>最新活动</span></li>
                <li><a href="/new?method=viewAllNews">客运动态</a></li>
                <li><a href="/new?method=viewAllNews">车站资讯</a></li>
            </ul>
        </div>
        <div>
            <ul>
                <li><span>乘客须知</span></li>
                <li><a href="info.jsp">购票提醒</a></li>
                <li><a href="info.jsp">窗口设置</a></li>
                <li><a href="info.jsp">联网售票</a></li>
                <li><a href="info.jsp">实名制购票</a></li>
            </ul>
        </div>
    </div>
</div>

<%--尾部--%>
<div class="rule footer">
    <jsp:include page="footer.jsp"></jsp:include>
</div>

</body>

<script src="layui/layui.js"></script>

<script>
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            /* ,arrow: 'always' //始终显示箭头*/
            , width: '1536px'
            , height: '370px'
            //,anim: 'updown' //切换动画方式
        });
    });
</script>

<script>
    /*查看待支付订单*/
    function noPayList() {
        $.ajax({
            type: 'get',
            url: '/order?method=viewNoPayList',
            success(rs) {
                $(rs).html(rs);
            }
        });

    }
</script>

<script>

    function view(depart_city, dest_city) {
        var date = new Date();
        var day = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
        window.location.href = "/ticket?method=viewTicketByDepartDest&depart_city=" + depart_city + "&dest_city=" + dest_city + "&depart_date=" + day;
    }
</script>

<%--交换两个文本框的值--%>
<script>
    $(function () {

        $("#exchangeInput").click(function () {
            var text1 = $("#depart_city").val();
            var text2 = $("#dest_city").val();
            $("#depart_city").val(text2);
            $("#dest_city").val(text1);
        })
    })
</script>


<%--刷新数据库日期--%>
<%--<script>
    var isLoaded=false;
    function flush() {
        $.ajax({
            type: "get",
            url:"/ticket?method=flushTime",
            beforeSend:function () {
                isLoaded=false;
            },
            success:function (rs) {
             console.log("更新成功");
            },
            complete:function () {
                isLoaded=true;
            },
            error:function () {
                console.log("刷新时间失败");
            }
        });
    }
    //每隔24消失刷新一次数据库
    flush();
    setInterval(function (){
        isLoaded && flush();
    } ,24*60*60*1000);

</script>--%>


</html>

