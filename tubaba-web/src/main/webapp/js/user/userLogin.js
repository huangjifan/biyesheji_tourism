//登录方式切换效果
function putong(){
	var display=$("#putong");
	display.css("display","block");
	$("#pt").attr("class","left")
	$("#sj").attr("class","right active");
	$("#shouji").css("display","none");
}
function shouji(){
	$("#sj").attr("class","right");
	$("#pt").attr("class","left active");
	$("#shouji").css("display","block");
	$("#putong").css("display","none");
}
var c=60;
function checkCode(){
	var flag = false;
	var phone = $('#mobileLoginText').val();
	var ss=$("#sjts").text;
	var reg=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
	if (phone!=''&&phone!=ss) {
		if (reg.test(phone)) {
			$.ajax({
				url:'send_code',
				type:'get',
				async: false,
				data:'phone='+phone,
				success:function(result){
					if(result.trim() == 'true'){
						$('body').dialog({
							type:'success',title:'提示',discription:'验证码发送成功!',buttons:[{name:'确定'}]
						})
						flag = true;
					}else{
						$('body').dialog({
							type:'warning',title:'警告.',discription:'发送失败!',buttons:[{name:'确定'}]
						})
						flag = false;
					}
				}
			})
			if (flag==false) {
				return;
			}
			else {
				settime();
			}
		}
		else {
			$('body').dialog({
				type:'primary',title:'警告!!!.',discription:'请输入正确的手机格式!',buttons:[{name:'确定'}]
			})
		}
	}	
	else {
		$('body').dialog({
			type:'primary',title:'提示',discription:'请输入手机号码!',buttons:[{name:'确定'}]
		})
	}
}
function settime() { //发送验证码倒计时
	var obj = $('#codefr');
	 if (c == 0) { 
	        obj.attr('disabled',false); 
	       obj.val("获取动态验证码");
	        c = 60; 
	        return;
	    } else { 
	        obj.attr('disabled',true);
	        obj.val("重新发送(" + c + ")");
	        c--; 
	    } 
	setTimeout('settime()',1000) 
}
//普通登录验证
$(function(){
	jQuery.validator.addMethod("ispass", function(value, element) {   
	    var tel =/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;
	    return this.optional(element) || (tel.test(value));
	}, "密码必须为8-16位数字和字符组成");
	$("#putongSubmit").validate({
		rules:{
			username:{required:true},
			userpass:{required:true}
		},
		messages:{
			username:{required:"邮箱/手机号/用户名"},
			userpass:{required:"请输入密码"}
		}
	})
})
//手机登录验证

$(function(){
	//验证手机号码格式
	jQuery.validator.addMethod("checkIphone",function(value,element){
		var reg=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;  
		 var iphone=$("#mobileLoginText").val();
		 if (reg.test(iphone)) {
			return true;
		 }
		 else{
			 return false;
		 }
	 },"邮箱格式错误");
	$("#mobileLoginSumbit").validate({
		rules:{
			iphone:{required:true,checkIphone:true},
			yzm:{required:true}
		},
		messages:{
			iphone:{required:"请输入手机号码",checkIphone:"请输入正确的手机格式"},
			yzm:{required:"请输入验证码"}
		},
		errorPlacement:function(error, element){
			error.appendTo(element.parent());
		}
	})
	
})
function pact(){
	if ($("#remPassWord").is(':checked')) {
		return true;
	}
	return false;
}
