<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>查看车票</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/validate.js" type="text/javascript"></script>
<link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />


<style>
    body {
        margin-top: 20px;
        margin: 0 auto;
        width: 100%;
    }

    .carousel-inner .item img {
        width: 100%;
        height: 300px;
    }

    font {
        color: #009688;
        font-size: 18px;
        font-weight: normal;
        padding: 0 10px;
    }

    .error{
        color:red;
    }
</style>
</head>
<body >

<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" />


<div class="container" style="width: 100%;">
    <!-- 引入header.jsp -->
    <div>
        <jsp:include page="/header.jsp"></jsp:include>
    </div>

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8"
             style="background: #fff;position:relative; margin-left: 80px;margin-top: 10px; ">
            <font style="margin-left: 350px;font-size: large;">车票改签</font>
            <div>&nbsp;</div>
            <form id="updateOrderForm" class="form-horizontal" action="${pageContext.request.contextPath}/order?method=viewMyOrders" style="margin-top: 5px;" method="post">
                <div class="form-group">
                    <label for="order_id" class="col-sm-2 control-label">订单编号</label>
                    <div class="col-sm-6">
                        <input type="text"  readonly class="form-control" id="order_id" name="order_id" value="${order.order_id}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="depart_date" class="col-sm-2 control-label">日期</label>
                    <div class="col-sm-6">
                        <input type="date" readonly class="form-control" id="depart_date" name="depart_date" value="${order.depart_date}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="depart_time" class="col-sm-2 control-label">出发时间</label>
                    <div class="col-sm-6">
                        <%--选择乘车时间--%>
                        <input type="text"   name="depart_time" readonly id="depart_time" style="width: 100px;height:30px;" value="${order.depart_time}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="depart_station"  class="col-sm-2 control-label">始发站</label>
                    <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="depart_station" name="depart_station"value="${order.depart_station}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="dest_station"  class="col-sm-2 control-label">目的地</label>
                    <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="dest_station" name="dest_station"value="${order.dest_station}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="depart_station"  class="col-sm-2 control-label">车次</label>
                    <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="" name="dest_station"value="${order.ticket_id}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="bus_type"  class="col-sm-2 control-label">汽车类型</label>
                    <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="bus_type" name="bus_type"value="${order.bus_type}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="checkout_id"  class="col-sm-2 control-label">检票窗口</label>
                    <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="checkout_id" name="checkout_id"value="${order.checkout_id}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">乘车人姓名</label>
                    <div class="col-sm-6">
                        <input type="text"  readonly class="form-control" id="name" name="name" value="${order.name}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="person_id" class="col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-6">
                        <input type="text"  readonly class="form-control" id="person_id" name="person_id" value="${order.person_id}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="telephone" class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-6">
                        <input type="tel" readonly class="form-control" id="telephone" name="telephone" value="${order.telephone}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="ticke_type" class="col-sm-2 control-label">车票类型</label>
                    <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="ticke_type" name="ticke_type" value="${order.ticket_type}">
                    </div>
                </div>

                <div class="form-group opt">
                    <label for="insurance" class="col-sm-2 control-label">是否购买保险</label>
                    <div class="col-sm-6">

                        <div id="insurance" name="insurance">
                            <c:if test="${order.insurance==true}">是</c:if>
                            <c:if test="${order.insurance==false}">否</c:if>
                        </div>
                    </div>
                    <%-- 出现错误信息 --%>
                    <%--<lable for="sex" class="error" style="display:none">性别必选</lable>--%>
                </div>
                <div class="form-group opt">
                    <label for="if_take_children" class="col-sm-2 control-label">是否携带儿童</label>
                    <div class="col-sm-6">
                        <div id="if_take_children" name="if_take_children">
                            <c:if test="${order.insurance==true}">是</c:if>
                            <c:if test="${order.insurance==false}">否</c:if>
                        </div>
                    </div>
                    <%-- 出现错误信息 --%>
                    <%--<lable for="sex" class="error" style="display:none">必选</lable>--%>
                </div>
                <div class="form-group">
                    <label for="ticket_price" class="col-sm-2 control-label">票价</label>
                    <div class="col-sm-6">
                        <input type="text" aria-readonly="true" readonly class="form-control" id="ticket_price" name="ticket_price"  value="￥${order.ticket_price}元">
                    </div>
                </div>
                <div class="form-group">
                    <label for="ticket_status" class="col-sm-2 control-label">车票状态</label>
                    <div class="col-sm-6">
                        <input type="text" readonly class="form-control" id="ticket_status" name="ticket_status" value="${order.ticket_status}">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" width="100" value="确认"
                               style="background-color: #009688; height: 35px; width: 100px;margin-left: 200px;  color: white;">
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-2"></div>

    </div>



    <!-- 引入footer.jsp -->
    <div class="footer" >
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</div>

<c:if test="${msg!=null}">
    <script>
        alter("${msg}");
    </script>
</c:if>
</body>
</html>




