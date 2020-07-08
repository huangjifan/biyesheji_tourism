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
<script type="text/javascript">
$(function(){
	var phone = $('em.font16').text();
	phone = plusXing(phone,3,4,'*');
	$('em.font16').text(phone);
})
function sendNote(){//发送短信
	var phone = $('#mobileValue').val();
	var flag=false;
	$.ajax({
		url:'${pageContext.request.contextPath}/send_code',
		type:'get',
		async: false,
		data:'phone='+phone,
		success:function(result){
			if(result.trim() == 'true'){
				alert('发送成功');
				flag = true;
			}else{
				alert('发送失败');
				flag = false;
			}
		}
	})
	if(flag == false){
		return;
	}
	settime();
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
function bindPasswordSubmit(){//支付密码提交时验证
	 if(checkCode()){
		 if(checkSso_password()){
			 if(checkSso_againPassword()){
				  $.ajax({
						url:'${pageContext.request.contextPath}/updateUserPaymentCode',
						type:'get',
						data:'id='+$('#codeResult').val()+"&paymentCode="+$('#sso_password').val(),
						async: false,
						success:function(result){
							if(result.result > 0){
								location.href="securitySettings";
							}else{
								alert("操作失败");
							}
						}
					}) 
			 }
		 }
	 }
}
function checkCode(){
	if($('#authenticationCode').val() != ''){
		var flag;
		$.ajax({
			url:'${pageContext.request.contextPath}/checkPhoneCode',
			type:'get',
			data:'code='+$('#authenticationCode').val(),
			async: false,
			success:function(result){
				if(result.trim() == '2'){
					flag = true;
				}else{
					flag = false;
				}
			}
		})
		if(flag){
			hideError('span_tips',$('#authenticationCode'));
			return true;
		}else{
			showError('span_tips','验证码输入错误',$('#authenticationCode'));
			return false;
		}
	}else{
		showError('span_tips','请填写短信验证码',$('#authenticationCode'));
		return false;
	} 
}
function checkSso_password(){
	if($('#sso_password').val() != ''){
		var reg=/^[1-9]+[0-9]*]*$/;
		if($('#sso_password').val().length == 6 && reg.test($('#sso_password').val())){
			hideError('passwordSpan',$('#sso_password'));
			return true;
		}else{
			showError('passwordSpan','请输入正确的6位数字支付密码',$('#sso_password'));
			return false;
		}
	}else{
		showError('passwordSpan','请您输入支付密码',$('#sso_password'));
		return false;
	}
}
function checkSso_againPassword(){
	if($('#sso_againPassword').val() == $('#sso_password').val()){
		hideError('againPasswordSpan',$('#sso_againPassword'));
		return true;
	}else{
		showError('againPasswordSpan','您两次密码输入不一致，请重新输入',$('#sso_againPassword'));
		return false;
	}
}
function showError(errorId,errorText,obj){
	$(obj).addClass('input_error');
	$('#'+errorId).show();
	$('#'+errorId).empty();
	$('#'+errorId).text(errorText);
	$('#'+errorId).prepend('<i class="tips_error_icon"></i>');
}
function hideError(errorId,obj){
	$(obj).removeClass('input_error');
	$('#'+errorId).show();
	$('#'+errorId).empty();
	$('#'+errorId).prepend('<i class="tips_right_icon"></i>');
}
function blurHide(obj,errorId){
	$(obj).removeClass('input_error');
	$('#'+errorId).hide();
}
</script>

<div class="newmember_main">
<!-- 会员中心左边菜单部分 -->
<jsp:include  page="userInfo_left.jsp" flush="true"/>

    <div class="newmember_rightside">
        <!--修改手机号开始-->
        <div class="mod_box">
            <div class="mod_content p20_4">
                <div class="password_edit_title">
                    <a href="securitySettings" class="fr">返回安全设置&gt;</a>
                    <h4>绑定支付密码</h4>
                </div>
                        <div class="pay_password_content">
                            <input id="codeResult" name="codeResult" type="hidden" value="${userId }">
                            <input id="mobileValue" name="mobile" type="hidden" value="${iphone }">
                            <p><label>  手机验证：</label><em class="font16">${iphone }</em></p>
                            <p><label>  验证码：</label><input type="text" onfocus="blurHide(this,'span_tips')" id="authenticationCode" name="authenticationCode" class="input_text">
                            <a class="code code-time" id="send-verifycode-old" href="javascript:sendNote()">获取短信验证码</a><a class="code1 code-time" style="display:none;" href="javascript:void(0)"><em id="countdown">60</em>秒后重发</a><span class="tips_warn" id="span_tips" style="display: none; margin-left: 10px;"></span></p>
                            <p><label>支付密码：</label><input type="password"  onfocus="blurHide(this,'passwordSpan')" id="sso_password" placeholder="请输入6位数字" class="input_text default-text"><span class="tips_warn" id="passwordSpan"></span></p>
                            <p><label>确认支付密码：</label><input type="password"  onfocus="blurHide(this,'againPasswordSpan')" id="sso_againPassword" class="input_text"><span class="tips_warn" id="againPasswordSpan"></span></p>
                            <p><label></label><a id="savePayPassword" class="input_button js-sure-btn" href="javascript:bindPasswordSubmit();">立即重置</a></p>
                            <!-- <p><label></label><a href="http://www.lvmama.com/public/help_center_132" class="no_mesage a_gray66" target="_blank">手机没有收到验证短信？</a></p> -->
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