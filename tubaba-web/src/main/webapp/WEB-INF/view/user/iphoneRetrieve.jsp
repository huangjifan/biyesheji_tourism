<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>短信找回页面</title>
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
<link rel="stylesheet" href="css/header-air.css"/>
<link rel="stylesheet" href="css/register_new.css"/>

<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/user/iphoneRetrieve.js"></script>
</head>
<body class="regist_body">
<div id="login_main" class="login_main">
    <div class="login_top zhfs_logo_top">
			<span class="login_logo">
				<a href="#"><img src="image/login_logo.jpg"></a> <label class="text">|</label> <a class="text">重置密码</a>
			</span>
        <span class="login_hotline">1010-6060</span>
    </div>

    <div class="register_center">

            <div class="w_max" id="w_max">
                <div class="fl" id="sj_div">
                    <div class="register_stepWidth" id="register_stepWidth">
                        <form action="phoneUpdatePassword" id="sjRegForm" method="post">
                            <input type="hidden" name="_method" value="put"/>
                            <ul class="register_form register_sj_form reset-box">
                                <li><label class="vcsmm_form_col "><i class="red">*</i>您的手机号：</label><input type="text" class="zhfs_form_input" id="sso_mobile" name="mobile" mobileValue="" placeholder="请输入手机号码">
                                	<label class="success" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                </li>
                                <li><label class="vcsmm_form_col "><i class="red">*</i>图形验证码：</label><input type="text" class="zhfs_form_input zhfs_w99" id="sso_verifycode1" name="verifycode" placeholder="请输入验证码"><img  id="image_code" src="
                                code" width="100" height="36"><a href="#" class="link_blue mar10" id="image" onClick="refreshCheckCode('image');return false;">换一张</a>
                                <label class="success" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                </li>
                                <li>
                                    <label class="vcsmm_form_col"><i class="red">*</i>手机验证码：</label><input type="text" class="zhfs_form_input zhfs_w99" id="sso_verifycode2" name="authenticationCode">
                                    <input type="button" value="获取动态验证码" class="code fr" onclick="checkCode()" id="codefr">
                                	<label class="error" style="display:none;">验证码错误</label>
                                </li>
                                <li><label class="vcsmm_form_col "><i class="red">*</i>设置密码：</label><input type="password" class="zhfs_form_input" id="sso_password" name="password" placeholder="输入8~16位密码，由数字字母组成">
                                    <div class="pw-strength-box">
                                        <span class="s1">弱</span><span class="s2">中</span><span class="s3">强</span>
                                    </div>
									<label class="success" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                </li>
                                <li><label class="vcsmm_form_col "><i class="red">*</i>确认密码：</label><input type="password" class="zhfs_form_input" id="sso_againPassword" name="againPassword" placeholder="请再次输入密码">
                                	<label class="success" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                </li>
                                <li ><label class="csmm_form_col w90"></label><a href="#" class="register_submit" id="iphoneSubmitBtn">提交</a></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
         <div class="reg_clear"></div>
    </div>
</div>
<!-- <script src="js/index.php.js"></script>
<script type="text/javascript" src="js/register.validate.js"></script>
<script src="js/eluminate.js"></script>
<script src="js/coremetrics-initalize.js"></script> -->
</body>
</html>