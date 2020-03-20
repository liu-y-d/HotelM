<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
	<title>Sign in</title>
	<!--font-awesome.min.css-->
	<link rel="stylesheet" href="/assets/css/font-awesome.min.css">
	<!--animate.css-->
	<link rel="stylesheet" href="/assets/css/animate.css">
	<!--bootstrap.min.css-->
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<!-- bootsnav -->
	<link rel="stylesheet" href="/assets/css/bootsnav.css">
	<!--style.css-->
	<link rel="stylesheet" href="/assets/css/style.css">
	<!--responsive.css-->
	<link rel="stylesheet" href="/assets/css/responsive.css">
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

	<![endif]-->
</head>
<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
	your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- signin end -->
<%--<h1>${LoginError}</h1>--%>
<section class="signin">
	<div class="container">
		<div class="sign-content">
			<h2>小型酒店预订管理系统</h2>
			<div class="row">
				<div class="col-sm-12">
					<div class="signin-form">
						<form action="/admin/Login" method="post">
							<div class="form-group">
								<label>Name</label>
								<input type="Name" class="form-control" name="adminName" >
							</div>
							<div class="form-group">
								<label>passward</label>
								<input type="password" class="form-control" name="adminPwd">
							</div>
							<div class="form-group">
								<p style="color: red">${LoginError}</p>
							</div>
							<div class="signin-footer">
								<input type="submit" class="btn signin_btn signin_btn_two" value="登 录">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

</body>
</html>
