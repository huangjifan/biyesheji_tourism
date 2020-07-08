<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单-驴妈妈旅游网</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
	$(function(){
		var state = $('#state').text();
		if(state == 0){
			$('#state').text('待审核');
		}else if(state == 1){
			$('#state').text('待支付');
		}else if(state == 2){
			$('#state').text('待出行');
		}else if(state == 3){
			$('#state').text('待点评');
		}else if(state == 4){
			$('#state').text('已评论');
		}else if(state == 5){
			$('#state').text('退款');
		}else if(state == 6){
			$('#state').text('取消');
		}else if(state == 7){
			$('#state').text('删除');
		}
		var tel = $('div.view-box').find('strong').eq(1).html().trim();
	    var mtel = tel.substr(0, 3) + '****' + tel.substr(7);
	    $('div.view-box').find('strong').eq(1).text(mtel);
	    
	    var iphones = $('td.iphones');
	     for(var i = 0 ; i < iphones.length ; i++){
	    	var iphone = $(iphones[i]).text().substr(0, 3) + '****' + $(iphones[i]).text().substr(7);
	    	$(iphones[i]).text(iphone);
	    } 
	})
</script>
</head>
<body>
<div id="wrap" class="ui-container lvmama-bg">
	
	<!-- 无搜索版，公共头部开始  -->
<!-- 无搜索版，公共头部结束 -->
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!---会员中心导航结束--->
		<div class="lv-nav wrap">
		<p>
			<a href="${pageContext.request.contextPath}/indexdo" hidefocus="false">我的驴妈妈</a>
			&gt;
			<a href="${pageContext.request.contextPath}/myOrder" hidefocus="false">我的订单</a>
			&gt;
			<a class="current" hidefocus="false">订单详情</a>
		</p>
		</div>
		<div class="wrap ui-content lv-bd">
				<!-- 订单详情>> -->
				<div class="ui-box mod-edit order_detail-edit pd10">
					<div class="ui-box-title"><h3>订单详情</h3></div>
				    	<!-- 订单信息>> -->
					<br>
                    <span class="nova-icon-outline-xs nova-icon-warning"></span>&nbsp;&nbsp;购买康旅权益产品(包含游乐宝)不支持开发票，使用康旅权益的本金购买旅游产品支持开发票，使用奖金购买旅游产品则不支持开发票
				    	<div class="view-box clearfix">
				        	<h4>游客信息</h4>
				            <p class="p-info first">联系人姓名
				            <strong>
									${indent.linkMan.realname }
			                </strong>联系人手机：
			                <strong>
								${indent.linkMan.iphone }
			                </strong>
            </p>
            <table class="lv-table order_detail-table">
                <tbody>
                <tr><th>姓名</th><th>手机</th><th>证件类型</th><th>证件号码</th></tr>
	            <!-- <tr>
                    <td>石杰</td>
                    <td>186****1379</td>
                    <td>身份证</td>
                    <td>4****************6</td>
                    <td></td>
                </tr> -->
                <c:if test="${!empty indent.linkMan.playMans }">
                	<c:forEach items="${indent.linkMan.playMans }" var="playMan">
	                	<tr>
		                    <td>${playMan.realname }</td>
		                    <td class="iphones">${playMan.iphone }</td>
		                    <c:if test="${!empty playMan.identity }">
		                    	<td>身份证</td>
		                    	<td>playMan.identity</td>
		                    </c:if>
		                    <td></td>
		                </tr>
	                </c:forEach> 
                </c:if>        
                </tbody>
            </table>

 <!-- 服务信息 开始 -->
<!-- 服务信息 结束 -->
            <h4>配送信息</h4>

            <h4>订单备注</h4>
            <p></p>
            <h4>订单信息</h4>
            <ul class="order-info clearfix">
                <li>订单号：${indent.ordernumber }</li>
                <li>订单状态：<label id="state">${indent.indentstatus }</label></li>
                <li>下单时间：<fmt:formatDate pattern="yyyy-MM-dd" value="${indent.indentdetails.orderstime }" /></li>
                <!-- <li>支付方式：预付（驴妈妈）</li> -->
                <li>
                    <div style="width: 100%"></div>
                </li>
                <li>&nbsp;</li>
            </ul>
            <!-- 订单列表>> -->
            <div class="order_list-box">

				            <div id="relat_product_list" style="display:none;position:absolute;background-color:#fff;border:1px solid #ccc;width:359px;padding:10px;text-align:left">
                                            </div><table class="lv-table order_list-table">
                                <colgroup>
                                    <col class="lvcol-1">
                                    <col class="lvcol-2">
                                    <col class="lvcol-3">
                                    <col class="lvcol-4">
                                    <col class="lvcol-5">
                                    <col class="lvcol-6">
                                </colgroup>
                                <thead>
                                <tr class="thead">
                                    <th class="product-name">产品名称</th>
                                    <th class="play-date">游玩日期</th>
                                    <!-- <th class="price">市场价</th> -->
                                    <th class="price">现售价</th>
                                    <th class="price">小计</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                    	<c:if test="${!empty indent.indentdetails.scenic }">
                                    		<td><a herf="javascript:void(0);" style="cursor: pointer;" hidefocus="false">${indent.indentdetails.scenic.scenicname }</a><em>&nbsp;&nbsp;&nbsp;&nbsp;×${indent.indentdetails.copies }</em></td>
                                    	</c:if>
                                        <c:if test="${!empty indent.indentdetails.scenicway }">
                                    		<td><a herf="javascript:void(0);" style="cursor: pointer;" hidefocus="false">${indent.indentdetails.scenicway.way }</a><em>&nbsp;&nbsp;&nbsp;&nbsp;×${indent.indentdetails.copies }</em></td>
                                    	</c:if>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${indent.indentdetails.starttime }" /></td>
                                        <td>${indent.price }</td>
                                        <td>${indent.price * indent.indentdetails.copies}</td>
                                        
                                    </tr>
                                </tbody>
                            </table>

                <!-- xiaorui add 上海迪士尼 剧场票我的订单详情展示 -->

                <!--赠品开始 -->
                <!--赠品结束 -->
                <!--发票开始 -->
							<!--发票结束 -->
				            <p class="price-sum">
				            	<b>订单结算总额：</b><dfn>¥<i class="f24">${indent.price * indent.indentdetails.copies}</i></dfn>
				            </p>

				        </div>
				        	<!-- <<订单列表 --> 
				        </div>
			</div>
		</div>
            <div class="park-view-box" style="display:none">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody><tr>
                        <td width="76%" bgcolor="#e6e4e4">商品名称</td>
                        <td width="24%" bgcolor="#e6e4e4" align="center">操作栏</td>
                    </tr>
        </tbody>
        </table>

    </div>
</div>
<div class="buttom clearfix">
	<div class="buttom_list">
		<b class="buttom_list_tit1">订购指南</b>
				   <a rel="nofollow" href="http://www.lvmama.com/public/help_center_2" target="_blank" hidefocus="false">门票订购流程是怎样的？</a>
		   <a rel="nofollow" href="http://www.lvmama.com/public/help_center_4" target="_blank" hidefocus="false">二维码使用时有什么注意事项？</a>
		   <a rel="nofollow" href="http://www.lvmama.com/public/help_center_5" target="_blank" hidefocus="false">可以预定多长时间的门票？</a>
		   <a rel="nofollow" href="http://www.lvmama.com/public/help_center_10" target="_blank" hidefocus="false">想要修改订单，怎么操作？</a>
	</div>
	<div class="buttom_list">
		<b class="buttom_list_tit2">注册与登录</b>
		   <a rel="nofollow" href="http://www.lvmama.com/public/help_center_132" target="_blank" hidefocus="false">手机没有收到激活/验证短信怎么办？</a>
		   <a rel="nofollow" href="http://login.lvmama.com/nsso/register/registering.do" target="_blank" hidefocus="false">怎样才能成为驴妈妈会员？</a>
		   <a rel="nofollow" href="http://login.lvmama.com/nsso/login" target="_blank" hidefocus="false">在哪登录会员帐号？</a>
		   <a rel="nofollow" href="http://www.lvmama.com/public/help_center_149" target="_blank" hidefocus="false">如何修改我的帐号密码？</a>
	</div>
	<div class="buttom_list">
		<b class="buttom_list_tit3">支付与取票</b>
		   <a rel="nofollow" href="http://www.lvmama.com/public/buy_guide#m_2" target="_blank" hidefocus="false">付款方式有哪些？</a>
		   <a rel="nofollow" href="http://www.lvmama.com/public/buy_guide#m_2" target="_blank" hidefocus="false">在线支付安全吗？</a>
		   <a rel="nofollow" href="http://www.lvmama.com/public/buy_guide#m_2" target="_blank" hidefocus="false">为什么支付不成功？</a>
		   <a rel="nofollow" href="http://www.lvmama.com/public/buy_guide#m_2" target="_blank" hidefocus="false">想要退款，应该怎么做？</a>
	</div>
	<div class="buttom_list" style="border: medium none;">
		<b class="buttom_list_tit4">沟通与订阅</b>
		   <a rel="nofollow" href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" target="_blank" hidefocus="false">我想咨询门票，应该怎么办？</a>
		   <a rel="nofollow" href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" target="_blank" hidefocus="false">我有意见，在哪可以提？</a>
		   <a rel="nofollow" href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" target="_blank" hidefocus="false">我想投诉，应该怎么反映？</a>
		   <a rel="nofollow" href="http://www.lvmama.com/public/about_lvmama#m_1" target="_blank" hidefocus="false">我是景区负责人，怎么联系驴妈妈？</a>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/footer.js"></script>
</body>
</html>