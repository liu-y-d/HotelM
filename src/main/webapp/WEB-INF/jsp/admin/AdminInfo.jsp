
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
						<li><a href="/admin/getAdminInfo">个人信息</a></li>

						<li role="separator" class="divider"></li>
						<li><a href="/admin/signOut">退出登录</a></li>
					</ul>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>

<div style="width: 50%; margin: 0 auto; background-color: #eeeeee;height: 250px;margin-top: 50px">
	<div class="col-lg-12 col-md-12 col-sm-12" style="padding-top:50px;font-size:20px;width:100%;text-align: center;margin-bottom: 0px;">
		<span style="margin-top: 20px" id="adminId">管理员编号：${adminInfo.adminId}</span><br>
		<span style="margin-top: 20px">管理员名称：${adminInfo.adminName}</span><br>
		<span style="margin-top: 20px" id="oldPwd">管理员原密码：${adminInfo.adminPwd}</span><br>
		<span>管理员密码：</span><input style="margin-top: 20px" type="password" name="adminPwd" id="adminPwd">
		<input type="button" class="btn btn-success" value="更改密码" onclick="updateAdminPwd()">
	</div>
</div>
<script>
	function updateAdminPwd() {
		var oldPwd = $("#oldPwd").text();
		var adminId = $("#adminId").text();
		var adminPwd = $("#adminPwd").val();
		if (oldPwd==adminPwd){
			alert("新密码不能与原密码重复！");
			return false;
		}else {
			$.ajax({
				type: "POST",
				url:"/admin/updateAdminPwd",
				data:{
					adminId:adminId,
					adminPwd:adminPwd
				},
				dataType:"JSON",
				success:function (data) {
					alert(data);
				}
			});
		}

	}
</script>
<%--<footer style="text-align: center;background-color: #5a84fd" >--%>

<%--	<p>作者：滑燕河</p>--%>
<%--</footer>--%>

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
