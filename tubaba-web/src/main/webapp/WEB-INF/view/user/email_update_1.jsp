<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
</head>
<body class="lvnav_safeset">
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
<!-- 会员中心左边菜单部分 -->
<jsp:include  page="userInfo_left.jsp" flush="true"/>

<script type="text/javascript">
	$(function(){
		var email = $('span.phone_num').text();
		email = plusXing(email,email.split('@')[0].length - 4,email.split('@')[1].length + 1,'*'); 
		$('span.phone_num').text(email);
	})
	function sendEmailCode(){
		if(checkCaptcha()){
			$.ajax({
				url:'${pageContext.request.contextPath}/sendEmailCode',
				type:'get',
				async: false,
				data:'email='+$("#userEmail").val(),
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
		setTimeout('settime()',1000);
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
				hideError('captcha_tip',$("#captcha"));
				return true;
			}else{
				showError('captcha_tip','验证码错误',$("#captcha"));
				return false;
			}
		}else{
			showError('captcha_tip','验证码不能为空',$("#captcha"));
			return false;
		}
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
				hideError('email_tip',$('sso_verifycode3'));
				return true;
			}else{
				showError('email_tip','验证码错误',$('sso_verifycode3'));
				return false;
			}
		}else{
			showError('email_tip','验证码不能为空',$('sso_verifycode3'));
			return false;
		}
	}
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
	function doSubmit(){
		if(checkCaptcha()){
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
        <div class="mod_box">
            <div class="mod_content p20_4">
                <div class="password_edit_title">
                    <a href="securitySettings" class="fr">返回安全设置&gt;</a>
                    <h4>修改邮箱</h4>
                </div>
                <div class="phone_edit_content">
                    <!--步骤开始-->
                    <ul class="setphone_box">
                        <li class="s_stepbox s_active">
                            <div class="s_step s_step1 ">
                                <span class="s_num">1</span><em>验证原邮箱</em>
                            </div>
                        </li>
                        <li class="s_stepbox">
                            <div class="s_step s_step2 ">
                                <span class="s_num">2</span><em>验证新邮箱</em>
                            </div>
                        </li>
                        <li class="">
                            <div class="s_step s_step3 ">
                                <span class="s_num">3</span><em>修改成功</em>
                            </div>
                        </li>
                    </ul>
                    <!--步骤结束-->
                    <form id="myForm" action="email_update_2" method="post">
                    	<input type="hidden" name="email" value="${email }" id="userEmail" />
                        <div class="phone_box">
                            <input type="hidden" id="old_email" name="old_email" value="1209237719@qq.com">
                            <p><label class="ml72">原邮箱地址：</label><span class="phone_num">${email }</span><!-- <a href="javascript:;" class="mail_tips">原邮箱地址已不再使用？</a> --></p>
                            <p><label class="ml72">图形验证码：</label><input type="text" onblur="checkCaptcha()" id="captcha" class="input_text"><a class="code_img " href="javascript:void(0)"><img src="code" width="90" height="30" id="img" onclick="refreshCheckCode(this.id)"></a><span class="tips_warn" id="captcha_tip"></span></p>
                            <p><label class="ml72">　　验证码：</label><input type="text" onblur="checkAuthenticationCode()" name="authenticationCode" id="sso_verifycode3" class="input_text" onblur="checkAuthenticationCode()"><a class="WithoutPredefineCountdown " onclick="sendEmailCode()" id="send-verifycode-old" href="javascript:void(0)">获取邮件验证码</a><a class="code1 code-time" style="display:none;" href="javascript:void(0)"><em id="countdown">60</em>秒后重发</a><span class="tips_warn" id="email_tip"></span></p>
                            <p><a class="input_button" href="javascript:doSubmit();">下一步</a></p>
                            <!-- <p class="no_mesage"><a href="http://www.lvmama.com/public/help_center_129" target="_blank">没有收到验证邮件？</a></p> -->
                        </div>
                    </form>
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