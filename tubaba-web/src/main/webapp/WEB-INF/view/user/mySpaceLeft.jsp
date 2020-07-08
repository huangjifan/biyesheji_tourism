<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>左边列表公共页面</title>
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
<link rel="stylesheet" href="css/newcommon.css" >
<link rel="stylesheet" href="css/buttons.css" >
<!--点评css-->
<link rel="stylesheet" href="css/comform_v2.css">
<link rel="stylesheet" href="css/tags.css">
<link rel="stylesheet" href="css/header_new.css">
<link rel="stylesheet" href="css/dialog.css">
<link href="css/header-air.css" rel="stylesheet"/>
<link href="css/ui-lvmama.css" rel="stylesheet" />
<link href="css/ui-components.css" rel="stylesheet" />
<link href="css/lv-bought.css" rel="stylesheet" />
<link rel="stylesheet" href="css/global_pop.css">
<link href="css/ui-components.css" rel="stylesheet" />
<link rel="stylesheet" href="css/lv-user-mytrip.css">
<link rel="stylesheet" href="css/tip.css" >
<link rel="stylesheet" href="css/integral.css" >
<link rel="stylesheet" href="css/integral.css" >
<link rel="stylesheet" href="css/newmember.css" >
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/indexdo.js"></script>
<style type="text/css">
	.one{
		display: none;
	}
</style>
</head>
<body  class="lv_newhome">
<!-- 会员中心顶部导航栏 -->
<div id="wrap" class="ui-container lvmama-bg">
<!-- 无搜索版，公共头部开始  -->
<div class="lv_topbar js_box">
    <div class="topbar_box">
    	<div class="lv_city_box">
        	<div class="lv_city_up">
            	<i class="lv_icon icon_city"></i>
                <b class="lv_city" data-city-name="上海" data-city-id="" data-id="9" data-source="home" fromchannel="" id="currentCity">上海</b>
                <a class="lv_city_btn" href="javascript:;">[切换]</a>
            </div>
            <div class="lv_city_down Js_LISTFIRST">
                <!-- 开始 -->
					<p class="my_city_t">可选城市列表</p>
				        
				<!-- 结束 -->
            </div>
       </div>

        <ul class="top_link">
        	 <li class="dropdown">
            	<a class="lv_link" href="" rel="nofollow">我的驴妈妈<i class="icon_arrow"></i></a>
                <div class="top_down pd_0">
                    <a href="" rel="nofollow">我的订单</a>
				<a href="" rel="nofollow">我的驴镑</a>
				<a href="" rel="nofollow">我的优惠券</a>
				<a href="" rel="nofollow" target="_blank">我的礼品卡</a>
                </div>
            </li>
            <li>
                 <a class="lv_link" href="" rel="nofollow">驴镑商城</a>
             </li>
            <li>
                <a class="lv_link" href="">会员俱乐部</a>
            </li>
            <li>
                <a class="lv_link" href="">品牌会员</a>
            </li>
            <li><a class="lv_link" href="" rel="nofollow">帮助</a></li>
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
            <a href="login">请登录</a>
            <a href="register" rel="nofollow">免费注册</a>
        </div>
	</div>
</div>
<!-- 导航标签渲染 -->
<!-- 无搜索版，公共头部结束 --><!---会员中心导航开始--->
<div class="newmember_bg">
    <div class="newmember_nav">
        <a href="" class="newmember_logo fl" hidefocus="false"></a>
        <ul class="nav_box">
            <li class="newmember_list" id="lv_newhome"><a href="" class="a_list">我的首页</a></li>
            <li class="newmember_list"  id="lv_newaccount">
                <a href="#" class="a_list a_default">账户设置<i class="arrow_up"></i></a>
                <div class="sub_box">
                    <i class="arrow_top"></i>
                    <ul class="newmember_sub">
                        <li>
                            <h5>账户安全</h5>
                            <a href="">安全设置</a>
                            <a href="">修改密码</a>
                            <a href="">注销用户</a>
                        </li>
                        <li>
                            <h5>常用信息</h5>
                            <a href="">常用游客信息</a>
                            <a href="">常用收货地址</a>
                        </li>
                        <li>
                            <h5>个人资料</h5>
                            <a href="">个人信息</a>
                            <a href="">自驾信息</a>
                            <a href="">头像设置</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="newmember_list"><a href="" class="a_list" target="_blank">驴镑商城</a></li>
            <li class="newmember_list"><a href="" class="a_list" target="_blank">会员俱乐部</a></li>
            <li class="newmember_list"><a href="" class="a_list" target="_blank">品牌会员</a></li>
        </ul>
        <a href="" class="newmember_home fr">返回驴妈妈首页</a>
    </div>
</div>
<!---会员中心导航结束--->

<!---会员中心页面开始--->
<div class="newmember_main">
    <!-- 会员中心左边菜单部分 -->
<!-- 会员中心左侧菜单栏 -->
<div class="newmember_leftside">
    <dl>
        <dt id="grzx1" onclick="grzx(1)"><i class="user_icon"></i>个人中心<i id="down1" class="downarr"></i></dt>
        <dd><a href="myMemberCenter" id="lvnav_grow">我的成长</a></dd>
        <dd><a href="myCollect/all/1" id="lvnav_collection">我的收藏</a></dd>
        <dd><a href="myCollect" id="lvnav_collection">我的收藏</a></dd>
        <dd><a href="mySpaceCommon" id="lvnav_comment">我的点评<span id="waittingCommentNumber"></span></a></dd>
        <dd><a href=""  id="lvnav_travel">我的游记<i class="write_yj"></i></a></dd>
                <dd><a href="" id="lvnav_invoice">我的发票</a></dd>

        <dd><a href="" id="lvnav_community_ask">我的问答</a></dd>
        <dd>
            <a href="" id="lvnav_information">站内消息<span id="myspace_message_count_id"></span></a>
        </dd>
    </dl>
    <div class="js-order-list-box">
        <dl id="leftNav">
            <dt id="grzx2" onclick="grzx(2)"><i class="order_icon"></i>订单中心<i id="down2" class="downarr"></i></dt>
            <dd><a href="myOrder" id="lvnav_order">我的订单</a></dd>
        </dl>
    </div>
     <dl>
         <dt id="grzx3" onclick="grzx(3)"><i class="cash_icon"></i>资产中心<i  id="down3" class="downarr"></i></dt>
         <dd><a href="${pageContext.request.contextPath}/myAccount/0/1" id="lvnav_balance">账户余额</a></dd>
         <dd><a href="${pageContext.request.contextPath}/myGrowUp/0" id="lvnav_growUp">会员等级礼品<i class='' id="myspace_growUp_hasNewCoupon"></i></a></dd>
     </dl>
    <dl>
        <dt id="grzx4" onclick="grzx(4)"><i class="server_icon"></i>服务中心<i  id="down4" class="downarr"></i></dt>
        <dd><a href="" id="lvnav_help" target="_blank">帮助中心</a></dd>
        <dd><a href="" id="lvnav_feedback" target="_blank">用户反馈</a></dd>
    </dl>
</div>
</div>
<!--右侧帮助中心开始-->
<!--帮助中心开始-->
<div class="help_box">
	<a class="title" href=""></a>
    <div class="help_box_content">
   	 	<div class="content">
	        <ul class="list">
	            <li><a href="" target="_blank" hidefocus="false">没有收到短信？</a></li>
	            <li><a href="" target="_blank" hidefocus="false">如何退款？</a></li>
	            <li><a href="" target="_blank" hidefocus="false">如何修改订单？</a></li>
	        </ul>
	        <p class="more_box"><a href="" target="_blank" hidefocus="false">更多帮助&gt;</a></p>
	        <p class="more_box">任何疑问请拨打<span class="tle_box"><i class="kf_icon"></i>1010-6060</span></p>
    	</div>
    </div>
</div>
</body>
</html>