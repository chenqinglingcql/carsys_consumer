<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/1/31
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>常见问题</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />

    <style>
        body {
            background-color: #fff;
        }

        .img {
            width: 100%;
            height: 406px;
            background-repeat: repeat-x;
        }

        .container {
            position: relative;
        }

        .index {
            position: absolute;
            top: -136px;
            left: 0;
        }

        .show_problems {
            width: 1200px;
            margin: -130px auto;
            /*background-color: red;*/
            padding-left: 50px;
        }

        .index .layui-nav-item {
            background-color: #313132 !important;
            text-align: center;
        }

        .footer {
            position: absolute;
            width: 100%;
            height: 30px;
            bottom: -260px;
        }

    </style>
</head>

<body>
<%--头部部分--%>
<div class="rule header">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<div class="rule img">
    <img src="img/login2.png" width="1560" height="406" style="margin-top: -135px">
</div>

<div class="rule container">
    <%--主体--%>
    <div class="index">
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
            <li class="layui-nav-item">
                <a href="/problem?method=view&link=全部问题">常见问题</a>
            </li>
            <li class="layui-nav-item">
                <a href="/problem?method=view&link=购票问题">购票问题</a>
            </li>
            <li class="layui-nav-item">
                <a href="/problem?method=view&link=支付问题">支付问题</a>
            </li>
            <li class="layui-nav-item">
                <a href="/problem?method=view&link=取票问题">取票问题</a>
            </li>
            <li class="layui-nav-item">
                <a href="/problem?method=view&link=退票改签问题">退票改签问题</a>
            </li>
            <li class="layui-nav-item">
                <a href="/problem?method=view&link=班次查询">班次查询</a>
            </li>
            <li class="layui-nav-item">
                <a href="/problem?method=view&link=个人账户问题">个人账户问题</a>
            </li>
            <li class="layui-nav-item">
                <a href="/problem?method=view&link=其他问题">其他问题</a>
            </li>
        </ul>
    </div>

    <div class="show_problems">
        <div class="layui-collapse" style="border: none">
            <%--若查询无结果，则显示图片--%>
            <c:if test="${requestScope.vo.list.size()==0}">
                <div>
                    <img style="width:450px;height: 450px;margin-left: 350px" src="img/notfound.png">
                </div>
            </c:if>
            <%--查询结果不为空--%>
            <c:if test="${requestScope.vo.list.size()!=0}">
                <%--表格--%>
                <%--面板--%>
                <div class="table">
                    <c:forEach items="${requestScope.vo.list}" var="problem">
                        <div class="layui-collapse" style="border: none">
                            <div class="layui-colla-item">
                                <h2 class="layui-colla-title"
                                    style="background-color: white; font-size: 16px">${problem.problem_title}</h2>
                                <div class="layui-colla-content" style="font-size: 16px;">${problem.problem}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


                <div style="width:1200px;margin:30px auto;text-align: left">
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
                                <a href="/problem?method=view&link=${link}&pageNow=${vo.pageNow-1}"
                                   aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                            </li>
                        </c:if>


                        <c:forEach begin="1" end="${vo.myPages}" var="page">

                            <%--  若当前页码pageNow正好是page，则显示被点击的状态 --%>
                            <c:if test="${vo.pageNow == page}">
                                <li class="active">
                                    <a href="JavaScript:void(0)"
                                       style="background-color: #ff7600;border-color: #ff7600">${page}</a>
                                </li>
                            </c:if>

                            <%--  若当前页码pageNow不是page，则显示可以点击的状态 --%>
                            <c:if test="${vo.pageNow != page}">
                                <li>
                                    <a href="/problem?method=view&link=${link}&pageNow=${page}">${page}</a>
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
                                <a href="/problem?method=view&link=${link}&pageNow=${vo.pageNow+1}"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
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
</div>


</body>
<script src="layui/layui.js"></script>

</html>
