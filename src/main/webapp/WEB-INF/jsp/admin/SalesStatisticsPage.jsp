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
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/admin/toMain">测试酒店管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/admin/toHouseInfoM">房型信息管理</a></li>
                <li><a href="/admin/queryCustomerReservationInfo">预定信息管理</a></li>
                <li><a href="/SalesStatistics">销量统计</a></li>
                <li><a href="/FinanceStatistics">财务统计</a></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" id="cusTel" placeholder="请输入客户电话">
                </div>
                <button type="button" id="checkNull" class="btn btn-default" data-toggle="modal" data-target="#queryByCusTel" onclick="queryReservation()">查询预定信息</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">${adminInfo.adminName}</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">设置 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">个人信息</a></li>

                        <li role="separator" class="divider"></li>
                        <li><a href="/admin/signOut">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<body>
<div class="jumbotron" style="background-color: #5a84fd;text-align: center;margin-bottom: 0px;">
    <h1>销售统计</h1>
    <p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>
</div>

<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 100%;height:500px;"></div>
<!-- 模态框（Modal）查询预定信息显示模态框 -->
<div class="modal fade" id="queryByCusTel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="hiden">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    查看预定信息
                </h4>
            </div>
            <div class="modal-body">
                <div class="modal-hyh">
                    户型编号：<input type="text" id="houseTypeId"/><br/>
                    户型名称：<input type="text" id="houseName"/><br/>
                    客户电话：<input type="text" id="cusTelPhone"/><br/>
                    客户名称：<input type="text" id="cusName"/><br/>
                    预定数量：<input type="text" id="reserHouseNumber"/><br/>
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭"/>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
    function queryReservation() {
        var cusTel = $("#cusTel").val();
        if (!cusTel){
            cusTel = 1;
        }
        var url = "/admin/queryByCusTel/" + cusTel;
        $.ajax({
            type: "POST",
            url: url,
            success: function (data) {
                var houseTypeId = data.houseTypeId;
                var houseName = data.houseName;
                var cusTel = data.cusTel;
                var cusName = data.cusName;
                var reserHouseNumber = data.reserHouseNumber;
                if (!data){
                    $("#houseTypeId").val('无信息');
                    $("#houseName").val('无信息');
                    $("#cusTelPhone").val('无信息');
                    $("#cusName").val('无信息');
                    $("#reserHouseNumber").val('无信息');

                }else {
                    $("#houseTypeId").val(houseTypeId);
                    $("#houseName").val(houseName);
                    $("#cusTelPhone").val(cusTel);
                    $("#cusName").val(cusName);
                    $("#reserHouseNumber").val(reserHouseNumber);
                }
            }
        });
    }

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    // 指定图表的配置项和数据
    myChart.setOption({
        title: {
        },
        tooltip: {},
        legend: {
            data:['人数']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '人数',
            type: 'bar',
            data: []
        }]
    });

    $.get("/SalesStatisticsInitData").done(function (data) {
        var xdata = new Array();
        var ydata = new Array();
        var obj = $.parseJSON(data);
        $.each(obj,function (i,value) {
            xdata.push(value.inTime);
            ydata.push(value.number);
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
