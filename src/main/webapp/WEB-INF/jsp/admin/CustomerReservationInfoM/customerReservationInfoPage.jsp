<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<div class="row" >
	<c:forEach var="cusReserInfo" items="${customerReservationInfos}">
		<div class="col-md-3" >
			<div class="houseInfo">
				<span>客户姓名：${cusReserInfo.cusName}</span>
				<span>客户电话：${cusReserInfo.cusTel}</span>
				<span>房型编号：${cusReserInfo.houseTypeId}</span>
				<span>房型名称：${cusReserInfo.houseName}</span>
				<span>预定数量：${cusReserInfo.reserHouseNumber}</span>
				<span>入住时间：${cusReserInfo.inTime}</span>
				<span>离店时间：${cusReserInfo.outTime}</span>
				<span>预订状态：
					<c:if test="${cusReserInfo.status ==0}">
						在住用户
					</c:if>
					<c:if test="${cusReserInfo.status ==1}">
						过期用户
					</c:if>
					<c:if test="${cusReserInfo.status ==2}">
						退订用户
					</c:if>
				</span>
			</div>
		</div>
	</c:forEach>
</div>
<c:if test="${customerReservationInfos.size()==0}">
	<h3 style="margin: 0 auto; text-align: center;margin-top: 100px">当前系统无在住用户信息！</h3>
</c:if>
<script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
