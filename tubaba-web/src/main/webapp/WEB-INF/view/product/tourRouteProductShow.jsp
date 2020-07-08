<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>旅游路线产品展示模板</title>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fh-icon-ac.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tourRouteProductShow.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/poplogin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lvSide.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>

</head>
<body>
<!-- 旅游路线id -->
<input id="scenicwayId" type="hidden" value="${id}">
<!-- 用户id -->
<input id="userId" type="hidden" value="${userid}">
<!-- 头部页面 开始 -->
<jsp:include page="../../../head.jsp"></jsp:include>
<!-- 头部页面 结束 -->
<div class="everything">
	<form id="reservationForm" action="../../indent/enterIntoFillInOrderForm" method="post">
		<input name="scenicwayId" type="hidden">
		<input name="atrtitle" type="hidden">
		<input name="name" type="hidden">
		<input name="description" type="hidden">
		<input name="departCity" type="hidden">
		<input name="departDate" type="hidden">
		<input name="returnDate" type="hidden">
		<input name="adultNumber" type="hidden">
		<input name="adultPrice" type="hidden">
		<input name="childrenNumber" type="hidden">
		<input name="childrenPrice" type="hidden">
		<input name="totalPrice" type="hidden">
	</form>
	<!--页面主体内容  开始-->
    <div class="wrap">

        <!--面包屑  开始-->
        <div id="scenicwayClassify" class="crumbs clearfix">
            <div class="crumbs-link">
                <!-- 
                <a href="http://dujia.lvmama.com/" rel="nofollow" hidefocus="false">度假旅游</a>
            		&gt;
                <a href="http://dujia.lvmama.com/tour/hainan267/group" hidefocus="false">海南跟团游</a>
                    &gt;
                <a href="http://dujia.lvmama.com/tour/sanya272/group" hidefocus="false">三亚跟团游</a>
                    &gt;
                <span>天津到三亚跟团游</span> 
                -->
            </div>
        </div>
        <!--面包屑  结束-->

        <!--首屏产品介绍模块  开始-->
        <div id="firstScreenProductIntroduction" class="detail_top_all clearfix">

            <!-- 二维码 -->
            <div class="detail_product_ewm detail_icon_hotel_flight">
                <div class="ewm_box">
                    <img src="${pageContext.request.contextPath}/image/636534-D14.png" width="100" height="100" alt="">
                    <p>手机扫码更优惠</p>
                </div>
            </div>
            <!-- 产品标题 -->
            <h1 class="detail_product_tit">  
                <!-- <b>【爆款热卖】三亚双飞5日跟团游</b>
               &nbsp;&nbsp;巨无霸红树林度假世界 纯玩零购 享海南四大名菜 限时0元换购海景小套房 赠海南特产礼盒 特惠可选升级亚马逊水乐园
	                         <a target="_blank" href="http://www.lvmama.com/public/levelLD" hidefocus="false"><span class="js_tip icon-level-five" tip-content="【小众高逼格】"></span></a>
                            	<span class="tagsback tagsback-orange" tip-content="驴客，为你的生活严选！"><em>驴妈妈严选</em></span>
                            	<span class="tagsback tagsback-orange" tip-content="特价优惠产品，详见页面具体描述。"><em>尾单</em></span>
                        
 				-->
            </h1>
            <p class="detail_product_num">
                <!--判断是不是半自助 -->
               <!--  
                <span class="dpn_group">跟团游</span>
                <i>产品编号：636534</i>
                                          本产品委托社为海南椰晖旅行社有限公司，具体的旅游服务和操作由委托社提供。
               -->
            </p>

            <div class="product_top_box clearfix">
                <!--首屏右侧  开始-->
                <div class="product_top_l">

                    <div class="img_scroll_all js_top_img_scroll">
                        <div class="img_scroll_box" style="position: relative; overflow: hidden;">
                            <ul class="img_scroll_list" style="position: absolute; left: 0px; top: 0px; width: 6838px;">
                            </ul>
                        </div>
                        <div class="img_scroll_tab" style="position: relative; overflow: hidden;">
                            <ul class="img_scroll_tab_list" style="position: absolute; left: 0px; top: 0px; width: 920px;">
                            </ul>
                        </div>
                        <span class="img_scroll_l"><i class="detail_icon_hotel_flight"></i></span>
                        <span class="img_scroll_r"><i class="detail_icon_hotel_flight"></i></span>
                    </div>

                    <div class="calendar-box">
                        <div class="calendar-tabs clearfix">
                            <div class="calendar-tabs-prev disabled"></div>
                            <div class="calendar-tab-box">
                                <div class="calendar-tab active" data-date="2018-11">
                                    <a hidefocus="false">
                                        <div class="calendar-tab-month"></div>
                                        <div class="calendar-tab-price">￥<span></span>起</div>
                                    </a>
                                </div>
                            </div>
                            <div class="calendar-tabs-next disabled"></div>
                       	</div>
						<div class="abroad-group-calendar">
							<div class="ui-calendar ui-calendar-big" data-bimonthly="false"
								data-float="false">
								<span class="month-prev" title="上一月" style="display: none;">‹</span><span
									class="month-next" title="下一月">›</span>
								<div class="calwrap clearfix">
									<div class="calmonth" data-offset="0">
										<div class="caltitle">
											<span class="mtitle">2018年11月</span>
										</div>
										<div class="calbox">
											<table class="caltable">
												<thead>
													<tr>
														<th class="sun">日</th>
														<th class="mon">一</th>
														<th class="tue">二</th>
														<th class="wed">三</th>
														<th class="thu">四</th>
														<th class="fri">五</th>
														<th class="sat">六</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td data-week="0" data-date-map="2018-10-28">
															<div
																class="date caldate">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="1" data-date-map="2018-10-29">
															<div
																class="date caldate">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="2" data-date-map="2018-10-30">
															<div
																class="date caldate">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="3" data-date-map="2018-10-31">
															<div
																class="date caldate">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="4" data-date-map="2018-11-01">
															<div class="date caldate nodate caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="5" data-date-map="2018-11-02">
															<div class="date caldate nodate caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="6" data-date-map="2018-11-03">
															<div class="date caldate nodate caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
													</tr>
													<tr>
														<td data-week="0" data-date-map="2018-11-04">
															<div class="date caldate nodate caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="1" data-date-map="2018-11-05">
															<div class="date caldate nodate caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="2" data-date-map="2018-11-06">
															<div class="date caldate nodate caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="3" data-date-map="2018-11-07">
															<div class="date caldate nodate caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="4" data-date-map="2018-11-08">
															<div class="date caldate nodate caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="5" data-date-map="2018-11-09">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice"></div>
																<div class="calactive"></div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="6" data-date-map="2018-11-10"
															data-aud-price2018-11-10="3320"
															data-children-price2018-11-10="0"
															linerouteid2018-11-10="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
													</tr>
													<tr>
														<td data-week="0" data-date-map="2018-11-11"
															data-aud-price2018-11-11="2530"
															data-children-price2018-11-11="0"
															linerouteid2018-11-11="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="1" data-date-map="2018-11-12"
															data-aud-price2018-11-12="2480"
															data-children-price2018-11-12="0"
															linerouteid2018-11-12="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="2" data-date-map="2018-11-13"
															data-aud-price2018-11-13="2790"
															data-children-price2018-11-13="0"
															linerouteid2018-11-13="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="3" data-date-map="2018-11-14"
															data-aud-price2018-11-14="2740"
															data-children-price2018-11-14="0"
															linerouteid2018-11-14="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="4" data-date-map="2018-11-15"
															data-aud-price2018-11-15="2740"
															data-children-price2018-11-15="0"
															linerouteid2018-11-15="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="5" data-date-map="2018-11-16"
															data-aud-price2018-11-16="2580"
															data-children-price2018-11-16="0"
															linerouteid2018-11-16="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="6" data-date-map="2018-11-17"
															data-aud-price2018-11-17="2980"
															data-children-price2018-11-17="0"
															linerouteid2018-11-17="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
													</tr>
													<tr>
														<td data-week="0" data-date-map="2018-11-18"
															data-aud-price2018-11-18="3290"
															data-children-price2018-11-18="0"
															linerouteid2018-11-18="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="1" data-date-map="2018-11-19"
															data-aud-price2018-11-19="2380"
															data-children-price2018-11-19="0"
															linerouteid2018-11-19="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="2" data-date-map="2018-11-20"
															data-aud-price2018-11-20="3040"
															data-children-price2018-11-20="0"
															linerouteid2018-11-20="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="3" data-date-map="2018-11-21"
															data-aud-price2018-11-21="3060"
															data-children-price2018-11-21="0"
															linerouteid2018-11-21="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="4" data-date-map="2018-11-22"
															data-aud-price2018-11-22="3060"
															data-children-price2018-11-22="0"
															linerouteid2018-11-22="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="5" data-date-map="2018-11-23"
															data-aud-price2018-11-23="2790"
															data-children-price2018-11-23="0"
															linerouteid2018-11-23="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="6" data-date-map="2018-11-24"
															data-aud-price2018-11-24="2640"
															data-children-price2018-11-24="0"
															linerouteid2018-11-24="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
													</tr>
													<tr>
														<td data-week="0" data-date-map="2018-11-25"
															data-aud-price2018-11-25="2950"
															data-children-price2018-11-25="0"
															linerouteid2018-11-25="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="1" data-date-map="2018-11-26"
															data-aud-price2018-11-26="2950"
															data-children-price2018-11-26="0"
															linerouteid2018-11-26="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="2" data-date-map="2018-11-27"
															data-aud-price2018-11-27="2550"
															data-children-price2018-11-27="0"
															linerouteid2018-11-27="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="3" data-date-map="2018-11-28"
															data-aud-price2018-11-28="2520"
															data-children-price2018-11-28="0"
															linerouteid2018-11-28="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="4" data-date-map="2018-11-29"
															data-aud-price2018-11-29="2610"
															data-children-price2018-11-29="0"
															linerouteid2018-11-29="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="5" data-date-map="2018-11-30"
															data-aud-price2018-11-30="2740"
															data-children-price2018-11-30="0"
															linerouteid2018-11-30="164613">
															<div class="date caldate today caldisabled">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="6" data-date-map="2018-12-01"
															data-aud-price2018-12-01="2740"
															data-children-price2018-12-01="0"
															linerouteid2018-12-01="164613">
															<div class="date caldate today caldisabled notThisMonth">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
													</tr>
													<tr>
														<td data-week="0" data-date-map="2018-12-02"
															data-aud-price2018-12-02="2740"
															data-children-price2018-12-02="0"
															linerouteid2018-12-02="164613">
															<div class="date caldate today caldisabled notThisMonth">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="1" data-date-map="2018-12-03"
															data-aud-price2018-12-03="3190"
															data-children-price2018-12-03="0"
															linerouteid2018-12-03="164613">
															<div class="date caldate today caldisabled notThisMonth">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="2" data-date-map="2018-12-04"
															data-aud-price2018-12-04="3020"
															data-children-price2018-12-04="0"
															linerouteid2018-12-04="164613">
															<div class="date caldate today caldisabled notThisMonth">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="3" data-date-map="2018-12-05"
															data-aud-price2018-12-05="2740"
															data-children-price2018-12-05="0"
															linerouteid2018-12-05="164613">
															<div class="date caldate today caldisabled notThisMonth">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																	<div class="calsale"></div>
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="4" data-date-map="2018-12-06"
															data-aud-price2018-12-06="2700"
															data-children-price2018-12-06="0"
															linerouteid2018-12-06="164613">
															<div class="date caldate today caldisabled notThisMonth">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="5" data-date-map="2018-12-07"
															data-aud-price2018-12-07="2740"
															data-children-price2018-12-07="0"
															linerouteid2018-12-07="164613">
															<div class="date caldate today caldisabled notThisMonth">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
														<td data-week="6" data-date-map="2018-12-08"
															data-aud-price2018-12-08="2880"
															data-children-price2018-12-08="0"
															linerouteid2018-12-08="164613">
															<div class="date caldate today caldisabled notThisMonth">
																<div class="calday"></div>
																<div class="calinfo"></div>
																<div class="calprice">
																</div>
																<div class="calactive">
																</div>
																<div class="calselected"></div>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
											<div class="month-loading" style="display: none;"></div>
										</div>
									</div>
								</div>
								<div class="nova-calendar-tip">
									<i></i>因最低价实时变化，请以实际价格为准
								</div>
							</div>
						</div>
					</div>
                </div>

                <!--首屏右侧  开始-->
                <div class="product_top_r">
                    <!--开心驴行-->
	                <div class="product_top_price_box">
	                    <dl class="product_info" style="padding: 20px 0 1px 88px">
	                        <dt>驴妈妈价：</dt>
	                        <dd>
	                            <p class="product_top_price">
		                            <span class="price_num">
		                            	<b>¥</b>
		                            </span>
		                            <!-- 起/人(最少成团人数:10人) -->
	                            </p>
	                            <span class="price_sm js_tip" tip-content="本起价是指未包含附加服务（如单人房差、保险费等）的基本价格。您最终确认的价格将会随所选出行日期、人数及服务项目而相应变化">起价说明</span>
	                        </dd>
	                    </dl>
	                    <div class="product_top_dp">
	                     	<div class="product_top_dp_left" target="">
	                            <i>好评率</i>
	                            
	                        </div>
	                        <a class="product_top_dp_right" style="margin-top: 5px" id="appraise" hidefocus="false">
	                            <span>
	                                <i></i>条点评
	                            </span>
	                            <span style="display: none">
	                            </span>
	                        </a>
	                    </div>
	                    <span class="detail_icon_hotel_flight detail_icon_sj"></span>
	                </div>

	                <dl class="product_info clearfix product_info_promotion">
	                    <dt>促销信息：</dt>
	                    <dd>
	                        <ul class="liner-discount-container">
	                            <!-- 
	                            <li>
	                              	<span class="liner-discount-icon"></span>
	                              	<span class="liner-discount-content"> 每满2000减100元(超级会员专享，每用户限2次，最高立减500元）</span>
	                            </li>
	                            <li>
	                              	<span class="liner-discount-icon"></span>
	                              	<span class="liner-discount-content"> 提前20天立减100元/成人</span>
	                            </li>
	                            <li>
	                              	<span class="liner-discount-icon"></span>
	                              	<span class="liner-discount-content"> 提前10天，立减60元/成人</span>
	                            </li> 
	                            -->
	                        </ul>
	                        <div class="liner-discount-expand">
	                        	<a href="#pd-sale-info" class="liner-discount-expand-rules" hidefocus="false">优惠规则&gt;</a>
	                        </div> 
	                    </dd>
	               </dl>
                   <!--  
                   <dl class="product_info clearfix">
                        <dt>优惠信息：</dt>
                        <dd>
                         
                                    <span class="tags101 js_tip" tip-content="从2014年12月08日起到2018年12月31日发表订单游记，审核通过即返20.00元，精华游记即返100.00元。更多精彩活动请查看游记频道。">游记返现</span>
                        </dd>
                    </dl> 
                    -->
                   	<!-- 红包列表-->
                	<!-- <div id="couponInfo_content"></div> -->
	                <form method="post" action="http://www.lvmama.com/vst_front/book/route/fillOrderDetail.do" id="submitDataForm" accept-charset="utf-8">
	                    <input type="text" id="orderJson" name="orderJson" value="" hidden="hidden">
	                    <input type="text" id="calendarJson" name="calendarJson" value="" hidden="hidden">
	                    <input type="hidden" id="productPageUrl" name="productPageUrl">
	                    <input type="hidden" id="notSell" name="notSell" value="N">
	                </form>
	                <div class="product_info_hr"></div>
	                <dl class="product_info">
                        <dt>目&nbsp;&nbsp;的&nbsp;&nbsp;地：</dt>
                        <dd></dd>
                    </dl>
                    <dl class="product_info">
                        <dt>游玩天数：</dt>
                        <dd></dd>
                    </dl>
	                <!--
	                <dl class="product_info ">
	                    <dt>行程天数：</dt>
	                    <dd>
	                        <ul class="xc_tab js_xc_tab">
	                            <li class="active" onclick="selectDays(this)" data="636534" data1="5" data2="4">5天4晚<i class="group_icon icon_gou"></i></li>
	                            <li onclick="selectDays(this)" data="636534" data1="6" data2="5">6天5晚<i class="group_icon icon_gou"></i></li>
	                            <li onclick="selectDays(this)" data="636534" data1="8" data2="7">8天7晚<i class="group_icon icon_gou"></i></li>
	                            <li onclick="selectDays(this)" data="636534" data1="7" data2="6">7天6晚<i class="group_icon icon_gou"></i></li>
	                        </ul>
	                    </dd>
	                </dl>
	                -->
	                <!-- 两种交通显示，根据需求选择 有往返交通就没有交通方式 -->
	                <!-- 
	                <dl class="product_info" id="trafficStyle">
		                <dt>交通方式：</dt>                
		                <dd>
			                <ul class="xc_tab js_xc_tab">
			              		<li class="active" onclick="selectTraffic(this)" data="15" data2="636534">去-飞机 返-飞机<i class="group_icon icon_gou"></i></li>
			                </ul>
		                </dd>
	            	</dl>  
	            	-->
                    <!-- 首屏预订模块 -->
                    <div class="product_top_booking">
                        <dl class="product_info clearfix">
                            <dt>出发城市：</dt>
                            <dd class="clearfix">
	                            <!-- 多出发地 -->
	                            <div class="start_city_box js_start_city clearfix">
	                                <div class="start_city_input"></div>
	                                <p>（1个城市可选）</p>
	                                <span class="icon_arrownew"><i>◆</i><b>◆</b></span>
	                                <div class="scb_line"></div>
	                                <!-- 出发城市 -->
	
	                            </div>
                            </dd>
                        </dl>
                        <dl class="product_info clearfix">
                            <dt>游玩日期：</dt>
                            <dd>
                                <input type="hidden" value="1">
                                <input class="preorder-start-time" id="preorder-start-time" type="hidden" placeholder="请选择出行日期" autocomplete="off">
                                <div class="playtime">
                                    <span class="placeholder">请选择出发日期</span>
                                    <input class="js_playtime" type="text" value="" readonly="" 
                                    	onclick="$('#dateOfVisit').show();" onblur="hideDateOfVisit()">
                                    <input id="mouseFlag" type="hidden" value="0"/>
                                    <i></i>
                                </div>
                            </dd>
                        </dl>
                        <dl class="product_info clearfix">
                            <dt>出游人数：</dt>
                            <dd>
                                <input type="hidden" id="preorder-quantity" value="N">
                                <div class="product_info_number">
										<div class="nova-select-label">
											<label> <select id="adultCount"
												class="adult-count selectModel" data-class="selectbox-mini"
												name="adultQuantity" style="display: none;">
													<option value="1">1</option>
													<option value="2" selected="selected">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
											</select>

											</label>
											<div class="nova-select opened" type="adultNumber"
												onclick="togglePeopleNumber(this)">
												<div class="nova-select-toggle">
													<em>2</em><b><i></i></b>
												</div>
												<div class="nova-select-dropdown" 
													onmouseout="$(this).find('.flag').text(0)"
												style="z-index: 23;position: absolute; top: 30px; left: 0px; width: 98px;">
													<div class="flag" name="adult" style="display:none;">0</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(1)">1</div>
													<div class="nova-select-option active" onmouseover="$(this).parent().find('.flag').text(2)">2</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(3)">3</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(4)">4</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(5)">5</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(6)">6</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(7)">7</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(8)">8</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(9)">9</div>
												</div>
											</div>
										</div>
										<span id="adultPriceDesc" style="display:block">
		                                    <span class="c_f60">¥</span>
		                                    <span class="c_999 product_info_number_slash">/</span>
		                                    <span class="c_999">成人</span>
                                    	</span>
                                     
                                </div>
                                <div class="product_info_number">
										<div class="nova-select-label">
											<label> <select id="childrenCount"
												style="display: none;">
													<option value="0">0</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
											</select>
											</label>
											<div class="nova-select opened" type="adultNumber" onclick="togglePeopleNumber(this)">
												<div class="nova-select-toggle">
													<em>0</em><b><i></i></b>
												</div>
												<div class="nova-select-dropdown" 
													onmouseout="$(this).find('.flag').text(0)"
												style="z-index: 23;position: absolute; top: 70px; left: 0px; width: 98px;">
													<div class="flag" name="children" style="display:none;">0</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(1)">1</div>
													<div class="nova-select-option active" onmouseover="$(this).parent().find('.flag').text(2)">2</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(3)">3</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(4)">4</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(5)">5</div>
													<div class="nova-select-option" onmouseover="$(this).parent().find('.flag').text(6)">6</div>
												</div>
											</div>
										</div>
										<span id="childPriceDesc" style="display: none;">
                                    <span class="c_f60"></span>
                                      <span class="c_999 product_info_number_slash">/</span>
                                    <span class="c_999">儿童</span>
                                    </span>
                                    <span class="nova-icon-xs nova-icon-help"></span>
                                    <span class="price_sm js_tip" tip-content="2-12 岁以下儿童仅含往返机票、当地旅游车位、导游服务、半价正餐，不占床位不含早餐，如产生门票等费用请自理。">儿童标准价</span>
                                </div>
                                <!--<span class="nova-tip-form">
                                <span class="nova-icon-xs nova-icon-warning"></span>本团期不支持儿童出游</span>-->
                            </dd>
                        </dl>
                        <dl class="product_info clearfix">
                            <dt></dt>
                            <dd class="clearfix">
                                <a class="btn btn-xl btn-orange btn-disabled product-info-start" data-tag="submitbutton" hidefocus="false" onclick="reservation(this)">
                                  	  立即预订
                                    <div class="product-info-start-tip">
                                        <i></i>
                                        <span class="nova-icon-sm nova-icon-warning"></span>请先选择产品出发日期
                                    </div>
                                </a>
                                <!--<span class="btn btn-xl product_info_btn_qrcode">扫码购<i></i><b></b></span>-->
                                <a id="collect" class="favorites" isCollect="false" onclick="collectAndCancelCollect()"><i class="detail_icon_hotel_flight"></i><span>收藏</span></a>
                                <span class="pi-telephone">客服热线：<em>1010-6060</em></span>
                            </dd>
                        </dl>

                    </div>

                    <div class="product_info_hr"></div>

                </div><!--首屏右侧  结束-->
            </div>
        </div>
        <!--首屏产品介绍模块  结束-->
        <!-- 点评 -->
		<div id="remark" class="product-module pd-comment">
		    <div class="pd-title"><em><i></i><b>驴友点评</b></em></div>
		    <div class="pd-section-content">
		        <div class="comwrap">
				<!-- 点评信息概况 -->
				<div class="new-cominfo">
				    <div class="comstati clearfix">
                       <div class="com-count">
                           <i class="percentum f60" data-mark="dynamicNum" data-level="100"></i><span class="f60">%</span>
                           <em>好评率</em>
                           <em>来自<a class="f60" hidefocus="false"></a>位驴友的真实点评</em>
                       </div>
				
				        <div class="com-btns">
				            <a class="nlogin" onclick="writeRemark()" rel="nofollow" hidefocus="false">有订单，写体验点评返奖金</a>
				        </div>
				    </div><!-- //com-btns -->
				</div>
		
				<div class="comheatd">
				    <ul class="comheatd-ul JS_com-tabnav">
			            <li class="active"><a href="javascript:;" hidefocus="false" id="allCmt" rel="nofollow">全部点评<span></span></a></li>
				    </ul>
				</div><!-- //comhead -->
		
	            <div class="JS_com-content">
	                <!-- 点评 -->
	                <div class="comment-list com-all" style="display:block" id="allCmtComment">
		
		            </div>
		        </div>
		        <div id="writeRemark" style="display: none;">
		        	<label>分数区</label>
		        	<br>
		        	<select>
		        		<option value="5" selected="selected">5</option>
		        		<option value="4">4</option>
		        		<option value="3">3</option>
		        		<option value="2">2</option>
		        		<option value="1">1</option>
		        	</select>
		        	<br>
		        	<label>评论区</label>
		        	<br>
		        	<textarea rows="15" cols="60"></textarea>
		        	<br>
		        	<input type="button" onclick="submitRemark()" value="发表评论">
		        	&nbsp;&nbsp;&nbsp;
		        	<input type="button" onclick="$('#writeRemark textarea').text('');$('#writeRemark').hide();" value="取消">
		        </div>
		    </div>
		</div>
    </div>
    
	<!--页面主体内容  结束-->
	<div id="dateOfVisit" class="ui-calendar ui-calendar-mini playtime-calendar"
	data-bimonthly="true" data-float="true"
	style="display: none;top: 510px; left: 767px; z-index: 23; width: 234px;"
	onmouseover="$('#mouseFlag').val(1)" onmouseout="$('#mouseFlag').val(0)"
	>
	<div class="calwrap clearfix">
		<div class="calmonth" data-offset="0">
			<div class="caltitle">
				<span class="mtitle"></span>
			</div>
			<div class="calbox">
				<table class="caltable">
					<thead>
						<tr>
							<th class="sun">日</th>
							<th class="mon">一</th>
							<th class="tue">二</th>
							<th class="wed">三</th>
							<th class="thu">四</th>
							<th class="fri">五</th>
							<th class="sat">六</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td data-week="0" data-date-map="2018-10-28">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="1" data-date-map="2018-10-29">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="2" data-date-map="2018-10-30">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="3" data-date-map="2018-10-31">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="4" data-date-map="2018-11-01">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="5" data-date-map="2018-11-02">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="6" data-date-map="2018-11-03">
								<div class="date caldate nodate caldisabled"></div>
							</td>
						</tr>
						<tr>
							<td data-week="0" data-date-map="2018-11-04">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="1" data-date-map="2018-11-05">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="2" data-date-map="2018-11-06">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="3" data-date-map="2018-11-07">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="4" data-date-map="2018-11-08">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="5" data-date-map="2018-11-09">
								<div class="date caldate today caldisabled"></div>
							</td>
							<td data-week="6" data-date-map="2018-11-10">
								<div class="date caldate caldisabled"></div>
							</td>
						</tr>
						<tr>
							<td data-week="0" data-date-map="2018-11-11"
								data-aud-price2018-11-11="2530"
								data-children-price2018-11-11="0"
								linerouteid2018-11-11="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="1" data-date-map="2018-11-12"
								data-aud-price2018-11-12="2880"
								data-children-price2018-11-12="0"
								linerouteid2018-11-12="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="2" data-date-map="2018-11-13"
								data-aud-price2018-11-13="2260"
								data-children-price2018-11-13="0"
								linerouteid2018-11-13="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="3" data-date-map="2018-11-14"
								data-aud-price2018-11-14="3220"
								data-children-price2018-11-14="0"
								linerouteid2018-11-14="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="4" data-date-map="2018-11-15"
								data-aud-price2018-11-15="2760"
								data-children-price2018-11-15="0"
								linerouteid2018-11-15="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="5" data-date-map="2018-11-16"
								data-aud-price2018-11-16="2460"
								data-children-price2018-11-16="0"
								linerouteid2018-11-16="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="6" data-date-map="2018-11-17"
								data-aud-price2018-11-17="2980"
								data-children-price2018-11-17="0"
								linerouteid2018-11-17="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
						</tr>
						<tr>
							<td data-week="0" data-date-map="2018-11-18"
								data-aud-price2018-11-18="2710"
								data-children-price2018-11-18="0"
								linerouteid2018-11-18="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="1" data-date-map="2018-11-19"
								data-aud-price2018-11-19="2980"
								data-children-price2018-11-19="0"
								linerouteid2018-11-19="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="2" data-date-map="2018-11-20"
								data-aud-price2018-11-20="2710"
								data-children-price2018-11-20="0"
								linerouteid2018-11-20="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="3" data-date-map="2018-11-21"
								data-aud-price2018-11-21="3090"
								data-children-price2018-11-21="0"
								linerouteid2018-11-21="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="4" data-date-map="2018-11-22"
								data-aud-price2018-11-22="2470"
								data-children-price2018-11-22="0"
								linerouteid2018-11-22="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="5" data-date-map="2018-11-23"
								data-aud-price2018-11-23="2680"
								data-children-price2018-11-23="0"
								linerouteid2018-11-23="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="6" data-date-map="2018-11-24"
								data-aud-price2018-11-24="3030"
								data-children-price2018-11-24="0"
								linerouteid2018-11-24="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
						</tr>
						<tr>
							<td data-week="0" data-date-map="2018-11-25"
								data-aud-price2018-11-25="2810"
								data-children-price2018-11-25="0"
								linerouteid2018-11-25="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="1" data-date-map="2018-11-26"
								data-aud-price2018-11-26="2810"
								data-children-price2018-11-26="0"
								linerouteid2018-11-26="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="2" data-date-map="2018-11-27"
								data-aud-price2018-11-27="3010"
								data-children-price2018-11-27="0"
								linerouteid2018-11-27="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="3" data-date-map="2018-11-28"
								data-aud-price2018-11-28="2520"
								data-children-price2018-11-28="0"
								linerouteid2018-11-28="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="4" data-date-map="2018-11-29"
								data-aud-price2018-11-29="2610"
								data-children-price2018-11-29="0"
								linerouteid2018-11-29="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="5" data-date-map="2018-11-30"
								data-aud-price2018-11-30="3010"
								data-children-price2018-11-30="0"
								linerouteid2018-11-30="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="6" data-date-map="2018-12-01"
								data-aud-price2018-12-01="3230"
								data-children-price2018-12-01="0"
								linerouteid2018-12-01="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
						</tr>
						<tr>
							<td data-week="0" data-date-map="2018-12-02"
								data-aud-price2018-12-02="3230"
								data-children-price2018-12-02="0"
								linerouteid2018-12-02="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="1" data-date-map="2018-12-03"
								data-aud-price2018-12-03="3020"
								data-children-price2018-12-03="0"
								linerouteid2018-12-03="164613">
								<div class="date nodate notThisMonth"></div>
							</td>
							<td data-week="2" data-date-map="2018-12-04"
								data-aud-price2018-12-04="3020"
								data-children-price2018-12-04="0"
								linerouteid2018-12-04="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="3" data-date-map="2018-12-05"
								data-aud-price2018-12-05="3230"
								data-children-price2018-12-05="0"
								linerouteid2018-12-05="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="4" data-date-map="2018-12-06"
								data-aud-price2018-12-06="3140"
								data-children-price2018-12-06="0"
								linerouteid2018-12-06="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="5" data-date-map="2018-12-07"
								data-aud-price2018-12-07="2740"
								data-children-price2018-12-07="0"
								linerouteid2018-12-07="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
							<td data-week="6" data-date-map="2018-12-08"
								data-aud-price2018-12-08="2880"
								data-children-price2018-12-08="0"
								linerouteid2018-12-08="164613">
								<div class="date caldate nodate caldisabled"></div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="month-loading" style="display: none;"></div>
			</div>
		</div>
	</div>
	</div>

	<!-- 底部页面 开始 -->
<jsp:include page="../../../floor.jsp"></jsp:include>
<!-- 底部页面 结束 -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/product/tourRouteProductShow.js"></script>
</body>
</html>