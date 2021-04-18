<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/3/3
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>
<style scoped>
    #app{
        width: 220px;
        height: 325px;
    }



</style>
<body>
<div id="app">
    <el-collapse v-model="activeName" accordion>
        <el-collapse-item title="集团公司领导带队开展节前..." name="1">
            <a href="/new?method=viewOneNew&new_title=集团公司领导带队开展节前安全综合大检查">
                <span style="background-color: white;">春节来临之际，为切实加强...</span>
            </a>
        </el-collapse-item>
        <el-collapse-item title="十分钟的相聚" name="2">
            <a href="/new?method=viewOneNew&new_title=十分钟的相聚">
                <span  style="background-color: white;">“你站远一点……再过二十...</span>
            </a>
        </el-collapse-item>
        <el-collapse-item title="疫路同行，感恩有你—客运..." name="3">
            <a href="/new?method=viewOneNew&new_title=“疫路同行，感恩有你”——客运分公司召开2021年职工家属迎新春座谈会">
                <span  style="background-color: white;">金牛贺岁，万象更新，...</span>
            </a>
        </el-collapse-item>
        <el-collapse-item title="交通集团领导走访慰问客运..." name="4">
            <a href="/new?method=viewOneNew&new_title=交通集团领导走访慰问客运外地留守员工">
                <span  style="background-color: white;">贴心的关怀，谆谆的嘱托...</span>
            </a>
        </el-collapse-item>
        <el-collapse-item title="无锡客运集团领导走访慰问..." name="5">
            <a href="/new?method=viewOneNew&new_title=无锡客运集团领导走访慰问困难职工">
                <span  style="background-color: white;">总经理华豪向市政协对...</span>
            </a>
        </el-collapse-item>
        <el-collapse-item title="更多..." name="6">
            <a href="/new?method=viewAllNews">
                更多...
            </a>
        </el-collapse-item>
    </el-collapse>
</div>
</body>
<!-- import Vue before Element -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function() {
            return {
                activeName: '1'
            }
        }
    })
</script>
</html>
