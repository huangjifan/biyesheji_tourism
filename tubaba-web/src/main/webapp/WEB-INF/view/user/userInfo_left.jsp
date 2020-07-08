<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="newmember_leftside">
	<dl>
		<dt id="grzx1"  onclick="grzx(1)"><i class="safe_icon" ></i>账户安全<i id="down1" class="downarr"></i></dt>
		<dd>
			<a href="securitySettings" id="lvnav_safeset">安全设置</a>
			<a href="loginPass_update" id="lvnav_passwd">修改登录密码</a>
			<a href="userLogout" id="lvnav_logout">注销用户</a>
		</dd>
	</dl>
	<dl>
		<dt id="grzx2"  onclick="grzx(2)"><i class="per_icon"></i>个人资料<i id="down2" class="downarr"></i></dt>
		<dd><a href="Personal_information" id="lvnav_perinfo">个人信息</a></dd>
		<dd><a href="headSet" id="lvnav_photoinfo">头像设置</a></dd>
	</dl>
</div> 
</body>
</html>