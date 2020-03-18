<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<script type="text/javascript">
        //禁用F5刷新
        document.onkeydown = function ()
        {
            if (event.keyCode == 116) {
                event.keyCode = 0;
                event.cancelBubble = true;
                return false;
            }
        }

        //禁止右键弹出菜单
        document.oncontextmenu = function () {
            return false;
        }
	</script>
</head>
<body>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">${hotelName}</a>
		</div>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>
<div class="page-header">
	<h1><small>预定成功,欢迎入住${hotelName},预定信息如下：</small></h1>
</div>
<ul class="list-group">
	<li class="list-group-item">房型编号：${cusReInfo.houseTypeId}</li>
	<li class="list-group-item">房型名称：${hotelInfo.houseName}</li>
	<li class="list-group-item">客户姓名：${cusReInfo.cusName}</li>
	<li class="list-group-item">客户电话：${cusReInfo.cusTel}</li>
	<li class="list-group-item">房间数量：${cusReInfo.reserHouseNumber}</li>
	<li class="list-group-item">房间价格：${hotelInfo.housePrice}</li>
	<li class="list-group-item">支付总价：${hotelInfo.housePrice*cusReInfo.reserHouseNumber}</li>
	<li class="list-group-item">入住时间：${cusReInfo.inTime}</li>
	<li class="list-group-item">离店时间：${cusReInfo.outTime}</li>
</ul>
<a href="/admin/reservationPage"><button type="button" class="btn btn-success">返回主页面</button></a>


<script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
