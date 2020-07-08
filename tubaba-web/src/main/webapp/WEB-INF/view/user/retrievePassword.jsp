<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码页面</title>
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
<link href="css/delv_css.css" rel="stylesheet" type="text/css" />
<link href="css/header.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="css/index.php.css"/>
<link rel="stylesheet" href="css/l_login.css"/>
<script src="js/eluminate.js"></script>
<script src="js/coremetrics-initalize.js"></script>
<link rel="stylesheet" href="css/header-air.css"/>
<link rel="stylesheet" href="css/register_new.css"/>
<script type="text/javascript">
	function email(){
		location.href="email";
	}
	function iphone(){
		location.href="iphone";
	}
</script>
</head>
<body>
<div id="login_main" class="login_main">
    <div class="login_top zhfs_logo_top">
		<span class="login_logo">
				<a href="#"><img src="image/login_logo.jpg"></a> <label class="text">|</label> <a class="text">重置密码</a>
		</span>
        <span class="login_hotline">1010-6060</span>
    </div>
    <div class="register_center">
        <ul class="re-password-box clearfix">
            <li onclick="email()">
                <i class="re-password-icon mail-icon"><img src="image/email.PNG"></i>
                <p class="hd">邮箱找回密码</p>
                <span class="tip">邮箱发送邮件找回密码</span>
            </li>
            <li onclick="iphone()">
                <i class="re-password-icon tel-icon"><img alt="" src="image/phone.PNG"></i>
                <p class="hd">手机找回密码</p>
                <span class="tip">手机发送短信找回密码</span>
            </li>
        </ul>
    </div>
</div>
<!-- 尾部 -->
<script src="js/footer.js"></script>
<script src="js/losc.js" language="javascript"></script>
<script>
    cmCreatePageviewTag("选择找回密码方式", "F0001", null, null,"-_--_--_--_--_-其他页面");
</script>
</body>
</html>