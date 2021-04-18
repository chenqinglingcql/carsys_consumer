<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>车票改签</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/validate.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />

    <style>
        .img {
            width: 100%;
            height: 877px;
            margin-top: -230px;
        }

        .row {
            margin-top: -580px;
            background-color: rgba(255,255,255,0.4);
            backdrop-filter: blur(3px);
        }

        .error {
            color: red;
        }

        .submit:hover {
            box-shadow: 0px 0px 5px #333;
        }

        .footer {
            position: absolute;
            width: 100%;
            height: 60px;
            bottom: 0;
        }



    </style>
</head>
<body>
<div class="rule header">
    <jsp:include page="header.jsp"></jsp:include>
</div>
<div class="rule img">
    <img src="img/bus.png" width="1560" height="877" style="margin-top: 45px;">
</div>

<%-- 隐藏域：存储项目发布路径 --%>
<input type="hidden" id="path" value="${pageContext.request.contextPath}"/>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8"
         style="position:relative;margin-left: 350px">
        <font style="margin-left: 350px;font-size: large;">车票改签</font>
        <div>&nbsp;</div>
        <form id="updateOrderForm" class="form-horizontal" style="margin-top: 5px;" method="post"
              action="/order?method=updateOrder&order_id=${order.order_id}">
            <div class="form-group">
                <label for="depart_date" class="col-sm-2 control-label">日期</label>
                <div class="col-sm-6">
                    <input type="date" class="form-control" id="depart_date" name="depart_date"
                           value="${order.depart_date}">
                </div>
            </div>
            <div class="form-group">
                <label for="depart_time" class="col-sm-2 control-label">出发时间</label>
                <div class="col-sm-6">
                    <%--选择乘车时间--%>
                    <select name="depart_time" id="depart_time" style="width: 100px;height:30px;"
                            value="${order.depart_time}">
                        <script>
                            $("#depart_time").val("${order.depart_time}");
                        </script>
                        <c:forEach items="${ticketList}" var="ticket">
                            <option value="${ticket.depart_time}"> ${ticket.depart_time}</option>
                        </c:forEach>
                    </select>
                    <%--
                                            <input type="date"  class="form-control" id="depart_time" name="depart_time" value="${order.depart_time}">
                    --%>
                </div>
            </div>
            <div class="form-group">
                <label for="depart_station" class="col-sm-2 control-label">始发站</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control" id="depart_station" name="depart_station"
                           value="${order.depart_station}">
                </div>
            </div>
            <div class="form-group">
                <label for="dest_station" class="col-sm-2 control-label">目的地</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control" id="dest_station" name="dest_station"
                           value="${order.dest_station}">
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">乘车人姓名</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control" id="name" name="name" value="${order.name}">
                </div>
            </div>
            <div class="form-group">
                <label for="person_id" class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control" id="person_id" name="person_id"
                           value="${order.person_id}">
                </div>
            </div>

            <div class="form-group">
                <label for="telephone" class="col-sm-2 control-label">电话</label>
                <div class="col-sm-6">
                    <input type="tel" readonly class="form-control" id="telephone" name="telephone"
                           value="${order.telephone}">
                </div>
            </div>
            <div class="form-group">
                <label for="ticke_type" class="col-sm-2 control-label">车票类型</label>
                <div class="col-sm-6">
                    <input type="text" readonly class="form-control" id="ticke_type" name="ticke_type"
                           value="${order.ticket_type}">
                </div>
            </div>

            <div class="form-group opt">
                <label for="insurance1" class="col-sm-2 control-label">是否购买保险</label>
                <div class="col-sm-6">

                    <c:if test="${order.insurance==true}">
                        <input type="radio" readonly checked name="insurance1" id="insurance1" value="true">是
                        <input type="radio" readonly name="insurance1" id="insurance1" value="false">否
                    </c:if>
                    <c:if test="${order.insurance==false}">
                        <input type="radio" readonly name="insurance" id="insurance" value="true">是
                        <input type="radio" readonly checked name="insurance" id="insurance" value="false">否
                    </c:if>

                </div>
                <%-- 出现错误信息 --%>
                <%--<lable for="sex" class="error" style="display:none">性别必选</lable>--%>
            </div>
            <div class="form-group opt">
                <label for="if_take_children" class="col-sm-2 control-label">是否携带儿童</label>
                <div class="col-sm-6">
                    <div name="if_take_children">
                        <c:if test="${order.insurance==true}">
                            <input type="radio" readonly checked id="if_take_children" name="if_take_children1"
                                   value="true">是
                            <input type="radio" readonly id="if_take_children" name="if_take_children1"
                                   value="false">否
                        </c:if>
                        <c:if test="${order.insurance==false}">
                            <input type="radio" readonly id="if_take_children" name="if_take_children2"
                                   value="true">是
                            <input type="radio" readonly checked id="if_take_children" name="if_take_children2"
                                   value="false">否
                        </c:if>
                    </div>
                </div>
                <%-- 出现错误信息 --%>
                <%--<lable for="sex" class="error" style="display:none">必选</lable>--%>
            </div>
            <div class="form-group">
                <label for="ticket_price" class="col-sm-2 control-label">票价</label>
                <div class="col-sm-6">
                    <input type="text" aria-readonly="true" readonly class="form-control" id="ticket_price"
                           name="ticket_price" value="￥${order.ticket_price}元">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" width="100" value="提交申请" class="submit"
                           style="margin-left: 150px;border-radius:5px;border:none;background-color: #ff7600; height: 35px; width: 150px;font-weight:500;color: white">
                </div>
            </div>
        </form>
    </div>

    <div class="col-md-2"></div>

</div>


<%--尾部--%>
<div class="rule footer">
    <jsp:include page="footer.jsp"></jsp:include>
</div>


</body>

</html>




