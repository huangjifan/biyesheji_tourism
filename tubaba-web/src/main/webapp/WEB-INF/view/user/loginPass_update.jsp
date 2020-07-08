<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
</head>
<body class="lvnav_passwd lv_newaccount">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<div class="newmember_main">
<!-- 会员中心左边菜单部分 -->
<jsp:include  page="userInfo_left.jsp" flush="true"/>
<script type="text/javascript">
	function checkOldPassword(obj){
		if($(obj).val() != ''){
			var flag = false;
			$.ajax({ 
			     type : "get", //提交方式 
			     url : "checkUserPass",//路径 
			     async:false,
			     data : { 
			    	 "password" : $(obj).val(),
			    	 "userId":$('#userId').val()
			     },
			     success : function(result) {//返回数据根据结果进行相应的处理 
			    	if(result.result > 0){
			    		flag = true;
			    	}
			     } 
			    }); 
			if(flag){
				hideError('oldPasswordSpan',obj);
				return true;
			}else{
				showError('oldPasswordSpan','密码错误',obj);
			}
		}else{
			showError('oldPasswordSpan','请输入原始密码',obj);
		}
	}
	function checkPassword(obj){
		if($(obj).val() != ''){
			var tel =/^[A-Za-z].*[0-9]|[0-9].*[A-Za-z]$/;
			if(tel.test($(obj).val()) && $(obj).val().length >= 8 && $(obj).val().length <= 16){
				hideError('passwordSpan',obj);
				return true;
			}else{
				showError('passwordSpan','密码必须为8~16位数字和字符组成',obj);
				return false;
			}
		}else{
			showError('passwordSpan','请输入新密码',obj);
			return false;
			
		}
	}
	function checkAgainPassword(obj){
		if($(obj).val() != ''){
			if($(obj).val() == $('#sso_password').val()){
				hideError('againPasswordSpan',obj);
				return true;
			}else{
				showError('againPasswordSpan','两次密码不一样',obj);
			}
		}else{
			showError('againPasswordSpan','请再次输入新密码',obj);
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
	function submit(){
		if(checkOldPassword($('#sso_oldPassword'))){
			if(checkPassword($('#sso_password'))){
				if(checkAgainPassword($('#sso_againPassword'))){
					$.ajax({ 
					     type : "get", //提交方式 
					     url : "updateUserPass",//路径 
					     async:false,
					     data : { 
					    	 "password" : $('#sso_password').val(),
					    	 "userId":$('#userId').val()
					     },
					     success : function(result) {//返回数据根据结果进行相应的处理 
					    	if(result.result > 0){
					    		location.href="securitySettings";
					    	}
					     } 
					    }); 
				}
			}
		}
	}
</script>
<div class="newmember_rightside">
<input type="hidden" id="userId" value="${userid }" />
        <!--修改登录密码开始-->
        <div class="mod_box">
            <div class="mod_content p20_4">
                <div class="password_edit_title">
                    <h4>修改登录密码</h4>
                </div>
                <div class="password_edit_content">
                    <p><label>　　原密码：</label><input type="password" id="sso_oldPassword" class="input_text" onblur="checkOldPassword(this)"><span class="tips_warn" id="oldPasswordSpan"></span></p>
                    <p><label>　　新密码：</label><input type="password" id="sso_password" class="input_text" onblur="checkPassword(this)"><span class="tips_warn" id="passwordSpan"></span></p>
                    <p><label>确认新密码：</label><input type="password" id="sso_againPassword" class="input_text" onblur="checkAgainPassword(this)"><span class="tips_warn" id="againPasswordSpan"></span></p>
                    <p><a class="input_button" onclick="submit()" id="sure_button" href="#">确 定</a><a href="retrieve" class="password_forget" target="_blank">忘记密码？</a></p>
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