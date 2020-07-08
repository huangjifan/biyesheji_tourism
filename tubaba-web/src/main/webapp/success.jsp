<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单提交成功页面</title>
</head>
<body>
	<div style="height:100px">
	</div>
	<div style="width: 700px; height:50px">
		<img align="right" alt="" src="image/success.png">
	</div>
	<div style="width: 750px; height:50px;">
		<div align="right">
			<h3>您的订单已提交成功</h3><br>
			<button id="shouye">返回首页</button>
			<button id = dingdan>查看订单</button>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

<script type="text/javascript">
	$("#shouye").click(function(){
		window.location.href="index"
	})
	
	$("#dingdan").click(function(){
		window.location.href="myOrder"
	})
</script>
</html>