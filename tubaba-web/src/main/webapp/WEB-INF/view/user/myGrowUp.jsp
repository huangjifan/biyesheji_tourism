<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员等级礼品-兔爸爸旅游网</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
<link href="${pageContext.request.contextPath}/css/header-air.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/ui-lvmama.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/ui-components.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/lv-bought.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/global_pop.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/newmember.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcommon.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/integral.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user/indexdo.js"></script>
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
		$('#couponStatus').parent().click(function(){
			if($('#ulId').is(':hidden')){
    			$('#ulId').slideDown(200);
    		}else{
    			$('#ulId').slideUp(200);
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
<body class="lvnav_growUp">
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
        <div class="mod_box" style="margin-top:30px;">
            <div class="mod_content p20_4">
                <div class="userCoupon-detail-box">
                    <div class="comon_tit clearfix">
                        
                        <div class="usergift_tab_box fl">
                            <cite>
                            <c:if test="${couponStatus == 0 }">
                            	<span id="couponStatus">可使用</span>
                            </c:if>
                             <c:if test="${couponStatus == 1 }">
                            	<span id="couponStatus">已使用</span>
                            </c:if>
                             <c:if test="${couponStatus == 2 }">
                            	<span id="couponStatus">已使用</span>
                            </c:if>
                            <i class="conmon_icon usergift_down"></i></cite>
                            <ul class="usergift_tab_lsit" style="display:none;background:#fff;" id="ulId">
                                <li class="selected" onclick="location.href='${pageContext.request.contextPath}/myGrowUp/0'">可使用</li>
                                <li onclick="location.href='${pageContext.request.contextPath}/myGrowUp/1'">已使用</li>
                                <li onclick="location.href='${pageContext.request.contextPath}/myGrowUp/2'">已过期</li>
                            </ul>
                            <input name="" value="" id="inputselect" type="hidden">
                        </div>
                    </div>

                    <div class="mod_icontent js_con" style="display:block">
	                    <c:if test="${couponList.size() > 0 }">
	                        <ul class="userCouponBox-v2">
	                        	<c:forEach items="${couponList }" var="coupon">
		                       		<em style="font-size:26px"></em>
		                            <li class="list userCouponicon js-userCouponprice">
		                                <div class="userCouponprice">
		                                    <i class="icon"></i>
		                                    <p class="name">￥${coupon.couponMoney }</p>
		                                </div>
		                                <div class="userCouponContent">
		                                    <p>有效日期：  <fmt:formatDate pattern="yyyy.MM.dd" value="${coupon.startTime }" />-<fmt:formatDate pattern="yyyy.MM.dd" value="${coupon.endTime }" />
		                                        <em class="state"> </em>
		                                    </p>
		                                </div>
		                            </li>
		                        </c:forEach>
	                        </ul>
	                        </c:if>
	                        <c:if test="${couponList.size() == 0 }">
	                        	<p class="cashTitle"></p>
	                        	<div class="userCoupon-no-list">
                                     <i class="userCouponicon"></i>
                                     <p>暂无优惠券</p>
                                 </div>
	                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 结构 -->

    <br/><br/>
<script src="${pageContext.request.contextPath}/js/footer.js"></script>
</body>
</html>