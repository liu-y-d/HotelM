<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/hyh.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/foundation-datepicker.css">
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
                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#queryByCusTel"
                        onclick="queryReservation()">查询预定信息
                </button>
            </form>
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
<footer style="text-align: center;background-color: #5a84fd">
    <p>作者：滑燕河</p>
</footer>
<!-- 模态框（Modal）预定房间 -->
<div class="modal fade" id="queryByCusTel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    预订信息
                </h4>
            </div>
            <div class="modal-body">
                <div class="modal-hyh">
                    <form action="/admin/editReservation" method="post" id="meForm">
                        <input type="hidden" name="houseTypeId" id="houseTypeId"/>
                        <input type="hidden" name="cusTel" /><br/>
                        <%--加载选中的户型名--%>
                        房间名称：<input type="text" name="houseName" id="houseName" disabled="disabled"/>
                        预定数量：<input type="number" name="reserHouseNumber" id="reserHouseNumber" value="1" disabled="disabled"/><br/>
                        客户姓名：<input type="text" name="cusName" id="cusName" disabled="disabled"/>
                        客户电话：<input type="text" name="cusTel" id="cusTelPhone" disabled="disabled"/><br>
                        入住时间: <input type="text" name="inTime" class="span2" value="" id="dpd1">
                        离店时间: <input type="text" name="outTime" class="span2" value="" id="dpd2"><br>
                        <input type="button" class="btn btn-default" data-dismiss="modal" id="Unsubscribe"
						onclick="unsubscribe()" value="退订"/>
						<input type="submit" id="checkNull1" class="btn btn-primary" value="提交修改"/>
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
    $(function(){
        //轮播图自动播放
        $('#myCarousel').carousel({
            interval: 3000,//自动播放4s

        });

    });
    function queryReservation() {
        var cusTel = $("#cusTel").val();
        if (!cusTel) {
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
                if (!data) {

					$("#meForm").remove();
					if ($(".modal-body").children().length==1){
                        $(".modal-body").append("<div>无信息</div>" +
                            "\t\t\t\t\t<input type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\" id=\"close\" value=\"关闭\"/>\n");
                    }


                } else {
                    $("#houseTypeId").val(houseTypeId);
                    $("#houseName").val(houseName);
                    $("#cusTelPhone").val(cusTel);
                    $("#cusName").val(cusName);
                    $("#reserHouseNumber").val(reserHouseNumber);
                    $("#dpd1").val(inTime);
                    $("#dpd2").val(outTime);
                    $("#Unsubscribe").css({"display": "inline"});

                }
            }
        });
    }

    // 退订函数
    function unsubscribe() {
        var cusTel = $("#cusTel").val();
        if (!cusTel) {
            cusTel = 1;
        }
        $.ajax({
            type: "GET",
            url: "/admin/Unsubscribe/" + cusTel,
            success: function (data) {
                alert(data);
                window.location.reload("http://localhost:8080/admin/reservationPage");
            }
        });
    }

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
</script>
</body>
</html>
