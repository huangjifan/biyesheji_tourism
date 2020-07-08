<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的个人中心顶部公共页面</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcommon.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/buttons.css" >
<!--点评css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comform_v2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tags.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_new.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dialog.css">
<link href="${pageContext.request.contextPath}/css/header-air.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/ui-lvmama.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/ui-components.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/ui-componentsTwo.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/lv-bought.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/global_pop.css">
<link href="${pageContext.request.contextPath}/css/ui-components.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lv-user-mytrip.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tip.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/integral.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/newmember.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dialog2.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user/indexdo.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user/mySpaceTop.js"></script>
<style type="text/css">
	.one{
		display: none;
	}
</style>
</head>
<body  class="lv_newhome">
<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires",0);
%>
<!-- 会员中心顶部导航栏 -->
<div id="wrap" class="ui-container lvmama-bg">
<!-- 无搜索版，公共头部开始  -->
<div class="lv_topbar js_box">
    <div class="topbar_box">
    	<div class="lv_city_box">
        	<div class="lv_city_up">
            </div>
            <div class="lv_city_down Js_LISTFIRST">
                <!-- 开始 -->
					<p class="my_city_t">可选城市列表</p>
				        
				<!-- 结束 -->
            </div>
       </div>

        <ul class="top_link">
        	 <li class="dropdown">
            	<a class="lv_link" href="${pageContext.request.contextPath}/indexdo" rel="nofollow">我的驴妈妈<i class="icon_arrow"></i></a>
                <div class="top_down pd_0">
                    <a href="myOrder" rel="nofollow">我的订单</a>
				<a href="myGrowUp/0" rel="nofollow">我的优惠券</a>
                </div>
            </li>
            <li class="border_l dropdown">
                <a class="lv_link lv_link_wx" href="" rel="nofollow"><i class="lv_icon icon_wx"></i></a>
            </li>
            <li class="dropdown">
                <a class="lv_link lv_link_xcx" href="" rel="nofollow"><i class="lv_icon icon_xcx"></i></a>
                <div class="top_down">
                    <img src="" width="206" height="92" alt="">
                </div>
            </li>
                <li><a class="lv_link lv_link_wb" onclick="_gaq.push(['_trackEvent', 'weibo', 'click', 'weiboshouye', 5]);" href="http://e.weibo.com/lvmamas" target="_blank" rel="nofollow"><i class="lv_icon icon_wb"></i></a></li>

            <li>
            	<a class="lv_link"  target="_blank" href="" rel="nofollow"><i class="lv_icon icon_mobile"></i>手机版</a>
            </li>
            <li class="border_l dropdown link_call">
                <a rel="nofollow" href="" class="lv_link"><i class="lv_icon icon_phone"></i>国内：<span id="onlyOne"><span>1010-6060</span></span> <i class="icon_arrow"></i></a>
                <div class="top_down">
                    <span class="lv_icon"></span>
                    <p class="phone-num"><em>国内：</em><i id="onlyTwo">1010-6060</i></p>
                    <p class="phone-num-abroad"><em>海外：</em>+86-21-6180-0981</p>
                </div>
            </li>
        </ul>
        <div id="J_login" class="topbar_login">
            <c:choose>
				<c:when test="${user != null}">
					<span class="vip_name">
						<a href="${pageContext.request.contextPath}/indexdo">${user}</a>
						<input type="hidden" value="${userid }" id="userid">
					</span>
					<a href="" class="lv_link lv_link2"><i class="lv_icon icon_xx"></i>消息</a>
					<a class="lv_link lv_link2" rel="nofollow"
						href="${pageContext.request.contextPath}/exit">[退出]</a>
				</c:when>
				<c:otherwise>
					<a id="top_login" href="${pageContext.request.contextPath}/login">请登录</a>
					<a href="${pageContext.request.contextPath}/register" rel="nofollow">免费注册</a>
				</c:otherwise>
			</c:choose>
        </div>
	</div>
</div>
</div>
<!-- 导航标签渲染 -->
<!---会员中心导航开始--->
<div class="newmember_bg">
    <div class="newmember_nav">
        <a href="${pageContext.request.contextPath}/indexdo" class="newmember_logo fl" hidefocus="false"></a>
        <ul class="nav_box">
            <li class="newmember_list" id="lv_newhome"><a href="${pageContext.request.contextPath}/indexdo" class="a_list">我的首页</a></li>
            <li class="newmember_list"  id="lv_newaccount">
                <a href="#" class="a_list a_default" id="zhsz">账户设置<i class="arrow_up"></i></a>
                <div class="sub_box">
                    <i class="arrow_top"></i>
                    <ul class="newmember_sub">
                        <li>
                            <h5>账户安全</h5>
                            <a href="${pageContext.request.contextPath}/securitySettings">安全设置</a>
                            <a href="${pageContext.request.contextPath}/loginPass_update">修改密码</a>
                            <a href="${pageContext.request.contextPath}/userLogout">注销用户</a>
                        </li>
                        <li>
                            <h5>个人资料</h5>
                            <a href="${pageContext.request.contextPath}/Personal_information">个人信息</a>
                            <a href="${pageContext.request.contextPath}/headSet">头像设置</a>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
        <a href="${pageContext.request.contextPath}/index" class="newmember_home fr">返回驴妈妈首页</a>
    </div>
</div>
<!---会员中心导航结束--->
</body>
</html>