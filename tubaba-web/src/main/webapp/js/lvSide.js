var c = 60;
function settime() { //发送验证码倒计时
	var obj = $($('.lv_side_btn_code')[0]);
	if (c == 0) {
		alert(123);
		obj.attr('disabled', false);
		obj.html("获取动态密码");
		c = 60;
		return;
	} else {
		obj.attr('disabled', true);
		obj.html("重新发送(" + c + ")");
		c--;
	}
	setTimeout('settime()', 1000);
}
$(function() {
	var $document = $(document);
	//复选框
	$document.on('change', '.login_checkbox input', function(e) {
		var $this = $(this),
			$parent = $this.parent(),
			checked = $this.attr('checked');
		//$('.login_checked').length > 0
		if (checked) {
			$parent.addClass('login_checked');
		} else {
			$parent.removeClass('login_checked');
		}
		;

	});

	//切换登录类型
	$document.on('click', '.lv_side_login_tab dd', function(e) {
		var num = $(this).index();
		$(this).addClass('active').siblings().removeClass('active');
		$('.lv_side_logintype').eq(num)
			.show().siblings('.lv_side_logintype').hide();
	});

	//显示内容
	$document.on('mouseover', '.lv_side_nav li', function(e) {
		var num = $(this).index();
		if ($(this).attr('id') == 'side_login') {
			$('.lv_side_login_box').show();
		} else {
			$('.lv_side_login_box').hide();
		}
		;
	});

	//返回顶部
	$document.on('click', '.lv_side_top', function(e) {
		$('body,html').animate({
			'scrollTop' : 0
		}, 300);
	});

	//调用
	lvLogin.init();

});

var lvLogin = {
	//初始化
	init : function() {
		var self = this;
		//创建侧边栏
		$('body').append(self.createDom());

		//检测登录状态
		$.ajax({
			url : 'isLogin',
			type : 'GET',
			success:function(req) {
			//请求成功，并且反馈成功状态
			if (req == 'success') {
				console.log('登录成功，欢迎来到驴妈妈！');
			} else {
				//未登录创建登录模块
				$('.lv_side').append(self.loginDom());
				//隐藏我的驴妈妈
				$('#side_login').html('<i class="lv_side_icon side_icon_my"></i>');

				//未登录状态，执行组件
				//事件
				self.event();

				//设置显示的登录类型
				self.set();

				//普通登录功能
				$("#subminlogin").click(function() {
					var name = $("#login_user_username").val();
					var pass = $("#login_user_pass").val();
					var str = "";
					if (name.trim() == '') {
						str = '请输入邮箱/手机号/用户名';
						$("#login_user_tip").addClass("login_error")
							.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>');
					} else if (pass.trim() == '') {
						str = '请输入密码';
						$("#login_user_tip").addClass("login_error")
							.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>');
					} else {
						$("#login_user_tip").addClass("login_error")
							.html('');
						$.ajax({
							url : 'userLoginAjax',
							type : 'post',
							data : {
								username : name,
								userpass : pass
							},
							success : function(data) {
								if (data == 'success') {
									$('#side_login').html('<a href="http://www.lvmama.com/myspace/index.do" target="_blank">'
										+ ' 				<p>我的兔爸爸</p><i class="lv_side_icon side_icon_my"></i>'
										+ ' 			</a>');
									$('.lv_side_login_box').remove();
									location.reload();
								} else {
									str = '用户名或密码错误';
									$("#login_user_tip").addClass("login_error")
										.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>');
									$("#login_user_pass").val('');
									$("#login_user_pass").focus();
								}
							}
						});
					}
				}),
				//手机登录功能
				$("#iphonelogin").click(function() {
					var iphone = $("#login_mobile").val();
					var yzm = $("#login_mobile_code").val();
					var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
					var str = "";
					if (iphone.trim() == '') {
						str = '请输入手机号';
						$("#login_mobile_tip").addClass("login_error")
							.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>');
					} else if (!reg.test(iphone)) {
						str = '请输入正确手机号';
						$("#login_mobile_tip").addClass("login_error")
							.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>');
					} else if (yzm.trim() == '') {
						str = '请输入动态密码';
						$("#login_mobile_tip").addClass("login_error")
							.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>');
					} else {
						$("#login_mobile_tip").addClass("login_error")
							.html('');
						$.ajax({
							url : 'userIphoneAjax',
							type : 'post',
							data : {
								iphone : iphone,
								yzm : yzm
							},
							success : function(data) {
								if (data.msg == 'success') {
									$('#side_login').html('<a href="http://www.lvmama.com/myspace/index.do" target="_blank">'
										+ ' 				<p>我的兔爸爸</p><i class="lv_side_icon side_icon_my"></i>'
										+ ' 			</a>');
									$('.lv_side_login_box').remove();
									location.reload();
								} else if (data.msg == 'error') {
									str = '登录失败';
									$("#login_mobile_tip").addClass("login_error")
										.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>');
								} else if (data.msg == 'yzmerror') {
									str = '动态密码错误';
									$("#login_mobile_tip").addClass("login_error")
										.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>')
								}
							}
						});
					}
				});
				//短信功能
				$(".lv_side_btn_code").click(function() {
					var str = "";
					var iphone = $("#login_mobile").val();
					var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
					if (iphone == '') {
						str = '请输入手机号';
						$("#login_mobile_tip").addClass("login_error")
							.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>');
					} else if (!reg.test(iphone)) {
						str = '请输入正确手机号';
						$("#login_mobile_tip").addClass("login_error")
							.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>');
					} else {
						var flag = false;
						$.ajax({
							url : 'send_code',
							type : 'get',
							async : false,
							data : 'phone=' + iphone,
							success : function(result) {
								if (result.trim() == 'true') {
									str = '验证码已发送至您的手机,请注意查收！';
									$("#login_mobile_tip").addClass("login_error")
										.html('<i class="lv_side_icon"></i>' + str + '</div>');
									flag = true;

								} else {
									str = '验证码发送失败！';
									$("#login_mobile_tip").addClass("login_error")
										.html('<i class="lv_side_icon side_icon_error"></i>' + str + '</div>');
								}
							}
						})
						if (flag == false) {
							return;
						}
						settime();
					}
				});

			}
		}
		});
	},
	event : function() {
		var self = this;
		var $document = $(document);

		//隐藏登录
		$(document).on('click', function(e) {
			$('.lv_side_login_box').hide();
		});

		//冒泡
		$(document).on('click', '.lv_side_login_box', function(e) {
			e.stopPropagation();
		});

	},
	//创建结构
	createDom : function() {
		var sideHtml = '<div class="lv_side" id="lv_side">'
			+ ' 	<ul class="lv_side_nav">'
			+ ' 		<li id="side_login">'
			+ ' 			<a href="http://www.lvmama.com/myspace/index.do" target="_blank">'
			+ ' 				<p>我的驴妈妈</p><i class="lv_side_icon side_icon_my"></i>'
			+ ' 			</a>'
			+ ' 		</li>'
			+ ' 		<li>'
			+ ' 			<a href="http://www.ctcnn.com/Research/pc_L.htm" target="_blank">'
			+ ' 				<p>有奖问卷</p><i class="lv_side_icon side_icon_questionnaire"></i>'
			+ ' 			</a>'
			+ ' 		</li>'
			+ ' 		<li>'
			+ ' 			<a href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" target="_blank">'
			+ ' 				<p>意见反馈</p><i class="lv_side_icon side_icon_feedback"></i>'
			+ ' 			</a>'
			+ ' 		</li>'
			+ ' 		<li class="lv_side_top">'
			+ ' 			<p>返回顶部</p><i class="lv_side_icon side_icon_top"></i>'
			+ ' 		</li>'
			+ ' 	</ul>'
			+ ' </div>';
		return sideHtml;
	},
	loginDom : function() {
		//登录模块
		var loginHtml = '<div class="lv_side_login_box">'
			+ ' 		<dl class="lv_side_login_tab">'
			+ ' 			<dd class="active">普通登录</dd>'
			+ ' 			<dd>手机动态密码登录</dd>'
			+ ' 		</dl>'
			+ ' '
			+ ' 		<!-- 普通登录 -->'
			+ ' 		<div class="lv_side_logintype" style="display:block;">'
			+ ' 			<div class="lv_side_login_tip" id="login_user_tip"></div>'
			+ ' 			<ul class="lv_side_login_list">'
			+ ' 				<li><input class="login_input" id="login_user_username" type="text" placeholder="邮箱／手机号／用户名／会员卡" ><i class="lv_side_icon side_icon_name"></i></li>'
			+ ' 				<li><input class="login_input" id="login_user_pass" type="password" placeholder="请输入密码"><i class="lv_side_icon side_icon_pass"></i></li>'
			+ ' 			</ul>'
			+ ' '
			+ ' 			<!-- <div class="lv_side_check lv_side_remember_pass"><a href="retrieve">忘记密码？</a><label><span class="login_checkbox lv_side_icon "><input type="checkbox"></span>记住密码30天</label></div> -->'
			+ ' '
			+ ' 			<a class="lv_side_btn_login js_user_login" id="subminlogin">登 录</a>'
			+ ' 			<!-- 普通登录，滑动验证模块 -->'
			+ ' 			<div class="embed_captcha" id="user_embed_captcha"></div>'
			+ ' '
			+ ' 			<p class="lv_side_register_tip">还不是驴妈妈会员？<a href="register">免费注册,送180元新手礼包</a></p>'
			+ ' 		</div>'
			+ ' '
			+ ' 		<!-- 手机登录 -->'
			+ ' 		<div class="lv_side_logintype">'
			+ ' 			<!-- 登录提示 -->'
			+ ' 			<div class="lv_side_login_tip" id="login_mobile_tip"></div>'
			+ ' '
			+ ' 			<ul class="lv_side_login_list">'
			+ ' 				<li><input class="login_input" id="login_mobile" type="text" maxlength="11" placeholder="手机号"><i class="lv_side_icon side_icon_mobile"></i></li>'
			+ ' 				<li><input class="login_input login_input_min" id="login_mobile_code" type="text" placeholder="请输入动态密码"><span class="lv_side_btn_code">获取动态密码</span></li>'
			+ ' 			</ul>'
			+ ' '
			+ ' 			<a class="lv_side_btn_login js_mobile_login" id="iphonelogin">登 录</a>'
			+ ' 			'
			+ ' 			<div class="lv_side_check lv_side_contract">'
			+ ' 				<label><span class="login_checkbox lv_side_icon login_checked"><input class="js_contract_checked" type="checkbox" checked=""></span>我已阅读并接受</label>'
			+ ' 				<a href="http://login.lvmama.com/nsso/register/agreement.do" target="_blank">《驴妈妈旅游网会员服务条款》</a>'
			+ ' 			</div>'
			+ ' 			<p class="lv_side_tip">快捷注册:可使用手机快捷登录功能，通过动态密码完成快捷注册并登录。</p>'
			+ ' 		</div>'
			+ ' 	'
			+ ' '
			+ ' '
			+ ' 	'
			+ ' 	</div>';
		return loginHtml;
	},
	show : function(arr) {
		this.options.set = arr;
	},
	options : {
		jumpUrl : '',
		userName : '',
		callback : null,
		set : [ 1, 1, 0 ]
	},
	set : function() {
		var arr = this.options.set;
		var active = true;
		for (var i = 0; i < arr.length; i++) {
			var siShow = arr[i];
			var $dd = $('.lv_side_login_tab').find('dd').eq(i);
			if (siShow > 0) {
				$dd.show();
				if (active) {
					active = false;
					$dd.addClass('active');
					$('.lv_side_logintype').eq(i).show().siblings('.lv_side_logintype').hide();
				}
				;

			} else {
				$dd.hide();
			}
			;
		}
		;
	}
};