<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全中心</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
</head>
<body class="lvnav_safeset lv_newaccount">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<script type="text/javascript">
	$(function(){
		var phone = $('span.phone_num').text();
		phone = plusXing(phone,3,4,'*');
		$('span.phone_num').text(phone);
	})
	function sendNote(){//发送短信
		var phone = $('#old_mobile').val();
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
	function checkCode(){
		if($('#authenticationCode').val() != ''){
			var flag;
			$.ajax({
				url:'${pageContext.request.contextPath}/checkPhoneCode',
				type:'get',
				data:'code='+$('#authenticationCode').val()+"&phone="+$('#old_mobile').val(),
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
				$('#span_tips').text('');
				$('#span_tips').prepend('<i class="tips_right_icon" ></i>');
				$('#span_tips').show();
				return true;
			}else{
				$('#span_tips').text('验证码错误');
				$('#span_tips').prepend('<i class="tips_error_icon" ></i>');
				$('#span_tips').show();
				return false;
			}
		}else{
			$('#span_tips').text('请输入验证码');
			$('#span_tips').prepend('<i class="tips_error_icon" ></i>');
			$('#span_tips').show();
			return false;
		}
	}
	function submit(){
		if(checkCode()){
			$.ajax({
				url:'${pageContext.request.contextPath}/removeCode',
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
</script>
<div class="newmember_main">
<!-- 会员中心左边菜单部分 -->
<jsp:include  page="userInfo_left.jsp" flush="true"/>
   
<!--页面主体-->
    <div class="newmember_rightside">
        <!--修改手机号开始-->
        <div class="mod_box">
            <div class="mod_content p20_4">
                <div class="password_edit_title">
                    <a href="securitySettings" class="fr">返回安全设置&gt;</a>
                    <h4>修改手机号</h4>
                </div>
                <div class="phone_edit_content">
                    <!--步骤开始-->
                    <ul class="setphone_box">
                        <li class="s_stepbox s_active">
                            <div class="s_step s_step1 ">
                                <span class="s_num">1</span><em>验证原手机号</em>
                            </div>
                        </li>
                        <li class="s_stepbox">
                            <div class="s_step s_step2 ">
                                <span class="s_num">2</span><em>验证新手机号</em>
                            </div>
                        </li>
                        <li class="">
                            <div class="s_step s_step3 ">
                                <span class="s_num">3</span><em>修改成功</em>
                            </div>
                        </li>
                    </ul>
                    <!--步骤结束-->
                    <form id="myForm" action="phone_update_2" method="post">
                        <div class="phone_box">
                            <p><label>原手机号：</label><span class="phone_num">${iphone }</span><!-- <a href="#" class="phone_tips">原手机号已丢失或停用</a> --></p>
                            <input type="hidden" id="old_mobile" name="old_mobile" value="${iphone }">
                            <p><label>　验证码：</label><input type="text" id="authenticationCode" name="authOldMobileCode" class="input_text" onblur="checkCode()"><a id="send-verifycode-old" onclick="sendNote()" class="WithoutPredefineCountdown " href="javascript:void(0)">获取动态密码</a><a class="code1 code-time" style="display:none;" href="javascript:void(0)"><em id="countdown">60</em>秒后重发</a><span class="tips_warn" id="span_tips"></span></p>
                            <p><a class="input_button" href="javascript:submit();">下一步</a></p>
                            <!-- <p><a href="http://www.lvmama.com/public/help_center_132" class="no_mesage" target="_blank">手机没有收到验证短信？</a></p> -->
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div data-mask="overlay" class="overlay" style="z-index: 3999; display: none;"></div>
<div class="dialog dialog-default" style="display: none; width: 600px; z-index: 4008; position: fixed; top: 20%; left: 30%;">    <div class="dialog-inner clearfix">        <a class="dialog-close" data-dismiss="dialog">×</a>        <div class="dialog-header" data-title="title"></div>        <div class="dialog-body" style="">            <div class="dialog-content clearfix" data-content="content"><div class="lostphone_box" style="display: block;">
    <h5>原来手机号已丢失或停用？</h5>
    <p class="lostphone_content">亲爱的用户，如果您无法进行账户的相关操作，请致电客服1010-6060。为了您的账户安全，我们必须验证您的身份，请先准备好以下资料，再致电客服。</p>
    <p class="lostphone_content"><em>建议提供如下资料：</em>
        1：提供最近一笔订单的出游人信息（姓名，手机号）<br>
        2：提供订单交易的银行卡交易流水号，或支付宝交易流水号，或充值账号的充值银行卡<br>　　交易流水号（请提供截图）<br>
        3：提供原绑定手机号</p><br>
    <p class="lostbtn_box"><a href="#" id="ensureTipButton">确定</a></p>
</div></div>        </div>        <div class="dialog-footer" data-btn="btns"></div>    </div></div>

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