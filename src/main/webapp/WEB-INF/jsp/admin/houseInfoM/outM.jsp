<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>欢迎再次使用该系统</title>
</head>
<body>
<script type="text/javascript" language="JavaScript">
	var loginInfo = "<%=session.getAttribute("adminInfo")%>";
	console.log(loginInfo);
	if (loginInfo == null){
	    //当前页面关闭方法
        window.opener=null;
        window.open('','_self');
        window.close();
	}
</script>
</body>
</html>
