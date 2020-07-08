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

<div class="newmember_main">
<!-- 会员中心左边菜单部分 -->
<jsp:include  page="userInfo_left.jsp" flush="true"/>
<script type="text/javascript">
function bindPasswordSubmit(){//支付密码提交时验证
	 if(checkOldPassword()){
		 if(checkSso_password()){
			 if(checkSso_againPassword()){
				  $.ajax({
						url:'${pageContext.request.contextPath}/updateUserPaymentCode',
						type:'get',
						data:'id='+$('#userId').val()+"&paymentCode="+$('#sso_password').val(),
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
function checkOldPassword(){
	if($('#sso_oldPassword').val() != ''){
		var flag = false;
		$.ajax({
			url:"checkUserPaymentCode",
			data:"userId="+$('#userId').val()+'&paymentCode='+$('#sso_oldPassword').val(),
			async: false,
			success:function(result){
				if(result.result == true){
					flag = true;
				}else{
					flag = false;
				}
			}
		})
		if(flag){
			hideError('oldPasswordSpan',$('#sso_oldPassword'));
			return true;
		}else{
			showError('oldPasswordSpan','原支付密码错误',$('#sso_oldPassword'));
			return false;
		}
	}else{
		showError('oldPasswordSpan','请您输入原支付密码',$('#sso_oldPassword'));
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


<div class="newmember_rightside">
        <!--修改登录密码开始-->
        <div class="mod_box">
            <div class="mod_content p20_4">
                <div class="password_edit_title">
                     <a href="securitySettings" class="fr">返回安全设置&gt;</a>
                    <h4>修改支付密码</h4>
                </div>
                <div class="pay_password_content">
                	<input type="hidden" value="${userId }" id="userId" />
                    <p><label>　　原支付密码：</label><input type="password" id="sso_oldPassword" class="input_text" onfocus="blurHide(this,'oldPasswordSpan')"><span class="tips_warn" id="oldPasswordSpan"></span></p>
                    <p><label>　　新支付密码：</label><input type="password" id="sso_password" placeholder="请输入6位数字" class="input_text default-text" onfocus="blurHide(this,'passwordSpan')" ><span class="tips_warn" id="passwordSpan"></span></p>
                    <p><label>确认新支付密码：</label><input type="password" id="sso_againPassword" class="input_text" onfocus="blurHide(this,'againPasswordSpan')"><span class="tips_warn" id="againPasswordSpan"></span></p>
                    <p><label></label><a href="paymentPassword_reset" class="a_blue">忘记支付密码？</a></p>
                    <p><label></label><a class="input_button js-sure-btn" id="sure_button" href="javascript:bindPasswordSubmit();">提 交</a></p>
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