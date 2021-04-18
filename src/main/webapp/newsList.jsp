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
    <title>最新活动</title>
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

        .img2 {
            position: absolute;
            right: 50px;
            top: 320px;
        }

        .show_problems {
            width: 1550px;
            margin: -110px auto;
            /*background-color: red;*/
            text-align: left;
            padding-top: 20px;
        }

        .layui-colla-item {
            margin-bottom: 12px;
            margin-left: 50px;
        }

        .table span {
            font-size: 18px;
        }

        .footer {
            position: absolute;
            width: 100%;
            height: 30px;
            bottom: 0;
        }

    </style>
</head>

<body>
<%--头部部分--%>
<div class="rule header">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<div class="rule img">
    <img src="img/login3.png" width="1560" height="406" style="margin-top: -105px">
</div>
<div class="img2">
    <img src="img/GIF.gif" width="300" height="300">
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
                <c:forEach items="${requestScope.vo.list}" var="news">
                    <div class="layui-collapse" style="border: none">
                        <div class="layui-colla-item">
                            <a href="/new?method=viewOneNew&new_title=${news.new_title}">
                                <span>${news.new_title}</span>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>


            <div style="width:1200px;margin:0 auto;text-align: center">
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
                            <a href="/new?method=viewAllNews&pageNow=${vo.pageNow-1}"
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
                                <a href="/new?method=viewAllNews&pageNow=${page}">${page}</a>
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
                            <a href="/new?method=viewAllNews&pageNow=${vo.pageNow+1}"
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


</body>
<script src="layui/layui.js"></script>

</html>
