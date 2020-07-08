<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的游记-驴妈妈旅游网</title>
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
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/myTrip.js"></script>
<script type="text/javascript" src="js/user/dialog.js"></script>
<style type="text/css">
	.order-col-name th{
		margin: 10px;
	}
</style>
</head>
<body  class = "lv_newhome lvnav_travel">
<div id="wrap" class="ui-container lvmama-bg">
 <!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!---会员中心导航结束--->
<!-- 会员主体部分开始 -->
<div class="newmember_main">
<!-- 会员中心左侧菜单栏 -->
<jsp:include page="myPageLeft.jsp" flush="true" />
    <!--  右边部分开始 -->
    <div class="newmember_rightside">
        <div class="mod_box shadow_down">
            <div class="mod_content p20_4">
                <div class="password_edit_title">
                    <h4>我的游记</h4>
                </div>
                <ul class="travelContent">
                   　<li class="wd200">
                        <i class="conmon_icon lvMoneyIcon"></i>
                        驴游宝累计收益（元）：<i class="conmon_icon unknown_icon tag" tip-content="驴游宝收益金额将打在每个用户对应的驴妈妈奖金账户。"></i>
                        <p class="mart10"><em class="font32 f_f60 "><i class="font18 f_f60">￥</i><span id="amtCount">0.00</span></em></p>
                        <p><a class="a_blue" href="#">了解驴游宝</a></p>
                    </li>
                    <li class="wd370">最新收益（元)：
                        <p class="mart10"><span class="f_f60">￥<em class="font20" id="firstAmt">0.00</em></span><span class="gray99" id="firstTime"></span></p>
                        <p><a class="a_blue jsView" href="#">查看收益记录</a></p>
                    </li>
                    <li>
                        <p>写游记也可以赚钱哦!</p>
                            <a href="mywrite" class="writeBtn mart10" target="_blank">写游记</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="detail_box ">
            <div class="comon_tit">
                <ul class="comon_tab">
                    <li class="active" id="youji1">
                        	<a href="mySpaceTrip?type=myTravel&pageNum=1">我的游记</a><i class="conmon_icon icon_jt"></i>
                    </li>
                    <li id="youji2">
                     	<a href="mySpaceTrip?type=dWrite&pageNum=1">待写游记的订单</a><i class="conmon_icon icon_jt"></i>
                    </li>
                </ul>
            </div>
            <!---我的游记开始-->
            <div class="mod_icontent mod_bg js_con" style="display:block" id = "myTripList">
            <input type="hidden" value="${type }" id="type">
            	<table class="order_table">
					<c:if test="${type=='myTravel' }">
		            <c:choose>
		            	<c:when test="${pageList.size()>0 }">
		            	<thead>
		            		<tr class="inf-col-name">
		            			<th width="620">游记标题</th>
								<th width="60">操作</th>
		            		</tr>
						</thead>
		            	<tbody height="200px;">
		            	<c:forEach items="${pageList.listIterator() }" var="list" >
	            			<tr class="sep-row">
	            				<td>
	            					<c:if test="${list.coverimg !=null }">
	            						<img src="${list.coverimg }" width="80" height="55" class="fl">
	            					</c:if>
	            					<c:if test="${list.coverimg==null }">
	            						<img src="image/default.jpg" width="80" height="55" class="fl">
	            					</c:if>
	            					<div class="travelProBox">
	            						<p class="travelProContent">
	            							<a href="travelNote?tid=${list.id }" target="_blank" class="a_gray33">${list.title}</a>
	            						</p>
	            						<span class="gray99">创建于  <fmt:formatDate value="${list.time }" pattern="yyyy-MM-dd"/></span>
	            						<span class="gray99 marL10">
	            							<i class="conmon_icon zan_icon marR5"></i>
	            							<c:if test="${list.travelLike.size()>0 }">
	            								${list.travelLike.size() }
	            							</c:if>
	            							<c:if test="${list.travelLike.size()==0 }">
	            								0
	            							</c:if>
	            						</span>
	            						<span class="gray99 marL10">
	            							<i class="conmon_icon view_icon marR5"></i>${list.views }
	            						</span>
	            						<span class="gray99 marL10">
	            							<i class="conmon_icon Message_icon marR5"></i>
	            							<c:if test="${list.travelCommon.size()>0 }">
	            								${list.travelCommon.size() }
	            							</c:if>
	            							<c:if test="${list.travelCommon.size()==0 }">
	            								0
	            							</c:if>
	            						</span>
	            					</div>
	            				</td>
	            				<td>
	            					<a class="travelBlue" href="editTravel?id=${list.id }" target="_blank">编辑</a>
	            					<a class="travelBlue" href="#" onclick="del(${list.id})">删除</a>
	            				</td>
	            			</tr>
		            		</c:forEach>
		            		</tbody>
		            	</c:when>
		            	<c:otherwise>
		            		<tbody>
								<tr class="inf-col-name">
									<td colspan="4">
										<div class="cashBox">
											<span class="fl">
												<img src="../image/lv_no.png" width="100" height="100">
											</span>
											<div class="nomyRecordm">
												<p class="cashTitle noMargin">您还没写过游记哦！</p>
												<p class="cashHelp">
													<a href="mywrite" class="mart10 nomywriteBtn" target="_blank">写游记</a>
												</p>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
		            	</c:otherwise>
		            </c:choose>
		            </c:if>
				</table>
				<!-- 未写游记的订单 -->
				<c:if test="${type=='dWrite' }">
		            <c:forEach items="${pageList.listIterator() }" var="common">
		            <div class='tableContent'>
						<table class='order_table'>
		            	<tr class='order-col-name'>
							<th colspan='7'>
								<span class='date'>下单时间:<fmt:formatDate value="${common.indentdetails.orderstime }" pattern="yyyy-MM-dd"/></span>&nbsp;&nbsp;&nbsp;&nbsp;<span class='num'>订单号：${common.ordernumber }</span>
							</th>
						</tr>
						<tr class='order-sep-row'>
							<td width='355'><div class='product-name'>
								<c:if test="${common.indentdetails.scenic !=null }">
									<a href='scenic?id=${common.indentdetails.scenic.id }&&pageIndex=0'>${common.indentdetails.scenic.scenicname }</a>
								</c:if>
								<c:if test="${common.indentdetails.scenicway !=null }">
									<a href='scenicway/tourRouteProductShow/${common.indentdetails.scenicway.id }'>${common.indentdetails.scenicway.way}</a>
								</c:if>
							</div></td>
							<td width='146'><div class='product-type'>景点门票</div></td>
							<td width='200'>
								<div class='product-date'><div class='product-date'>出行时间：<fmt:formatDate value="${common.indentdetails.starttime }" pattern="yyyy-MM-dd"/></div></div>
							</td>
							<td width='93'><div class='product-price'>￥${common.price }</div></td>
							<td class='order-line' width='77'>
								<div class='product-option'><span class='order-status wait'>取消</span>
								<p><a href='viewDetail/${common.id}' class='detail-link'>订单详情</a></p></div>
							</td>
							<td class='order-line' width='113'><p><a href='mywrite?iid=${common.id }' target="_blank">去写游记</a></p></td>
						</tr>
						</table>
					</div>
					</c:forEach>
		           </c:if>
				<!-- 分页 -->
           		<div class="page_box mart20">
					<div id="pages_" class="pages" style="null">
						<div id="lv_page">
							<div class="Pages">
								<c:choose>
									<c:when test="${pageList.getPageNum() == 1 }">
										<a href="#" title="上一页" class="PrevPage">上一页</a>
									</c:when>
									<c:otherwise>
										<a href="mySpaceTrip?type=${type }&pageNum=${pageList.getPageNum() - 1 }" title="上一页" class="PrevPage">上一页</a>
									</c:otherwise>
								</c:choose>
								<c:forEach begin="1" end="${pageList.getPages() }" varStatus="index">
									<c:choose>
										<c:when test="${pageList.getPageNum() == index.index }">
											<span class="PageSel">${index.index }</span>
										</c:when>
										<c:otherwise>
											<a href="mySpaceTrip?type=${type }&pageNum=${index.index }" class="PageLink" title="第 ${index.index }页">${index.index }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${pageList.getPageNum() == pageList.getPages() }">
										<a href="#" title="下一页" class="NextPage">下一页</a><br>
									</c:when>
									<c:otherwise>
										<a href="mySpaceTrip?type=${type }&pageNum=${pageList.getPageNum() + 1 }" title="下一页" class="NextPage">下一页</a><br>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>							
				</div>
            </div>
            <!---我的游记结束-->
            <!---待写订单游记开始-->
            <div class="mod_icontent mod_bg js_con" id = "unWriteTripOrder">
				
            </div>
            <!---待写订单游记结束-->
            <!--我写的游记评论开始-->
            <div class="mod_icontent mod_bg js_con" id = "getMyTripComment">

            </div>
            <!--我写的游记评论开始-->
            
            
            <!---游记帮助结束-->
<!-- 会员主体部分结束 -->
    </div>
    </div>
    <!--我的收益记录开始-->
    <div class="myRecordBox"  id="myEarnings">

    </div>
<!--我的收益记录结束-->
</div>


</div>
<script src="js/footer.js"></script>
</body>

</html>