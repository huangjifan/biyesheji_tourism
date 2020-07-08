<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
</head>
<body class="lv_newaccount lvnav_tourinfo">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>

<div class="newmember_main">
<!-- 账户设置左边菜单部分 -->
<jsp:include  page="userInfo_left.jsp" flush="true"/>

    <!-- 账户设置右侧主体部分 -->
    <div class="newmember_rightside">
        <div class="mod_box">
            <div class="mod_content p20_4">

                    <div class="password_edit_title">
                        <a href="javascript:;" class="add_btn fr"><em>+</em>新增常用游客</a>
                        <h4>常用游客信息</h4>
                    </div>
                    <div class="address_m250">
                        <table class="address_table">
                            <thead>
                            <tr>
                                <th width="90">中文姓名</th>
                                <th width="100">手机号码</th>
                                <th width="120">证件类型</th>
                                <th width="150">证件号码</th>
                                <th width="150">邮箱</th>
                                <th width="90">性别</th>
                                <th width="110">出生日期</th>
                                <th width="90">旅客类型</th>
                                <th width="80">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                                    <tr id="2c9486e566c0a92b0166d8736f5d2582">
                                        <td>
                                            石杰
                                        </td>
                                        <td>186****1379</td>
                                        <td>身份证</td>
                                        <td>4311222001********</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="address_mod">
                                            <a href="javascript:;" onclick="updateUserReceiver('2c9486e566c0a92b0166d8736f5d2582');" class="js_mod">修改</a>
                                            <a href="javascript:delReceivers('2c9486e566c0a92b0166d8736f5d2582');" class="js_del">删除</a>
                                        </td>
                                    </tr>
                                    <tr id="2c9486ef66e4ac430166eeb8becc086d">
                                        <td>
                                            石杰
                                        </td>
                                        <td>186****1379</td>
                                        <td>客服联系我</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="address_mod">
                                            <a href="javascript:;" onclick="updateUserReceiver('2c9486ef66e4ac430166eeb8becc086d');" class="js_mod">修改</a>
                                            <a href="javascript:delReceivers('2c9486ef66e4ac430166eeb8becc086d');" class="js_del">删除</a>
                                        </td>
                                    </tr>
                            </tbody>
                        </table>
                        <div class="pages">
<div id="pages_" class="pages" style="null"> <div id="lv_page"><div class="Pages"><a href="#" title="上一页" class="PrevPage">上一页</a><span class="PageSel">1</span><a href="#" title="下一页" class="NextPage">下一页</a><br></div></div></div>                        </div>
                    </div>
            </div>
        </div>
    </div>
<!--帮助中心开始-->
<div class="help_box">
	<a class="title" href="javascript:;"></a>
    <div class="help_box_content">
   	 	<div class="content">
	        <ul class="list">
	            <li><a href="http://www.lvmama.com/public/help_center_132" target="_blank" hidefocus="false">没有收到短信？</a></li>
	            <li><a href="http://www.lvmama.com/public/buy_guide#m_2" target="_blank" hidefocus="false">如何退款？</a></li>
	            <li><a href="http://www.lvmama.com/public/help_center_10" target="_blank" hidefocus="false">如何修改订单？</a></li>
	        </ul>
	        <p class="more_box"><a href="http://www.lvmama.com/public/help" target="_blank" hidefocus="false">更多帮助&gt;</a></p>
	        <p class="more_box">任何疑问请拨打<span class="tle_box"><i class="kf_icon"></i>1010-6060</span></p>
    	</div>
    </div>
</div>
<!--帮助中心结束-->
<div class="hr_b"></div>



<script src="http://pic.lvmama.com/js/v6/public/footer.js?v=110518"></script><!-- 公共底部  --><!-- footer\ --><div class="wrap" style="clear: both;"><a class="public_ft" href="http://www.lvmama.com/public/user_security" target="_blank"><ul class="public_ft_list"><li><i class="ft_ioc1"></i><strong>价格保证</strong>同类产品，保证低价</li><li><i class="ft_ioc2"></i><strong>退订保障</strong>因特殊情况影响出行，保证退订</li><li><i class="ft_ioc3"></i><strong>救援保障</strong>旅途中遇意外情况，保证援助</li><li><i class="ft_ioc4"></i><strong>7x24小时服务</strong>快速响应，全年无休</li></ul></a></div><!-- copyright\ --><div class="lv-footer clearfix wrap" style="margin:0 auto;">    <p class="footer-link">       <a href="http://www.lvmama.com/public/about_lvmama" rel="nofollow">关于我们</a> |        <a href="http://www.lvmama.com/public/lianxi_us" rel="nofollow">联系我们</a> |        <a href="http://www.lvmama.com/public/site_map">网站地图</a> |        <a href="http://hotels.lvmama.com/brand/">酒店品牌</a> |        <a href="http://hotels.lvmama.com/area/">酒店查询</a> |        <a href="http://www.lvmama.com/public/help" rel="nofollow">帮助中心</a> |        <a href="http://www.lvmama.com/public/links">友情链接</a> |        <a href="http://www.lvmama.com/public/jobs" rel="nofollow">诚聘英才</a> |    <a href="http://www.lvmama.com/public/zizhi_lvmama" rel="nofollow">旅游度假资质</a> |        <a href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" rel="nofollow">意见反馈</a> |        <a rel="nofollow" href="http://www.lvmama.com/public/adwy">广告业务</a>    </p>    <p class="lv-copyright">Copyright © 2018 www.lvmama.com. 上海景域文化传播股份有限公司版权所有　<a href="http://www.miitbeian.gov.cn" target="_blank" rel="nofollow">沪ICP备13011172号-3</a>　增值电信业务经营许可证编号：<a rel="nofollow" href="http://pic.lvmama.com/img/ICP.jpg" target="_blank">沪B2-20100030</a></p>   <div class="lv-safety">      <a class="safety2" target="_blank" rel="nofollow" title="经营性网站备案信息" href="http://www.miibeian.gov.cn/"></a>      <a class="safety3" target="_blank" rel="nofollow" title="网络110报警服务" href="http://www.cyberpolice.cn"></a>      <a class="safety4" target="_blank" rel="nofollow" title="支付宝特约商家"></a>      <a class="safety5" target="_blank" rel="nofollow" title="AAA级信用企业" href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1664396140"></a>      <a class="safety6" target="_blank" rel="nofollow" title="上海工商" href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110930103539539"></a>      <a class="safety7" target="_blank" rel="nofollow" title="可信网站" href="https://ss.knet.cn/verifyseal.dll?sn=2010101800100002662&amp;comefrom=trust&amp;trustKey=dn&amp;trustValue=www.lvmama.com"></a>      <a class="safety8" target="_blank" rel="nofollow" title="诚信认证示范企业" href="https://credit.szfw.org/CX20160614015657160455.html" id="___szfw_logo___" hidefocus="false"></a>      <a class="safety9" target="_blank" rel="nofollow" title="网络社会征信网" href="http://www.zx110.org"></a>      <a class="safety10" target="_blank" rel="nofollow" title="360网站安全检测" href="http://webscan.360.cn"></a>      <a class="safety11" target="_blank" rel="nofollow" title="网监安全" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010702001030"></a>      <a class="safety13" target="_blank" rel="nofollow" title="举报中心" href="http://www.shjbzx.cn/"></a>   </div></div><!-- //footer --><!-- 公共底部结束  -->

</div>


<!--帮助中心开始-->
<div class="help_box">
	<a class="title" href="javascript:;"></a>
    <div class="help_box_content">
   	 	<div class="content">
	        <ul class="list">
	            <li><a href="#" target="_blank" hidefocus="false">没有收到短信？</a></li>
	            <li><a href="#" target="_blank" hidefocus="false">如何退款？</a></li>
	            <li><a href="#" target="_blank" hidefocus="false">如何修改订单？</a></li>
	        </ul>
	        <p class="more_box"><a href="#" target="_blank" hidefocus="false">更多帮助&gt;</a></p>
	        <p class="more_box">任何疑问请拨打<span class="tle_box"><i class="kf_icon"></i>1010-6060</span></p>
    	</div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/footer.js"></script>
</body>
</html>