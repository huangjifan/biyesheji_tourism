<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的发票-兔爸爸旅游网</title>
<link rel="stylesheet" href="http://pic.lvmama.com/min/index.php?f=/styles/v6/comment/comform_v2.css,/styles/v5/modules/tags.css" >
<link href="http://pic.lvmama.com/styles/new_v/header-air.css?v=110518" rel="stylesheet"/>
<link href="http://pic.lvmama.com/styles/mylvmama/ui-lvmama.css?v=110518" rel="stylesheet" />
<link href="http://pic.lvmama.com/styles/mylvmama/ui-components.css?v=110518" rel="stylesheet" />
<link href="http://pic.lvmama.com/styles/mylvmama/lv-bought.css?v=110518" rel="stylesheet" />
<link rel="stylesheet" href="http://pic.lvmama.com/styles/global_pop.css?v=110518">
<link href="http://pic.lvmama.com/styles/new_v/ob_common/ui-components.css?v=110518" rel="stylesheet" />
<link rel="stylesheet" href="http://pic.lvmama.com/min/index.php?f=/styles/you/lv-user-mytrip.css&v=110518">
<link rel="stylesheet" href="http://pic.lvmama.com/styles/v6/myspace/newmember.css?v=110518" >
<link rel="stylesheet" href="http://pic.lvmama.com/min/index.php?f=/styles/v6/header_new.css,/styles/v4/modules/dialog.css,styles/v5/modules/tip.css&v=110518" >
<link rel="stylesheet" href="http://pic.lvmama.com/styles/v6/myspace/newcommon.css?v=110518" >
<link rel="stylesheet" href="http://pic.lvmama.com/styles/v6/myspace/integral.css?v=110518" >
</head>
<body  class = "lvnav_invoice">
<!-- 无搜索版，公共头部开始  -->
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!---会员中心导航结束--->
<!-- 会员中心页面开始-->
<div class="newmember_main">
<!-- 会员中心左侧菜单栏 -->
<jsp:include page="myPageLeft.jsp" flush="true" />
    <div class="newmember_rightside">
        <div class="newmember-invoice-box">
            <h4 class="title">我的发票</h4>
            <span class="nova-tip-form tips">
                <span class="nova-icon-xs nova-icon-warning"></span>小驴提醒：发票将在出游后3-5个工作日左右完成审核并发出，纸质发票的具体送达日期以快递公司为准，发票金额为您的实付金额（不包含保险金额、礼品卡、优惠券、奖金、退款金额）。
            </span>
            <div class="nova-tip-form tips">
                <span class="nova-icon-xs nova-icon-warning"></span>如门票产品或是打包产品中包含门票产品不允许开票，订单开票金额为0元，使用康旅卡支付等情况暂不支持开发票，故订单中不会露出发票申请的按钮；
            </div>
            <div class="nova-tip-form tips">
                <span class="nova-icon-xs nova-icon-warning"></span>购买康旅权益产品(包含游乐宝)不支持开发票，使用康旅权益的本金购买旅游产品支持开发票，使用奖金购买旅游产品则不支持开发票
            </div>
            <div class="nova-tip-form tips">
                <span class="nova-icon-xs nova-icon-warning"></span>接邮管局通知规定现快递收件人需要实名制，故请您务必填写真实姓名，感谢您的配合。
            </div>
        </div>
        <!--切换开始-->
        <div class="detail_box ">
            <div class="comon_tit">
                <div class="invoice-serch-box fr">
                    <input type="text" placeholder="输入订单号查找发票" class="input fl js-invoice-input" id="orderId" onkeydown="EnterPress(event)"/>
                    <a href="javascript:;" class="conmon_icon close js-colse"></a>
                    <a href="javascript:;" class="btn fl" onclick = "searchHistoryList()">
                        <i class="conmon_icon invoice-serch-icon"></i>
                    </a>
                </div>
                <ul class="comon_tab">
                    <li class="active">
                        已确认<i class="conmon_icon icon_jt"></i>
                    </li>
                    <li>
                        未确认<i class="conmon_icon icon_jt"></i>
                    </li>
                </ul>

            </div>
            <!---发票列表开始-->
            <div class="mod_bg p20_4 js_con" style="display:block">
                <ul class="newmember-invoice-title clearfix">
                    <li class="wdone">发票抬头</li>
                    <li class="wdtwo">抬头类型</li>
                    <li class="wdthree">开票金额</li>
                    <li class="wdfour">开票项目</li>
                    <li class="wdfive">开票进度</li>
                    <li class="wdsix">操作</li>
                </ul>
                <div id = "tableContent1">
                </div>
                <div class="page_box mart20">
                    <div id="pages_" class="pages" style="null">
                        <div id="lv_page">
                            <div class="Pages" id ="pageId_tabs-1">
                            </div>
                        </div>
                    </div>
                </div>

            </div><!---发票列表结束-->
            <!---发票列表开始-->
            <div class="mod_bg p20_4 js_con">
                <ul class="newmember-invoice-title clearfix">
                    <li class="wdone">发票抬头</li>
                    <li class="wdtwo">抬头类型</li>
                    <li class="wdthree">开票金额</li>
                    <li class="wdfour">开票项目</li>
                    <li class="wdfive">开票进度</li>
                    <li class="wdsix">操作</li>
                </ul>
                <div id = "tableContent2">
                </div>
                <div class="page_box mart20">
                    <div id="pages_" class="pages" style="null">
                        <div id="lv_page">
                            <div class="Pages" id ="pageId_tabs-2">
                            </div>
                        </div>
                    </div>
                </div>
            </div><!---发票列表结束-->
        </div>
        <!-- 会员中心页面结束-->
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
<script src="js/footer.js"></script>
</div>
</div>
</body>
</html>