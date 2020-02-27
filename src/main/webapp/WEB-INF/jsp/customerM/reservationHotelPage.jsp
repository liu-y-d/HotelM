<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="/assets/css/hyh.css">
<%--	<link rel="stylesheet" type="text/css" href="/assets/css/foundation.min.css">--%>
	<link rel="stylesheet" type="text/css" href="/assets/css/foundation-datepicker.css">
</head>
<body>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="/admin/reservationPage">${hotelName}</a>
		</div>
	</div><!-- /.container-fluid -->
</nav>

<div class="row">
	<c:forEach var="hotelInfo" items="${hotelInfos}">
		<div class="col-md-3">
			<div class="houseInfo">
				<img src="${hotelInfo.houseImg}" width="100%" height="200px"/>
				<span>房型编号：${hotelInfo.houseTypeId}</span>
				<span>房型名称：${hotelInfo.houseName}</span>
				<span >剩余数量：${hotelInfo.houseNum}</span>
				<span>房间价格：${hotelInfo.housePrice}</span>
				<span>
					<c:if test="${hotelInfo.houseNum != 0}">
						<input id="judgmentStatus" type="button" class="btn-success" value="预定" data-toggle="modal" data-target="#reservationHouseInfo"
					       onclick="reservationFunction(${hotelInfo.houseTypeId})">
					</c:if>
					<c:if test="${hotelInfo.houseNum == 0}">
						<input type="button" value="满房" disabled="disabled" style="background-color: red;color: white;">
					</c:if>
				</span>
			</div>
		</div>
	</c:forEach>
</div>


<!-- 模态框（Modal）预定房间 -->
<div class="modal fade" id="reservationHouseInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title">
					填写个人信息
				</h4>
			</div>
			<div class="modal-body">
				<div class="modal-hyh">
					<form action="/admin/addCustomerReservationInfo" method="post" >
						<img id="img" src="" width="100%" height="200px"/>
						<input type="hidden" name="houseTypeId" id="houseTypeId"/>
						<%--加载选中的户型名--%>
						<input type="hidden" name="houseName" id="houseNam" disabled="disabled"/>
						房间价格：<input type="number" name="housePrice" id="housePri" disabled="disabled"/>
						预定数量：<input type="number" name="reserHouseNumber" id="reserHouseNumber" value="1"/><br/>
						客户姓名：<input type="text" name="cusName" id="cusName"/>
						客户电话：<input type="text" name="cusTel" id="cusTel"/><br>
						入住时间: <input type="text" name="inTime" class="span2" value="" id="dpd1">
						离店时间: <input type="text" name="outTime" class="span2" value="" id="dpd2"><br>
<%--						<table class="table" >--%>
<%--								<thead>--%>
<%--								<tr>--%>
<%--									<th style="margin: 0 auto;text-align: center">--%>
<%--										入住时间:--%>
<%--										<input type="text" name="inTime" class="span2" value="" id="dpd1">--%>
<%--									</th>--%>
<%--									<th style="margin: 0 auto;text-align: center">离店时间:--%>
<%--										<input type="text" name="outTime" class="span2" value="" id="dpd2">--%>
<%--									</th>--%>
<%--								</tr>--%>
<%--								</thead>--%>
<%--							</table>--%>

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
<script src="/assets/js/foundation-datepicker.js"></script>
<script src="/assets/js/locales/foundation-datepicker.zh-CN.js"></script>
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
            if (!$("#reserHouseNumber").val() && $("#cusName").val() && $("#cusTel")) {
                alert("输入信息不能为空");
                return false;
            } else {
                //添加客户名和手机号验证
                return true;
            }
        });
    });
</script>
<script type="text/javascript">
	// 日期时间插件
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var checkin = $('#dpd1').fdatepicker({
		onRender: function (date) {
			return date.valueOf() < now.valueOf() ? 'disabled' : '';
		}
	}).on('changeDate', function (ev) {
		if (ev.date.valueOf() > checkout.date.valueOf()) {
			var newDate = new Date(ev.date)
			newDate.setDate(newDate.getDate() + 1);
			checkout.update(newDate);
		}
		checkin.hide();
		$('#dpd2')[0].focus();
	}).data('datepicker');
	var checkout = $('#dpd2').fdatepicker({
		onRender: function (date) {
			return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
		}
	}).on('changeDate', function (ev) {
		checkout.hide();
	}).data('datepicker');
    //预定函数
    function reservationFunction(data) {
    	console.log(0);
        var houseTypeId = data;
        var url = "/admin/queryById/" + houseTypeId;
        $.ajax({
            type: "POST",
            url: url,
            success: function (data) {
                var houseName = data.houseName;
                var houseTypeId = data.houseTypeId;
	            var housePrice = data.housePrice;
	            var houseImg = data.houseImg;
                $("#houseNam").val(houseName);
                $("#houseTypeId").val(houseTypeId);
                $("#housePri").val(housePrice);
                /*给图片标签的src属性赋值*/
                $("#img").attr('src',houseImg);
            }
        });
    }
</script>
</body>
</html>
