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
		#shoujierror{
			color:red;
		}
	</style>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/user/userLogin.js"></script>
<script type="text/javascript" src="js/user/dialog.js"></script>
</head>
<body>
 <%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
%>
<!-- 头部-->
<div class="login_top">
			<h1 class="lv_logo"><a href="#">兔爸爸旅游网</a></h1>
            <h2 class="lv_logo_keywords">登录中心</h2>
			<span class="login_hotline">1010-6060</span>
		</div>
<!-- 头部结束-->

<!-- 主体-->
<div class="login-wrap" style="overflow: visible;">
	<div class="login-box clearfix">
    	<div class="user-box">
        	<ul class="tab clearfix">
            	<li class="left" id="pt" onclick="putong()">普通登录</li>
                <li class="right active" id="sj" onclick="shouji()">手机动态密码登录</li>
            </ul>
            <!-- 普通登录-->
            <div class="content" style="display:block" id="putong">
            	<ul class="ipt-box clearfix">
            	<!-- 提交的from表单 -->
            		<form method="post" id="putongSubmit" action="userLoginPost">
	            		<li id="aaa">
	                    	<input type="text" value="" style="margin-bottom:6px;" class="user-ipt" name="username" id="username" placeholder="邮箱/手机号/用户名">
	                    </li>
	                	<li class="pswd" id="bbb">
	                    	<input type="password" value="" style="margin-bottom:6px;" class="user-ipt" name="userpass" id="userpass" placeholder="请输入密码">
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
	                    <a href="retrieve" class="link fr">忘记密码？</a></li>
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
	                    	<input type="text" style="margin-bottom:6px;" class="user-ipt" value="" name="iphone" id="mobileLoginText" placeholder="手机号">
	                    	<!-- 报错结束-->
	                    </li>
	                	<li class="clearfix" id="clearfix">
	                    	<span class="fl">
	                        	<input type="text" style="margin-bottom:6px;" name="yzm" id="mobileCode" class="user-ipt width" placeholder="请输入动态密码"/>
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
				<div id="shoujierror">${shoujierror }</div>
            <!-- 合作网站账号登录结束-->
			</div>
			<!-- 手机验证登录结束-->
        </div>
	</div>
	<!--新的广告页-->
	<ul class="login-main-box" style="display:block">
		<li><img src="image/loginbody.jpg"></li>
	</ul>
</div>
<!-- 主体结束-->
<!-- 公共底部  -->
<!-- footer\ -->
<div class="wrap" style="clear: both;">
<a class="public_ft" href="" target="_blank">
<ul class="public_ft_list"><li><i class="ft_ioc1"></i>
<strong>价格保证</strong>同类产品，保证低价</li><li><i class="ft_ioc2">
</i><strong>退订保障</strong>因特殊情况影响出行，保证退订</li><li>
<i class="ft_ioc3"></i><strong>救援保障</strong>旅途中遇意外情况，保证援助</li>
<li><i class="ft_ioc4"></i><strong>7x24小时服务</strong>快速响应，全年无休</li>
</ul></a></div>
<!-- copyright\ -->
<div class="lv-footer clearfix wrap" style="margin:0 auto;">   
 <p class="footer-link">      
  <a href="http://www.lvmama.com/public/about_lvmama" rel="nofollow">关于我们</a> |
 <a href="http://www.lvmama.com/public/lianxi_us" rel="nofollow">联系我们</a> | 
 <a href="http://www.lvmama.com/public/site_map">网站地图</a> |
 <a href="http://hotels.lvmama.com/brand/">酒店品牌</a> | 
<a href="http://hotels.lvmama.com/area/">酒店查询</a> | 
<a href="http://www.lvmama.com/public/help" rel="nofollow">帮助中心</a> |
<a href="http://www.lvmama.com/public/links">友情链接</a> | 
<a href="http://www.lvmama.com/public/jobs" rel="nofollow">诚聘英才</a> |
<a href="http://www.lvmama.com/public/zizhi_lvmama" rel="nofollow">旅游度假资质</a> |
<a href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" rel="nofollow">意见反馈</a> |
<a rel="nofollow" href="http://www.lvmama.com/public/adwy">广告业务</a>
</p>
<p class="lv-copyright">Copyright © 2018 www.lvmama.com. 上海景域文化传播股份有限公司版权所有
<a href="http://www.miitbeian.gov.cn" target="_blank" rel="nofollow">沪ICP备13011172号-3</a>
增值电信业务经营许可证编号：<a rel="nofollow" href="http://pic.lvmama.com/img/ICP.jpg" target="_blank">
沪B2-20100030</a></p>
<div class="lv-safety">
<a class="safety2" target="_blank" rel="nofollow" title="经营性网站备案信息" href="http://www.miibeian.gov.cn/"></a>
<a class="safety3" target="_blank" rel="nofollow" title="网络110报警服务" href="http://www.cyberpolice.cn"></a>
<a class="safety4" target="_blank" rel="nofollow" title="支付宝特约商家"></a>
<a class="safety5" target="_blank" rel="nofollow" title="AAA级信用企业" href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1664396140"></a>
<a class="safety6" target="_blank" rel="nofollow" title="上海工商" href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110930103539539"></a>
<a class="safety7" target="_blank" rel="nofollow" title="可信网站" href="https://ss.knet.cn/verifyseal.dll?sn=2010101800100002662&amp;comefrom=trust&amp;trustKey=dn&amp;trustValue=www.lvmama.com"></a>
<a class="safety8" target="_blank" rel="nofollow" title="诚信认证示范企业" href="https://credit.szfw.org/CX20160614015657160455.html" id="___szfw_logo___" hidefocus="false"></a>
<a class="safety9" target="_blank" rel="nofollow" title="网络社会征信网" href="http://www.zx110.org"></a>
<a class="safety10" target="_blank" rel="nofollow" title="360网站安全检测" href="http://webscan.360.cn"></a>
<a class="safety11" target="_blank" rel="nofollow" title="网监安全" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010702001030"></a>
<a class="safety13" target="_blank" rel="nofollow" title="举报中心" href="http://www.shjbzx.cn/"></a>
</div>
</div>
<!-- //footer -->

<div class="complete_box" style="display:none"><ul class="complete_list"></ul></div><div class="complete_box_hotel hotelDestBox" style="display:none"></div><div class="complete_box_hotel hotelKeywordBox" style="display:none"></div><div class="complete_error_tips" style="display:none;"><span>找不到目的地：</span><span class="word"></span><i>×</i></div><div id="right-bottom-tools"><a id="goTopBtn" target="_self" href="javascript:;" title="返回顶部"></a><a href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" target="_blank" id="Feedback" title="意见反馈"></a></div><div id="userdata_el" style="visibility: hidden; position: absolute;"></div></body>
</html>