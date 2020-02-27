<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="/assets/css/hyh.css">
</head>
<body>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="/admin/reservationPage">${hotelName}</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/admin/toHouseInfoMInReservationPage">查看房型信息</a></li>
			</ul>
			<form class="navbar-form navbar-left" action="">
				<div class="form-group">
					<input type="text" name="cusTel" class="form-control" id="cusTel" placeholder="请输入客户电话">
				</div>
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#queryByCusTel" onclick="queryReservation()">查询预定信息</button>
			</form>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>

<div class="jumbotron" style="background-color: #5a84fd;text-align: center;margin-bottom: 0px;">

	<h1>测试酒店</h1>
	<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>
</div>

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active" style="text-align: center">
			<img src="/assets/images/1.jpg" alt="..." style="display: inline-block">
			<div class="carousel-caption">
				...
			</div>
		</div>
		<div class="item" style="text-align: center">
			<img src="/assets/images/2.jpg" alt="..." style="display: inline-block">
			<div class="carousel-caption">
				...
			</div>
		</div>
		<div class="item" style="text-align: center">
			<img src="/assets/images/3.jpg" alt="..." style="display: inline-block">
			<div class="carousel-caption">
				...
			</div>
		</div>
	</div>

	<!-- Controls -->
	<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>
<footer style="text-align: center;background-color: #5a84fd" >
	<p>2019 百家号</p>
	<p>Posted by: 编程的乐趣百家号</p>
</footer>


<!-- 模态框（Modal）查询信息显示模态框 -->
<div class="modal fade" id="queryByCusTel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
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
					入住时间：<input type="text" id="inTime"/><br/>
					离店时间：<input type="text" id="outTime"/><br/>

					<input type="button" class="btn btn-default" data-dismiss="modal" value="关闭"/>
					<input type="button" class="btn btn-default" data-dismiss="modal" id="Unsubscribe" onclick="Unsubscribe()" value="退订"/>
				</div>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
                var inTime = data.inTime;
                var outTime = data.outTime;
                if (!data){
                    $("#houseTypeId").val('无信息');
                    $("#houseName").val('无信息');
                    $("#cusTelPhone").val('无信息');
                    $("#cusName").val('无信息');
                    $("#reserHouseNumber").val('无信息');
                    $("#inTime").val('无信息');
                    $("#outTime").val('无信息');
                    $("#Unsubscribe").css({"display":"none"});

                }else {
                    $("#houseTypeId").val(houseTypeId);
                    $("#houseName").val(houseName);
                    $("#cusTelPhone").val(cusTel);
                    $("#cusName").val(cusName);
                    $("#reserHouseNumber").val(reserHouseNumber);
                    $("#inTime").val(inTime);
                    $("#outTime").val(outTime);
					$("#Unsubscribe").css({"display":"inline"});

				}
            }
        });
    }
    // 退订函数
	function Unsubscribe() {
		var cusTel = $("#cusTel").val();
		if (!cusTel){
			cusTel = 1;
		}
		$.ajax({
			type: "GET",
			url: "/admin/Unsubscribe/" + cusTel,
			success:function (data) {
				alert(data)
			}
		});
	}
</script>
</body>
</html>
