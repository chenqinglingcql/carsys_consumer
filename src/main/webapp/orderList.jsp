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
    <title>我的订单</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/validate.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/orderList.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />

</head>
<body>
<div class="rule header">
    <jsp:include page="header.jsp"></jsp:include>
</div>
<div class="rule img">
    <img src="img/bus.png" width="1520" height="877" style="margin-top: 45px;opacity: 0.8">
</div>

<%--主体--%>
<div class="main">
    <%--表格--%>
    <table class="layui-table" title="我的订单">
        <tbody>
        <%--查询结果不为空--%>
        <c:if test="${requestScope.vo.list.size()!=0}">
            <%--表格--%>
            <div class="table">
                <table>
                    <colgroup>
                        <col width="120" class="orderId">
                        <col width="60">
                        <col width="150">
                        <col width="90">
                        <col width="90">
                        <col width="120">
                        <col width="120">
                        <col width="70">
                        <col width="70">
                        <col width="80">
                        <col width="80">
                        <%--车票状态--%>
                        <col width="80">
                        <col width="75">
                        <col width="150">
                    </colgroup>

                    <tbody>
                    <tr class="title">
                        <th style="text-align: center;width: 150px;" class="orderId">订单编号</th>
                        <th style="text-align: center;">姓名</th>
                        <th style="text-align: center;">身份证号</th>
                        <th style="text-align: center;">出发日期</th>
                        <th style="text-align: center;">出发时间</th>
                        <th style="text-align: center;">起始站</th>
                        <th style="text-align: center;">目的地</th>
                        <th style="text-align: center;">班次</th>
                        <th style="text-align: center;">座位号</th>
                        <th style="text-align: center;">检票窗口</th>
                        <th style="text-align: center;">车票类型</th>
                        <th style="text-align: center;">车票价格</th>
                        <th style="text-align: center;">车票状态</th>
                        <th style="text-align: center;">操作</th>
                    </tr>
                    <c:forEach items="${requestScope.vo.list}" var="order">
                        <tr>
                            <td class="orderId">
                                <div style="width:150px;text-align:center;height:46px; padding:0 10px;line-height:40px;white-space: nowrap;text-overflow: ellipsis;overflow: hidden">
                                        ${order.order_id}
                                </div>
                            </td>
                            <td>${order.name}</td>
                            <td>
                                <div style="width:150px;text-align:center;white-space: nowrap;padding:0 10px;text-overflow: ellipsis;overflow: hidden">
                                        ${order.person_id}
                                </div>
                            </td>
                            </td>
                            <td>${order.depart_date}</td>
                            <td>${order.depart_time}</td>
                            <td>${order.depart_station}</td>
                            <td>${order.dest_station}</td>
                            <td>${order.ticket_id}</td>
                            <td>${order.seat_id}</td>
                            <td>${order.checkout_id}</td>
                            <c:if test="${order.ticket_type=='1'}">
                                <td>全票</td>
                            </c:if>
                            <c:if test="${order.ticket_type=='0'}">
                                <td>半票</td>
                            </c:if>
                            <td>${order.ticket_price}</td>
                            <td>${order.ticket_status}</td>
                            <script>
                                var date=new Date();
                            </script>

                            <td>
                                <% Date now=new Date();
                                request.setAttribute("now",now);
                                %>
                                <c:if test="${order.depart_date < now}">
                                    <input type="button" disabled value="支付" class="layui-btn layui-btn-x" id="update" style="border-radius:5px;height:30px;line-height:35px;background-color: #a3a3a3"
                                           onclick="payforOrder('${path}','${order.order_id}')">
                                    <input type="button" disabled value="退订" class="layui-btn layui-btn-x" id="update" style="border-radius:5px;height:30px;line-height:35px;background-color: #a3a3a3;margin-left: -2px"
                                           onclick="deleteOrder('${path}','${order.order_id}')">
                                </c:if>

                                <c:if test="${order.depart_date >= now}">
                                    <c:if test="${order.ticket_status eq '未支付'}">
                                        <input type="button" value="支付" class="layui-btn layui-btn-x" id="update" style="border-radius:5px;height:30px;line-height:35px;background-color: #ff7600"
                                               onclick="payforOrder('${path}','${order.order_id}')">
                                        <input type="button" value="退订" class="layui-btn layui-btn-x" id="update" style="border-radius:5px;height:30px;line-height:35px;background-color: red;margin-left: -2px"
                                               onclick="deleteOrder('${path}','${order.order_id}')">
                                    </c:if>
                                    <c:if test="${order.ticket_status eq '未检票'}">
                                        <input type="button" value="改签" class="layui-btn layui-btn-x" id="update" style="border-radius:5px;height:30px;line-height:35px;background-color: #5FB878"
                                               onclick="viewOneorder('${path}','${order.order_id}')">
                                        <input type="button" value="退票" class="layui-btn layui-btn-x" id="delete" style="border-radius:5px;height:30px;line-height:35px;background-color: #009688;margin-left: -2px"
                                               onclick="deleteOrder('${path}','${order.order_id}')">
                                    </c:if>

                                </c:if>

                                <%--<input type="button" value="查看" class="layui-btn layui-btn-x" id="view" style="background-color: #ff7600"
                                       onclick="viewOneorder('${path}','${order.order_id}')">--%>



                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div style="width:1400px;margin:-60px auto;text-align: center">
                <ul class="pagination" style="text-align: center">
                    <!--分页 -->
                        <%-- 若在第一页，则不可以点击上一页 --%>
                    <c:if test="${vo.pageNow == 1}">
                    <li class="disabled">
                        <a href=""><span aria-hidden="true">&laquo;</span></a>
                        </c:if>
                            <%-- 若不在第一页，则可以点击上一页 --%>
                        <c:if test="${vo.pageNow != 1}">
                    <li>
                        <a href="/order?method=viewMyOrders&pageNow=${vo.pageNow-1}" aria-label="Previous"><span
                                aria-hidden="true">&laquo;</span></a>
                    </li>
                    </c:if>


                    <c:forEach begin="1" end="${vo.myPages}" var="page">

                        <%--  若当前页码pageNow正好是page，则显示被点击的状态 --%>
                        <c:if test="${vo.pageNow == page}">
                            <li class="active">
                                <a href="JavaScript:void(0)"  style="background-color: #ff7600;border-color: #ff7600">${page}</a>
                            </li>
                        </c:if>

                        <%--  若当前页码pageNow不是page，则显示可以点击的状态 --%>
                        <c:if test="${vo.pageNow != page}">
                            <li>
                                <a href="/order?method=viewMyOrders&pageNow=${page}">${page}</a>
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
                            <a href="/order?method=viewMyOrders&pageNow=${vo.pageNow+1}" aria-label="Next"> <span
                                    aria-hidden="true">&raquo;</span></a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </c:if>
        <!-- 分页结束 -->
        </tbody>
    </table>
</div>

<%--尾部--%>
<div class="rule footer">
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body

<script src="layui/layui.js"></script>
<script>
    //删除单个商品
    function deleteOrder(url, order_id) {
        $.ajax({
            type: "post",
            url: url + "/order?method=deleteOrder&order_id=" + order_id,
            success: function (rs) {
                $(".info").html(rs);
            }
        });
    };
    //删除单个商品(未支付)
    function deleteOrder(url, order_id) {
        $.ajax({
            type: "post",
            url: url + "/order?method=deleteOrderNoPay&order_id=" + order_id,
            success: function (rs) {
                $(".info").html(rs);
            }
        });
    };

    /*改签*/
    function viewOneorder(url, order_id) {
        $.ajax({
            type: "post",
            url: url + "/order?method=viewOneOrder&order_id=" + order_id,
            success: function (rs) {
                $("body").html(rs);
            }
        });
    }

    //支付订单
    function payforOrder(url,order_id) {
        $.ajax({
            type: "post",
            url: url + "/order?method=viewNoPayOrder&order_id=" + order_id,
            success: function (rs) {
                $("body").html(rs);
            }
        });
    }
</script>


</html>
