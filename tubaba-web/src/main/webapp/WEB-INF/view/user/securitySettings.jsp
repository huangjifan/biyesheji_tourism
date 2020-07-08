<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />

</head>
<body class="lvnav_safeset lv_newaccount">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<script type="text/javascript">
	$(function(){
		if($('#email').text() != undefined && $('#email').text() != ''){
			var email = $('#email').text();
			email = plusXing(email,email.split('@')[0].length - 4,email.split('@')[1].length + 1,'*'); 
			$('#email').text(email);
		}
		var phone = $('#phone').text();
		phone = plusXing(phone,3,4,'*');
		$('#phone').text(phone);
	})
	
</script>
<div class="newmember_main">
<!-- 会员中心左边菜单部分 -->
<jsp:include  page="userInfo_left.jsp" flush="true"/>

    <div class="newmember_rightside">
        <div class="mod_box">
            <div class="mod_content">
                <div class="s_safebox">
                    <i class="a_icon fl"></i>
                    <div class="s_content">
                        <p class="s_title">小驴建议您启用安全设置，以保障您的账户安全！</p>
                        <p class="s_note">注册时间：<fmt:formatDate pattern="yyyy-MM-dd" value="${registertime }" /><em class="s_modline">|</em>上次登录时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${lastLoginDate }" /><em class="s_modtip">（如非本人登录，建议您尽快修改密码）</em></p>
                    </div>
                </div>
                <ul class="s_telbox">
                    <li>
                        <a href="loginPass_update" class="mod_a">修改登录密码&gt;&gt;</a>
                        <i class="b_icon"></i>
                        <span class="s_title">登录密码</span>
                        <span class="s_note">为了保障您的账户安全，建议您定期修改登录密码</span>
                    </li>
                    <li>
                                <a href="phone_update_1" class="mod_a">修改手机&gt;&gt;</a>
                                <i class="b_icon"></i>
                                <span class="s_title">手机绑定</span>
                                <span class="s_note">已绑定手机号码<span id="phone">${iphone }</span>，你可凭此手机号直接登陆驴妈妈，接收账户安全验证码</span>

                    </li>
                    <li>
                    
                    	<c:if test="${!empty email }">
                    		 <a href="email_update_1" class="mod_a">修改邮箱&gt;&gt;</a>
	                         <i class="b_icon"></i>
	                         <span class="s_title">邮箱绑定</span>
	                         <span class="s_note">已绑定邮箱<span id="email">${email }</span></span>
                    	</c:if>
                        <c:if test="${empty email }">
                        	<i class="c_icon"></i>
                        	<span class="s_title">邮箱绑定</span>
                        	<a href="email_add" class="mod_a">绑定邮箱&gt;&gt;</a>
                       		<span class="s_note">未绑定邮箱</span>
                        </c:if>
                    </li>
                    <li class="end">
                    	<c:if test="${!empty paymentCode }">
                    		 <a href="paymentPassword_update" onclick="modifyPassword()" class="mod_a">修改支付密码&gt;&gt;</a>
	                         <i class="b_icon"></i>
                    	</c:if>
                         <c:if test="${empty paymentCode }">
                    		 <a href="paymentPassword_add" onclick="modifyPassword()" class="mod_a">绑定支付密码&gt;&gt;</a>
	                         <i class="c_icon"></i>
                    	</c:if>
                        <span class="s_title">支付密码</span>
                        <span class="s_note">使用账户存款/礼品卡等支付时输入，保护账户资金安全。</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--帮助中心开始-->
<div class="help_box">
	<a class="title" href="javascript:;"></a>
    <div class="help_box_content">
   	 	<div class="content">
	        <ul class="list">
	            <li><a href="#" target="_blank" hidefocus="false">没有收到短信？</a></li>
	            <li><a href="#" target="_blank" hidefocus="false">如何退款？</a></li>
	            <li><a href="#" target="_blank" hidefocus="false">如何修改订单？</a></li>
	        </ul>
	        <p class="more_box"><a href="#" target="_blank" hidefocus="false">更多帮助&gt;</a></p>
	        <p class="more_box">任何疑问请拨打<span class="tle_box"><i class="kf_icon"></i>1010-6060</span></p>
    	</div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/footer.js"></script>
</body>
</html>