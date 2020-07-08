<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="newmember_leftside">
    <dl>
        <dt id="grzx1" onclick="grzx(1)"><i class="user_icon"></i>个人中心<i id="down1" class="downarr"></i></dt>
        <dd><a href="${pageContext.request.contextPath}/myMemberCenter" id="lvnav_grow">我的成长</a></dd>
        <dd><a href="${pageContext.request.contextPath}/myCollect/all/1" id="lvnav_collection">我的收藏</a></dd>
        <dd><a href="${pageContext.request.contextPath}/mySpaceCommon?type=ddp&pageNum=1" id="lvnav_comment">我的点评<span id="waittingCommentNumber"></span></a></dd>
        <dd><a href="${pageContext.request.contextPath}/mySpaceTrip?type=myTravel&pageNum=1"  id="lvnav_travel">我的游记<i class="write_yj"></i></a></dd>
        <!-- <dd><a href="#" id="lvnav_community_ask">我的问答</a></dd>
        <dd><a href="#" id="lvnav_information">站内消息<span id="myspace_message_count_id"></span></a></dd> -->
    </dl>
    <div class="js-order-list-box">
        <dl id="leftNav">
            <dt id="grzx2" onclick="grzx(2)"><i class="order_icon"></i>订单中心<i id="down2" class="downarr"></i></dt>
            <dd><a href="${pageContext.request.contextPath}/myOrder" id="lvnav_order">我的订单</a></dd>
        </dl>
    </div>
     <dl>
         <dt id="grzx3" onclick="grzx(3)"><i class="cash_icon"></i>资产中心<i  id="down3" class="downarr"></i></dt>
         <dd><a href="${pageContext.request.contextPath}/myAccount/0/1" id="lvnav_balance">账户余额</a></dd>
         <dd><a href="${pageContext.request.contextPath}/myGrowUp/0" id="lvnav_growUp">会员等级礼品<i class='' id="myspace_growUp_hasNewCoupon"></i></a></dd>
     </dl>
    <!-- <dl>
        <dt id="grzx4" onclick="grzx(4)"><i class="server_icon"></i>服务中心<i  id="down4" class="downarr"></i></dt>
        <dd><a href="#" id="lvnav_help" target="_blank">帮助中心</a></dd>
        <dd><a href="#" id="lvnav_feedback" target="_blank">用户反馈</a></dd>
    </dl> -->
</div>
</body>
</html>