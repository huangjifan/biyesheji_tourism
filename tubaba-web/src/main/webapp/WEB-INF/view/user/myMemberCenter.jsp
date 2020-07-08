<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的成长-驴妈妈旅游网</title>
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
<link href="css/header-air.css" rel="stylesheet"/>
<link href="css/ui-lvmama.css" rel="stylesheet" />
<link href="css/ui-components.css" rel="stylesheet" />
<link href="css/lv-bought.css" rel="stylesheet" />
<link rel="stylesheet" href="css/global_pop.css">
<link rel="stylesheet" href="css/newmember.css" >
<link rel="stylesheet" href="css/newcommon.css" >
<link rel="stylesheet" href="css/integral.css" >
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/indexdo.js"></script>
<script type="text/javascript">
	$(function(){
		$('ul[class="user_comon_tab"]').find('li').click(function(){
			if($(this).text().trim() == '成长值'){
				$(this).addClass('active');
				$(this).prev().removeClass('active');
				$(this).parent().parent().next().css('display','none');
				$(this).parent().parent().next().next().css('display','block');
			}else if($(this).text().trim() == '会员特权'){
				$(this).addClass('active');
				$(this).next().removeClass('active');
				$(this).parent().parent().next().css('display','block');
				$(this).parent().parent().next().next().css('display','none');
			}
		})
	})	
</script>
<style type="text/css">
	.one{
		display: none;
	}
</style>
</head>
<body class="lv_newhome lvnav_grow">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!---会员中心导航结束--->
<div class="newmember_main">
<!-- 会员中心左侧菜单栏 -->
<jsp:include page="myPageLeft.jsp" flush="true" />
    <!-- 会员中心开始 -->
    <div class="newmember_rightside">
        <!-- 我的成长开始 -->
        <div class="user_mod_content p20_4">
        <c:if test="${users.integral >= list.get(0).minIntegral }">
        	
        </c:if>
        <c:choose>
        	<c:when test="${users.integral >= list.get(4).minIntegral }"><div class="user_commonbg user_common_v6"></c:when>
        	<c:when test="${users.integral >= list.get(3).minIntegral }"><div class="user_commonbg user_common_v5"></c:when>
        	<c:when test="${users.integral >= list.get(2).minIntegral }"><div class="user_commonbg user_common_v4"></c:when>
        	<c:when test="${users.integral >= list.get(1).minIntegral }"><div class="user_commonbg user_common_v3"></c:when>
        	<c:when test="${users.integral >= list.get(0).minIntegral }"><div class="user_commonbg user_common_v2"></c:when>
        	<c:otherwise><div class="user_commonbg user_common_v1"></c:otherwise>
        </c:choose>
            <!-- <div class="user_commonbg user_common_v1"> -->
                <div class="user_head-box">
                    <span class="name-box name-v1">
                        <i class="user_grade_Icon user_head_v1"></i>
                        <c:choose>
				        	<c:when test="${users.integral >= list.get(4).minIntegral }">钻石会员</c:when>
				        	<c:when test="${users.integral >= list.get(3).minIntegral }">铂金会员</c:when>
				        	<c:when test="${users.integral >= list.get(2).minIntegral }">金牌会员</c:when>
				        	<c:when test="${users.integral >= list.get(1).minIntegral }">银牌会员</c:when>
				        	<c:when test="${users.integral >= list.get(0).minIntegral }">铜牌会员</c:when>
				        	<c:otherwise>注册会员</c:otherwise>
				        </c:choose>
                    </span>
                    <img src='../image/default-photo.gif' width="84" height="84" class="user_head-img">
                    <div class="user_head-bg"></div>
                </div>
                <p class="user_head_title">${users.username }</p>
                <p class="user_grade_Icon user_head_grow">成 长 值</p>
                <p class="user_head_num">${users.integral }</p>
                <div class="user_head_tips user_head_tips-v1">
                        <i class="ui-arrow-top"></i>
                        <c:choose>
                        	<c:when test="${users.integral >= list.get(0).minIntegral }">
                        		<c:forEach items="${list }" var="member" varStatus="index" begin="0" end="${list.size() - 1 }">
		                        	<c:if test="${users.integral >= member.minIntegral && users.integral <= member.maxIntegral}">
		                        		+ ${list.get(index.index + 1).minIntegral - users.integral }  成长值即可享${list.get(index.index + 1).name }特权！
		                        	</c:if>
		                        </c:forEach>
                        	</c:when>
                        	<c:otherwise>
                        		 +${list.get(0).minIntegral - users.integral } 成长值即可享${list.get(0).name }特权！
                        	</c:otherwise>
                        </c:choose>
                        <!-- +1  
                       	 成长值即可享铜牌会员特权！ -->
                </div>
            </div>

            <div class="user_myle_box">
                <h4 class="title">我的成长</h4>

                <div class="user_growth-progress pr">
                    <ul class="user_growth_box">
                        <li class="active">
                            <i class="user_grade_Icon user_growth_v1"></i>

                            <p class="text">注册会员<em>（0）</em></p>
                        </li>
                        <li >
                            <i class="user_grade_Icon user_growth_v2"></i>

                            <p class="text">铜牌会员<em>（1）</em></p>
                        </li>
                        <li >
                            <i class="user_grade_Icon user_growth_v3"></i>

                            <p class="text">银牌会员<em>（400）</em></p>
                        </li>
                        <li >
                            <i class="user_grade_Icon user_growth_v4"></i>

                            <p class="text">金牌会员<em>（3000）</em></p>
                        </li>
                        <li >
                            <i class="user_grade_Icon user_growth_v5"></i>

                            <p class="text">铂金会员<em>（8000）</em></p>
                        </li>
                        <li >
                            <i class="user_grade_Icon user_growth_v6"></i>

                            <p class="text">钻石会员<em>（20000）</em></p>
                        </li>
                    </ul>
                    <span style="width:0%"/>
                </div>
                <h4 class="title">我的特权</h4>

                <div class="user_myle_list clearfix">
                	<a class="user_grade_Icon user_myle_v1 fl"
                       title="专属活动" hidefocus="false"></a>
                	<c:if test="${users.integral >= list.get(0).minIntegral }">
                		 <a class="user_grade_Icon user_myle_v3 fl"
                       title="生日礼包" hidefocus="false"></a>
                	</c:if>
                	<c:if test="${users.integral < list.get(0).minIntegral }">
                		 <a class="user_grade_Icon dis_user_myle_v3 fl"
                       title="生日礼包" hidefocus="false"></a>
                	</c:if>
                	<c:if test="${users.integral >= list.get(1).minIntegral }">
                		 <a class="user_grade_Icon user_myle_v4 fl"
                       title="等级优惠券" hidefocus="false"></a>
                	</c:if>
                	<c:if test="${users.integral < list.get(1).minIntegral }">
                		 <a class="user_grade_Icon dis_user_myle_v4 fl"
                       title="等级优惠券" hidefocus="false"></a>
                	</c:if>
                	<c:if test="${users.integral >= list.get(2).minIntegral }">
                		 <a class="user_grade_Icon user_myle_v5 fl"
                       title="等级专享价" hidefocus="false"></a>
                	</c:if>
                	<c:if test="${users.integral < list.get(2).minIntegral }">
                		 <a class="user_grade_Icon dis_user_myle_v5 fl"
                       title="等级专享价" hidefocus="false"></a>
                	</c:if>
                	<c:if test="${users.integral >= list.get(3).minIntegral }">
                		 <a class="user_grade_Icon user_myle_v6 fl"
                       title="邮轮优先登船" hidefocus="false"></a>
                	</c:if>
                	<c:if test="${users.integral < list.get(3).minIntegral }">
                		<a class="user_grade_Icon dis_user_myle_v6 fl"
                       title="邮轮优先登船" hidefocus="false"></a>
                	</c:if>
                	<c:if test="${users.integral >= list.get(4).minIntegral }">
                		 <a class="user_grade_Icon user_myle_v7 fl"
                       title="WIFI特权" hidefocus="false"></a>
                	</c:if>
                	<c:if test="${users.integral < list.get(4).minIntegral }">
                		 <a class="user_grade_Icon dis_user_myle_v7 fl"
                       title="WIFI特权" hidefocus="false"></a>
                	</c:if>
                </div>
            </div>
        </div>
        <!-- 我的成长结束 -->
        <!--切换开始-->
        <div class="user-detail_box ">
            <div class="user_detail_title">
                <ul class="user_comon_tab">
                    <li class="active">
                        会员特权<i class="conmon_icon icon_jt"></i>
                    </li>
                    <li>
                        成长值<i class="conmon_icon icon_jt"></i>
                    </li>
                </ul>
            </div>
            <!---会员特权开始-->
            <div class="user_mod_bg p20_4 js_con" style="display:block">
                <div class="growthCon">
                    <h4 class="user_title">会员成长介绍</h4>

                    <div class="user_tip">
                        <p>（1） 银牌及以上会员的星级有效期为1年，自完成升星之日算起；注册会员和铜牌会员的星级有效期长期有效。</p>

                        <p>（2） 当星级到期时，将扣除银牌及以上会员不同数量的成长值，并根据剩余成长值重新计算会员星级。</p>

                        <p>（3） 若达到上一级别的级别标准，即可升级；若未达到，将顺次下调一个会员级别，同时按照下调日更新会员星级有效期。</p>

                        <p>（4） 扣除成长值时，会员的成长值最低降为1。</p>
                    </div>
                    <table class="growth-tabe mart10">
                        <thead>
                        <tr class="font14">
                            <th width="190">会员等级</th>
                            <th width="220">成长值</th>
                            <th>等级有效期及升降级标准</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><i class="user_grade_Icon user_icon_v1"></i>注册会员</td>
                            <td>注册会员</td>
                            <td>永久有效</td>
                        </tr>

                        <tr>
                            <td><i class="user_grade_Icon user_icon_v2"></i>铜牌会员</td>
                            <td>成长值(1-399)</td>
                            <td>永久有效</td>
                        </tr>

                        <tr>
                            <td><i class="user_grade_Icon user_icon_v3"></i>银牌会员</td>
                            <td>成长值(400-2999)</td>
                            <td>有效期1年，1年后扣除200成长值，根据剩余成长值重新计算级别</td>
                        </tr>

                        <tr>
                            <td><i class="user_grade_Icon user_icon_v4"></i>金牌会员</td>
                            <td>成长值(3000-7999)</td>
                            <td>有效期1年，1年后扣除1000成长值，根据剩余成长值重新计算级别</td>
                        </tr>

                        <tr>
                            <td><i class="user_grade_Icon user_icon_v5"></i>铂金会员</td>
                            <td>成长值(8000-19999)</td>
                            <td>有效期1年，1年后扣除2000成长值，根据剩余成长值重新计算级别</td>
                        </tr>
                        <tr>
                            <td><i class="user_grade_Icon user_icon_v6"></i>钻石会员</td>
                            <td>成长值(20000+)</td>
                            <td>有效期1年，1年后扣除4000成长值，根据剩余成长值重新计算级别</td>
                        </tr>
                        </tbody>
                    </table>
                    <h4 class="user_title mart20">等级权益</h4>
                    <table class="growth-tabe ">
                        <thead>
                        <tr class="font14">
                            <th width="200">会员特权</th>
                            <th width="130">注册会员</th>
                            <th width="130">铜牌会员</th>
                            <th width="130">银牌会员</th>
                            <th width="130">金牌会员</th>
                            <th width="130">铂金会员</th>
                            <th width="130">钻石会员</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="user-frist"><i class="user_grade_Icon user_icon_hot"></i>专属活动</td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                        </tr>

                        <tr>
                            <td class="user-frist"><i class="user_grade_Icon user_icon_mary"></i>生日礼包</td>
                            <td></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                        </tr>

                        <tr>
                            <td class="user-frist"><i class="user_grade_Icon user_icon_cash"></i>等级优惠券</td>
                            <td></td>
                            <td></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                        </tr>

                        <tr>
                            <td class="user-frist"><i class="user_grade_Icon user_icon_gift"></i>等级专享价</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                        </tr>

                        <tr>
                            <td class="user-frist"><i class="user_grade_Icon user_icon_ship"></i>邮轮优先登船</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                        </tr>

                        <tr>
                            <td class="user-frist"><i class="user_grade_Icon user_icon_wifi"></i>WIFI特权</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><i class="user_grade_Icon user_icon_right"></i></td>
                        </tr>
                        </tbody>
                    </table>
                    <h4 class="user_title mart20">特权说明</h4>
                    <ul class="user_grade-contetn">
                        <li>
                            <h5><i class="user_grade_Icon user_icon_dian"></i>专属活动</h5>

                            <p>驴妈妈会员可享受会员日等专属活动。</p>
                        </li>
                        <li>
                            <h5><i class="user_grade_Icon user_icon_dian"></i>生日礼包</h5>

                            <p>会员生日可获赠惊喜礼包，等级越高，礼包优惠越多，包含优惠券、蛋糕券、礼品券等。<a
                                    href="http://my.lvmama.com/myspace/userinfo.do?requestDestination=PF">完善生日信息</a>
                            </p>

                            <p>生日礼包通过短信/邮件通知，需会员主动领取。<a href="http://my.lvmama.com/memberClub/index.do">立即领取</a>
                            </p>
                        </li>
                        <li>
                            <h5><i class="user_grade_Icon user_icon_dian"></i>等级优惠券</h5>

                            <p>不同等级会员每月可领大额专属优惠券。<a
                                    href="http://my.lvmama.com/myspace/growUp/productIndex.do">立即领取</a></p>
                        </li>
                        <li>
                            <h5><i class="user_grade_Icon user_icon_dian"></i>等级专享价</h5>

                            <p>主要针对金牌、铂金、钻石会员的用户，定期可享受部分产品的会员专享优惠价（包括但不限于部分门票产品、周边游产品、国内产品、出境游产品）。</p>
                        </li>
                        <li>
                            <h5><i class="user_grade_Icon user_icon_dian"></i>邮轮优先登船</h5>

                            <p>达到相应等级的会员，购买指定邮轮产品时，可享受VIP特权（优先登船+贵宾免费茶歇），请联系VIP客服预订。<a
                                    href="http://www.lvmama.com/public/help_center_591 ">查看更多细则</a></p>
                        </li>
                        <li>
                            <h5><i class="user_grade_Icon user_icon_dian"></i>WiFi特权</h5>

                            <p>达到相应等级的会员，购买指定出境产品时，可免费获赠境外wifi ，请联系VIP客服预订。<a
                                    href="http://www.lvmama.com/public/help_center_592 ">查看更多细则</a></p>
                        </li>
                    </ul>
                </div>
            </div>
            <!---会员特权结束-->
            <!--成长值开始-->
            <div class="user_mod_bg p20_4 js_con">   
                <div class="growthCon">
                    <h4 class="user_title">什么是成长值？</h4>

                    <div class="user_tip">
                        驴妈妈会员的成长之路，记录了注册会员在驴妈妈平台上购买产品及参与互动等获得的成长值的累积，等级变化过程，通过会员成长等级授予会员特殊权益，交易金额越高，成长等级越高，获得会员的权益机会越多。
                    </div>
                    <h4 class="user_title">如何获得成长值？</h4>
                    <table class="growth-tabe ">
                        <thead>
                        <tr class="font14">
                            <th width="150">获得途径</th>
                            <th width="170">获得成长值</th>
                            <th width="350">说明</th>
                            <th>发放时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="tag">
                            <td>购买旅游产品（线上购买）</td>
                            <td>根据订单实付金额计算，1元＝1点成长值</td>
                            <td class="textLet">所有成长值取订单实际支付金额整数，小数点后全部舍弃（例：9.98元订单实际支付金额，成长值计9）<span class="f_f60">注：单机票、单火车票订单除外，实付金额10元=1点成长值。</span>
                            </td>
                            <td class="textLet">交易完成后，且游玩成功后的次日统一处理。退款部分成长值减少，以退款成功时间起取整数，次日凌晨统一处理。</td>
                        </tr>
                        <tr class="tag">
                            <td>购买实物商品（线上购买）</td>
                            <td>根据订单实付金额计算， 1元＝2点成长值注：会员首单、会员日单、生日单可或双倍成长值。</td>
                            <td class="textLet">
                                所有成长值取订单实际支付金额整数，小数点后全部舍弃（例：9.98元订单实际支付金额，成长值计18）。会员首单：新会员第一笔订单。取消后再下的不作为首单会员日单：下单时间在每月28日00:00:00-23:59:59的订单生日单：会员生日所在月份下的订单。
                            </td>
                            <td class="textLet">交易完成后次日统一处理。退款部分成长值减少，以退款成功时间起取整数，次日凌晨统一处理。</td>
                        </tr>
                        <tr class="tag">
                            <td>首次绑定邮箱</td>
                            <td>10</td>
                            <td>首次绑定邮箱，即可获得成长值</td>
                            <td>绑定邮箱成功后</td>
                        </tr>
                        <tr class="tag">
                            <td>订单点评审核通过</td>
                            <td>10</td>
                            <td class="textLet">发表点评，通过审核后，获赠成长值。每个自然月通过点
                                评（包括订单点评审核通过和订单点评加精华)最高加100
                                成长值
                            </td>
                            <td>点评通过审核后</td>
                        </tr>
                        <tr class="tag">
                            <td>订单点评加精华</td>
                            <td>10</td>
                            <td class="textLet">订单点评被评为精华点评后，获赠成长值。每个自然月通
                                过点评（包括订单点评审核通过和订单点评加精华)最高加
                                100成长值
                            </td>
                            <td>点评被评为精华点评后</td>
                        </tr>
                        <tr class="tag">
                            <td>APP订单完成分享</td>
                            <td>20</td>
                            <td class="textLet">订单支付完成分享，分享成功后增
                                加20个成长值。每笔订单分享只送一次，每个自然月最高加
                                200成长值。
                            </td>
                            <td>分享成功后</td>
                        </tr>
                        <tr class="tag">
                            <td>会员升级活动</td>
                            <td>根据活动规则发放相应的成长值</td>
                            <td class="textLet">不定期开展的会员活动，会员参与能获得成长值的活动
                            </td>
                            <td>以活动规则为准</td>
                        </tr>

                        </tbody>
                    </table>
                    <h4 class="user_title">我的成长值明细</h4>
                    <table id="expDetailTable" class="growth-tabe ">
                        <thead>
                        <tr class="font14">
                            <th width="220">下单时间</th>
                            <th width="140">获得时间</th>
                            <th width="140">来源</th>
                            <th width="140">订单号</th>
                            <th width="140">成长值</th>
                        </tr>
                        </thead>
                        <tbody id="expDetailTbody">
                        </tbody>
                    </table>
                </div>
            </div>
            <!--成长值结束-->
        </div>
    </div>
    <!-- 结构 -->

    <br/><br/>
<script src="js/footer.js"></script>
</div>
</body>
</html>