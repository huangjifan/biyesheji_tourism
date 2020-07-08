<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 顶部导航 开始 -->
<div class="lv_topbar js_box">
	<div class="topbar_box">
        <div class="lv_city_box">
            <div class="lv_city_up">
                <i class="lv_icon icon_city"></i>
                <b class="lv_city" cid="38" upid="3" id="currentCity">上海</b>
                <a class="lv_city_btn" href="javascript:;" onclick="showChangeCity()">[切换]</a>
            </div>
            <div class="lv_city_down Js_LISTFIRST" tabindex="0" onblur='hideChangeCity()'>
                <!-- 开始 -->
                <p class="my_city_t">可选城市列表</p>
                <!-- 结束 -->
			</div>
        </div>
	
        <ul class="top_link">
            <li class="dropdown" onmouseout="hideMyTubaba()" onmouseover="showMyTubaba()">
                <a class="lv_link" href="${pageContext.request.contextPath}/indexdo" rel="nofollow">我的兔爸爸<i class="icon_arrow"></i></a>
                <div class="top_down pd_0">
                    <a href="${pageContext.request.contextPath}/myOrder" rel="nofollow">我的订单</a>
                    <a href="${pageContext.request.contextPath}/myGrowUp/0" rel="nofollow">我的优惠券</a>
                </div>
            </li>
            <li>
                <a class="lv_link" href="${pageContext.request.contextPath}/index.do">会员俱乐部</a>
            </li>
            <li>
                <a class="lv_link" href="${pageContext.request.contextPath}/index.do">品牌会员</a>
            </li>
            <li><a class="lv_link" href="${pageContext.request.contextPath}/help" rel="nofollow">帮助</a></li>
            <li id="weiXingAccounts" class="border_l dropdown" onmouseout="hideWeiXingAccountsImage()" onmouseover="showWeiXingAccountsImage()">
                <a class="lv_link lv_link_wx" href="javascript:;" rel="nofollow"><i class="lv_icon icon_wx"></i></a>
                <div class="top_down">
                    <img src="${pageContext.request.contextPath}/image/wechatcode.jpg" width="220" height="90" alt="">
                </div>
            </li>
            <li class="dropdown" >
                <a class="lv_link lv_link_xcx" href="javascript:;" rel="nofollow"><i class="lv_icon icon_xcx"></i></a>
                <div class="top_down">
                    <img src="${pageContext.request.contextPath}/image/wechat-mini-program-qrcode.png" width="206" height="92" alt="">
                </div>
            </li>
            <li><a class="lv_link lv_link_wb" onclick="_gaq.push([&#39;_trackEvent&#39;, &#39;weibo&#39;, &#39;click&#39;, &#39;weiboshouye&#39;, 5]);" href="http://e.weibo.com/lvmamas" rel="nofollow"><i class="lv_icon icon_wb"></i></a></li>

            <li>
                <a class="lv_link" target="_blank" href="" rel="nofollow"><i class="lv_icon icon_mobile"></i>手机版</a>
            </li>
            <li class="border_l dropdown link_call" onmouseout="hidePhone()" onmouseover="showPhone()">
                <a rel="nofollow" href="javascript:;" class="lv_link"><i class="lv_icon icon_phone"></i>国内：<span id="onlyOne"><span>1010-6060</span></span> <i class="icon_arrow"></i></a>
                <div class="top_down">
                    <span class="lv_icon"></span>
                    <p class="phone-num"><em>国内：</em><i id="onlyTwo">1010-6060</i></p>
                    <p class="phone-num-abroad"><em>海外：</em>+86-21-6180-0981</p>
                </div>
            </li>
            <li class="border_l online-customer-service">
                <a rel="nofollow" href="${pageContext.request.contextPath}/admin_login.jsp" target="_blank" class="lv_link">后台管理</a>
            </li>
        </ul>
		<div id="J_login" class="topbar_login">
			<c:choose>
				<c:when test="${user != null}">
					<span class="vip_name"><a
						href="${pageContext.request.contextPath}/indexdo">${user}</a></span>
					<a href=""
						class="lv_link lv_link2"><i class="lv_icon icon_xx"></i>消息</a>
					<a class="lv_link lv_link2" rel="nofollow"
						href="${pageContext.request.contextPath}/exit">[退出]</a>
				</c:when>
				<c:otherwise>
					<a id="top_login" href="${pageContext.request.contextPath}/login">请登录</a>
					<a href="${pageContext.request.contextPath}/register">免费注册</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<!-- 顶部导航 结束 -->

<!-- 网站图标和搜索框 开始 -->
<div class="lv_header">
    <div class="header_inner clearfix">
    	<!-- 网站图标 -->
        <div class="lv_logo">
            <a href="${pageContext.request.contextPath}/index">兔爸爸旅游网</a>
        </div>
        <div class="lvFestivals"></div>
        <a class="lv_homeHeadTip" target="_blank" href=""></a>
    </div>
</div>
<!-- 网站图标和搜索框 结束 -->

<!-- 旅游分类和旅游攻略 开始 -->
<div class="lv_nav_bg">
    <div class="lv_nav">
        <ul class="lv_nav_l css3_run" id="2017_lv_nav_li">
            <li id="home"><a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-00-首页&#39;,&#39;PC首页顶部导航&#39;);" href="${pageContext.request.contextPath}/index" rel="nofollow">首页</a></li>
           <!--  <li id="destroute" class="pnav_down" onmouseout="hideTravelSonClassify(this)" onmouseover="showTravelSonClassify(this)">
                <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-02-国内游&#39;,&#39;PC首页顶部导航&#39;);" href="#">国内游<i class="icon_triangle"></i></a>
                <div class="down_nav" style="width: 1423px; left: -241.5px;">
                    <p style="left: 113.5px;">
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-02-国内游-国内首页&#39;,&#39;PC首页顶部导航&#39;);" class="downNav_def" href="http://localhost:1001/destroute.jsp">国内首页</a>
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-02-国内游-自由行&#39;,&#39;PC首页顶部导航&#39;);" class="downNav_fit" href="http://localhost:1001/destroute.jsp">机酒自由行</a>
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-02-国内游-超级自由行&#39;,&#39;PC首页顶部导航&#39;);" class="downNav_diy" href="http://localhost:1001/destroute.jsp">超级自由行</a>
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-02-国内游-定制游&#39;,&#39;PC首页顶部导航&#39;);" href="company.jsp">定制游</a>
                    </p>
                    <span class="lv_icon down_nav_t" style="left: 273.5px;"></span>
                </div>
            </li> -->
           <!--  <li id="around" class="pnav_down" onmouseout="hideTravelSonClassify(this)" onmouseover="showTravelSonClassify(this)">
                <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-03-周边游&#39;,&#39;PC首页顶部导航&#39;);" href="#" data-losc="084208">周边游<i class="icon_triangle"></i></a>
                <div class="down_nav" style="width: 1423px; left: -315.5px;">
                    <p style="left: 190.5px;">
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-03-周边游-周边游首页&#39;,&#39;PC首页顶部导航&#39;);" class="downNav_zby" href="http://localhost:1001/zhoubianyou.jsp" data-losc="084208">周边游首页</a>
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-03-周边游-酒店+景点&#39;,&#39;PC首页顶部导航&#39;);" class="downNav_j_j" href="http://localhost:1001/zhoubianyou.jsp" data-losc="084210">酒店+景点</a>
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-03-周边游-周边跟团&#39;,&#39;PC首页顶部导航&#39;);" class="downNav_bus" href="http://localhost:1001/zhoubianyou.jsp" data-losc="084211">周边跟团</a>
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-03-周边游-定制游&#39;,&#39;PC首页顶部导航&#39;);" href="http://localhost:1001/company.jsp">定制游</a>
                    </p>
                    <span class="lv_icon down_nav_t" style="left: 347.5px;"></span>
                </div>
            </li> -->
            <li id="custom" class="pnav_down" onmouseout="hideTravelSonClassify(this)" onmouseover="showTravelSonClassify(this)">
                <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-06-定制游&#39;,&#39;PC首页顶部导航&#39;);" href="company.jsp" rel="nofollow">定制游<i class="icon_triangle"></i></a>
                <div class="down_nav" style="width: 1423px; left: -537.5px;">
                    <p style="left: 483px;">
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-06-定制游-个人定制游&#39;,&#39;PC首页顶部导航&#39;);" class="downNav_personal" href="${pageContext.request.contextPath}/company.jsp">个人定制游</a>
                    </p>
                    <span class="lv_icon down_nav_t" style="left: 569.5px;"></span>
                </div>
            </li>
            <li id="ticket" class="pnav_down" onmouseout="hideTravelSonClassify(this)" onmouseover="showTravelSonClassify(this)">
            	<a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-04-景点门票&#39;,&#39;PC首页顶部导航&#39;);" href="${pageContext.request.contextPath}/ticket" rel="nofollow">景点门票<i class="icon_triangle"></i><i class="icon_sbx"></i></a>
                <div class="down_nav" style="width: 1423px; left: -389.5px;">
                    <p style="left: 316.5px;">
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-04-景点门票-国内门票&#39;,&#39;PC首页顶部导航&#39;);" class="downNav_mp" href="${pageContext.request.contextPath}/ticket.jsp">国内门票</a>
                    </p>
                    <span class="lv_icon down_nav_t" style="left: 429.5px;"></span>
                </div>
            </li>
            <li id="lvyou" class="pnav_down" onmouseout="hideTravelSonClassify(this)" onmouseover="showTravelSonClassify(this)">
                <a  href="#">旅游攻略<i class="icon_triangle"></i></a>
                <div class="down_nav" style="width: 1423px; left: -1075.5px;">
                    <p style="left: 971.5px;">
                        <a onclick="cmCreateElementTag(&#39;首页-PC-上海-顶部导航-14-旅游攻略-游记&#39;,&#39;PC首页顶部导航&#39;);" class="downNav_yj" href="${pageContext.request.contextPath}/trip?pageNum=1">游记</a>
                    </p>
                    <span class="lv_icon down_nav_t" style="left: 1115.5px;"></span>
                </div>
            </li>
        </ul>
    </div>
</div>
<!-- 旅游分类和旅游攻略 结束 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>