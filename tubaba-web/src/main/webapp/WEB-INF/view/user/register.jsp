<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script id="_1540193150787_8581" src="https://fp.fraudmetrix.cn/fp/detect.json?partnerCode=lvmama&amp;OQQo0o=a90417e1-34be-42c3-ab34-87b8040f8222_19720659&amp;appName=lvmama_web&amp;paramz=https%3A%2F%2Flogin.lvmama.com%2Fnsso%2Fregister%2Fregistering.do%5E%5E-%5E%5E-%5E%5E-&amp;v=VtFBjjiyNLeO8yJxPpetPmAV2w6Qlm2UARhSEkXvxj2pYbzdn7Lda3d7AN%2B16SNk&amp;idf=1540193150402-17036575348&amp;w=DfBIcpspYwZCl6DIkS%2FKPtqi1wd~ij~xR2jMSSq8tQtHM96zoJCYy5~OfzqEdCu6fDlRax97sP0%2FDi2Bsy1ZPQbT9DBJNN9H&amp;ct=JrXAd3qQtHe%3D&amp;_callback=_1540193150787_8581&amp;h=a4ba386bd85dc21d50927694202501e6"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title>兔爸爸注册</title>
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
<link rel="stylesheet" href="css/header-air.css">
<link rel="stylesheet" href="css/register_new.css">
<!-- <link rel="shortcut icon" href="/nsso/favicon.ico" type="image/x-icon">
<link rel="icon" href="/nsso/favicon.ico" type="image/x-icon"> -->
<link rel="stylesheet" href="css/jquery.common.css">
<link rel="stylesheet" href="css/style_https.3.2.0.css">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/user/register.js"></script>
</head>
<body>
<!-- 最大的div -->
	<div id="login_main" class="login_main">
	<!-- 头部图片 -->
		<div class="login_top zhfs_logo_top">
		
			<span class="login_logo"> <a href="http://www.lvmama.com"><img
					src="//pics.lvjs.com.cn/img/new_v/ob_login/login_logo.jpg"></a> <label
				class="text">|</label> <a class="text">免费注册</a>
			</span> <span class="login_hotline">1010-6060</span>
		</div>
		<!-- 中间部分 -->
		<div class="register_center">
			<div class="w_overflow" id="w_overflow">
				<div class="w_max" id="w_max">
					<div class="fl" id="sj_div">
						<div class="reg_sjyx_allStep">
							<div class="register_stepWidth" id="register_stepWidth">
							<!-- 注册头部的图片 -->
								<div class="regist-top-ad"></div>
								<!-- 注册的from表单 -->
								<form action="registerUser" id="sjRegForm" method="post">
									<ul style="" class="register_form register_sj_form">
										<li><label class="vcsmm_form_col">
										<i class="red">*</i>
											您的手机号 : </label>
										<input type="text" class="zhfs_form_input" id="sso_mobile" name="mobile" mobilevalue=""
											placeholder="请输入手机号码">
											<label class="success" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
											</li>
											
										<!--是否显示图形验证码 -->
										<li><label class="vcsmm_form_col"><i class="red">*</i>图形验证码
												: </label> <input type="text" class="zhfs_form_input zhfs_w99"
											id="sso_verifycode1" style="margin-left: -6px"
											name="verifycode" placeholder="请输入验证码"> <img
											id="image" src="code"
											width="100" height="32"> <a href="#"
											class="link_blue mar10"
											onclick="refreshCheckCode('image');return false;">换一张</a>
											<label class="success" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
										</li>
										<!-- 验证码 -->
										<li><label class="vcsmm_form_col"><i class="red">*</i>手机验证码
												: </label><input type="text" class="zhfs_form_input zhfs_w99"
											id="sso_verifycode2" name="authenticationCode">
											<input type="button" value="获取动态验证码"  class="code fr" onclick="checkCode()" id="codefr">
											<label class="error" style="display:none;">验证码错误</label></li>
										<li>
										<label class="vcsmm_form_col">
										<i class="red">*</i> 设置密码 : 
										</label>
										<input type="password" class="zhfs_form_input" id="sso_password" 
										name="password" placeholder="输入8~16位密码，由数字字母组成">
                                        <div class="pw-strength-box ">
                                            <span class="s1">弱</span><span class="s2">中</span><span class="s3">强</span>
                                        </div>
                                        <label class="success" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									</li>
										<li><label class="vcsmm_form_col"><i class="red">*</i>
												确认密码 : </label><input type="password" class="zhfs_form_input"
											id="sso_againPassword" name="againPassword"
											placeholder="请再次输入密码">
											<label class="success" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></li>
										<li><label class="csmm_form_col w90"> </label><input
											type="checkbox" class="gray_ipt" checked="" id="terms">我已阅读并接受<a
											class="link_blue" href="javascript:void(0)"
											onclick="agreement('http://login.lvmama.com/nsso/register/agreement.do')">《兔爸爸旅游网会员服务条款》</a>
											<label class="error" id="termsError" style="display:none;margin-left:106px;">请阅读《兔爸爸旅游网会员服务条款》</label>
											<div id="terms_xx"></div></li>
										<div id="popup-captcha" style="display: block">
											<div class="gt_input">
												<input class="geetest_challenge" type="hidden"
													name="geetest_challenge" value=""><input
													class="geetest_validate" type="hidden"
													name="geetest_validate" value=""><input
													class="geetest_seccode" type="hidden"
													name="geetest_seccode" value="">
											</div>
										</div>
										<!-- <input class="btn" id="origin_popup-submit" type="hidden"
											value="提交" style="display: none;"/>
										<input class="btn" id="popup-submit" type="hidden" value="提交"/> -->
										<li><label class="csmm_form_col w90"></label><a
											href="javascript:void(0)" class="register_submit"
											id="submitBtn">同意服务条款并注册</a></li>
										<li class="gray_wz"><label class="csmm_form_col w90">
										</label>已有账号，<a href="login" class="link_blue">直接登录&gt;&nbsp;</a></li>
									</ul>
								</form>
								<!-- 注册的from表单结束 -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="reg_clear"></div>
		</div>
	</div>
	<div id="userdata_el" style="visibility: hidden; position: absolute;"></div>
</body>
</html>