<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的点评-兔爸爸旅游网</title>
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
<link rel="stylesheet" href="css/tags.css" >
<link href="css/header-air.css" rel="stylesheet"/>
<link href="css/ui-lvmama.css" rel="stylesheet" />
<link href="css/ui-components.css" rel="stylesheet" />
<link href="css/lv-bought.css" rel="stylesheet" />
<link rel="stylesheet" href="css/global_pop.css">
<link rel="stylesheet" href="css/lv-user-mytrip.css">
<link rel="stylesheet" href="css/newmember.css" >
<link rel="stylesheet" href="css/tip.css" >
<link rel="stylesheet" href="css/newcommon.css" >
<link rel="stylesheet" href="css/integral.css" >
<link rel="stylesheet" href="css/order-v1.css">
<style type="text/css">
	.pager{
		width: 100%;
		height:30px;
		border:1px red solid;
	}
	.cmt-will{
		height:230px;
	}
</style>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/mySpaceCommon.js"></script>
<!--点评新增css-->
<link rel="stylesheet" href="css/comform_v2.css">
<link rel="stylesheet" href="css/paging.css">
<link rel="stylesheet" href="css/dialog.css">
<link rel="stylesheet" href="css/user/myspaceindex.css">

</head>
<body class = "lvnav_comment">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!---会员中心导航结束--->
<!-- 会员中心页面开始-->
<div class="newmember_main">
<!-- 会员中心左侧菜单栏 -->
<jsp:include page="myPageLeft.jsp" flush="true" />
    <!--右侧 开始-->
    <div class="newmember_rightside">
        <div class="cmtFocus">
            <div class="main-box banner-box js-banner">
                <ul class="banner-list">
                    <li style="display:block" >
                        <a href="" target="_blank"><img src="image/dianping.jpg" width="1020"
                                                                         height="240"></a>
                    </li>
                </ul>
                <div class="banner-num-box">
                        <span class="active"></span>
                        <span></span>
                        <span></span>

                </div>
            </div>
        </div>
        <!--点评tab 开始-->
        <div class="cmtTab modCmt">
        	<input type="hidden" value="${type }" id="type"/>
            <a href="mySpaceCommon?type=ddp&pageNum=1" class="cmtTab-li current active" id="ddp">待点评
            <span class="cmtTab-num">
            	<c:choose>
					<c:when test="${ddp != null}">
						(${ddp })
					</c:when>
					<c:otherwise>
						(0)
					</c:otherwise>
				</c:choose>
            </span></a>
            <a href="mySpaceCommon?type=ydp&pageNum=1" class="cmtTab-li" id="ydp">已点评
            <span class="cmtTab-num">
            	<c:choose>
					<c:when test="${ydp != null}">
						(${ydp })
					</c:when>
					<c:otherwise>
						(0)
					</c:otherwise>
				</c:choose>
            </span></a>
            <a href="#" class="cmtTab-rule"><span class="cmtTab-ico"></span><i>点评奖金规则</i><span
                    class="cmtTab-arrow"></span></a>
        </div>
        <div class="cmtLi">
            <div class="cmt-will" id="needComment">
				<c:if test="${pageList.getTotal() > 0}"><!-- 判断是否有评论 -->
					<!-- 待点评 -->
					<c:if test="${type=='ddp' }">
	   				<ul class="fav-content js-fav-hover clearfix ">
	   					<c:forEach  items="${pageList.listIterator() }" var="common">
	   						<div class='ddp' style='display:block;'>
	   						<div class='tableContent'>
							<table class='order_table'>
							<tr class='order-col-name'>
								<th colspan='7'>
									<span class='date'>下单时间 :<fmt:formatDate value="${common.orderstime}" pattern="yyyy-MM-dd"/></span><span class='num'>订单号：${common.indent.ordernumber }</span>
								</th>
							</tr>
							<tr class='order-sep-row'>
								<td width='355'><div class='product-name'>
								<c:if test="${common.scenic !=null }">
									<a href='scenic?id=${common.scenic.id } &&pageIndex=0'>${common.scenic.scenicname }</a>
								</c:if>
								<c:if test="${common.scenicway !=null }">
									<a href='scenicway/tourRouteProductShow/${common.scenicway.id }'>${common.scenicway.way }</a>
								</c:if>
								</div></td>
								<td width='146'><div class='product-type'>景点门票</div></td>
								<td width='200'>
									<div class='product-date'><div class='product-date'>出行时间：<fmt:formatDate value="${common.starttime }" pattern="yyyy-MM-dd"/></div></div>
								</td>
								<td width='93'><div class='product-price'>￥${common.indent.price }</div></td>
								<td class='order-line' width='77'>
									<div class='product-option'><span class='order-status wait'>取消</span>
									<p><a href='viewDetail/${common.indent.id }' class='detail-link'>订单详情</a></p></div>
								</td>
								<td class='order-line' width='113'>
									<p>
									<c:if test="${common.scenic.id !=null }">
										<a href='scenic?id=${common.scenic.id }&&pageIndex=0'>去点评</a>
									</c:if>
									<c:if test="${common.scenicway.id !=null }">
										<a href='scenicway/tourRouteProductShow/${common.scenicway.id }'>去点评</a>
									</c:if>
									</p>
								</td>
							</tr>
							</table>
							</div> 
							</div>
	   					</c:forEach>
	         		</ul>
	         		</c:if>
	         		<!-- 已点评 -->
	         		<c:if test="${type=='ydp' }">
	   				<ul class="fav-content js-fav-hover clearfix ">
	   					<c:forEach  items="${pageList.listIterator() }" var="common">
	   						<div class='ddp' style='display:block;'>
	   						<div class='tableContent'>
							<table class='order_table'>
							<tr class='order-col-name'>
								<th colspan='7'>
									<span class='date'>下单时间:<fmt:formatDate value="${common.orderstime }" pattern="yyyy-MM-dd"/></span><span class='num'>订单号：${common.indent.ordernumber }</span>
								</th>
							</tr>
							<tr class='order-sep-row'>
								<td width='355'><div class='product-name'>
									<c:if test="${common.scenic !=null }">
										<a href='scenic?id=${common.scenic.id }&&pageIndex=0'>${common.scenic.scenicname }</a>
									</c:if>
									<c:if test="${common.scenicway !=null }">
										<a href='scenicway/tourRouteProductShow/${common.scenicway.id }'>${common.scenicway.way }</a>
									</c:if>
								</div></td>
								<td width='146'><div class='product-type'>景点门票</div></td>
								<td width='200'>
									<div class='product-date'><div class='product-date'>出行时间：<fmt:formatDate value="${common.starttime }" pattern="yyyy-MM-dd"/></div></div>
								</td>
								<td width='93'><div class='product-price'>￥${common.indent.price }</div></td>
								<td class='order-line' width='77'>
									<div class='product-option'><span class='order-status wait'>待支付</span>
									<p><a href='viewDetail/${common.indent.id }' class='detail-link'>订单详情</a></p></div>
								</td>
								<td class='order-line' width='113'><p><!-- <a href=''>去点评</a> --></p></td>
							</tr>
							</table>
							</div> 
							</div>
	   					</c:forEach>
	         		</ul>
	         		</c:if>
           		</c:if>
           		<!-- 没有点评 -->
           		<c:if test="${pageList.getTotal() == 0}">
           			<div class='noResultComment'>
						<span class='cmt-noResult-head'></span>
						<p>您当前还没有点评订单哦~</p>
					</div>
           		</c:if>
				
            </div>
            <!-- 分页 -->
           	<div class="page_box mart20">
				<div id="pages_" class="pages" style="null">
					<div id="lv_page"><div class="Pages">
						<c:choose>
							<c:when test="${pageList.getPageNum() == 1 }">
								<a href="#" title="上一页" class="PrevPage">上一页</a>
							</c:when>
							<c:otherwise>
								<a href="mySpaceCommon?type=${type }&pageNum=${pageList.getPageNum() - 1 }" title="上一页" class="PrevPage">上一页</a>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="1" end="${pageList.getPages() }" varStatus="index">
							<c:choose>
								<c:when test="${pageList.getPageNum() == index.index }">
									<span class="PageSel">${index.index }</span>
								</c:when>
								<c:otherwise>
									<a href="mySpaceCommon?type=${type }&pageNum=${index.index }" class="PageLink" title="第 ${index.index }页">${index.index }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageList.getPageNum() == pageList.getPages() }">
								<a href="#" title="下一页" class="NextPage">下一页</a><br>
							</c:when>
							<c:otherwise>
								<a href="mySpaceCommon?type=${type }&pageNum=${pageList.getPageNum() + 1 }" title="下一页" class="NextPage">下一页</a><br>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>							
			</div>
            <!-- 已点评 -->
            <div class="cmt-ed" id="alreadyComment" >
            </div>
        </div>
        <!--点评列表 结束-->

        <!--点评QA 开始-->
        
        <!--点评QA 结束-->
    </div>
    <!--右侧 结束--> <!-- newmember_rightside -->
</div> <!-- newmember_main -->
<!-- 会员中心页面结束-->
<div class="fixPic"></div>
<script src="js/footer.js" type="text/javascript"></script>
</body>

</html>