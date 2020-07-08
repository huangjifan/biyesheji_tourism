<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
</head>
<body class="lvnav_logout">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<script type="text/javascript">
function refreshCheckCode(id){
	var obj = $('#'+id);
	 //获取当前的时间作为参数，无具体意义     
    var timenow = new Date().getTime();     
       //每次请求需要一个不同的参数，否则可能会返回同样的验证码     
    //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。     
    obj.attr('src','code?d='+timenow);
}
</script>

<div class="newmember_main">
<!--会员中心左边导航开始-->
<jsp:include  page="userInfo_left.jsp" flush="true"/>
<script type="text/javascript">
	$(function(){
		$('.nova-radio-label').click(function(){
			$('.nova-radio').removeClass('nova-checked');
			$(this).find('span').addClass('nova-checked');
		})
	})
	function sendCode(){
		if(checkCaptcha()){
			$.ajax({
				url:'${pageContext.request.contextPath}/send_code',
				type:'get',
				async: false,
				data:'phone='+$('#mobileNum').val(),
				success:function(result){
					if(result.trim() == 'true'){
						alert('发送成功');
						settime()
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
	function checkCaptcha(){
		if($("#captcha").val() != ''){
			var flag = false;
			$.ajax({
				type:'get',
				url:'/checkCode',
				dataType:"html",
				async:false,//默认为异步请求，设置false为同步
				data:"code="+$("#captcha").val(),
				success:function(result){
					if(result.trim() == 'true'){
						flag = true;
					}else{
						flag = false;
					}
				}
			})
			if(flag){
				hideError('captcha-error',$("#captcha"));
				return true;
			}else{
				showError('captcha-error','验证码错误',$("#captcha"));
				return false;
			}
		}else{
			showError('captcha-error','验证码不能为空',$("#captcha"));
			return false;
		}
	}
	function checkAuthenticationCode(){
		if($('#smsCode').val() != ''){
			var flag = false;
			$.ajax({
				url:'${pageContext.request.contextPath}/checkPhoneCode',
				type:'get',
				data:'code='+$('#smsCode').val(),
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
				hideError('send-verifycode',$('#smsCode'));
				return true;
			}else{
				showError('send-verifycode','验证码错误',$('#smsCode'));
				return false;
			}
		}else{
			showError('send-verifycode','验证码不能为空',$('#smsCode'));
			return false;
		}
	}
	function showError(errorId,errorText,obj){
		$(obj).addClass('input_error');
		$('#'+errorId).show();
		$('#'+errorId).empty();
		$('#'+errorId).text(errorText);
		$('#'+errorId).prepend('<span class="nova-icon-xs nova-icon-error"></span>');
	}
	function hideError(errorId,obj){
		$(obj).removeClass('input_error');
		$('#'+errorId).empty();
		$('#'+errorId).prepend('<span class="nova-icon-xs nova-icon-success"></span>');
	}
	function doSubmit(){
		if(checkCaptcha()){
			if(checkAuthenticationCode()){
				var logoutWhy = '';
				if($('.nova-checked').prev().val() == '其他'){
					logoutWhy = $('.nova-checked').prev().val() + '-' + $('#otherContent').val();
				}else{
					logoutWhy = $('.nova-checked').prev().val();
				}
				$.ajax({
					url:'${pageContext.request.contextPath}/logoutUser',
					type:'post',
					async: false,
					data:"type=3&userId="+$('#userId').val()+"&logoutWhy="+logoutWhy,
					success:function(result){
						alert(1111);
						if(result.result == true){
							location.href="exit";
						}
					}
				})
			}
		}
	}
</script>
<div class="newmember_rightside">
        <div class="mod_box">
            <div class="mod_content p20_4">
                <div class="loginOut-tip-box">
                    <h3 class="title"><span class="nova-icon-outline-xl nova-icon-warning"></span>账号注销后，将放弃以下权益和资产</h3>
                    <div class="content">
                        1 历史订单将无法查询<br>
                        2 账号将会无法登录<br>
                        3 放弃驴镑和优惠券等权益、<br>
                        4 放弃钱包、礼品卡、权益等金额
                    </div>
                    <p class="tips">请确保所有订单已完结并且无纠纷，账号注销后历史订单产生的返现、驴镑等权益视为自动放弃。<br>
                        若线上验证失败，还可以致电驴妈妈客服电话1010-6060咨询账号注销相关事宜。</p>
                </div>
                <div class="loginOut-input-box">
                	<input type="hidden" value="${userId }" id="userId" />
                    <h4 class="title">手机号码验证</h4>
                    <ul class="list">
                        <li>
                            <span class="word"><em>* </em>手机号码：</span>
                            <input id="mobileNum" type="text" value="${iphone }" disabled="">
                            &nbsp;&nbsp;<span class="nova-tip-form error_text" style="display: none;" id="mobile-error"><span class="nova-icon-xs nova-icon-error"></span>手机号码不能为空！</span>
                        </li>
                        <li>
                            <span class="word"><em>* </em>图形验证码：</span>
                            <input type="text" placeholder="请输入图片验证码" onblur="checkCaptcha()" class="iptwidth JS_non_empty" id="captcha">
                            <a href="#">
                                <img id="captchaImg" src="code" width="85" id="" height="36" onclick="refreshCheckCode('captchaImg')">
                            </a>
                            &nbsp;&nbsp;<span class="nova-tip-form"  id="captcha-error"><!-- <span class="nova-icon-xs nova-icon-error"></span>请输入正确的图形验证码！ --></span>
                        </li>
                        <li>
                            <span class="word"><em>* </em>短信验证码：</span>
                            <input id="smsCode" type="text" placeholder="请输入短信验证码" onblur="checkAuthenticationCode()" class="iptwidth JS_non_empty">
                            <a id="send-verifycode-old" onclick="sendCode()" class="WithoutPredefineCountdown " href="javascript:void(0)">发送验证码</a>
                            <span class="code1 code-time" style="display:none;"><em id="countdown">60</em>秒后重发</span>
                            <span class="nova-tip-normal">
                                <span class="nova-icon-xs nova-icon-info"></span>
						                                验证有效时间为：1分钟，超出时间请重新获取</span>
                            <span class="nova-tip-form" id="send-verifycode"></span>
                        </li>
                        <li class="nova-radio-group">
                            <div class="other-list">
                                <label class="nova-radio-label nova-radio-label-orange">
                                    <input type="radio" name="other" value="不想收到驴妈妈短信" checked="" class="nova-radio-hide"><span class="nova-radio nova-checked"></span>
                                    <em>不想收到驴妈妈短信</em>
                                </label>
                            </div>
                            <div class="other-list">
                                <label class="nova-radio-label nova-radio-label-orange">
                                    <input type="radio" name="other" value="其他账户需绑定此注册号码" class="nova-radio-hide"><span class="nova-radio"></span>
                                    <em>其他账户需绑定此注册号码</em>
                                </label>
                            </div>
                            <div class="other-list">
                                <label class="nova-radio-label nova-radio-label-orange">
                                    <input type="radio" name="other" value="多余账户" class="nova-radio-hide"><span class="nova-radio"></span>
                                    <em>多余账户</em>
                                </label>
                            </div>
                            <div class="other-list">
                                <label class="nova-radio-label nova-radio-label-orange">
                                    <input type="radio" name="other" value="其它" class="nova-radio-hide"><span class="nova-radio"></span>
                                    <em>其它</em>
                                </label>
                                <textarea name="" id="otherContent" maxlength="50" cols="30" rows="10"></textarea>
                            </div>
                        </li>
                        <li>
                            <a href="javascript:doSubmit();" class="loginOut-btn">帐号验证</a>
                        </li>
                    </ul>
                </div>
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