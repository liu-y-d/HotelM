
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>主页面</title>
	<link rel="stylesheet" type="text/css" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
</head>
<body>
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
					<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">预定信息管理
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="/admin/queryCustomerReservationInfoStatus0">有效用户</a></li>
						<li><a href="/admin/queryCustomerReservationInfo">过期用户</a></li>
						<li><a href="/admin/queryCustomerReservationInfoStatus2">退订用户</a></li>

					</ul>
				</li>
				<li><a href="/SalesStatistics">销量统计</a></li>
				<li><a href="/FinanceStatistics">财务统计</a></li>
				<li><a href="/druid">系统性能查询</a></li>
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
						<li><a href="/admin/getAdminInfo">个人信息</a></li>

						<li role="separator" class="divider"></li>
						<li><a href="/admin/signOut">退出登录</a></li>
					</ul>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>

<div class="jumbotron" style="background-color: #9AB8C4;margin-bottom: 0px;">
	<h3 style="padding-left: 15px">管理员：${adminInfo.adminName},欢迎您！</h3>
	<p style="padding-left: 15px;font-size: 15px;margin-top: 20px">点击左上方房型信息管理按钮可管理酒店房间信息，点击预定信息管理可以对客户的预定信息修改，
		如果您想查看某人是否预定了房间，请于右上方输入客户的信息进行订单查询！</p>
</div>

<div id="myCarousel" class="carousel slide" style="width: 90%; margin: 0 auto; padding-top: 20px;">
	<div class="carousel-inner">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>


		<div class="item active">
			<a href="#">
				<img src="/assets/images/1.jpg" alt="第一张" width="100%">
			</a>
		</div>
		<div class="item">
			<a href="#">
				<img src="/assets/images/2.jpg" alt="第一张" width="100%">
			</a>
		</div>
		<div class="item">
			<a href="#">
				<img src="/assets/images/1.jpg" alt="第一张" width="100%">
			</a>
		</div>
		<div class="item">
			<a href="#">
				<img src="/assets/images/2.jpg" alt="第一张" width="100%">
			</a>
		</div>
		<div class="item">
			<a href="#">
				<img src="/assets/images/1.jpg" alt="第一张" width="100%">
			</a>
		</div>
		<a href="#myCarousel" data-slide="prev" class="carousel-control left"><!-- ‹ -->
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a><!-- 左箭头 -->
		<a href="#myCarousel" data-slide="next" class="carousel-control right"><!-- › -->
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a><!-- 右箭头 -->
	</div>
</div>
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
<script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		//轮播图自动播放
		$('#myCarousel').carousel({
			interval: 3000,//自动播放4s

		});

	});
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
</script>

</body>
</html>
