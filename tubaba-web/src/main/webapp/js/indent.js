function checkCode(){
	var phone=$("#mobileLoginText").val();
	var pattern = /^1[34578]\d{9}$/; 
	if (phone==''||phone==null||!pattern.test(phone)||phone.length!=11) {
		alert("手机号不正确");
		return;
	}
	
	var flag=false;
	$.ajax({
		url:'send_code',
		type:'get',
		async: false,
		data:'phone='+phone,
		success:function(result){
			if(result.trim() == 'true'){
				alert("验证码发送成功");
				flag = true;
			}else{
				alert("发送失败");
				flag = false;
			}
		}
	})
	if (flag) {
		settime();
	}
	else {
		alert("发送失败");
	}
}
var c=60;
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