<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>站内消息-驴妈妈旅游网</title>
 <link rel="shortcut icon" href="image/favicon.png" type="image/png" />
<link rel="stylesheet" href="css/tags.css" >
<link href="css/header-air.css" rel="stylesheet"/>
<link href="css/ui-lvmama.css" rel="stylesheet" />
<link href="css/ui-components.css" rel="stylesheet" />
<link href="css/lv-bought.css" rel="stylesheet" />
<link rel="stylesheet" href="css/global_pop.css">
<link href="css/ui-components.css" rel="stylesheet" />
<link rel="stylesheet" href="css/lv-user-mytrip.css">
<link rel="stylesheet" href="css/newmember.css" >
<link rel="stylesheet" href="css/tip.css" >
<link rel="stylesheet" href="css/newcommon.css" >
<link rel="stylesheet" href="css/integral.css" >
</head>
<body class = "lv_newhome lvnav_information">
<div id="wrap" class="ui-container lvmama-bg">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!---会员中心导航结束--->
<div class="newmember_main">
<!-- 会员中心左侧菜单栏 -->
<jsp:include page="myPageLeft.jsp" flush="true" />
    <!--  右边部分开始 -->
    <div class="newmember_rightside">
        <!-- 站内消息>> -->
        <div class="mod_box">
            <div class="mod_title">
                <h3 class="h3_title">站内消息</h3>
            </div>
            <div class="mod_content p20_3">
                <div class="news_tab_box ">
                    <ul class="comon_tab clearfix">
                        <li  class="active" onclick="index('SYSTEM')">
                            系统消息 （<em class="f_f60" id = 'tab_SYSTEM'>2</em>）<i class="conmon_icon icon_jt"></i>
                        </li>
                        <li  onclick="index('ASSET')">
                            资产消息<i class="conmon_icon icon_jt"></i>
                        </li>
                        <li  onclick="index('ACTIVE')">
                            活动消息<i class="conmon_icon icon_jt"></i>
                        </li >
                        <li  onclick="index('SOCIAL')">
                            互动消息<i class="conmon_icon icon_jt"></i>
                        </li>
                    </ul>
                </div>
                <div class="news_title clearfix">
                    <a class="a_blue fr marR16" href="javascript:void(0);" id = "yidu-all">全部设为已读</a>
                    共3条，未读<em class="f_f60 font14">2</em>条<a class="a_blue marL20" href="javascript:void(0);" onclick="showMessageByIsRead('SYSTEM','0')">
                        只看未读
                    </a>
                </div>

                    <div class="js_con" style="display:block">
                        <ul class="news_list">
                                    <li>
                                        <div class="news_list_box clearfix">

                                            <span class="news_input_box"><input type="checkbox" name="items"
                                                                                onclick="checkAAll(2)"
                                                                                value="11932377"></span>
                                            <span class="news_bt "><a
                                                    href="javascript:void(0);" status="READED"
                                                    mid='11932377' type="SYSTEM"
                                                    class="a_gray33">会员升级提醒 </a></span>
                                            <span class="news_time">2018-11-02 09:40:00</span>
                                        </div>
                                        <!--浮层开始-->
                                        <div class="lv_tips_box">
                                            <i class="conmon_icon lv_up_icon"></i>

                                            <div class="news_content" id='content_11932377'>

                                            </div>
                                        </div>
                                        <!--浮层结束-->
                                    </li>

                                    <li>
                                        <div class="news_list_box clearfix">

                                            <span class="news_input_box"><input type="checkbox" name="items"
                                                                                onclick="checkAAll(2)"
                                                                                value="10352566"></span>
                                            <span class="news_bt click_b"><a
                                                    href="javascript:void(0);" status=""
                                                    mid='10352566' type="SYSTEM"
                                                    class="a_gray33">驴妈妈积分升级通知</a>
                                                <span id='unRead_10352566'
                                                      style="color:#FF0000">[未读]</span>  </span>
                                            <span class="news_time">2018-07-24 12:30:00</span>
                                        </div>
                                        <!--浮层开始-->
                                        <div class="lv_tips_box">
                                            <i class="conmon_icon lv_up_icon"></i>

                                            <div class="news_content" id='content_10352566'>

                                            </div>
                                        </div>
                                        <!--浮层结束-->
                                    </li>

                                    <li>
                                        <div class="news_list_box clearfix">

                                            <span class="news_input_box"><input type="checkbox" name="items"
                                                                                onclick="checkAAll(2)"
                                                                                value="9944905"></span>
                                            <span class="news_bt click_b"><a
                                                    href="javascript:void(0);" status=""
                                                    mid='9944905' type="SYSTEM"
                                                    class="a_gray33">驴妈妈奖金升级通知</a>
                                                <span id='unRead_9944905'
                                                      style="color:#FF0000">[未读]</span>  </span>
                                            <span class="news_time">2018-05-23 13:00:00</span>
                                        </div>
                                        <!--浮层开始-->
                                        <div class="lv_tips_box">
                                            <i class="conmon_icon lv_up_icon"></i>

                                            <div class="news_content" id='content_9944905'>

                                            </div>
                                        </div>
                                        <!--浮层结束-->
                                    </li>

                                <li>
                                    <div class="news_list_box clearfix">
                                        <span class="news_allinput_box"><input type="checkbox" onclick="checkAAll(1)">全选</span>
                                    </div>
                                </li>
                        </ul>

                    </div>
                    <div class="page_box"> <!--分页开始-->
                        <div class="page_box mart20"><div id='pages_' class='pages' style='null'> <div id="lv_page"><div class="Pages"><a href="#" title="上一页" class="PrevPage" >上一页</a><span class="PageSel">1</span><a href="#" title="下一页" class="NextPage" >下一页</a></span><br/></div></div></div></div>
                    </div><!--分页结束-->
                

            </div>
        </div>
        <!-- 站内消息>> -->
    </div>
    <!-- 右边部分结束 -->

</div>
<!--帮助中心开始-->
<div class="help_box">
	<a class="title" href="javascript:;"></a>
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
<!--帮助中心结束-->
<!--右侧帮助中心-->
<div class="hr_b"></div>
</div>

<!-- 封住窗口的弹出框  -->
<div class="xh_overlay"></div>
<script src="js/footer.js"></script>
</body>

</html>