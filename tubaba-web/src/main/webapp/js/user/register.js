function refreshCheckCode(id){
	var obj = $('#'+id);
	 //获取当前的时间作为参数，无具体意义     
    var timenow = new Date().getTime();     
       //每次请求需要一个不同的参数，否则可能会返回同样的验证码     
    //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。     
    obj.attr('src','code?d='+timenow);
    $("#sjRegForm").validate().resetForm();//更换验证码之后重置验证
}
var c=60;
function checkCode(){
	if($("#sjRegForm").validate().element($('#sso_mobile'))){
		if($("#sjRegForm").validate().element($('#sso_verifycode1')) && $('#sso_verifycode1').data('previousValue') != undefined && $('#sso_verifycode1').data('previousValue').valid == true){
			var flag = false;
			var phone = $('#sso_mobile').val();
			$.ajax({
				url:'send_code',
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
$(function(){
	//密码判断
	jQuery.validator.addMethod("ispass", function(value, element) {   
	    var tel =/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;
	    return this.optional(element) || (tel.test(value));
	}, "密码必须为8-16位数字和字符组成");
	// 手机号码验证
	jQuery.validator.addMethod("isMobile", function(value, element) {
		var length = value.length;
		var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
		return this.optional(element) || (length == 11 && mobile.test(value));
	}, "请正确填写您的手机号码");
	$('#sjRegForm').validate({
		rules:{
			mobile:{
				required:true,
				isMobile:true,
				remote:{
					type:'get',
					url:'/checkPhone',
					dataType:"html",
					async:false,//默认为异步请求，设置false为同步
					data:{
						phone:function() {
			              return $("#sso_mobile").val();
			            }
					},
					dataFilter:function(data,type){
						if(data.trim() == 'true'){
							return true;
						}else{
							return false;
						}
					}
				}
			},
			verifycode:{
				required:true,
				remote:{
					type:'get',
					url:'/checkCode',
					dataType:"html",
					async:false,//默认为异步请求，设置false为同步
					data:{
						code:function() {
			              return $("#sso_verifycode1").val();
			            }
					},
					dataFilter:function(data,type){
						if(data.trim() == 'true'){
							return true;
						}else{
							return false;
						}
					}
				}
			
			},
			password:{
				required:true,
				rangelength:[8,16],
				ispass:true,
			},
			againPassword:{
				required:true,
				equalTo:'#sso_password',
			}
		},
		messages:{
			mobile:{
				required:'手机号不能为空',
				isMobile:'请输入正确的手机号',
				remote:'手机号已存在',
			},
			verifycode:{
				required:'验证码不能为空',
				remote:'验证码错误',
			},
			password:{
				required:'密码不能为空',
				rangelength:$.validator.format("密码必须为{0}-{1}位数字和字符组成")
			},
			againPassword:{
				required:'确认密码不能为空',
				equalTo:'两次密码不一样',
			}
		},
       errorPlacement:function(error, element){
    	   //改变报错信息位置
    	   error.appendTo(element.parent());
       },
       showErrors : function(errorMap, errorList) {
    	   var id;
    	   if(errorList[0] != undefined){
    		   id = $(errorList[0].element).attr('id');
    		   $($('#'+id)).parent().find('label[class="success"]').hide();
    	   }
           // 遍历错误列表
           for(var obj in errorMap) {
               // 自定义错误提示效果
               $('#' + obj).parent().addClass('has-error');
           }
           // 此处注意，一定要调用默认方法，这样保证提示消息的默认效果
           this.defaultShowErrors();
       },
       success:function(label) {
    	   console.log($(label).attr('id').substring(0,$(label).attr('id').lastIndexOf("-")));
    	   $($('#'+$(label).attr('id').substring(0,$(label).attr('id').lastIndexOf("-")))).parent().find('label[class="success"]').show();
       }
	})
	/*$('input[id!="sso_verifycode2"]').focus(function(){//获取焦点时验证
		if(!$("#sjRegForm").validate().element($(this))){
			$(this).parent().find('label[class="success"]').hide();
		}
	});*/
	/*$('input[id!="sso_verifycode2"]').keyup(function(){//键盘松开时验证
		if($(this).data('previousValue') != undefined && $(this).attr('id')  == 'sso_verifycode1'){
			$(this).data('previousValue').old = $(this).val();
		}
		if($("#sjRegForm").validate().element($(this)) && $(this).attr('id')  == 'sso_verifycode1' && $(this).data('previousValue') != undefined && $(this).data('previousValue').valid == true){
			$(this).parent().find('label[class="success"]').show();
		}else if($("#sjRegForm").validate().element($(this)) && $(this).attr('id')  != 'sso_verifycode1'){
			$(this).parent().find('label[class="success"]').show();
		}else{
			$(this).parent().find('label[class="success"]').hide();
		}
	});*/
	/*$('input[id!="sso_verifycode2"]').blur(function(){//失去焦点时验证
		if($("#sjRegForm").validate().element($(this))){
			$(this).parent().find('label[class="success"]').show();
		}
		if($('#sso_password').val() != $('#sso_againPassword').val()){
			$($('#sso_againPassword')).parent().find('label[class="success"]').hide();
		}
	});*/
	
	/*$('input[id="sso_password"]').blur(function(){
		if($("#sjRegForm").validate().element($(this))){
			if($(this).val().indexOf('.') > 0){
				$(this).next().addClass('pswState-strong');
			}else{
				var tel =/^(?=.*\d)(?=.*[a-zA-Z])(?=.*[~!@#$%^&*])[\da-zA-Z~!@#$%^&*]{8,18}$/;
				if(tel.test($(this).val())){
					$(this).next().addClass('pswState-strong');
				}else{
					$(this).next().addClass('pswState-weak');
				}
			}
		}else{
			$(this).next().removeClass('pswState-strong').removeClass('pswState-weak');
		}
	});*/
	
	$('input[id="sso_password"]').keyup(function(){//键盘松开验证----判断密码强度
		if($("#sjRegForm").validate().element($(this))){
			if($(this).val().indexOf('.') > 0){
				$(this).next().addClass('pswState-strong');
			}else{
				var tel =/^(?=.*\d)(?=.*[a-zA-Z])(?=.*[~!@#$%^&*])[\da-zA-Z~!@#$%^&*]{8,18}$/;
				if(tel.test($(this).val())){
					$(this).next().addClass('pswState-strong');
				}else{
					$(this).next().removeClass('pswState-strong');
					$(this).next().addClass('pswState-weak');
				}
			}
		}else{
			$(this).next().removeClass('pswState-strong').removeClass('pswState-weak');
		}
	});
	
	//注册提交方法
	$('#submitBtn').click(function(){
		if($('#sjRegForm').valid()){
			if($('#sso_verifycode2').val() == ''){
				$('#sso_verifycode2').parent().find('label[class="error"]').text('验证码不能为空').css('display','inline-block');
			}else{
				var code = $('#sso_verifycode2').val();
				$.ajax({ 
				     type : "get", //提交方式 
				     url : "checkPhoneCode",//路径 
				     data : { 
				    	 "code" : code,
				    	 "phone":$('#sso_mobile').val(),
				     },
				     success : function(result) {//返回数据根据结果进行相应的处理 
				    	 if(result.trim() == '2'){
				    		 if($('#terms').is(':checked')){
				    			$('#sjRegForm').submit();
				    		 }else{
				    			 $('#terms').parent().find('label[class="error"]').css('display','block').text('请阅读《兔爸爸旅游网会员服务条款》');
				    		 }
				    	 }else{
				    		 $('#sso_verifycode2').parent().find('label[class="error"]').text('验证码错误').css('display','inline-block');
				    	 }
				     } 
				    }); 
			}
		}else{
			if(!$("#sjRegForm").validate().element($('#sso_verifycode1')) || $('#sso_verifycode1').data('previousValue') == undefined || $('#sso_verifycode1').data('previousValue').valid == false){
				$('#sso_verifycode1').parent().find('label[class="success"]').hide();
			}
		}
	})
	
	//找回密码提交方法
	$('#iphoneSubmitBtn').click(function(){
		if($('#sjRegForm').valid()){
			if($('#sso_verifycode2').val() == ''){
				$('#sso_verifycode2').parent().find('label[class="error"]').text('验证码不能为空').css('display','inline-block');
			}else{
				var code = $('#sso_verifycode2').val();
				$.ajax({ 
				     type : "get", //提交方式 
				     url : "checkPhoneCode",//路径 
				     data : { 
				    	 "code" : code,
				     },
				     success : function(result) {//返回数据根据结果进行相应的处理 
				    	 if(result.trim() == '2'){
				    		$('#sjRegForm').submit();
				    	 }else{
				    		 $('#sso_verifycode2').parent().find('label[class="error"]').text('验证码错误').css('display','inline-block');
				    	 }
				     } 
				    }); 
			}
		}else{
			if(!$("#sjRegForm").validate().element($('#sso_verifycode1')) || $('#sso_verifycode1').data('previousValue') == undefined || $('#sso_verifycode1').data('previousValue').valid == false){
				$('#sso_verifycode1').parent().find('label[class="success"]').hide();
			}
		}
		
	})
	
})