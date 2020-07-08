<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单成功界面</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
<!-- 订单通用样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/indentSuccess.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/new_pay_addCss.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.common.css">
<link href="${pageContext.request.contextPath}/css/product/wdatePicker.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<style type="text/css">
.paynew .zyxf {
	background-position: -300px -400px;
}
.paynew .bank-list .bank {
	padding: 0;
}
.wrap .paynew .bank-list li {
	height: 43px;
	margin: 0 20px 12px 4px;
}
#bankTipsLayer{
width:800px; /*需要修改*/
height:auto;
padding:0;
margin:0 auto;
font-size:12px;
}
#bankTipsLayer:after {
content: "."; 
display: block;
height: 0; 
clear: both; 
visibility: hidden;
}
/*	表格内容*/
#bankTipsLayerCase ul{}
#bankTipsLayerCase ul li{
float:left;
width:160px; /*需要修改*/
}
</style> 
</head>
<body class="order">
	<!--  -->
	<input id="userId" type="hidden" value="${userid}">
	<!--  -->
	<input id="indentId" type="hidden" value="${indentId}">
	<!-- 名称 -->
	<input id="name" type="hidden" value="${name}">
	<!-- 描述 -->
	<input id="description" type="hidden" value="${description}">
	<!-- 优惠后的金额 -->
	<input id="money" type="hidden" value="${money}">
	
	<div class="wrap">
		<!-- 操作步骤 -->
		<ol class="ui-step ui-step-3">
		    <li class="ui-step1 ui-step-start ui-step-done">
		        <div class="ui-step-arrow">
		            <i class="arrow_r1"></i>
		            <i class="arrow_r2"></i>
		        </div>
		        <span class="ui-step-text">填写订单</span>
		    </li>
		    <li class="ui-step2 ui-step-active">
		        <div class="ui-step-arrow">
		            <i class="arrow_r1"></i>
		            <i class="arrow_r2"></i>
		        </div>
		        <span class="ui-step-text">在线支付</span>
		    </li>
		    <li class="ui-step3 ui-step-end">
		        <div class="ui-step-arrow">
		            <i class="arrow_r1"></i>
		            <i class="arrow_r2"></i>
		        </div>
		        <span class="ui-step-text">预订成功</span>
		    </li>
		</ol> 
		<!-- //操作步骤 -->
	    <div class="order-main paynew">
			<div class="main">
				<div class="hr_a"></div>
	            <div class="c-title">
	                <h3>您预订：</h3>
	                <div class="total-price">
	                    <span class="price-num"><dfn></dfn> 元</span>
	                    <strong>订单金额：</strong>
	                </div>
	            </div>
	        </div> 
	            
	        <div class="tipbox tip-success tip-nowrap">
	            <span class="tip-icon-big tip-icon-big-success"></span>
	            <div style="padding: 10px 10px 5px 76px;" class="tip-content">
					<h3 class="tip-title tip-title-group">
						您的订单已提交成功，正在确认资源，审核结果会尽快以短信方式通知您。<br>审核通过后，您可以在“<a
							href="${pageContext.request.contextPath}/myOrder" target="_blank">我的订单</a>”中继续付款：
						<dfn></dfn>
						元
					</h3>
					<button class="pbtn pbtn-orange pbtn-mini" onclick="payment(this)">不等审核,直接支付</button>
					<a href="${pageContext.request.contextPath}/index">
	                	<span id="goLvmamaIndexBtn" class="pbtn pbtn-orange pbtn-mini">返回首页</span>
	                </a>
	            </div>
	        </div>
	   </div> 
	</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/product/indentSuccess.js"></script>
</body>
</html>