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
    <title>支付订单</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/validate.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/payforOrder.css">
    <style>
        body{
            background-color: #FFFFFF!important;
        }
    </style>
</head>

<body>

<div class="rule header">
    <jsp:include page="header.jsp"></jsp:include>
</div>
<div class="rule img">
    <img src="img/Banner1.png" width="1520" height="300">
</div>

<div class="rule container">
    <form class="" id="orderForm" action="${path}/order?method=confirmOrder" method="post">
        <%--表格--%>
        <div class="table">
            <table class="layui-table" style="text-align: center">
                <colgroup>
                    <col width="160">
                    <col width="160">
                </colgroup>
                <thead>
                <tr>
                    <th style="text-align: center">车票编号</th>
                    <th style="text-align: center">起始点</th>
                    <th style="text-align: center">终点站</th>
                    <th style="text-align: center">日期</th>
                    <th style="text-align: center">发车时间</th>
                    <th style="text-align: center">车次</th>
                    <th style="text-align: center">车型</th>
                    <th style="text-align: center">检票站台</th>
                    <th style="text-align: center">座位号</th>
                    <th style="text-align: center">汽车票状态</th>
                    <th style="text-align: center">汽车票类型</th>
                    <th style="text-align: center">乘车人姓名</th>
                    <th style="text-align: center">乘车人身份证号</th>
                    <th style="text-align: center">是否购买保险</th>
                    <th style="text-align: center">是否携带儿童</th>
                </tr>
                </thead>
                <%-- <c:forEach items="${orders.itemList}" var="orderItem">--%>
                <tbody>
                <tr>
                    <td>
                        <div style="width:150px;text-align:center;height:40px; padding:0 10px;line-height:40px;white-space: nowrap;text-overflow: ellipsis;overflow: hidden">
                            ${order.order_id}
                        </div>
                    </td>
                    <td>${order.depart_station}</td>
                    <td>${order.dest_station}</td>
                    <td>${order.depart_date}</td>
                    <td>${order.depart_time}</td>
                    <td>${order.ticket_id}</td>
                    <td>${order.bus_type}</td>
                    <td>${order.checkout_id}</td>
                    <td>${order.seat_id}</td>
                    <td>${order.ticket_status}</td>

                    <%-- <td>${order.ticket_type}</td>--%>
                    <c:if test="${order.ticket_type=='1'}">
                        <td>全票</td>
                    </c:if>
                    <c:if test="${order.ticket_type=='0'}">
                        <td>半票</td>
                    </c:if>

                    <td>${order.name}</td>
                    <td>${order.person_id}</td>
                    <%-- <td>${order.insurance}</td>
                     <td>${order.if_taken_children}</td>--%>

                    <c:if test="${order.ticket_type==true}">
                        <td>是</td>
                    </c:if>
                    <c:if test="${order.ticket_type==false}">
                        <td>否</td>
                    </c:if>
                    <c:if test="${order.ticket_type==true}">
                        <td>是</td>
                    </c:if>
                    <c:if test="${order.ticket_type==false}">
                        <td>否</td>
                    </c:if>

                </tr>
                </tbody>
                <%--</c:forEach>--%>
            </table>
        </div>
        <div style="text-align: right; margin-right: 120px;">
            订单总金额: <strong style="color: #ff7600;font-size: 20px">￥${order.ticket_price}0</strong>
        </div>

        <hr/>

        <div style="margin-top: 5px; margin-left: 50px;color: black">
            <strong>选择支付方式</strong>
            <p>
                <br/>
                <input type="radio" name="pd_FrpId" value="alipay"/>
                &nbsp;&nbsp<img src="img/zhifubao.jpg" align="middle" width="160" height="85" style="margin-right: 30px"/>
                <input type="radio" name="pd_FrpId" value="weixin"/>
                &nbsp;&nbsp<img src="img/weixin.jpg" align="middle" width="160" height="85" />
            </p>

            <p style="text-align: right; margin-right: 100px;">

                <a href="javascript:document.getElementById('orderForm').submit();">
                    <input type="submit" width="100" value="确认支付" class="submit"
                           style="margin-left: 130px;border-radius:5px;border:none;background-color: #ff7600; height: 50px; width: 200px;font-weight:500;color: white;font-size: 20px">
                </a>
            </p>
        </div>
    </form>
</div>


<%--尾部--%>
<div class="rule footer">
    <jsp:include page="footer.jsp"></jsp:include>
</div>
<script src="layui/layui.js"></script>

</body>
</html>
