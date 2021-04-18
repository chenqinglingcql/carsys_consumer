<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="Shortcut Icon" href="img/icon.ico" type="image/x-icon" />
    <script LANGUAGE="javascript">
        var onecount;
        onecount=0;
        subcat = new Array();
        subcat[0] = new Array("南京","01","001");
        subcat[1] = new Array("张家港","01","002");
        subcat[2] = new Array("淮安","01","003");
        subcat[3] = new Array("苏州","01","004");
        subcat[4] = new Array("九江市","01","005");
        subcat[5] = new Array("上饶市","02","006");
        subcat[6] = new Array("合肥市","03","007");
        subcat[7] = new Array("滁州市","03","008");
        subcat[8] = new Array("天长","03","009");
        subcat[9] = new Array("芜湖市","03","010");
        subcat[10] = new Array("杭州","05","011");
        subcat[11] = new Array("温州","05","012");
        subcat[12] = new Array("苏州","04","013");
        subcat[13] = new Array("南京","04","014");
        onecount=14;

        function changelocation(locationid)
        {
            document.myform.smalllocation.length = 0;

            var locationid=locationid;
            var i;
            document.myform.smalllocation.options[0] = new Option('选择地区','0');
            for (i=0;i < onecount; i++)
            {
                if (subcat[i][1] == locationid)
                {
                    document.myform.smalllocation.options[document.myform.smalllocation.length] = new Option(subcat[i][0], subcat[i][2]);
                }
            }

        }


    </script>
</head>
<style>
    *{
        padding: 0px;
        margin: 0px;
    }

    .container{
        width:1220px;
        height:680px ;
        position: relative;
        margin: 0px auto;
    }
    .index{
        float: left;
    }
    .info{
        float: right;
        height: 600px;
        background-color: #00F7DE;
        width:950px;
    }

    span{
        line-height: 25px;
        font-size: 15px;
        color: #9F9F9F;
        font-family: 新宋体;
    }
</style>
<body>
<div class="container">
    <%--头部--%>
    <div>
        <jsp:include page="header.jsp"></jsp:include>
    </div>
    <%--主体--%>
    <div>
        <div class="main">
            <div class="index" style="margin-left: 25px;">
                <ul class="layui-nav layui-nav-tree layui-bg-green" lay-filter="test">
                    <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">最近活动</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;">客运动态</a></dd>
                            <dd><a href="javascript:;">车站资讯</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">客运服务</a>
                        <dl class="layui-nav-child">
                            <dd><a href="">班车时刻表</a></dd>
                            <dd><a href="">班线景点推荐</a></dd>
                            <dd><a href="">乘客须知</a></dd>
                            <dd><a href="">城市交通地图</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="">常见问题</a></li>
                </ul>
            </div>
        </div>
        <div class="info">
            <form name="myform" method="post" style="padding: 40px;line-height: 40px">
                <input type="text" class="lauyi-input" id="laydate" placeholder="请选择日期" style="height: 30px">
                <select name="biglocation" onChange="changelocation(document.myform.biglocation.options[document.myform.biglocation.selectedIndex].value)" style="height: 30px">
                    <option selected value="0">--请选择省--</option>
                    <option value="01">无锡</option>
                    <option value="02">江西</option>
                    <option value="03">安徽</option>
                    <option value="04">浙江</option>
                </select>
                <select name="smalllocation" style="height: 30px">
                    <option selected value="0">--请选择市--</option>
                </select>
                <input type="submit" value="查找" style="height: 30px;width: 100px;background-color: #009688">
            </form>
        </div>


    </div>
    <%--尾部--%>
    <div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</div>
</body>
<script src="layui/layui.js"></script>
<script>
    layui.use('laydate',function ({
        var laydate=layui.laydate;
        laydate.render({
            elem:'#laydate'
        });
    });)
</script>
</html>