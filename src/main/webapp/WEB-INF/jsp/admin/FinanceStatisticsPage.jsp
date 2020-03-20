<%--
  Created by IntelliJ IDEA.
  User: 13775
  Date: 2020/2/27
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>统计页</title>
    <link rel="stylesheet" type="text/css" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="/assets/js/echarts.js"></script>
</head>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/admin/toMain">小型酒店预订管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/admin/toHouseInfoM">房型信息管理</a></li>
                <li class="dropdown">
                    <a href="/admin/queryCustomerReservationInfo" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">预定信息管理
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/admin/queryCustomerReservationInfoStatus0">在住用户</a></li>
                        <li><a href="/admin/queryCustomerReservationInfo">过期用户</a></li>
                        <li><a href="/admin/queryCustomerReservationInfoStatus2">退订用户</a></li>
                    </ul>
                </li>
                <li><a href="/SalesStatistics">销量统计</a></li>
                <li><a href="/FinanceStatistics">财务统计</a></li>
                <li><a href="/druid">系统性能查询</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">${adminInfo.adminName}</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">设置 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/admin/getAdminInfo">个人信息</a></li>

                        <li role="separator" class="divider"></li>
                        <li><a href="/admin/signOut">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="jumbotron" style="text-align: center;margin-bottom: 0px;">
    <h1>财务统计</h1>
</div>
<body>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 100%;height:400px;"></div>

<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    // 指定图表的配置项和数据
    myChart.setOption({
        title: {
        },
        tooltip: {},
        legend: {
            data:['金额/元']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '金额/元',
            type: 'bar',
            data: []
        }]
    });

    $.get("/FinanceStatisticsInitData").done(function (data) {
        var xdata = new Array();
        var ydata = new Array();
        var obj = $.parseJSON(data);
        $.each(obj,function (i,value) {
            xdata.push(value.time);
            ydata.push(value.money);
        });
        myChart.setOption({
            xAxis:{
                data:xdata
            },
            series:[{
                data:ydata
            }]
        })

    });
</script>
</body>
</body>
</html>
