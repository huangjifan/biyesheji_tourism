<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
</head>
<body>
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>

<div class="newmember_main">
<!-- 会员中心左边菜单部分 -->
<jsp:include  page="userInfo_left.jsp" flush="true"/>

<script type="text/javascript">
function showError(errorId,errorText,obj){
	$(obj).addClass('input_error');
	$('#'+errorId).empty();
	$('#'+errorId).text(errorText);
	$('#'+errorId).prepend('<i class="tips_error_icon"></i>');
}
function hideError(errorId,obj){
	$(obj).removeClass('input_error');
	$('#'+errorId).empty();
	$('#'+errorId).prepend('<i class="tips_right_icon"></i>');
}
function checkAuthenticationCode(){
	if($('#sso_verifycode3').val() != ''){
		var flag = false;
		$.ajax({
			type:'get',
			url:'/checkEmailCode',
			dataType:"html",
			async:false,//默认为异步请求，设置false为同步
			data:"emailCode="+$('#sso_verifycode3').val(),
			success:function(result){
				if(result.trim() == '2'){
					flag = true;
				}else{
					flag = false;
				}
			}
		})
		if(flag){
			hideError('email_code',$('sso_verifycode3'));
			return true;
		}else{
			showError('email_code','验证码错误',$('sso_verifycode3'));
			return false;
		}
	}else{
		showError('email_code','验证码不能为空',$('sso_verifycode3'));
		return false;
	}
}
function clearTip(){
	if($('#emailId').val() != ''){
		var reg = /[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5}/;
		if(reg.test($('#emailId').val())){
			var flag = false;
			$.ajax({
				type:'get',
				url:'/checkEmail',
				dataType:"html",
				async:false,//默认为异步请求，设置false为同步
				data:"email="+$('#emailId').val(),
				success:function(result){
					if(result.trim() == 'true'){
						flag = true;
					}else{
						flag = false;
					}
				}
			})
			if(flag){
				hideError('email_tip',$('#emailId'));
				return true;
			}else{
				showError('email_tip','邮箱已存在',$('#emailId'));
				return false;
			}
		}else{
			showError('email_tip','请输入正确的邮箱',$('#emailId'));
			return false;
		}
	}else{
		showError('email_tip','邮箱不能为空',$('#emailId'));
		return false;
	}
}
function sendEmailCode(){
	if(clearTip()){
		$.ajax({
			url:'${pageContext.request.contextPath}/sendEmailCode',
			type:'get',
			async: false,
			data:'email='+$("#emailId").val(),
			success:function(result){
				if(result.result == true){
					alert('发送成功');
					settime();
				}else{
					alert('发送失败');
				}
			}
		})
	}
}
function settime() { //发送验证码倒计时
	var time = $('#countdown').text();
	 if (time == 0) { 
		   $('#countdown').parent().hide();
		   $('#send-verifycode-old').show();
		   $('#countdown').text(60);
	       return;
	    } else { 
	    	 $('#countdown').parent().show();
			$('#send-verifycode-old').hide();
	    	time = time - 1;
	    	$('#countdown').text(time);
	    } 
	setTimeout('settime()',1000) 
}
function doSubmit(){
	if(clearTip()){
		if(checkAuthenticationCode()){
			$.ajax({
				url:'${pageContext.request.contextPath}/removeEmailCode',
				type:'get',
				async: false,
				success:function(result){
					if(result.result == true){
						$('#myForm').submit();
					}
				}
			})
		}
	}
}
</script>

<div class="newmember_rightside">
        <!--绑定邮箱开始-->
        <div class="mod_box">
            <div class="mod_content p20_4">
                <div class="password_edit_title">
                    <a href="securitySettings" class="fr">返回安全设置&gt;</a>
                    <h4>绑定邮箱</h4>
                </div>
                <div class="phone_edit_content">
                    <!--步骤结束-->
                    <form id="myForm" action="updateUserEmail" method="post">
                    	<input type="hidden" name="userId" id="userId" value="${userid }" />
                        <div class="phone_box">
                            <input type="hidden" name="newVersion" value="">
                            <p><label class="ml72">邮箱地址：</label><input type="text" id="emailId" name="email" onblur="clearTip()" class="input_text wd_250" maxlength="64"><span class="tips_warn" id="email_tip"></span></p>
                            <p><label class="ml72">验证码：</label><input type="text" onblur="checkAuthenticationCode()" name="authenticationCode" id="sso_verifycode3" class="input_text"><a class="WithoutPredefineCountdown " onclick="sendEmailCode()" id="send-verifycode-old" href="javascript:void(0)">获取邮件验证码</a><a class="code1 code-time" style="display:none;" href="javascript:void(0)"><em id="countdown">60</em>秒后重发</a><span class="tips_warn" id="email_code"></span></p>
                            <p><a class="input_button" href="javascript:doSubmit();">下一步</a></p>
                            <!-- <p class="no_mesage"><a href="http://www.lvmama.com/public/help_center_129" target="_blank">没有收到验证邮件？</a></p> -->
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--修改登录密码结束-->
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