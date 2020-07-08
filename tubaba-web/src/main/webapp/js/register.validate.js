$(function(){
	var isGoOn = false;
	var tmpdataobj = {

		sso_inviteCode : {
            active : "璇疯緭鍏ユ湁鏁堢殑閭€璇风爜",
			inviteCode : "蹇呴』涓�7-9涓瓧绗︿笖鐢辨暟瀛楀拰瀛楁瘝缁勬垚",
            express : [{
                text : "蹇呴』涓�7-9涓瓧绗︿笖鐢辨暟瀛楀拰瀛楁瘝缁勬垚",
                func : function(){
                    var text = $(this).val();
                    if (text =="") {
                    	//alert(1111);
                    	return true;
                    }else{
                    	//alert(2222);
                    	return (/^[0-9a-zA-Z]{7,9}$/.test(text));
                    }

                }
            }]
        },



		sso_membership : {
			active : "璇疯緭鍏ユ湁鏁堢殑浼氬憳鍗″彿",
			empty : "璇疯緭鍏ユ湁鏁堢殑浼氬憳鍗″彿"
		},
		sso_mobile : {
			active : "璇峰～鍐欐偍鐪熷疄鐨勬墜鏈哄彿鐮侊紝浣滀负椹村濡堢殑鐧诲綍璐﹀彿",
			empty : "鎵嬫満鍙风爜涓嶈兘涓虹┖",
			phone : "璇疯緭鍏ユ湁鏁堢殑鎵嬫満鍙风爜",
			position : ":last"
		},
		sso_mobile2 : {
			active : "璇峰～鍐欐偍鐪熷疄鐨勬墜鏈哄彿鐮�",
			empty : "鎵嬫満鍙风爜涓嶈兘涓虹┖",
			phone : "璇疯緭鍏ユ湁鏁堢殑鎵嬫満鍙风爜",
			position : ":last"
		},
		sso_username : {
			active : "4-16涓瓧绗︼紝涓嫳鏂囧潎鍙紝涓€涓腑鏂囦负2涓瓧绗︼紝鎺ㄨ崘浣跨敤涓枃鍚�",
			className : "reg_mtop",
			empty : "鐢ㄦ埛鍚嶄笉鑳戒负绌�",
			express : [{
				text : "鐢ㄦ埛鍚嶅湪4-16涓瓧绗﹀唴",
				func : function(){
					var text = $(this).val();
					var len = text.length + text.replace(/[^\u4e00-\u9fa5]+/g,"").length;
					return (len>=4 && len<=16);
				}
			},{
				text : "鍖呭惈闈炴硶瀛楃",
				func : function(){
					var text = $(this).val();
					var len = text.length + text.replace(/[^\u4e00-\u9fa5]+/g,"").length;
					return (/^[\_a-z0-9\u4e00-\u9fa5]+$/i.test(text) && (len>=4 && len<=16));
				}
			},{
				text : "涓嶈兘鍏ㄤ负鏁板瓧",
				func : function(){
					var text = $(this).val();
					return !/^[\d]+$/.test(text);
				}
			}]
		},
		sso_oldPassword : {
			active : "璇疯緭鍏ユ棫瀵嗙爜",
			empty : "鏃у瘑鐮佷笉鑳戒负绌�",
			express : [{
				text : "瀵嗙爜鍦�6-16涓瓧绗﹀唴",
				func : function(){
					var text = $(this).val();
					return (text.length>=6 && text.length<=16);
				}
			}]
		},
		sso_password : {
			active : "瀵嗙爜蹇呴』涓�8~16浣嶆暟瀛楀拰瀛楃缁勬垚",
			empty : "瀵嗙爜涓嶈兘涓虹┖",
			express : [{
				text : "瀵嗙爜蹇呴』涓�8-16浣嶆暟瀛楀拰瀛楃缁勬垚",
				func : function(){
					var This = $(this)
					var text = This.val();
					if (/^((?=.*[0-9])(?=.*[A-Za-z]))(?=.*[^A-Za-z0-9]).{8,16}$/.test(text)) {
						This.siblings('.pw-strength-box').addClass('pswState-strong').removeClass('pswState-middle pswState-weak');
						return true; //寮哄瘑鐮�
					}else if(/^((?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])).{8,16}$/.test(text)){
						This.siblings('.pw-strength-box').addClass('pswState-middle').removeClass('pswState-weak pswState-strong');
						return true; //涓瘑鐮�
					}else if(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/.test(text)){
						This.siblings('.pw-strength-box').addClass('pswState-weak').removeClass('pswState-middle pswState-strong');
						return true; //鑻ュ瘑鐮�
					};

					
				}
			}]
		},
		sso_againPassword : {
			active : "璇峰啀娆¤緭鍏ュ瘑鐮�",
			empty : "涓ゆ瀵嗙爜杈撳叆涓嶄竴鑷�",
			express : [{
				text : "涓ゆ瀵嗙爜杈撳叆涓嶄竴鑷�",
				func : function(){
					var pwd1 = $(this).val();
					var pwd2 = $("#sso_password").val();
					return pwd2==pwd1;
				}
			}]
		},
		sso_email : {
			active : "璇峰～鍐欏父鐢ㄧ殑Email鍦板潃",
			email : "璇疯緭鍏ユ湁鏁堢殑Email鍦板潃"
		},
		sso_email_b : {
			active : "璇峰～鍐欏父鐢ㄧ殑Email鍦板潃锛屼綔涓洪┐濡堝鐨勭櫥褰曡处鍙�",
			empty : "email鍦板潃涓嶈兘涓虹┖",
			email: "璇疯緭鍏ユ湁鏁堢殑Email鍦板潃",
			yahooEmail: "鎮ㄨ緭鍏ョ殑鐢靛瓙閭鍩熷悕涓嶈兘娉ㄥ唽鎴愬姛锛岃鏇存崲鍏跺畠閭"
		},
		sso_email_c : {
			active : "璇峰～鍐欏父鐢ㄧ殑Email鍦板潃",
			empty : "email鍦板潃涓嶈兘涓虹┖",
			email : "璇疯緭鍏ユ湁鏁堢殑Email鍦板潃"
		},
		sso_verifycode1 : {
			active : "璇疯緭鍏ラ獙璇佺爜",
			empty : "楠岃瘉鐮佷笉鑳戒负绌�",
			express : [{
				text : "楠岃瘉鐮佽緭鍏ラ敊璇�",
				func : function(){
					var len = this.value.length;
					var length = parseInt($(this).attr("length") || 4);
						//return len==length;
					if(len == 1 || len == 2 || len == 4) {
						return true;
					} else {
						return false;
					}
				}
			}],
			position : ":last"
		},
		sso_verifycode2 : {
			active : "璇疯緭鍏ョ煭淇℃牎楠岀爜",
			empty : "鐭俊鏍￠獙鐮佷笉鑳戒负绌�",
			position : ":last"
		},
		sso_verifycode3 : {
			active : "璇疯緭鍏ョ煭淇℃牎楠岀爜",
			empty : "鐭俊鏍￠獙鐮佷笉鑳戒负绌�",
			express : [{
				text : "鏍￠獙鐮佽緭鍏ラ敊璇�",
				func : function(){
					var len = this.value.length;
					var length = parseInt($(this).attr("length") || 6);
					return len==length;
				}
			}],
			position : ":last"
		},
		sso_verifycode4 : {
			active : "璇疯緭鍏ョ煭淇℃牎楠岀爜",
			empty : "鐭俊鏍￠獙鐮佷笉鑳戒负绌�",
			express : [{
				text : "鏍￠獙鐮佽緭鍏ラ敊璇�",
				func : function(){
					var len = this.value.length;
					var length = parseInt($(this).attr("length") || 6);
					return len==length;
				}
			}],
			position : ":last"
		},
		sso_verifycode5 : {
			active : "璇疯緭鍏ラ偖绠辨牎楠岀爜",
			empty : "閭鏍￠獙鐮佷笉鑳戒负绌�",
			express : [{
				text : "鏍￠獙鐮佽緭鍏ラ敊璇�",
				func : function(){
					var len = this.value.length;
					var length = parseInt($(this).attr("length") || 6);
					return len==length;
				}
			}],
			position : ":last"
		}
	};
	$("#sso_password").change(function(){
		var apwd = document.getElementById("sso_againPassword");
		if(this.value!="" && this.value == apwd.value){
			$(apwd).change();
		}
	});
	var tmpArr = [];
	for(var n in tmpdataobj){
		var elt = $("#"+n);
		elt.length>0 && tmpArr.push(elt);
	}
	var input_s = $("input.zhfs_form_input");
	tmpArr.sort(function(a,b){
		return input_s.index(a) > input_s.index(b);
	});
	var dataobj = {};
	for(var i=0;i<tmpArr.length;i++){
		dataobj[tmpArr[i].attr("id")] = tmpdataobj[tmpArr[i].attr("id")];
	}
	for(var n in dataobj){
		$("#"+n).val("").ui("validate",dataobj[n]);
	}

	//console.log();
	setTimeout(function(){
		var $inviteCode = $('#sso_inviteCode').attr('inviteCode')
		$('#sso_inviteCode').val($inviteCode)
	},1000)
	setTimeout(function(){
		var $mobileCode = $('#sso_mobile').attr('mobileValue')
		$('#sso_mobile').val($mobileCode)
	},1000)
	if($("#captialId").length>0 && $("#cityId").length>0){
		$("body").ui("selectArea",{
			province : "#captialId",
			city : "#cityId"
		});
	}
	
	$("#submitBtn").click(function(){
		if($(this).hasClass("btn-disabled")){
			return;
		}
		$.validate(dataobj,"",function(){
			window.validate_pass && window.validate_pass();
		});
	});
	var lihide = $("#emailRegForm li.hide");
	if(lihide.size()>0){
		$("#sso_email_b").one("click",function(){
			lihide.show();
		});
	}
	//椹村濡堟湇鍔℃潯娆�
	$("#lvmama_tk").click(function(){
		$(this).next().toggleClass("showBlock");
	});
});
!function(window){
	var ua = window.navigator.userAgent.toLowerCase(), 
	reg = /msie|applewebkit.+safari/;
	if(reg.test(ua)){
		var _sort = Array.prototype.sort;
		Array.prototype.sort = function(fn){
			if(!!fn && typeof fn === 'function'){
				if(this.length < 2) return this;
				var i = 0, j = i + 1, l = this.length, tmp, r = false, t = 0;
				for(;i < l;i++){
					for(j = i + 1;j < l;j++){
						t = fn.call(this, this[i], this[j]);
						r = (typeof t === 'number' ? t : 
						!!t ? 1 : 0) > 0 
						? true : false;
						if(r){
							tmp = this[i];
							this[i] = this[j];
							this[j] = tmp;
						}
					}
				}
				return this;
			}
			else{
				return _sort.call(this);
			}
		};
	}
}(window);
function refreshCheckCode(s){
    var elt = document.getElementById(s);
    elt.src = elt.src + "?_="+new Date().getTime();
}
var form_validate = true;

//甯愬彿瀵嗙爜鎻愮ず
		$('#sso_verifycode1').each(function(){
			if(!$(this).val()==''){ 
				$(this).siblings('p').hide().css({'background-image':'none'}); 
				}else{ 
				$(this).siblings('p').show(); 
				};
			$(this).focus(function(){
				$(this).siblings('p').hide();
			});
			$(this).blur(function(){
				if(!$(this).val()==''){
						$(this).siblings('p').hide();
					}else{
						$(this).siblings('p').show();
					};
			});
		});
		
		$(".dynamic").click(function(){
			$(this).prev().focus();
		});

$(function(){
	$('#sso_password').on('keyup',function(){
		if ($(this).val()=='') {
			$('.pw-strength-box').removeClass('pswState-weak pswState-middle pswState-strong');
		};
	});
	
});