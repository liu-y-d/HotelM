<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
	<title>房型信息管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="/assets/css/hyh.css">
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
					<a href="/admin/queryCustomerReservationInfo" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">预定信息管理
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
<input type="button" class="btn btn-success" style="margin: 20px" value="添加房间信息" data-toggle="modal" data-target="#editHouseInfo"
	   onclick="editFunction(${hotelInfo.houseTypeId})">
<div class="row">
	<c:forEach var="hotelInfo" items="${hotelInfos}">
		<div class="col-md-3 ">
			<div class="houseInfo">
				<img src="${hotelInfo.houseImg}" width="100%" height="200px"/>
				<span>房型编号：${hotelInfo.houseTypeId}</span>
				<span>房型名称：${hotelInfo.houseName}</span>
				<span>剩余数量：${hotelInfo.houseNum}</span>
				<span>房间价格：${hotelInfo.housePrice}</span>
				<span><input type="button" class="btn btn-success" value="编辑" data-toggle="modal" data-target="#editHouseInfo"
				             onclick="editFunction(${hotelInfo.houseTypeId})">
				<input type="button" class="btn btn-danger" value="删除" onclick="delFunction(${hotelInfo.houseTypeId})"></span>
			</div>
		</div>
	</c:forEach>
</div>

<!-- 模态框（Modal）实现增加用户表单 -->
<div class="modal fade" id="addHouseInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加户型信息
				</h4>
			</div>
			<div class="modal-body">
				<div class="modal-hyh">
					<form action="/admin/addHouseInfo" method="post" enctype="multipart/form-data">
						户型名称：<input type="text" name="houseName" id="houseName"/><br/>
						房间数量：<input type="number" name="houseNum" id="houseNum"/><br/>
						房间价格：<input type="number" name="housePrice" id="housePrice"/><br/>
						<input type="file" name="file" class="upload"><br/>
						<input type="button" class="btn btn-default" data-dismiss="modal" value="关闭"/>
						<input type="submit" id="checkNull" class="btn btn-primary" value="提交"/><%--设置id属性用jquery捕获该按钮的点击事件从而进行非空判断--%>
					</form>
				</div>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal）实现修改房型信息表单 -->
<div class="modal fade" id="editHouseInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title">
					修改房型信息
				</h4>
			</div>
			<div class="modal-body">
				<div class="modal-hyh">
					<form action="/admin/editHouseInfo" method="post" enctype="multipart/form-data">
						<input type="hidden" name="houseTypeId" id="houseTypeId"/>
						户型名称：<input type="text" name="houseName" id="houseNam"/><br/><%--避免与上面模态框中的id重名--%>
						房间数量：<input type="number" name="houseNum" id="houseNumber"/><br/><%--避免与上面模态框中的id重名--%>
						房间价格：<input type="number" name="housePrice" id="housePri"/><br/>
						<input type="file" name="file" class="upload"><br/>
						<input type="button" class="btn btn-default" data-dismiss="modal" value="关闭"/>
						<input type="submit" id="checkNull1" class="btn btn-primary" value="提交"/>
					</form>
				</div>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //判断添加房型信息时输入是否为空
        $("#checkNull").click(function () {
            if (!$("#houseName").val() && $("#houseNum").val()) {
                alert("输入信息不能为空");
                return false;
            } else {
                return true;
            }
        });
        $("#checkNull1").click(function () {
            if (!$("#houseNam").val() && $("#houseNumber").val()) {
                alert("输入信息不能为空");
                return false;
            } else {
                return true;
            }
        });
    });

</script>
<script type="text/javascript">
    //编辑函数
    function editFunction(data) {
        var houseTypeId = data;
        var url = "/admin/queryById/" + houseTypeId;
        $.ajax({
            type: "POST",
            url: url,
            success: function (data) {
                var houseName = data.houseName;
                var houseNum = data.houseNum;
                var houseTypeId = data.houseTypeId;
	            var housePrice = data.housePrice;
                $("#houseNam").val(houseName);
                $("#houseNumber").val(houseNum);
                $("#houseTypeId").val(houseTypeId);
                $("#housePri").val(housePrice);
            }
        });
    }

    //删除函数
    function delFunction(data) {
        var houseTypeId = data;
        if (confirm("确认要删除么？")) {
            var url = "/admin/delHouseById/" + houseTypeId;
            $.ajax({
                type: "POST",
                url: url,
                success: function (data) {
                    if (data==0){
                    	alert("该房型下有住户，删除失败！");
                    	return;
					}
                    alert("成功删除" + data + "个房型");
                    window.location.reload();//确认后自动刷新页面
                }
            });
        }

    }
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
