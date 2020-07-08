<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<title>兔爸爸登录</title>
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/l_login.css">
	<link rel="stylesheet" href="css/global.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/dialogalert.css">
	
	<style type="text/css">
		.app_right{background: none;}
	</style>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/user/userLogin.js"></script>
<script type="text/javascript" src="js/user/dialog.js"></script>
</head>
<body style="margin:0 auto;width:400px;">
<div class="user-box" style="margin-left:100px;margin-top:100px;width:400px;">
        	<ul class="tab clearfix">
            	<li class="left" id="pt" onclick="putong()">普通登录</li>
                <li class="right active" id="sj" onclick="shouji()">手机动态密码登录</li>
            </ul>
            <!-- 普通登录-->
            <div class="content" style="display:block;width:400px" id="putong">
            	<ul class="ipt-box clearfix">
            	<!-- 提交的from表单 -->
            		<form method="post" id="putongSubmit" action="userLoginPost">
	            		<li id="aaa">
	                    	<input type="text" value="" style="margin-bottom:6px;" class="user-ipt" name="username" id="username">
	                       <p id="userNameTips" class="name">邮箱/手机号/用户名/会员卡</p>
	                    </li>
	                	<li class="pswd" id="bbb">
	                    	<input type="password" value="" style="margin-bottom:6px;" class="user-ipt" name="userpass" id="userpass">
	                        <p id="passwdTips" class="passwd">请输入密码</p>
	                     </li>
                        
						 <li id="_captcha" style="display: none;">
							<a class="fr" href="javasrcipt:;"><img id="image" src="/captcha/account/checkcode/login_web.htm" width="104" height="40" onclick="refreshImageCaptcha('image');return false;"></a>
                        
							<span>
								<input value="" name="verifycode" id="verifycode" class="user-ipt width">
								<p class="dynamic">请填写计算结果或验证码</p>
								<!-- 报错-->
							<div class="validateErrorTip " id="errorCodeDiv">
								<div class="validate-error-arrowR"><em>◆</em><i>◆</i></div>
								<div class="validateContent" id="errorCode">请输入验证码或计算结果</div>
							</div>
							<!-- 报错结束-->
							</span>
						 </li>
	                    <li class="forget_pw clearfix"><span class="check-box fl">
	                    </span>
	                    </li>
	                    <li id="_loginButton" class="last">
	                    	<input type=submit value="登 录" class="loing-btn" id="loginButton" >
	                    </li>
	            	</form>
                </ul>
                <p class="lv-member">还不是兔爸爸会员？<a href="register" class="link">免费注册,送180元新手礼包</a></p>
            	<div class="errorinfo">${error }</div>
            <!-- 合作网站账号登录结束-->
            </div>
            <!-- 普通登录结束-->
            <!-- 手机验证登录-->
            <div class="content" id="shouji" style="display:none">
            	<ul class="ipt-box clearfix">
            		<form id="mobileLoginSumbit" action="userShoujiLogin" method="post" name="mobileLogin_form">
	            		<li id="ccc">
	                    	<input type="text" style="margin-bottom:6px;" class="user-ipt" value="" name="iphone" id="mobileLoginText">
	                    	<p class="name" id="sjts">手机号</p>
	                    	<!-- 报错结束-->
	                    </li>
	                	<li class="clearfix" id="clearfix">
	                    	<span class="fl">
	                        	<input type="text" style="margin-bottom:6px;" name="yzm" id="mobileCode" class="user-ipt width" />
	                    		<p class="dynamic" id="dtcode">请输入动态密码</p>
	                    	<!-- 报错结束-->
	                    	<input type="button" value="获取动态验证码" class="code fr" onclick="checkCode()" id="codefr"><br />
	                    	
	                    	
	                    	</span>
	                        
	                    </li>
	                    <li id="_loginMobileButton" class="last">
	                    	<input type="submit" class="loing-btn" onclick="return pact()" value="登 录">
	                    </li>
					</form>
				</ul>
				<span style="font-size:13px" class="check-box fl">
				<input id="remPassWord" checked="checked" type="checkbox" class="check">我已阅读并接受
				</span>
				<a style="font-size:13px" class="link">《兔爸爸旅游网会员服务条款》</a>
				<p class="lv-member">快捷注册:可使用手机快捷登录功能，通过动态密码完成快捷注册并登录。</p>
				<%-- <div style='color:"red"'>${shoujierror }</div> --%>
            <!-- 合作网站账号登录结束-->
			</div>
			<!-- 手机验证登录结束-->
        </div>
</body>
</html> 