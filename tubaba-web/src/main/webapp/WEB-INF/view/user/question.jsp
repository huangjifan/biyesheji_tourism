<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的提问-旅游攻略</title>
<link rel="stylesheet" href="css/dialog.css">
<link rel="stylesheet" href="css/user/comment_index.css">
<link rel="stylesheet" href="css/header_new.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/user/question-detail.css">
<link rel="stylesheet" href="css/user/question-page.css">
<link rel="stylesheet" href="css/user/lvwalk.css" >
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/user/question.js"></script>
<style type="text/css">
	
</style>
</head>
<body>
<!-- 头部导航部分 -->
    <div class="lv_topbar js_box">
        <div class="topbar_box">
            <div class="lv_city_box">
                <a class="lv_collect" href="" target="_blank" title="驴妈妈旅游网" rel="sidebar"><i class="lv_icon icon_collect"></i>收藏驴妈妈</a>
            </div>
            <ul class="top_link">
                <li class="dropdown">
                    <a class="lv_link" href="javascript:;" rel="nofollow">我的驴妈妈<i class="icon_arrow"></i></a>
                    <div class="top_down pd_0">
                        <a href="" rel="nofollow">我的订单</a>
                        <a href="" rel="nofollow">我的积分</a>
                        <a href="" rel="nofollow">我的优惠券</a>
                        <a href="" rel="nofollow" target="_blank">我的会员卡</a>
                        <a href="" rel="nofollow" target="_blank">我的礼品卡</a>
                    </div>
                </li>
                <li>
                    <a class="lv_link" href="" rel="nofollow">积分商城</a>
                </li>
                <li><a class="lv_link" href="" rel="nofollow">帮助</a></li>
                <li class="border_l dropdown">
                    <a class="lv_link" href="javascript:;" rel="nofollow"><i class="lv_icon icon_wx"></i>微信</a>
                    <div class="top_down">
                        <img src="http://s2.lvjs.com.cn/img/v3/wechatcode.jpg" width="220" height="90" alt="">
                    </div>
                </li>
                <li><a class="lv_link" onClick="_gaq.push(['_trackEvent', 'weibo', 'click', 'weiboshouye', 5]);" href="http://e.weibo.com/lvmamas" rel="nofollow"><i class="lv_icon icon_wb"></i>+微博</a></li>

                <li>
                    <a class="lv_link" target="_blank" href="http://shouji.lvmama.com/" rel="nofollow"><i class="lv_icon icon_mobile"></i>手机版</a>
                </li>
                <li class="border_l dropdown link_call">
                    <a id ="onlyOne" class="lv_link" href="javascript:;" rel="nofollow"><i class="lv_icon icon_phone"></i><span></span> <i class="icon_arrow"></i></a>
                    <div class="top_down">
                        <span class="lv_icon"></span>
                        <p id ="onlyTwo" class="phone-num"> </p>
                    </div>
                </li>
            </ul>
            <div id="J_login" class="topbar_login">
                <a href="#">请登录</a>
                <a href="" rel="nofollow">免费注册</a>
            </div>
        </div>
    </div>
    <!-- /头部导航部分结束 -->

    <!-- 二级导航部分 -->
    <div class="lv_header">
        <div class="header_inner clearfix">
            <h1 class="lv_logo"><a href="http://www.lvmama.com">驴妈妈旅游网</a></h1>
            <div class="lv_jbr"></div>
            <h2 class="lv_logo_keywords">旅游攻略</h2>
            <div class="header_search" id="headerSearch_div">

                <div class="lv_search_box">
                    <div class="search_type_list">
                        <i class="icon_iconsearch"></i>
                        <input id="search_php" class="lv_search w_380" x-webkit-speech="" value="请输入国家、城市、目的地" data-inittxt="请输入国家、城市、目的地" autocomplete="off" maxlength="12" type="text">
                        <div id="lv_searchList" class="lv_searchList" style="display: none;">
                            <div id="lv_searchCon" class="lv_searchCon"><a href="http://lvyou.lvmama.com/poi/sight-10683142.html" target="_blank" class=""><span>齐齐哈尔</span><i class="icon_type icon_sm_VIEWSPOT"></i>北纬47°城市温泉家园</a><a href="http://lvyou.lvmama.com/poi/zone-178900.html" target="_blank" class=""><span>重庆</span><i class="icon_type icon_sm_SCENIC_ENTERTAINMENT"></i>重庆城市精英真人CS俱乐部(国防教育培训中心)</a><a href="http://lvyou.lvmama.com/d-taoyuanshi206876.html" target="_blank" class=""><span>台湾</span><i class="icon_type icon_sm_VIEWSPOT"></i>桃园市</a><a href="http://lvyou.lvmama.com/poi/sight-101764.html" target="_blank"><span>淮安</span><i class="icon_type icon_sm_VIEWSPOT"></i>盱眙铁山寺国家森林公园</a><a href="http://lvyou.lvmama.com/poi/sight-104861.html" target="_blank"><span>洛阳</span><i class="icon_type icon_sm_VIEWSPOT"></i>花果山国家森林公园</a><a href="http://lvyou.lvmama.com/poi/sight-159351.html" target="_blank"><span>普洱</span><i class="icon_type icon_sm_VIEWSPOT"></i>普洱国家公园</a><a href="http://lvyou.lvmama.com/poi/sight-179551.html" target="_blank"><span>吉隆坡</span><i class="icon_type icon_sm_VIEWSPOT"></i>吉隆坡城市历史回顾馆</a><a href="http://lvyou.lvmama.com/poi/sight-10671882.html" target="_blank"><span>新余</span><i class="icon_type icon_sm_VIEWSPOT"></i>凯光新天地新余国家亚热带植物园</a><a href="http://lvyou.lvmama.com/poi/sight-162215.html" target="_blank"><span>腾冲</span><i class="icon_type icon_sm_VIEWSPOT"></i>腾冲火山地热国家地质公园</a><a href="http://lvyou.lvmama.com/poi/sight-104569.html" target="_blank"><span>六安</span><i class="icon_type icon_sm_VIEWSPOT"></i>舒城万佛山国家森林公园</a><a href="http://lvyou.lvmama.com/poi/zone-10748467.html" target="_blank"><span>晋城</span><i class="icon_type icon_sm_SCENIC_ENTERTAINMENT"></i>山西蟹岛城市海景</a><a href="http://lvyou.lvmama.com/poi/sight-103247.html" target="_blank"><span>朝阳</span><i class="icon_type icon_sm_VIEWSPOT"></i>朝阳凤凰山国家森林公园</a></div>
                            <div id="lv_searching" class="lv_searching">
                                <p>您是在找：</p>
                                <a href="http://www.lvmama.com/lvyou/search/?t=youji&amp;q=请输入国家、城市、目的地" target="_blank">请输入国家、城市、目的地的游记</a>
                                <a href="http://www.lvmama.com/lvyou/search/?t=gonglue&amp;q=请输入国家、城市、目的地" target="_blank">请输入国家、城市、目的地的攻略</a>
                            </div>
                            <div id="lv_searchFooter" class="lv_searchFooter"><span>更多关于：</span><a href="http://www.lvmama.com/lvyou/search/?t=all&amp;q=请输入国家、城市、目的地" target="_blank">请输入国家、城市、目的地</a></div>
                        </div>
                    </div>
                    <span class="lv_icon btn_lv_search"></span>
                </div>
            </div>
        </div>
    </div>
    <!-- /二级导航部分结束 -->
    <div class="lv_nav_bg">
    <div class="lv_nav">
        <ul class="lv_nav_l css3_run" id="2017_lv_nav_li">
            <li id="home"><a onclick="cmCreateElementTag('首页-PC--顶部导航-00-首页','PC首页顶部导航');" href="http://www.lvmama.com" rel="nofollow">首页</a></li>
            <li id="abroad" class="pnav_down">
                <a onclick="cmCreateElementTag('首页-PC--顶部导航-01-出境游','PC首页顶部导航');" href="http://www.lvmama.com/abroad/">出境游<i class="icon_triangle"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-01-出境游-出境首页','PC首页顶部导航');" class="downNav_def" href="http://www.lvmama.com/abroad/">出境首页</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-01-出境游-邮轮','PC首页顶部导航');" href="http://youlun.lvmama.com">邮轮</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-01-出境游-签证','PC首页顶部导航');" class="downNav_visa" href="http://www.lvmama.com/visa/">签证</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-01-出境游-境外玩乐','PC首页顶部导航');" class="downNav_localfun" href="http://www.lvmama.com/localfun/">境外玩乐</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-01-出境游-WIFI/电话卡','PC首页顶部导航');" class="downNav_wifi" href="http://www.lvmama.com/wifi/">WIFI/电话卡</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-01-出境游-定制游','PC首页顶部导航');" href="http://www.lvmama.com/company/">定制游</a>
                    </p>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
            <li id="destroute" class="pnav_down">
                <a onclick="cmCreateElementTag('首页-PC--顶部导航-02-国内游','PC首页顶部导航');"  href="http://www.lvmama.com/destroute/">国内游<i class="icon_triangle"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-02-国内游-国内首页','PC首页顶部导航');" class="downNav_def" href="http://www.lvmama.com/destroute/">国内首页</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-02-国内游-自由行','PC首页顶部导航');" class="downNav_fit" href="http://www.lvmama.com/jijiu/?losc=087900&ict=i">机酒自由行</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-02-国内游-超级自由行','PC首页顶部导航');" class="downNav_diy" href="http://diy.lvmama.com/">超级自由行</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-02-国内游-定制游','PC首页顶部导航');" href="http://www.lvmama.com/company/">定制游</a>
                    </p>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
            <li id="around" class="pnav_down">
                <a onclick="cmCreateElementTag('首页-PC--顶部导航-03-周边游','PC首页顶部导航');" href="http://www.lvmama.com/zhoubianyou/" data-losc="084208">周边游<i class="icon_triangle"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-03-周边游-周边游首页','PC首页顶部导航');" class="downNav_zby" href="http://www.lvmama.com/zhoubianyou/" data-losc="084208">周边游首页</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-03-周边游-酒店+景点','PC首页顶部导航');" class="downNav_j_j" href="http://www.lvmama.com/freetour/" data-losc="084210">酒店+景点</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-03-周边游-周边跟团','PC首页顶部导航');" class="downNav_bus" href="http://www.lvmama.com/around/" data-losc="084211">周边跟团</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-03-周边游-定制游','PC首页顶部导航');" href="http://www.lvmama.com/company/">定制游</a>
                    </p>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
            
            <li id="ticket" class="pnav_down">
            <a onclick="cmCreateElementTag('首页-PC--顶部导航-04-景点门票','PC首页顶部导航');" href="http://ticket.lvmama.com/" rel="nofollow">景点门票<i class="icon_triangle"></i><i class="icon_sbx"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-04-景点门票-国内门票','PC首页顶部导航');" class="downNav_mp" href="http://ticket.lvmama.com/">国内门票</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-04-景点门票-境外门票','PC首页顶部导航');" href="http://s.lvmama.com/ticket/?keyword=境外&k=0#list">境外门票</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-04-景点门票-万达乐园','PC首页顶部导航');" href="http://www.lvmama.com/zt/u/wanda" target="_blank">万达乐园</a>
                    </p>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
            <li id="hotel" class="pnav_down">
                <a onclick="cmCreateElementTag('首页-PC--顶部导航-05-酒店','PC首页顶部导航');" href="http://hotels.lvmama.com/hotel" rel="nofollow" data-losc="084219">酒店<i class="icon_triangle"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-05-酒店-国内酒店','PC首页顶部导航');" class="downNav_def" href="http://hotels.lvmama.com/hotel" data-losc="084219">国内酒店</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-05-酒店-境外酒店','PC首页顶部导航');" href="http://globalhotel.lvmama.com/?cid=12265950">境外酒店</a>
                    </p>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
            <li id="custom" class="pnav_down">
                <a onclick="cmCreateElementTag('首页-PC--顶部导航-06-定制游','PC首页顶部导航');" href="http://www.lvmama.com/company" rel="nofollow">定制游<i class="icon_triangle"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-06-定制游-个人定制游','PC首页顶部导航');" class="downNav_personal" href="http://www.lvmama.com/company?pageType=personal">个人定制游</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-06-定制游-企业定制游','PC首页顶部导航');" class="downNav_company" href="http://www.lvmama.com/company?pageType=company">企业定制游</a>
                    </p>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
            <li id="zijia" class="pnav_down">
                <a onclick="cmCreateElementTag('首页-PC--顶部导航-07-自驾游','PC首页顶部导航');" href="http://zijia.lvmama.com/" data-losc="084232">自驾游<i class="icon_triangle"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-07-自驾游-自驾首页','PC首页顶部导航');" class="downNav_def" href="http://zijia.lvmama.com/" data-losc="084232">自驾首页</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-07-自驾游-房车露营','PC首页顶部导航');" href="http://www.lvmama.com/zt/u/fangche" target="_blank" data-losc="084238">房车露营</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-07-自驾游-定制游','PC首页顶部导航');" href="http://www.lvmama.com/company/">定制游</a>
                    </p>
                    <a href="http://www.lvmama.com/register/roadClup.do?losc=068634&ict=i" class="navZjy" target="_blank"><i class="lv_icon icon_navzjy"></i></a>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
            <li id="lvyue">
            <a onclick="cmCreateElementTag('首页-PC--顶部导航-08-亲子游','PC首页顶部导航');" href="http://lvyue.lvmama.com/" target="_blank" data-losc="084253">亲子游</a><i class="icon_ly"></i></li>
            <li id="liner" class="pnav_down">
            <a onclick="cmCreateElementTag('首页-PC--顶部导航-09-邮轮','PC首页顶部导航');" href="http://youlun.lvmama.com">邮轮<i class="icon_triangle"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-09-邮轮-邮轮首页','PC首页顶部导航');" class="downNav_def" href="http://youlun.lvmama.com">邮轮首页</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-09-邮轮-日本航线','PC首页顶部导航');" href="http://www.lvmama.com/youlun/line-l677-s0-b0-m0.html">日本航线</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-09-邮轮-海外航线','PC首页顶部导航');" class="downNav_abdliner" href="http://youlun.lvmama.com/abroadyoulun">海外航线</a>
                    </p>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
            <li id="flight" class="pnav_down">
            <a onclick="cmCreateElementTag('首页-PC--顶部导航-10-机票','PC首页顶部导航');" href="http://flight.lvmama.com" rel="nofollow">机票<i class="icon_triangle"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-10-机票-国内机票','PC首页顶部导航');" class="downNav_gnjp" href="http://flight.lvmama.com">国内机票</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-10-机票-国际机票','PC首页顶部导航');" class="downNav_gjjp" href="http://iflight.lvmama.com/">国际·港澳台机票</a>
                    </p>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
            <li id="train"><a onclick="cmCreateElementTag('首页-PC--顶部导航-11-火车票','PC首页顶部导航');" href="http://train.lvmama.com">火车票</a></li>
            <li id="tuangou"><a onclick="cmCreateElementTag('首页-PC--顶部导航-12-特卖会','PC首页顶部导航');" href="http://www.lvmama.com/tuangou">特卖会</a></li>
            
            <li id="finance" class="pnav_down">
                <a onclick="cmCreateElementTag('首页-PC--顶部导航-13-金融','PC首页顶部导航');" href="https://jr.lvmama.com/index" target="_blank">金融<i class="icon_triangle"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-13-金融-小驴白条','PC首页顶部导航');" href="https://jr.lvmama.com/baitiao" target="_blank">小驴白条</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-13-金融-小驴分期','PC首页顶部导航');" href="https://jr.lvmama.com/installment" target="_blank">小驴分期</a>
                        <!--<a onclick="cmCreateElementTag('首页-PC--顶部导航-13-金融-理财','PC首页顶部导航');" href="https://jr.lvmama.com/licai" target="_blank">理财</a>-->
                        <!-- <a onclick="cmCreateElementTag('首页-PC--顶部导航-13-金融-外币兑换','PC首页顶部导航');" href="https://jr.lvmama.com/exchange" target="_blank">外币兑换</a> -->
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-13-金融-礼品卡','PC首页顶部导航');" href="http://www.lvmama.com/stored/goStoredSearch.do" target="_blank">礼品卡</a>
                    </p>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
            <li id="lvyou" class="pnav_down">
                <a onclick="cmCreateElementTag('首页-PC--顶部导航-14-旅游攻略','PC首页顶部导航');" href="http://www.lvmama.com/lvyou/">旅游攻略<i class="icon_triangle"></i></a>
                <div class="down_nav">
                    <p>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-14-旅游攻略-目的地','PC首页顶部导航');" class="downNav_def" href="http://www.lvmama.com/lvyou/">目的地</a>
                        <!-- <a onclick="cmCreateElementTag('首页-PC--顶部导航-14-旅游攻略-攻略','PC首页顶部导航');" class="downNav_guide" href="http://www.lvmama.com/guide/">攻略</a> -->
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-14-旅游攻略-游记','PC首页顶部导航');" class="downNav_yj" href="http://www.lvmama.com/trip/">游记</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-14-旅游攻略-驴游宝','PC首页顶部导航');" class="downNav_lyb" href="http://www.lvmama.com/trip/lvyoubao" target="_blank">驴游宝</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-14-旅游攻略-口碑榜','PC首页顶部导航');" href="http://www.lvmama.com/comment/" target="_blank">口碑榜</a>
                        <a onclick="cmCreateElementTag('首页-PC--顶部导航-14-旅游攻略-问答','PC首页顶部导航');" class="downNav_qa" href="http://www.lvmama.com/lvyou/wenda" target="_blank">问答</a>
                    </p>
                    <span class="lv_icon down_nav_t"></span>
                </div>
            </li>
        </ul>
    </div>
</div>

<!-- 导航标签渲染 -->
<!-- 公共头部开始  -->

<div class="wrap-all">
    <div class="wrapcon">
        <!--面包屑 START-->
        <div class="crumb">
            <a href="">驴妈妈首页</a><span>&gt;</span>
            <a href="">旅游攻略</a><span>&gt;</span>
            <a href="">旅游问答</a><span>&gt;</span>
            <h1 class="cur">问题编辑</h1>
        </div>
        <!--面包屑 END-->
        <!--内容区 START-->
        <form method="post" id="question_operator" action="#">
        <div class="question-content">
            <p class="question-title">我的提问<span>Question</span></p>
            <dl class="question-block">
                <dt><span class="red">*</span>标题</dt>
                <dd class="question-block-title">
                    <div class="nchtextarea">
                        <textarea id="qTitle" name="qTitle" class="ec-textarea js_yz" cols="30" rows="10" placeholder="请输入完整清晰的问题"></textarea> 
                        <span class="tbmac-tip tbmac-tip-normal"></span>
                    </div>
                </dd>
            </dl>
            <dl class="question-block">
                <dt><span class="red">*</span>详细内容</dt>
                <dd class="question-block-detail">
                    <div class="nchtextarea">
                        <textarea id="qContent" name="qContent" class="ec-textarea js_yz" cols="30" rows="10" placeholder="关于问题更详细的说明，请在这里补充。"></textarea> <span class="tbmac-tip tbmac-tip-normal">已输入<b><em>0</em>/500</b>字</span>
                    </div>
                </dd>
            </dl>
            <dl class="question-block">
                <dt><span class="red">*</span>问题相关目的地</dt>

                    <dd class="question-block-relation">
                    <input type="text" placeholder="点击添加问题相关目的地" class="dev_input relation-input js_mdd js_yz dev_dest_text dev_focus" id="destName" name="destName"/>
                </dd>

                <dd class="relation-modify">
                    <i class="tip-icon tip-icon-map-gay"></i><span class="relation-place">--</span><a class="btn-modify js-modify">修改</a>
                </dd>
            </dl>

            <dl class="question-block">
                <dt><span class="red">*</span>问题分类标签</dt>

                <dd class="question-block-classic">
                    <input type="text" placeholder="点击选择问题相关分类标签" readonly="readonly" class="relation-input js_classic js_yz dev_tag_text" name="tagNames" id="tagNames"/>
                    <span class="tip-icon tip-icon-down"></span>
                </dd>

                <dd class="relation-modify">
                    
                    <a class="btn-modify js-modify">修改</a>
                </dd>
            </dl>
            <div class="nounce-box">
                <b class="cur"></b><label><input type="checkbox"/><a href="http://www.lvmama.com/qa-web/lvyou/wenda/procotol.html" title="" target="_blank">免责声明/审核告知</a></label>
            </div>
            <input type="hidden" id="destId" name="destId">
            <input type="hidden" id="qid" name="qid">
            <input type="hidden" id="checkToken" name="checkToken" value="4136A690A80F7718A5D724422B7A0A5F">
            <a class="btn" onclick="return submits()">提交问题</a>
            <span class="message-error" style="display: inline;">
            	<!-- <i class="tip-icon tip-icon-error"></i>请输入标题 -->
            </span>
        </div>
        </form>
        <!--内容区 END-->
    </div>
</div>

<!--相关目的地 START-->
<div class="float-relation-mdd" tabindex='0' style="top:684px;left:232.5px;display:none;" id="dest">
    <dl class="clearfix">
        <dt>热门</dt>
        <dd class="clearfix">
            <span id="1" class="dev_remove">北京</span>
            <span id="137" class="dev_remove">厦门</span>
            <span id="398" class="dev_remove">香港</span>
            <span id="272" class="dev_remove">三亚</span>
            <span id="340" class="dev_remove">西安</span>
            <span id="79" class="dev_remove">上海</span>
            <span id="229" class="dev_remove">广州</span>
            <span id="277" class="dev_remove">重庆</span>
            <span id="102" class="dev_remove">千岛湖</span>
            <span id="312" class="dev_remove">云南</span>
        </dd>
    </dl>
    <dl class="clearfix">
        <dt>国内</dt>
        <dd class="clearfix">
            <span id="3933" class="dev_remove">西塘</span>
            <span id="161" class="dev_remove">青岛</span>
            <span id="100" class="dev_remove">杭州</span>
            <span id="87" class="dev_remove">苏州</span>
            <span id="3698" class="dev_remove">九寨沟</span>
            <span id="254" class="dev_remove">桂林</span>
            <span id="320" class="dev_remove">丽江</span>
            <span id="221" class="dev_remove">张家界</span>
            <span id="279" class="dev_remove">成都</span>
            <span id="3941" class="dev_remove">长隆</span>
        </dd>
    </dl>
    <dl class="clearfix">
        <dt>国际</dt>
        <dd class="clearfix">
            <span id="3542" class="dev_remove">泰国</span>
            <span id="3563" class="dev_remove">普吉岛</span>
            <span id="3544" class="dev_remove">韩国</span>
            <span id="3545" class="dev_remove">巴厘岛</span>
            <span id="3607" class="dev_remove">长滩岛</span>
            <span id="3543" class="dev_remove">日本</span>
            <span id="3559" class="dev_remove">法国</span>
            <span id="3546" class="dev_remove">马尔代夫</span>
            <span id="3629" class="dev_remove">毛里求斯</span>
            <span id="3624" class="dev_remove">越南</span>
        </dd>
    </dl>
</div>
<!--相关目的地 END-->


<!--问题分类标签 START-->
<div class="float-relation-classic" tabindex='0' style="top: 775px; left: 232.5px; display: none;">
            <dl class="clearfix">
                <dt>指南信息</dt>
                   <dd>
                        <span>
                            <b></b>
                            <label><input type="checkbox" name="tagIds" value="护照/通行证"/>护照/通行证</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="简介"/>简介</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="时间"/>时间</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="线路"/>线路</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="退税"/>退税</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="地址"/>地址</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="小费"/>小费</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="签证"/>签证</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="货币/汇率"/>货币/汇率</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="摄影"/>摄影</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="上网/电话卡"/>上网/电话卡</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="邮政"/>邮政</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="安全"/>安全</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="语言"/>语言</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="气候"/>气候</label>
                        </span>
                        <span>
                            <b></b>
                            <label><input type="checkbox" name="tagIds" value="景点/门票"/>景点/门票</label>
                        </span>
                        <span>
                            <b></b>
                            <label><input type="checkbox" name="tagIds" value="上网/电话卡"/>上网/电话卡</label>
                        </span>
                        <span>
                            <b
                            ></b>
                            <label><input type="checkbox" name="tagIds" value="行程/攻略"/>行程/攻略</label>
                        </span>
                   </dd>
            </dl>
            <dl class="clearfix">
                <dt>购物</dt>
                    <dd>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="购物"/>购物</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="奢侈品"/>奢侈品</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="免税店"/>免税店</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="70"/>打折/折扣</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="71"/>特产/纪念品</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="72"/>奥特莱斯</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="73"/>商圈</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="74"/>消费</label>
                                </span>
                    </dd>
            </dl>
            <dl class="clearfix">
                <dt>交通</dt>
                    <dd>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="79"/>地铁</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="78"/>租车/包车</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="77"/>汽车</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="82"/>骑行</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="80"/>出租车</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="81"/>轮船/邮轮</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="101"/>交通</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="75"/>飞机</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="76"/>火车</label>
                                </span>
                    </dd>
            </dl>
            <dl class="clearfix">
                <dt>美食</dt>
                    <dd>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="59"/>夜市/排挡</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="58"/>特色餐厅</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="57"/>米其林</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="60"/>美食</label>
                                </span>
                    </dd>
            </dl>
            <dl class="clearfix">
                <dt>住宿</dt>
                    <dd>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="66"/>预定</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="64"/>酒店</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="65"/>度假村</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="62"/>客栈</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="63"/>民宿</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="61"/>青旅</label>
                                </span>
                                <span>
                                    <b
                                    ></b>
                                    <label><input type="checkbox" name="tagIds" value="100"/>住宿</label>
                                </span>
                    </dd>
            </dl>
            
</div>
<!--问题分类标签 END-->
</body>
</html>