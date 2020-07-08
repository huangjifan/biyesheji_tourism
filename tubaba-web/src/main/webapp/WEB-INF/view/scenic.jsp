<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Language" content="zh-CN">
<title>${scen.headline}</title>
<!--生产线引用-->
<link rel="canonical" href="http://ticket.lvmama.com/scenic-11345021">
<link rel="stylesheet"
	href="css/indexscenic.css">
<link rel="stylesheet" href="css/scenic.css">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
</head>
<body class="ticket responsive ticket_revision" allyes_city="CD">
<!-- 头部页面 开始 -->
<jsp:include page="../../head.jsp"></jsp:include>
<!-- 头部页面 结束 -->
	<!-- 导航标签渲染 -->
	<!-- 引用导航 结束 -->
	<input id="destId" value="121200" style="display: none">
	<!-- wrap\\ 1 -->
	<div class="body_bg">
	<c:if test="${error==null}">
		<div class="dest-main">
			<!--面包屑导航-->
			<!--组装面包屑和天气-->
			<div class="overview">
				<div class="dtitle clearfix">
					<span class="xorder"> <span class="price"><dfn>
								¥<i>${scen.floor_price }</i>
								<input type="hidden" id="check" value="${userid}"/>
							</dfn>起</span> <a href="#destorder" class="btn btn-large btn-reision"><span
							class="btn-text">立即预订</span></a>
					</span>
					<div class="titbox">
						<h1 class="tit"  title="${scen.scenicname }">${scen.scenicname }</h1>
						<input type="hidden" id="scenicName" value="${scen.scenicname }">
						<input type="hidden" id="titlescenic" value="${scen.scenicname }">
					</div>
				</div>
				<div class="dcontent clearfix">
					<!--组装产品图片-->
					<div class="ticket_img_scroll">

						<div class="datu fl">
							<a href="javascript:;" class="datu_prev"></a> <a
								href="javascript:;" class="datu_next"></a>
							<ul class="pic_mod_ul">
								<c:forEach items="${scenimagelist }" var="image">
									<li style="display: none;"><img src="${image.path }"
										width="462" height="308"></li>
								</c:forEach>
							</ul>
						</div>
						<div class="xtu fr" style="height: 271px;">

							<dl class="pic_tab_dl" style="width: 95px; top: -1035px;">
								<c:forEach items="${scenimagelist }" var="image">
									<dd class="">
										<img src="${image.path }" width="95" height="64">
										<div class="ticket_meng"></div>
									</dd>
								</c:forEach>
								<dt style="top: 1173px;"></dt>
							</dl>
						</div>
						<span class="pic_left"></span> <span class="pic_right"></span>
					</div>
					<div class="dinfo">
						<div class="sec-info">
							<div class="sec-inner">
								<c:if test="${bool==true}">
									<p class="btn_collect clearfix current">
							            <span class="icon icon_collectXin" onclick="getcollection(${scen.id })"></span>
							            <span class="collectText" onclick="getcollection(${scen.id })">收藏</span>
						 	            <span class="collectedText" onclick="getcollection(${scen.id })">已收藏</span>
							            <span class="cancelText" onclick="getcollection(${scen.id })">取消收藏</span>
							        </p>
						        </c:if>
						        <c:if test="${bool==false}">
							        <p class="btn_collect clearfix">
							            <span class="icon icon_collectXin" onclick="getcollection(${scen.id })"></span>
							            <span class="collectText" onclick="getcollection(${scen.id })">收藏</span>
							            <span class="collectedText" onclick="getcollection(${scen.id })">已收藏</span>
							            <span class="cancelText" onclick="getcollection(${scen.id })">取消收藏</span>
							        </p>
						        </c:if>
								<dl class="dl-hor">
									<dt>景点地址：</dt>
									<dd>
										<p class="linetext" title="${scen.address }">${scen.address }</p>
									</dd>
								</dl>
								<dl class="dl-hor index2">
									<dt>精彩活动：</dt>
									<dd>
										<p>
											<a class="c_f60" href="#jdhd" title="">
												兔爸爸旅游·${scen.headline }</a><i
												class="icon icon_hot css3_runs css3_jump"></i>
										</p>
									</dd>
								</dl>

								<!--领红包-->
							</div>
						</div>
						<!--有精华点评显示下面的div-->
						<div class="comment-info">
							<div class="pj_t">
								<div class="pj_tab">
									<a href="javascript:;">上一条</a> <a href="javascript:;">下一条</a>
								</div>
								<div class="c_09c">
									<i class="icon"></i> <span><i data-mark="dynamicNum"
										data-level="100">100</i>%</span> <i class="good_recon">好评</i> <i
										class="verticle_line"></i> <a href="#yhdp" hidefocus="false">
										查看${count }人点评</a>
								</div>
							</div>
							<div class="quote">
								<i class="qstart">"</i> <i class="qend">"</i>
								<ul class="pj_list">
								<c:forEach items="${remarklist }" var="remark">
									<li class="active"
										title="${remark.content }">
										<i class="ellipsis_icon">...</i>${remark.content }
									</li>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
	<!-- 收藏 -->
		<script type="text/javascript">
		
		function getcollection(scenicId){
			var foll=false;
			if($("#check").val()==null||$("#check").val()==""){
				 alert("请先登录");
				 location.href="login";
			}else{
				$.ajax({
					url:"collect/queryCollectByUserIdAndScenicIdOrScenicwayId",
					async:false,
					data:{
						scenicId:scenicId,
						userId:$("#check").val(),
					},success:function(result){
						foll=result.isCollect;
						/* alert(result.isCollect) */
					}
				})
				if(foll==false){
					$.ajax({
						url:"collect/insertCollect",
						type:"post",
						async:false,
						data:{
							scenicId:scenicId,
							userId:$("#check").val(),
						},success:function(result){
							if(result.success>0){
								alert("收藏成功！！！")
								$("#collections").css("display","none");
								$("#collected").css("display","block");
								$("#cancel").css("display","none");
								location.reload();
							}
						}
					}) 
				}else if(foll==true){
					 $.ajax({
						url:"collect/cancelCollect",
						async:false,
						data:{
							scenicId:scenicId,
							userId:$("#check").val(),
						},success:function(result){
							if(result.success>0){
								alert("已取消收藏！！！")
								$("#collections").css("display","none");
								$("#collected").css("display","none");
								$("#cancel").css("display","block");
								location.reload();
							}
						}
					}) 
				}
			}
		}
	</script>
			<div id="destorder" class="tab-outer mt20">
				<div class="tab-dest tab-fixed" style="">
					<ul class="ul-hor js-ticketTab">
						<li class="active"><a href="javascript:;">景点门票</a></li>
					</ul>
					<span class="nav_tips pa">注：门票限网上及手机客户端预订，不接受电话预订。</span>
				</div>
			</div>
			<!-- 商品列表开始 -->
			<div class="dcontent dorder-list">
				<div class="dpro-list">
					<table class="ptable table-full" style="display: block;">
						<thead class="pttit">
							<tr>
								<td></td>
								<td>
									<dl class="ptditem">
                                    <dd class="pdpaytype">支付方式</dd>
                                    <dd class="pdprefer" style="text-indent: 40px;">价格</dd>                                
                                    <dd class="pdlvprice"></dd>
                                    <dd class="pdprice"></dd>
                                    <dd class="pdAdvbookingTime"></dd>
                                    <dt class="pdname">产品名称</dt>
                                </dl>
								</td>
							</tr>
						</thead>
						<tbody class="ptbox short" id="23446031">
						<c:forEach items="${typelist }" var="type">
							<tr>
								<td class="ptdname">
									<div class="ptname">
									<c:if test="${type.type=='childprice' }">
										<h5>儿童票</h5>
									</c:if>
									<c:if test="${type.type=='adultprice' }">
										<h5>成人票 </h5>
									</c:if>
									</div>
								</td>
								<td>
									<div class="ptdlist">
										<div class="pdlist-inner">
											<!-- 这个是门票的时候价格表-->
											<dl class="ptditem">
												<dd class="pdpaytype">
													<!-- 在线支付ipay 加 ipay-online 景区则不加-->
													<span class="ipay ipay-online"> <i class="itype">
															在线支付 </i> <a href="indentTicket?id=${scen.id }&&type=${type.type}"
														class="btn btn-w btn-small  btn-orange">预订</a>
													</span>
												</dd>
												<dd class="pdlvprice">
													<dfn>
														<i></i><span></span>
													</dfn>
												</dd>
												<dd class="pdlvprice">
													<dfn>
														¥<i>${type.price }</i><span>起</span>
													</dfn>
												</dd>
												<dt class="pdname">
													<c:if test="${type.type=='childprice' }">
														儿童票
													</c:if>
													<c:if test="${type.type=='adultprice' }">
														成人票 
													</c:if>
														[门票]<span class="icon_arrownew"><i>◆</i><b>◆</b></span>
												</dt>
											</dl>
										</div>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--//.dpro-list-->
			</div>

			<!-- 商品列表结束 -->

			<!-- 栏腰banner -->
			<div class="cenBan pr mt20">
				<div class="cenBanTab pa">
					<span class=""></span><span class="active"></span><span class=""></span>
				</div>

				<script type="text/javascript"
					src="http://pic.lvmama.com/styles/zt/ads/lvmama_pc_ad.js"></script>
				<script type="text/javascript"
					src="http://pic.lvmama.com/styles/zt/ads/lvmama_pc_ad.js"></script>
				<script type="text/javascript" id="ads_11_14_279">
					channel_id = "11";
					place_id = "14";
					dest_id = "279";
					adsShow(channel_id, place_id, dest_id);
				</script>
				<ul class="sytopBan-ul">
					<li class=""><a href="http://ticket.lvmama.com/scenic-121200"
						target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','11_14_279_794')">
							<img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-11-05/650b727c-de4e-47ac-9486-82f7e6e215e3.jpg"
							height="60" width="1200">
					</a></li>
					<li class="active"><a
						href="http://ticket.lvmama.com/scenic-10629290" target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','11_14_279_793')">
							<img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-10-12/cd160563-8faf-4e07-9e1a-fae9d43b6aa4.jpg"
							height="60" width="1200">
					</a></li>
					<li class=""><a href="http://ticket.lvmama.com/scenic-151220"
						target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','11_14_279_792')">
							<img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-09-19/6a818fc2-bdf8-4d26-a850-2a1ea8ec9ef7.jpg"
							height="60" width="1200">
					</a></li>
				</ul>
			</div>


			<!-- 浮动导航2 -->
			<div class="tab-outer mt20">
				<div class="tab-dest tab-fixed" style="">
					<ul class="ul-hor J_scrollnav">

						<li date_id="policy" class="active"><a href="javascript:;">预订须知</a>
						</li>
						<li date_id="activity" class=""><a href="javascript:;">精彩活动</a>
							<span class="lv_nav_label"
							style="margin-left: -17px; color: #fff; top: -10px;"> <em>小兔推荐</em><i
								style="top: 16px; left: 50px;"></i></span></li>
						<li date_id="introduction" class=""><a href="javascript:;">景点介绍
						</a></li>
						<li date_id="traffic" class=""><a href="javascript:;">交通指南</a>
						</li>
						<c:if test="${page.list.size()!=0 }">
							<li date_id="comments" class="">驴友点评<span id="totalCmt">(${count })</span></li>
						</c:if>
						<li date_id="product-customer-trip" class="">相关游记<span
							id="totalTrip">(${tralCount })</span></li>
					</ul>
					<a href="#destorder" class="btn btn-large cbtn-orange nav_yd"
						style="display: none;"><span class="btn-text">立即预订</span>
					<!-- <i class="icon icon-r dicon-rarr"></i> --></a>
				</div>
			</div>


			<div class="dside">
				<div class="sidebox dside-search">
					<div class="scontent">
						<hr>
						<dl class="dl-ver">
							<dt>相关景点推荐</dt>
							<dd>
							<c:forEach items="${corrlist }" var="corr">
								<a href="scenic?id=${corr.id }&&pageIndex=0" target="_blank"
									title="${corr.scenicname }">${corr.scenicname }</a> 
								</c:forEach>
							</dd>
						</dl>
					</div>
				</div>
				<div class="sidebox dside-theme">
					<div class="stitle">
						<h3 class="stit">“${scen.title.type }”景点</h3>
					</div>
					<div class="scontent">
					<c:forEach items="${scencorrlist }" var="corrs">
						<dl class="dl-hor">
	                        <dt>
	                            <a href="scenic?id=${corrs.id }&&pageIndex=0" target="_blank">
	                                    <img width="90" height="60" alt="" src="${corrs.coverImage }">
	                            </a>
	                        </dt>
	                        <dd>
	                            <p><a href="scenic?id=${corrs.id }&&pageIndex=0" target="_blank">${corrs.scenicname }</a></p>
	                                <p class="ticket_price_p"><dfn>¥<i>${corrs.floor_price}</i><em>起</em></dfn></p>
	                                <p>
	                                    <span class="tagsback tagsback-orange"><em>点评</em><i>¥1</i></span>
	                                    <span class="tags tagsback tagsback-app">¥1</span>
	                                </p>
	                        </dd>
	                    </dl>
						</c:forEach>
					</div>
				</div>

				<div class="sidebox dside-class">
					<div class="scontent">
						<dl class="dl-class JS_mddshow">
							<dt class="mddTit">
								<span class="icon_arrownew fr"><i>◆</i><b>◆</b></span> 目的地：
							</dt>
							<dd class="mddCon">
							<c:forEach items="${corrlist }" var="corrs">
								<a href="scenic?id=${corrs.id }&&pageIndex=0"
									hidefocus="false" target="_blank"><i class="dian">▪</i>${corrs.address }
									</a>
								</c:forEach>
							</dd>
						</dl>
					</div>
				</div>
				<div class="sidebox dside-near dside-good">
					<div class="stitle">
						<h3 class="stit">${scen.city }好评景点</h3>
					</div>
					<div class="scontent"> 
					<ul class="textlist js_imgshow" id="good_common_list_ticket">
						<c:forEach items="${pralist }" var="pra" varStatus="varStatus">
								<li class="active"><a href="scenic?id=${pra.id }&&pageIndex=0" target="_blank"> 
								<img width="228" height="152" alt="${pra.scenicname }" src="${pra.coverImage }"> </a> 
								<dfn>
										¥<i>${pra.floor_price }</i><em>起</em><!-- floor_price -->
								</dfn> <a href="scenic?id=${pra.id }&&pageIndex=0"
									target="_blank" hidefocus="false"><em class="rank_num ">${varStatus.index+1 } </em>${pra.scenicname }</a>
								</li>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!--//.dside-->
			<div class="dmain">
				<!--组装产品详情-->
				${scen.introduce }
		<div id="traffic" class="dbox traffic">
	        <div class="dtitle">
	            <h2 class="dtit"><i class="icon dicon-traffic"></i>交通指南</h2>
	        </div>
	        <div class="dcontent">
	            <div id="allmap" style="width:100%;height:500px;"></div>
	        </div>
	    </div>
	   <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=e2d18b71d9efe03b141bf9dba03baec9"></script>
	   
	<script type="text/javascript">
	$(function(){
		var scenicname=$("#scenicName").val();
		
		var map = new BMap.Map("allmap");          
		map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
		 var navigationControl = new BMap.NavigationControl({
			    // 靠左上角位置
			    anchor: BMAP_ANCHOR_TOP_LEFT,
			    // LARGE类型
			    type: BMAP_NAVIGATION_CONTROL_LARGE,
			    // 启用显示定位
			    enableGeolocation: true
			  });
			  map.addControl(navigationControl);
		var local = new BMap.LocalSearch(map, {
			renderOptions:{map: map}
		});
		local.search(scenicname);
	})
	
</script>
				<!--用户点评--开始-->
				<a id="yhdp"
					style="font-size: 0; padding-top: 35px; display: block;"
					hidefocus="false"></a>

				<div id="comments" class="new-comments">
					<div class="dtitle">
						<h2 class="dtit">
							<i class="icon dicon-comments"></i>驴友点评
						</h2>
					</div>
					<div class="comwrap">
						<!-- 点评信息概况 -->
						<div class="new-cominfo">
							<div class="comstati clearfix">

								<div class="com-count">
								
									<i class="percentum f60" data-mark="dynamicNum"
										data-level="100">
										<c:if test="${pricMap['praise']==null}">
											0
										</c:if>
										<c:if test="${pricMap['praise']!=null}">
										${pricMap['praise']}
										</c:if>
										 </i><span class="f60">%</span> <em>好评率</em>
									<em>来自<a target="_blank" class="f60">${count }</a>位驴友的真实点评
									</em>
								</div>
								<div class="com-btns">
								
									<a class="nlogin"  href="javascript:;" onclick="loginFormSubmit(${scen.id})" rel="nofollow">有订单，写体验点评返奖金</a>
								</div>
							</div>
							<!-- //com-btns -->
						</div>


						<div class="comheatd">
						<c:if test="${page.list.size()!=0 }">
							<ul class="comheatd-ul JS_com-tabnav">
								<li class="active"><a href="javascript:;" hidefocus="false"
									id="allCmt" rel="nofollow">全部点评<span>(${count })</span></a></li>
								<li class=""><a href="javascript:;" hidefocus="false"
									id="bestCmt" rel="nofollow">精华点评<span>(${countlike })</span></a></li>
								<li class=""><a href="javascript:;" hidefocus="false"
									id="picCmt" rel="nofollow">晒旅图点评<span>(${countimg })</span></a></li>
							</ul>
							</c:if>
						</div>
						<!-- //comhead -->
						<div class="JS_com-content">
							<!-- 点评 -->
							
							<div class="comment-list com-all" style="display: block;"
								id="allCmtComment">
								<c:forEach items="${page.list }" var="remarklist">
								<div class="comment-li" >
									<div class="ufeed-info">
										<span class="fr tagsback tagsback-orange" tip-title="写体验点评送积分"
											tip-content="预订此产品，游玩后发表体验点评，内容通过审核，即可获得积分。"><em>送</em><i>400分</i></span>
										<span class="fr tagsback tagsback-orange" tip-title="写体验点评返现金"
											tip-content="预订此产品，游玩后发表体验点评，内容通过审核，即可获得<span>19</span>元点评奖金返现。"><em>点评</em><i>19元</i></span>
										<p class="ufeed-score">
										<c:if test="${remarklist.essence==1 }">
											<span class="tags tags-red">精华</span> 
										</c:if>
										<c:if test="${remarklist.mark.id==5 }">
											<span class="ufeed-level"><i data-level="5" data-mark=""
												style="width: 100%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==4 }">
											<span class="ufeed-level"><i data-level="4" data-mark="" style="width: 80%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==3 }">
											<span class="ufeed-level"><i data-level="3" data-mark="" style="width: 60%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==2 }">
											<span class="ufeed-level"><i data-level="2" data-mark="" style="width: 40%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==1 }">
											<span class="ufeed-level"><i data-level="1" data-mark="" style="width: 20%;"></i></span>
										</c:if>
											<span class="ufeed-item"> <em>景区服务&nbsp;</em>
												<i>${remarklist.mark.id}(推荐) </i>
											</span> <span class="ufeed-item"> <em>游玩体验&nbsp;</em> <i>${remarklist.mark.id}
													(推荐) </i>
											</span> <span class="ufeed-item"> <em>预订便捷&nbsp;</em> <i>${remarklist.mark.id}
													(推荐) </i>
											</span> <span class="ufeed-item"> <em>性价比&nbsp;</em> <i>${remarklist.mark.id}
													(推荐) </i>
											</span> <span class="ufeed-tag">体验</span>
										</p>
									</div>
									<!-- //ufeed-info -->
									<div class="ufeed-content">
										<!-- 展开时加showmore -->
										${remarklist.content }
										<span class="JS_showmore ufeed-showmore">查看全部<i
											class="iconcom iconcom-more"></i></span>
									</div>
									<!-- 点评图片展示 -->
									<!-- 大图结构 -->
									<div class="compic-big">
										<a class="l" title="上一张" href="javascript:;"></a><a class="r"
											title="下一张" href="javascript:;"></a>
										<p></p>
									</div>
									<c:if test="${remarklist.remarkimg.size()!=0}">
									<div class="compic-scoll">
										<span class="compic-bigbtn fl"><i
											class="iconcom iconcom-scollleft"></i></span>
										<div class="compic-small fl">
											<!-- //compic-scollbox -->
											<ul>
											<c:forEach items="${remarklist.remarkimg }" var="img">
												<li
													data-src="${img.path }"><img src="${img.path }" alt="成都欢乐谷"></li>
											</c:forEach>
											</ul>
										</div>
										<a href="javascript:;" class="JS_close copic-bigup">收起<i
											class="iconcom iconcom-bigup"></i></a> <span
											class="compic-bigbtn fr"><i
											class="iconcom iconcom-scollright"></i></span>
									</div>
									</c:if>
									<!-- 用户信息 --><!-- fr com-enjoy active -->
									
									<div class="com-userinfo">
										
										<a href="javascript:;" class="JS_reply fr com-dcom"
											rel="nofollow"><i class="iconcom iconcom-dcom"></i>回复<em>${remarklist.remarks.size()}</em></a>
										<a
												href="javascript:;"
												class="fr com-enjoy" id="userfulCount_all_6530776"
												rel="nofollow" onclick="addUsefulCount(${remarklist.id })"><i class="iconcom iconcom-enjoy"></i>有用<em>${remarklist.remlike.size() }</em></a>
										<p>
											<a href="javascript:;" title="${remarklist.user.username }" rel="nofollow">${remarklist.user.username }</a>
											对 “ ${scen.scenicname }” 发表点评 
										</p>
									</div>
									<!-- 点评回复 -->
									<c:if test="${remarklist.remarks.size()==0 }">
									<div class="com-answer combd clearfix">
										<!-- //如果下面有回复则加 open否则不加 -->
										<i class="iconcom iconcom-boxdir"></i>
										<div class="com-answer-form">
												<a data-cid="6530776" data-ctype="all" data-reply="0"
													class="com-answer-submit radio5 fr" href="javascript:;" onclick="commentCommit(${remarklist.id})">回复</a>
												<input class="com-answerinput" type="text" name="remarkContent${remarklist.id}" id="remarkContent${remarklist.id}" />
										</div>
											<ul class="com-answer-li">
											</ul>
									</div>
									</c:if>
									<c:if test="${remarklist.remarks.size()!=0 }">
									 <div class="com-answer combd clearfix open"> <!-- //如果下面有回复则加 open否则不加 -->
							            <i class="iconcom iconcom-boxdir"></i>
							                <div class="com-answer-form">
							                        <a data-cid="5405748" data-ctype="" data-reply="2" onclick="commentCommit(${remarklist.id})" class="com-answer-submit radio5 fr" href="javascript:;">回复</a>
							                       <input class="com-answerinput" type="text" name="remarkContent${remarklist.id}" id="remarkContent${remarklist.id}" />
							                </div>
							            <ul class="com-answer-li">
											<c:forEach items="${remarklist.remarks}" var="remid">
												 <li>
								                       <p><span>${remid.user.username }：</span>${remid.content }</p>
								                   </li>
								            </c:forEach>
										</ul>
						        	</div> 
						        	</c:if>
									<!-- //com-answer -->
								</div>
							</c:forEach>
							<c:if test="${page.list.size()!=0}">
								<div class="paging orangestyle">
									<div class="pagebox">
										<c:if test="${page.hasPreviousPage==false}">
											<span class="prevpage"><i class="larr"></i></span>
										</c:if>
										<c:if test="${page.hasPreviousPage==true}">
											<a class="prevpage" hidefocus="false" onclick="getPage(${page.pageNum-1},${scen.id})" href="javascript:;"><i class="larr"></i></a>
										</c:if>
										<c:forEach items="${page.navigatepageNums }" var="nums">
										<c:if test="${nums==page.pageNum }">
											<span class="pagesel">${nums}</span>
										</c:if>
										<c:if test="${nums!=page.pageNum }">
											<a href="javascript:;" hidefocus="false" onclick="getPage(${nums},${scen.id})">${nums }</a>
										</c:if>
										</c:forEach>
										<!-- <span class="pagemore">...</span> 
										<a href="javascript:;" hidefocus="false" onclick="getPage()">20</a> -->
										<c:if test="${page.hasNextPage==false }">
											<span class="nextpage"><i class="rarr"></i></span>
										</c:if>
										<c:if test="${page.hasNextPage==true }">
											<a href="javascript:;" class="nextpage" onclick="getPage(${page.pageNum+1},${scen.id})" > 
											<i class="rarr"></i></a>
										</c:if>
									</div>
								</div> 
							</c:if>
								<!-- //comment-li -->
							</div>
							<!-- //comment-list -->

							<!-- 精华 -->
							<div class="comment-list" id="bestCmtComment"
								style="display: none;">
								
								<!-- //comment-li -->
								<c:forEach items="${esspage.list }" var="remarklist">
								<div class="comment-li" >
									<div class="ufeed-info">
										<span class="fr tagsback tagsback-orange" tip-title="写体验点评送积分"
											tip-content="预订此产品，游玩后发表体验点评，内容通过审核，即可获得积分。"><em>送</em><i>400分</i></span>
										<span class="fr tagsback tagsback-orange" tip-title="写体验点评返现金"
											tip-content="预订此产品，游玩后发表体验点评，内容通过审核，即可获得<span>19</span>元点评奖金返现。"><em>点评</em><i>19元</i></span>
										<p class="ufeed-score">
										<c:if test="${remarklist.essence==1 }">
											<span class="tags tags-red">精华</span> 
										</c:if>
										<c:if test="${remarklist.mark.id==5 }">
											<span class="ufeed-level"><i data-level="5" data-mark=""
												style="width: 100%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==4 }">
											<span class="ufeed-level"><i data-level="4" data-mark="" style="width: 80%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==3 }">
											<span class="ufeed-level"><i data-level="3" data-mark="" style="width: 60%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==2 }">
											<span class="ufeed-level"><i data-level="2" data-mark="" style="width: 40%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==1 }">
											<span class="ufeed-level"><i data-level="1" data-mark="" style="width: 20%;"></i></span>
										</c:if>
											<span class="ufeed-item"> <em>景区服务&nbsp;</em>
												<i>${remarklist.mark.id}(推荐) </i>
											</span> <span class="ufeed-item"> <em>游玩体验&nbsp;</em> <i>${remarklist.mark.id}
													(推荐) </i>
											</span> <span class="ufeed-item"> <em>预订便捷&nbsp;</em> <i>${remarklist.mark.id}
													(推荐) </i>
											</span> <span class="ufeed-item"> <em>性价比&nbsp;</em> <i>${remarklist.mark.id}
													(推荐) </i>
											</span> <span class="ufeed-tag">体验</span>
										</p>
									</div>
									<!-- //ufeed-info -->
									<div class="ufeed-content">
										<!-- 展开时加showmore -->
										${remarklist.content }
										<span class="JS_showmore ufeed-showmore">查看全部<i
											class="iconcom iconcom-more"></i></span>
									</div>
									<!-- 点评图片展示 -->
									<!-- 大图结构 -->
									<div class="compic-big">
										<a class="l" title="上一张" href="javascript:;"></a><a class="r"
											title="下一张" href="javascript:;"></a>
										<p></p>
									</div>
									<c:if test="${remarklist.remarkimg.size()!=0}">
									<div class="compic-scoll">
										<span class="compic-bigbtn fl"><i
											class="iconcom iconcom-scollleft"></i></span>
										<div class="compic-small fl">
											<!-- //compic-scollbox -->
											<ul>
											<c:forEach items="${remarklist.remarkimg }" var="img">
												<li
													data-src="${img.path }"><img src="${img.path }" alt="成都欢乐谷"></li>
											</c:forEach>
											</ul>
										</div>
										<a href="javascript:;" class="JS_close copic-bigup">收起<i
											class="iconcom iconcom-bigup"></i></a> <span
											class="compic-bigbtn fr"><i
											class="iconcom iconcom-scollright"></i></span>
									</div>
									</c:if>
									<!-- 用户信息 -->
									<div class="com-userinfo">
										<a href="javascript:;" class="JS_reply fr com-dcom"
											rel="nofollow"><i class="iconcom iconcom-dcom"></i>回复<em>${remarklist.remarks.size()}</em></a>
										<a
											href="javascript:;"
											class="fr com-enjoy" id="userfulCount_all_6530776"
											rel="nofollow" onclick="addUsefulCount(${remarklist.id })"><i class="iconcom iconcom-enjoy"></i>有用<em>0</em></a>
										<p>
											<a href="javascript:;" title="${remarklist.user.username }" rel="nofollow">${remarklist.user.username }</a>
											对 “ ${scen.scenicname }” 发表点评 
										</p>
									</div>
									<!-- 点评回复 -->
									<c:if test="${remarklist.remarks.size()==0 }">
									<div class="com-answer combd clearfix">
										<!-- //如果下面有回复则加 open否则不加 -->
										<i class="iconcom iconcom-boxdir"></i>
										<div class="com-answer-form">
												<a data-cid="6530776" data-ctype="all" data-reply="0"
													class="com-answer-submit radio5 fr" href="javascript:;" onclick="commentjhCommit(${remarklist.id})">回复</a>
												<input class="com-answerinput" type="text" name="remarkjhContent${remarklist.id}" id="remarkjhContent${remarklist.id}" />
										</div>
											<ul class="com-answer-li">
											</ul>
									</div>
									</c:if>
									<c:if test="${remarklist.remarks.size()!=0 }">
									 <div class="com-answer combd clearfix open"> <!-- //如果下面有回复则加 open否则不加 -->
							            <i class="iconcom iconcom-boxdir"></i>
							                <div class="com-answer-form">
							                        <a data-cid="5405748" data-ctype="" data-reply="2" onclick="commentjhCommit(${remarklist.id})" class="com-answer-submit radio5 fr" href="javascript:;">回复</a>
							                       <input class="com-answerinput" type="text" name="remarkjhContent${remarklist.id}" id="remarkjhContent${remarklist.id}" />
							                </div>
							            <ul class="com-answer-li">
											<c:forEach items="${remarklist.remarks}" var="remid">
												 <li>
								                       <p><span>${remid.user.username }：</span>${remid.content }</p>
								                   </li>
								            </c:forEach>
										</ul>
						        	</div> 
						        	</c:if>
									<!-- //com-answer -->
								</div>
							</c:forEach>
								<!-- //comment-li -->
								<div class="paging orangestyle">
									<div class="pagebox">
										<c:if test="${esspage.hasPreviousPage==false}">
											<span class="prevpage"><i class="larr"></i></span>
										</c:if>
										<c:if test="${esspage.hasPreviousPage==true}">
											<a class="prevpage" hidefocus="false" onclick="getesspget(${esspage.pageNum-1},${scen.id})" href="javascript:;"><i class="larr"></i></a>
										</c:if>
										<c:forEach items="${esspage.navigatepageNums }" var="nums">
										<c:if test="${nums==esspage.pageNum }">
											<span class="pagesel">${nums}</span>
										</c:if>
										<c:if test="${nums!=esspage.pageNum }">
											<a href="javascript:;" hidefocus="false" onclick="getesspget(${nums},${scen.id})">${nums }</a>
										</c:if>
										</c:forEach>
										<c:if test="${esspage.hasNextPage==false }">
											<span class="nextpage"><i class="rarr"></i></span>
										</c:if>
										<c:if test="${esspage.hasNextPage==true }">
											<a href="javascript:;" class="nextpage" onclick="getesspget(${esspage.pageNum+1},${scen.id})" > 
											<i class="rarr"></i></a>
										</c:if>
									</div>
								</div> 
							</div>
							<!-- //comment-list -->

							<!-- 晒旅图点评 -->
							<div class="comment-list" id="picCmtComment"
								style="display: none;">
								<c:forEach items="${imgpage.list }" var="remarklist">
								<div class="comment-li" >
									<div class="ufeed-info">
										<span class="fr tagsback tagsback-orange" tip-title="写体验点评送积分"
											tip-content="预订此产品，游玩后发表体验点评，内容通过审核，即可获得积分。"><em>送</em><i>400分</i></span>
										<span class="fr tagsback tagsback-orange" tip-title="写体验点评返现金"
											tip-content="预订此产品，游玩后发表体验点评，内容通过审核，即可获得<span>19</span>元点评奖金返现。"><em>点评</em><i>19元</i></span>
										<p class="ufeed-score">
										<c:if test="${remarklist.essence==1 }">
											<span class="tags tags-red">精华</span> 
										</c:if>
										<c:if test="${remarklist.mark.id==5 }">
											<span class="ufeed-level"><i data-level="5" data-mark=""
												style="width: 100%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==4 }">
											<span class="ufeed-level"><i data-level="4" data-mark="" style="width: 80%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==3 }">
											<span class="ufeed-level"><i data-level="3" data-mark="" style="width: 60%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==2 }">
											<span class="ufeed-level"><i data-level="2" data-mark="" style="width: 40%;"></i></span>
										</c:if>
										<c:if test="${remarklist.mark.id==1 }">
											<span class="ufeed-level"><i data-level="1" data-mark="" style="width: 20%;"></i></span>
										</c:if>
											<span class="ufeed-item"> <em>景区服务&nbsp;</em>
												<i>${remarklist.mark.id}(推荐) </i>
											</span> <span class="ufeed-item"> <em>游玩体验&nbsp;</em> <i>${remarklist.mark.id}
													(推荐) </i>
											</span> <span class="ufeed-item"> <em>预订便捷&nbsp;</em> <i>${remarklist.mark.id}
													(推荐) </i>
											</span> <span class="ufeed-item"> <em>性价比&nbsp;</em> <i>${remarklist.mark.id}
													(推荐) </i>
											</span> <span class="ufeed-tag">体验</span>
										</p>
									</div>
									<!-- //ufeed-info -->
									<div class="ufeed-content">
										<!-- 展开时加showmore -->
										${remarklist.content }
										<span class="JS_showmore ufeed-showmore">查看全部<i
											class="iconcom iconcom-more"></i></span>
									</div>
									<!-- 点评图片展示 -->
									<!-- 大图结构 -->
									<div class="compic-big">
										<a class="l" title="上一张" href="javascript:;"></a><a class="r"
											title="下一张" href="javascript:;"></a>
										<p></p>
									</div>
									<c:if test="${remarklist.remarkimg.size()!=0}">
									<div class="compic-scoll">
										<span class="compic-bigbtn fl"><i
											class="iconcom iconcom-scollleft"></i></span>
										<div class="compic-small fl">
											<!-- //compic-scollbox -->
											<ul>
											<c:forEach items="${remarklist.remarkimg }" var="img">
												<li
													data-src="${img.path }"><img src="${img.path }" alt="成都欢乐谷"></li>
											</c:forEach>
											</ul>
										</div>
										<a href="javascript:;" class="JS_close copic-bigup">收起<i
											class="iconcom iconcom-bigup"></i></a> <span
											class="compic-bigbtn fr"><i
											class="iconcom iconcom-scollright"></i></span>
									</div>
									</c:if>
									<!-- 用户信息 -->
									<div class="com-userinfo">
										<a href="javascript:;" class="JS_reply fr com-dcom"
											rel="nofollow"><i class="iconcom iconcom-dcom"></i>回复<em>${remarklist.remarks.size()}</em></a>
										<a
											href="javascript:;"
											class="fr com-enjoy" id="userfulCount_all_6530776"
											rel="nofollow" onclick="addUsefulCount(${remarklist.id })"><i class="iconcom iconcom-enjoy"></i>有用<em>0</em></a>
										<p>
											<a href="javascript:;" title="${remarklist.user.username }" rel="nofollow">${remarklist.user.username }</a>
											发表点评 
										</p>
									</div>
									<!-- 点评回复 -->
									<c:if test="${remarklist.remarks.size()==0 }">
									<div class="com-answer combd clearfix">
										<!-- //如果下面有回复则加 open否则不加 -->
										<i class="iconcom iconcom-boxdir"></i>
										<div class="com-answer-form">
												<a data-cid="6530776" data-ctype="all" data-reply="0"
													class="com-answer-submit radio5 fr" href="javascript:;" onclick="commentimgCommit(${remarklist.id})">回复</a>
												<input class="com-answerinput" type="text" name="remarkimgContent${remarklist.id}" id="remarkimgContent${remarklist.id}" />
										</div>
											<ul class="com-answer-li">
											</ul>
									</div>
									</c:if>
									<c:if test="${remarklist.remarks.size()!=0 }">
									 <div class="com-answer combd clearfix open"> <!-- //如果下面有回复则加 open否则不加 -->
							            <i class="iconcom iconcom-boxdir"></i>
							                <div class="com-answer-form">
							                        <a data-cid="5405748" data-ctype="" data-reply="2" class="com-answer-submit radio5 fr" href="javascript:;" onclick="commentimgCommit(${remarklist.id})">回复</a>
							                        <input class="com-answerinput" type="text" name="remarkimgContent${remarklist.id}" id="remarkimgContent${remarklist.id}" />
							                </div>
							            <ul class="com-answer-li">
											<c:forEach items="${remarklist.remarks}" var="remid">
												 <li>
								                       <p><span>>${remid.user.username }：</span>${remid.content }</p>
								                   </li>
								            </c:forEach>
										</ul>
						        	</div> 
						        	</c:if>
									<!-- //com-answer -->
								</div>
							</c:forEach>
								<!-- //comment-li -->
								<div class="paging orangestyle">
									<div class="pagebox">
										<c:if test="${imgpage.hasPreviousPage==false}">
											<span class="prevpage"><i class="larr"></i></span>
										</c:if>
										<c:if test="${imgpage.hasPreviousPage==true}">
											<a class="prevpage" hidefocus="false" onclick="getPageimg(${imgpage.pageNum-1},${scen.id})" href="javascript:;"><i class="larr"></i></a>
										</c:if>
										<c:forEach items="${imgpage.navigatepageNums }" var="nums">
										<c:if test="${nums==imgpage.pageNum }">
											<span class="pagesel">${nums}</span>
										</c:if>
										<c:if test="${nums!=imgpage.pageNum }">
											<a href="javascript:;" hidefocus="false" onclick="getPageimg(${nums},${scen.id})">${nums }</a>
										</c:if>
										</c:forEach>
										<c:if test="${imgpage.hasNextPage==false }">
											<span class="nextpage"><i class="rarr"></i></span>
										</c:if>
										<c:if test="${imgpage.hasNextPage==true }">
											<a href="javascript:;" class="nextpage" onclick="getPageimg(${imgpage.pageNum+1},${scen.id})" > 
											<i class="rarr"></i></a>
										</c:if>
									</div>
								</div> 
							</div>
						</div>
					</div>
				</div>
				<!--用户点评--结束-->

				<!-- 游记开始 -->
				<input type="hidden" id="elite" value="">
				<div id="product-customer-trip" class="dbox tripBox">
					<div class="dtitle">
						<p class="dtit">
							<i class="dp_icon dicon-trip"></i>相关游记
						</p>
 					</div>
					<div class="tripContent">
						<div class="tripTab">
							<span class="active" id="allTabTrip">全部</span>
						</div>
						<ul class="trip-list">
							<div class="tripListBox">
								<div id="allTrip" class="tripListAll">
									<c:forEach items="${travpage.list }" var="tra">
									<li><a class="trip-listPic" target="_blank"
										href="javascript:;"
										title="" hidefocus="false" data="0"> <img
											src="${tra.coverimg }"
											width="190" height="127" alt="${tra.title }">
									</a>

										<div class="trip-listInfo">
											<p class="trip-listTit" date-travel="1">
												<a target="_blank"
													href="javascript:;"
													hidefocus="false" data="0">${tra.title }</a>
											</p>
											<p class="trip-listTime">由兔爸爸攻略编辑发表于${tra.time }</p>

											<p class="trip-listCon">
												<span class="icon dicon-yhL"></span> <span
													class="icon dicon-yhR"></span>
												${tra.content }...
											</p>
										</div></li>
										</c:forEach>
										<c:if test="${travpage.list.size()==0 }">
											<div class="commentNull">
									                <span class="icon"></span>
									                 		   本产品暂无相关游记，如果您去过，那就写篇关于这里的游记吧,一篇好的游记可以让人印象深刻哦!!!
									            </div>
										</c:if>
								<c:if test="${travpage.list.size()!=0}">
								<div class="paging orangestyle">
									<div class="pagebox">
										<c:if test="${travpage.hasPreviousPage==false}">
											<span class="prevpage"><i class="larr"></i></span>
										</c:if>
										<c:if test="${travpage.hasPreviousPage==true}">
											<a class="prevpage" hidefocus="false" onclick="getPagetra(${imgpage.pageNum-1},${scen.id})" href="javascript:;"><i class="larr"></i></a>
										</c:if>
										<c:forEach items="${travpage.navigatepageNums }" var="nums">
										<c:if test="${nums==travpage.pageNum }">
											<span class="pagesel">${nums}</span>
										</c:if>
										<c:if test="${nums!=travpage.pageNum }">
											<a href="javascript:;" hidefocus="false" onclick="getPagetra(${nums},${scen.id})">${nums }</a>
										</c:if>
										</c:forEach>
										<c:if test="${travpage.hasNextPage==false }">
											<span class="nextpage"><i class="rarr"></i></span>
										</c:if>
										<c:if test="${travpage.hasNextPage==true }">
											<a href="javascript:;" class="nextpage" onclick="getPagetra(${imgpage.pageNum+1},${scen.id})" > 
											<i class="rarr"></i></a>
										</c:if>
									</div>
								</div> 
								</c:if>
								</div>
							</div>
						</ul>
					</div>
				</div>
				<script type="text/javascript">
					/**
					 *Ajax请求数据
					 *@param elite 全部/精华
					 *@param callFn 回调函数
					 */
					function ajaxData(currentPage, elite, callFn) {
						$.ajax({
							url : "/ticket/trip/destPaginationOfTrip",
							data : {
								currentPage : currentPage,
								destId : 121200,
								elite : getElite(elite)
							},
							dataType : 'html',
							success : function(data) {
								var index = getIndex(elite);
								dataArray[index] = data;
								if (callFn)
									callFn(data);
							},
							error : function(res) {
								console.info("ajaxData failure【" + res.status
										+ "】");
							}
						});
					}
				</script>
				<!-- 游记结束 -->
				<!--公共底部-->
				<!--组装底部-->
			</div>
			<!--组装主题景点 开始-->
			<!--为你推荐景点-->
			<div class="guess-main nchmpRecommend" id="popular_attraction_list">
				<p class="nchmpRecommendTit">
					为你推荐成都人气景点<a
						href="http://ticket.lvmama.com/a-chengdu279"
						title="" class="nchmpRecommendMore" target="_blank">更多成都门票&gt;</a>
				</p>
				<div class="nchTrafficDerc">
					<div class="nchTrafficNav clearfix">
						<ul>
						<c:forEach items="${tilelist }" var="til" varStatus="0" end="7">
							<li class="cur" onclick="getcorrScenic(${scen.id},${til.id })">${til.type }</li>
						</c:forEach>
						</ul>
					</div>
					<div class="nchTrafficTab clearfix" style="display: block;">
						<ul id="corrId">
						<c:forEach items="${scencorrlist }" var="scencorr">
							<li>
	                            <a hidefocus="false" href="scenic?id=${scencorr.id }&&pageIndex=0" target="_blank"> 
	                                <img width="205" height="137" alt="成都欢乐谷" src="${scencorr.coverImage }">
		                        </a>
		                        <h5>
		                            <a hidefocus="false" href="scenic?id=${scencorr.id }&&pageIndex=0" target="_blank">${scencorr.scenicname }</a>
		                        </h5>
		                        <p> <span class="guess_price"><dfn>¥</dfn>${scencorr.floor_price }</span>起</p>
                    		</li>
                    	</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!--组装主题景点 结束-->
			<div class="guess-main">
				<!--附近推荐-->
				<div class="guess_tit">
					<h3>附近推荐</h3>
					<ul class="guess_tit_ul">
						<li class="active">门票<i class="around_icon"></i></li>
					</ul>
				</div>
				<ul class="guess_list" style="display: block;"
					id="guess_list_ticket">
					<c:forEach items="${corrlist }" var="cor" varStatus="0" end="3">
						<li><a hidefocus="false"
							href="scenic?id=${cor.id }&&pageIndex=0"
							target="_blank"> <img width="205" height="137" alt="${cor.scenicname }"
								src="${cor.coverImage }">
						</a>
							<h5>
								<a hidefocus="false"
									href="scenic?id=${cor.id }&&pageIndex=0"
									target="_blank">${cor.scenicname }</a>
							</h5>
							<p>
							</p>
						</li>
					</c:forEach>
				</ul>
				<!--附近推荐结束-->
			</div>
			<!--公共底部-->
			<!-- 公共底部  -->
			<!-- footer\ -->
			<div class="wrap" style="clear: both;">
				<a class="public_ft"
					href="http://www.lvmama.com/public/user_security" target="_blank">
					<ul class="public_ft_list">
						<li><i class="ft_ioc1"></i><strong>价格保证</strong>同类产品，保证低价</li>
						<li><i class="ft_ioc2"></i><strong>退订保障</strong>因特殊情况影响出行，保证退订</li>
						<li><i class="ft_ioc3"></i><strong>救援保障</strong>旅途中遇意外情况，保证援助</li>
						<li><i class="ft_ioc4"></i><strong>7x24小时服务</strong>快速响应，全年无休</li>
					</ul></a>
			</div>
			<!-- copyright\ -->
			<div class="lv-footer clearfix wrap" style="margin: 0 auto;">
				<p class="footer-link">
					<a href="http://www.lvmama.com/public/about_lvmama" rel="nofollow">关于我们</a>
					| <a href="http://www.lvmama.com/public/lianxi_us" rel="nofollow">联系我们</a>
					| <a href="http://www.lvmama.com/public/site_map">网站地图</a> | <a
						href="http://hotels.lvmama.com/brand/">酒店品牌</a> | <a
						href="http://hotels.lvmama.com/area/">酒店查询</a> | <a
						href="http://www.lvmama.com/public/help" rel="nofollow">帮助中心</a> |
					<a href="http://www.lvmama.com/public/links">友情链接</a> | <a
						href="http://www.lvmama.com/public/jobs" rel="nofollow">诚聘英才</a> |
					<a href="http://www.lvmama.com/public/zizhi_lvmama" rel="nofollow">旅游度假资质</a>
					| <a
						href="http://www.lvmama.com/userCenter/user/transItfeedBack.do"
						rel="nofollow">意见反馈</a> | <a rel="nofollow"
						href="http://www.lvmama.com/public/adwy">广告业务</a>
				</p>
				<p class="lv-copyright">
					Copyright © 2018 www.lvmama.com. 上海景域文化传播股份有限公司版权所有 <a
						href="http://www.miitbeian.gov.cn" target="_blank" rel="nofollow">沪ICP备13011172号-3</a>
					增值电信业务经营许可证编号：<a rel="nofollow"
						href="http://pic.lvmama.com/img/ICP.jpg" target="_blank">沪B2-20100030</a>
				</p>
				<div class="lv-safety">
					<a class="safety2" target="_blank" rel="nofollow" title="经营性网站备案信息"
						href="http://www.miibeian.gov.cn/"></a> <a class="safety3"
						target="_blank" rel="nofollow" title="网络110报警服务"
						href="http://www.cyberpolice.cn"></a> <a class="safety4"
						target="_blank" rel="nofollow" title="支付宝特约商家"></a> <a
						class="safety5" target="_blank" rel="nofollow" title="AAA级信用企业"
						href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1664396140"></a> <a
						class="safety6" target="_blank" rel="nofollow" title="上海工商"
						href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110930103539539"></a>
					<a class="safety7" target="_blank" rel="nofollow" title="可信网站"
						href="https://ss.knet.cn/verifyseal.dll?sn=2010101800100002662&amp;comefrom=trust&amp;trustKey=dn&amp;trustValue=www.lvmama.com"></a>
					<a class="safety8" target="_blank" rel="nofollow" title="诚信认证示范企业"
						href="https://credit.szfw.org/CX20160614015657160455.html"
						id="___szfw_logo___" hidefocus="false"></a> <a class="safety9"
						target="_blank" rel="nofollow" title="网络社会征信网"
						href="http://www.zx110.org"></a> <a class="safety10"
						target="_blank" rel="nofollow" title="360网站安全检测"
						href="http://webscan.360.cn"></a> <a class="safety11"
						target="_blank" rel="nofollow" title="网监安全"
						href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010702001030"></a>
					<a class="safety13" target="_blank" rel="nofollow" title="举报中心"
						href="http://www.shjbzx.cn/"></a>
				</div>
			</div>
			<!-- //footer -->
			<!-- 公共底部结束  -->


			<div class="hh_cooperate">
				<p>
					<b>相关地区：</b><span> 
					<c:forEach items="${corrlist }" var="list">
					<a
						href="scenic?id=${list.id }&&pageIndex=0" target="_blank"
						hidefocus="false">${list.address }</a> 
					</c:forEach>
					</span>
				</p>
			</div>
			<!-- 景点弹层 -->
			<div class="resortAlert">
				<div class="destIcon resortAlert-close pa"></div>

				<!-- //resortComList -->
			</div>
		</div>
		</c:if>
		<c:if test="${error!=null }">
			<div class="tipbox tip-warning tip_style" style="background-color: rgb(204, 232, 207);">
                <span class="tip-icon-big tip-icon-nobg-big-warning"></span>
                <div class="tip-content">
	                <h3 class="tip-title">非常抱歉，没有找到符合“${name }”的产品</h3>
	                <p class="tip-explain">建议您: 变更出发地,关键字或筛选条件重新搜索</p>
	                <p class="tip-proposal">或者马上来定制属于自己的行程吧</p>
                	<a href="company.jsp" class="tip-proposal-btn">立即定制</a>
                </div>
            </div>
		</c:if>
		<!-- //resortAlert -->
	</div>
	<!-- 流量二期布码使用 -->
	<!--校验user agent JS-->

	<!--收藏-->
	<!-- 频道公用js-->
	<script type="text/javascript"
		src="/js/user/indexscenic.js"></script>
	<div class="poptip tip-light poptip-default"
		style="left: 1008.47px; top: 18134.5px; display: none;" id="poptip1">
		<div class="tip-arrow tip-arrow-12">
			<em>◆</em> <i>◆</i>
		</div>
		<div class="tip-content">
			<h5 class="tip-title" style="display: block;">写体验点评送积分</h5>
			<p>预订此产品，游玩后发表体验点评，内容通过审核，即可获得积分。</p>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
	
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
	<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<!--点评JS-->
	<!--游记JS-->
	<!--地图JS-->
	<!--  <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>  -->
	 <!-- <script type="text/javascript"
		src="http://api.map.baidu.com/getscript?v=1.4&amp;ak=&amp;services=&amp;t=20181030063907"> 
	</script> -->
<!-- 
	 <script type="text/javascript"
		src="http://api.map.baidu.com/library/DistanceTool/1.2/src/DistanceTool_min.js"></script> 

	 <script src="http://pic.lvmama.com/js/v6/modules/mapControl.js"></script> 
	 <script src="http://pic.lvmama.com/js/v5/ibm/eluminate.js"></script>
	<script src="http://pic.lvmama.com/js/v5/ibm/coremetrics-initalize.js"></script> -->
	<script type="text/javascript">
		var isTemai = 'false';
		var isTemaiFlag = $("#isTemaiSuppGoods").val();
		var firstuppGoodsPrice = $("#firstuppGoodsPrice").val();
		var firstSuppGoodsMarkerPrice = $("#firstSuppGoodsMarkerPrice").val();
		if (isTemaiFlag == 'Y') {
			isTemai = 'true';
		}
	</script>
	
	<script type="text/javascript">
	
		var publicCallBack = {};
		publicCallBack.backed = true;
		//var bu="TICKET_BU";

		cmCreatePageviewTag(
				"PC_景乐_产品详情页_门票_国内门票_景点门票_常规_182386",
				"PC_Scenic_ProductDetailPage_Ticket_LocalTicket_JingDianTicket_DefaultBuying",
				null, null, "-_--_--_--_--_-产品页面");
		cmCreateProductviewTag(
				"182386",
				"成都欢乐谷",
				"PC_Scenic_ProductDetailPage_Ticket_LocalTicket_JingDianTicket_DefaultBuying",
				"-_--_--_-TICKET_BU");


		function asynloadingProductDetail() {
			$(".dpro-list").each(function() {
				$(this).find("a.ptlink").each(function() {
					var currentItem = $(this).parent().parent();
					if (typeof ($(this).attr("data")) != "undefined") {
						getProductDetailData(currentItem, "lod");
					}
				});
			});
		}

		$(".dpro-list").delegate("a.ptlink", "click", function() {
			var currentItem = $(this).parent().parent();
			if (typeof ($(this).attr("data")) != "undefined") {
				//检测是否可以展开。
				//如果可以展开，则去调取展开逻辑。
				if (currentItem.hasClass("ptditem-selected")) {
					currentItem.find(".pdetails").hide();
					currentItem.removeClass("ptditem-selected");
				} else if (currentItem.find(".pdetails").length == 1) {
					currentItem.find(".pdetails").show();
					currentItem.addClass("ptditem-selected");
				} else if (currentItem.find('.pdetails').length == 0) {
					//                getProductDetailData(currentItem,"clk");
					$.alert("加载中请耐心等待......");
				}
			}
		});
		
		$('.dpro-list').on(
				'click',
				'.pdetails-tab li',
				function() {
					var $me = $(this), $index = $me.index();
					$me.addClass('active').siblings().removeClass('active');
					$me.parents('.pdetails-tabBox').find('.pdetails-tabCon')
							.eq($index).show().siblings('.pdetails-tabCon')
							.hide();
				})
				
		//相关景点查询
		//scenId 景点id typeId 类型id
		function getcorrScenic(scenId,typeId){
			$.ajax({
				url:"corrScenic",
				type:"post",
				data:{
					scenId:scenId,
					typeId:typeId,
				},success:function(result){
					$("#corrId").empty();
					var mark="";
					console.log(result.scenlist)
					if(result.scenlist.length==0){
						mark+="<div id='allTrip' class='tripListAll'>"
		                	+"<div class='commentNull'>"
		                	+"<span class='icon'></span>  本产品暂无相关景点!!!"
		                	+"</div>"
		                	+"<div class='paging orangestyle'>"
		                	+"<div class='pagebox'>"
		                	+"<span class='prevpage'><i class='larr'></i></span><span class='nextpage'><i class='rarr'></i></span>"
		                	+"</div>"
		                	+"</div></div>"
					}
					for(var i=0;i<result.scenlist.length;i++){
						mark+="<li>"
							+"<a hidefocus='false' href='scenic?id="+result.scenlist[i].id+"&&pageIndex=0' target='_blank'>"
							+"<img width='205' height='137' alt="+result.scenlist[i].scenicname+" src="+result.scenlist[i].coverImage+">"
							+"</a>"
							+"<h5>"
							+"<a hidefocus='false' href='scenic?id="+result.scenlist[i].id+"&&pageIndex=0' target='_blank'>"+result.scenlist[i].scenicname+"</a>"
							+"</h5>"
							+"<p>"
							+"<span class='guess_price'><dfn>¥</dfn>"+result.scenlist[i].floor_price+"</span>起"
							+"</p>"
							+"</li>";
					}
					$("#corrId").append(mark);
				}
			})
		}
		function MyAutoRun() {
			document.location.reload();
		}
		/**
		 * 这个是没有登录的时候,弹出框用的,里面是空的就可以
		 */
		function loginFormSubmit(scenId) {
			if($("#check").val()==null||$("#check").val()==""){
				/*  $("#getlogin").css("display","block")  */
				alert("请先登录")
				location.href="login";
			}else{
				location.href="myOrder";
			} 
		}
		
		function getclolse(){
			$("#getlogin").css("display","none")
		}
		
		$("#allCmt").bind("click", function() {
			var count = $("#allCmtComment").find(".comment-li").length;
			if (count <= 0) {
				Comment.newLoadPaginationOfComment({
					type : "all",
					currentPage : 1,
					totalCount : 16982,
					placeId : '121200',
					productId : '',
					placeIdType : 'PLACE',
					isPicture : "N",
					isBest : "N",
					isPOI : "Y",
					isELong : "N"
				});
			}
		});
		//查询所有的评论分页
		function getPage(pageIndex,scenId){
			$.ajax({
				url:"pageAll",
				type:"post",
				data:{
					pageIndex:pageIndex,
					scenId:scenId
				},success:function(result){
					$("#allCmtComment").empty();
					var str="";
					for(var i=0;i<result.allpage.list.length;i++){
						str+="<div class='comment-li'>"
							+"<div class='ufeed-info'>"
							+"<p class='ufeed-score'>";
						if(result.allpage.list[i].essence==1){
							str+="<span class='tags tags-red'>精华</span>";
						}
						if(result.allpage.list[i].mark!=null){
							if(result.allpage.list[i].mark.id==5){
								str+="<span class='ufeed-level'><i data-level='5' data-mark='' style='width: 100%;'></i></span>"
							}
							if(result.allpage.list[i].mark.id==4){
								str+="<span class='ufeed-level'><i data-level='4' data-mark='' style='width: 80%;'></i></span>"
							}
							if(result.allpage.list[i].mark.id==3){
								str+="<span class='ufeed-level'><i data-level='3' data-mark='' style='width: 60%;'></i></span>"
							}
							if(result.allpage.list[i].mark.id==2){
								str+="<span class='ufeed-level'><i data-level='2' data-mark='' style='width: 40%;'></i></span>"
							}
							if(result.allpage.list[i].mark.id==1){
								str+="<span class='ufeed-level'><i data-level='1' data-mark='' style='width: 20%;'></i></span>"
							} 
						}
						if(result.allpage.list[i].mark!=null){
							str+="<span class='ufeed-item'> <em>景区服务&nbsp;</em>"
								+"<i>"+result.allpage.list[i].mark.id+"(推荐)</i>"
								+"</span> <span class='ufeed-item'> <em>游玩体验&nbsp;</em> <i>"+result.allpage.list[i].mark.id+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>预订便捷&nbsp;</em> <i>"+result.allpage.list[i].mark.id+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>性价比&nbsp;</em> <i>"+result.allpage.list[i].mark.id+"(推荐) </i>"
								+"</span> <span class='ufeed-tag'>体验</span>"
								+"</p>"
								+"</div>"
								+"<div class='ufeed-content'>"
								+result.allpage.list[i].content
								+"<span class='JS_showmore ufeed-showmore'>查看全部<i class='iconcom iconcom-more'></i></span>"
								+"</div>"
								+"<div class='compic-big'>"
								+"<a class='l' title='上一张' href='javascript:;'></a><a class='r' title='下一张' href='javascript:;'></a>"
								+"<p></p>"
								+"</div>";
							
						}else{
							str+="<span class='ufeed-item'> <em>景区服务&nbsp;</em>"
								+"<i>"+0+"(推荐)</i>"
								+"</span> <span class='ufeed-item'> <em>游玩体验&nbsp;</em> <i>"+0+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>预订便捷&nbsp;</em> <i>"+0+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>性价比&nbsp;</em> <i>"+0+"(推荐) </i>"
								+"</span> <span class='ufeed-tag'>体验</span>"
								+"</p>"
								+"</div>"
								+"<div class='ufeed-content'>"
								+result.allpage.list[i].content
								+"<span class='JS_showmore ufeed-showmore'>查看全部<i class='iconcom iconcom-more'></i></span>"
								+"</div>"
								+"<div class='compic-big'>"
								+"<a class='l' title='上一张' href='javascript:;'></a><a class='r' title='下一张' href='javascript:;'></a>"
								+"<p></p>"
								+"</div>";
						}
						if(result.allpage.list[i].remarkimg!=null){
							str+="<div class='compic-scoll'>"
								+"<span class='compic-bigbtn fl'>"
								+"<i class='iconcom iconcom-scollleft'></i></span>"
								+"<div class='compic-small fl'>"
								+"<ul>";
								for(var j=0;j<result.allpage.list[i].remarkimg.length;j++){
									str+="<li data-src="+result.allpage.list[i].remarkimg[j].path+"><img src="+result.allpage.list[i].remarkimg[j].path+" alt='成都欢乐谷'></li>"
								}
								str+="</ul>"
									+"</div>"
									+"<a href='javascript:;' class='JS_close copic-bigup'>收起<i class='iconcom iconcom-bigup'></i></a>"
									+"<span class='compic-bigbtn fr'><i class='iconcom iconcom-scollright'></i></span>"
									+"</div>";
						} 
						if(result.allpage.list[i].remlike!=null){
							str+="<div class='com-userinfo' >"
								+"<a href='javascript:;' class='JS_reply fr com-dcom' rel='nofollow'>";
								if(result.allpage.list[i].remarks!=null){
									str+="<i class='iconcom iconcom-dcom'></i>回复<em>"+result.allpage.list[i].remarks.length+"</em></a>";
								}else{
									str+="<i class='iconcom iconcom-dcom'></i>回复<em>"+0+"</em></a>";
								}
								str+="<a href='javascript:;' onclick='addUsefulCount("+result.allpage.list[i].id+")' class='fr com-enjoy' id='userfulCount_all_6530776' rel='nofollow'>"
								+"<i class='iconcom iconcom-enjoy'></i>有用<em>"+result.allpage.list[i].remlike.length+"</em></a>"
								+"<p>"
								+"<a href='javascript:;' title="+result.allpage.list[i].user.username+" rel='nofollow'>"+result.allpage.list[i].user.username+"</a>"
								+"发表点评 "
								+"</p>"
								+"</div>";
						}else{
							str+="<div class='com-userinfo'>"
								+"<a href='javascript:;' class='JS_reply fr com-dcom' rel='nofollow'>"
								+"<i class='iconcom iconcom-dcom'></i>回复<em>"+0+"</em></a>"
								+"<a href='javascript:;' class='fr com-enjoy' id='userfulCount_all_6530776' rel='nofollow' onclick='addUsefulCount("+result.allpage.list[i].id+")'>"
								+"<i class='iconcom iconcom-enjoy' ></i>有用<em>"+0+"</em></a>"
								+"<p>"
								+"<a href='javascript:;' title="+result.allpage.list[i].user.username+" rel='nofollow'>"+result.allpage.list[i].user.username+"</a>"
								+"发表点评 "
								+"</p>"
								+"</div>";
						}
						if(result.allpage.list[i].remarks==null){
							str+="<div class='com-answer combd clearfix'>"
								+"<i class='iconcom iconcom-boxdir'></i>"
								+"<div class='com-answer-form'>"
								+"<a data-cid='6530776' data-ctype='all' data-reply='0' onclick='commentCommit("+result.allpage.list[i].id+")' class='com-answer-submit radio5 fr' href='javascript:;'>回复</a>"
								+"<input class='com-answerinput' name='remarkContent"+result.allpage.list[i].id+"' id='remarkContent"+result.allpage.list[i].id+"' type='text'>" 
								+"</div>"
								+"<ul class='com-answer-li'></ul>"
								+"</div>"
						}
						if(result.allpage.list[i].remarks!=null){
							str+="<div class='com-answer combd clearfix open'>"
								+"<i class='iconcom iconcom-boxdir'></i>"
								+"<div class='com-answer-form'>"
								+"<a data-cid='5405748' data-ctype='' data-reply='2' class='com-answer-submit radio5 fr' onclick='commentCommit("+result.allpage.list[i].id+")' href='javascript:;'>回复</a>"
								+"<input class='com-answerinput' name='remarkContent"+result.allpage.list[i].id+"' id='remarkContent"+result.allpage.list[i].id+"' type='text'>"
								+"</div>"
								+"<ul class='com-answer-li'>";
								for(var s=0;s<result.allpage.list[i].remarks.length;s++){
									str+="<li>"
				                      	+"<p><span>"+result.allpage.list[i].user.username+"：</span>"+result.allpage.list[i].remarks[s].content+"</p>"
				                   		+"</li>";
								}
								str+="</ul>"
									+"</div>";
						}
							str+="</div>";
					}
					
					str+="<div class='paging orangestyle'>"
						+"<div class='pagebox'>";
						if(result.allpage.hasPreviousPage==false){
							str+="<span class='prevpage'><i class='larr'></i></span>";
						}else{
							str+="<a href='javascript:;' class='prevpage' hidefocus='false' onclick='getPage("+(result.allpage.pageNum-1)+","+result.scenId+")'><i class='larr'></i></a>"
						}
						for(var p=0;p<result.allpage.navigatepageNums.length;p++){
							if(result.allpage.navigatepageNums[p]==result.allpage.pageNum){
								str+="<span class='pagesel'>"+result.allpage.navigatepageNums[p]+"</span>";
							}else{
								str+="<a href='javascript:;' hidefocus='false' onclick='getPage("+result.allpage.navigatepageNums[p]+","+result.scenId+")' >"+result.allpage.navigatepageNums[p]+"</a>";
							}
						}
						if(result.allpage.hasNextPage==false){
							str+="<span class='nextpage'><i class='rarr'></i></span>";
						}else{
							str+="<a href='javascript:;' class='nextpage' onclick='getPage("+result.allpage.pageNum+1+","+result.scenId+")'><i class='rarr'></i></a>"
						}
						str+="</div>"
							+"</div>";
					$("#allCmtComment").append(str);
				}
			})
		}
		//点赞
		function addUsefulCount(remarkId){
			if($("#check").val()==null||$("#check").val()==""){
				 /* $("#getlogin").css("display","block")  */
				alert("请先登录")
				location.href="login";
			}else{
				$.ajax({
					url:"likeCheck",
					type:"post",
					data:{
						userId:$("#check").val(),
						remarkId:remarkId,
					},success:function(result){
						if(result==true){
							alert("您已经点过赞！！！");
						}else{
							$.ajax({
								url:"likecomment",
								type:"post",
								data:{
									userId:$("#check").val(),
									remarkId:remarkId,
								},success:function(result){
									if(result==true){
										alert("点赞成功")
										location.reload();
									}
								}
							})
						}
					}
				})
			}
		}
		
		
		function commentCommit(markId){
			if($("#check").val()==null||$("#check").val()==""){
				 /* $("#getlogin").css("display","block") */
				alert("请先登录")
				location.href="login";
			}else{
				$.ajax({
					url:"commentCommit",
					type:"post",
					data:{
						markId:markId,
						content:$("#remarkContent"+markId).val(),
					},success:function(result){
						if(result==true){
							alert("回复成功");
							location.reload();
						}
					}
				})
			}
		}	
		
		function commentimgCommit(markId){
			if($("#check").val()==null||$("#check").val()==""){
				/*  $("#getlogin").css("display","block") */
				alert("请先登录")
				location.href="login";
			}else{
				$.ajax({
					url:"commentCommit",
					type:"post",
					data:{
						markId:markId,
						content:$("#remarkimgContent"+markId).val(),
					},success:function(result){
						if(result==true){
							alert("回复成功");
							location.reload();
						}
					}
				})
			}
		}	
		
		function commentjhCommit(markId){
			if($("#check").val()==null||$("#check").val()==""){
				/*  $("#getlogin").css("display","block") */
				alert("请先登录")
				location.href="login";
			}else{
				$.ajax({
					url:"commentCommit",
					type:"post",
					data:{
						markId:markId,
						content:$("#remarkjhContent"+markId).val(),
					},success:function(result){
						if(result==true){
							alert("回复成功");
							location.reload();
						}
					}
				})
			}
		}
		
		$("#bestCmt").bind("click", function() {
			var count = $("#bestCmtComment").find(".comment-li").length;
			if (count <= 0) {
				Comment.newLoadPaginationOfComment({
					type : "best",
					currentPage : 1,
					totalCount : 194,
					placeId : '121200',
					productId : '',
					placeIdType : 'PLACE',
					isPicture : "N",
					isBest : "Y",
					isPOI : "Y",
					isELong : "N"
				});
			}
		});
		
		function getesspget(pageIndex,scenId){
			$.ajax({
				url:"queryessPage",
				type:"post",
				data:{
					pageIndex:pageIndex,
					scenId:scenId
				},success:function(result){
					$("#bestCmtComment").empty();
					var str="";
					 for(var i=0;i<result.esspage.list.length;i++){
						str+="<div class='comment-li'>"
							+"<div class='ufeed-info'>"
							+"<p class='ufeed-score'>";
						if(result.esspage.list[i].essence==1){
							str+="<span class='tags tags-red'>精华</span>";
						}
						if(result.esspage.list[i].mark!=null){
							if(result.esspage.list[i].mark.id==5){
								str+="<span class='ufeed-level'><i data-level='5' data-mark='' style='width: 100%;'></i></span>"
							}
							if(result.esspage.list[i].mark.id==4){
								str+="<span class='ufeed-level'><i data-level='4' data-mark='' style='width: 80%;'></i></span>"
							}
							if(result.esspage.list[i].mark.id==3){
								str+="<span class='ufeed-level'><i data-level='3' data-mark='' style='width: 60%;'></i></span>"
							}
							if(result.esspage.list[i].mark.id==2){
								str+="<span class='ufeed-level'><i data-level='2' data-mark='' style='width: 40%;'></i></span>"
							}
							if(result.esspage.list[i].mark.id==1){
								str+="<span class='ufeed-level'><i data-level='1' data-mark='' style='width: 20%;'></i></span>"
							} 
						}
						if(result.esspage.list[i].mark!=null){
							str+="<span class='ufeed-item'> <em>景区服务&nbsp;</em>"
								+"<i>"+result.esspage.list[i].mark.id+"(推荐)</i>"
								+"</span> <span class='ufeed-item'> <em>游玩体验&nbsp;</em> <i>"+result.esspage.list[i].mark.id+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>预订便捷&nbsp;</em> <i>"+result.esspage.list[i].mark.id+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>性价比&nbsp;</em> <i>"+result.esspage.list[i].mark.id+"(推荐) </i>"
								+"</span> <span class='ufeed-tag'>体验</span>"
								+"</p>"
								+"</div>"
								+"<div class='ufeed-content'>"
								+result.esspage.list[i].content
								+"<span class='JS_showmore ufeed-showmore'>查看全部<i class='iconcom iconcom-more'></i></span>"
								+"</div>"
								+"<div class='compic-big'>"
								+"<a class='l' title='上一张' href='javascript:;'></a><a class='r' title='下一张' href='javascript:;'></a>"
								+"<p></p>"
								+"</div>";
							
						}else{
							str+="<span class='ufeed-item'> <em>景区服务&nbsp;</em>"
								+"<i>"+0+"(推荐)</i>"
								+"</span> <span class='ufeed-item'> <em>游玩体验&nbsp;</em> <i>"+0+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>预订便捷&nbsp;</em> <i>"+0+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>性价比&nbsp;</em> <i>"+0+"(推荐) </i>"
								+"</span> <span class='ufeed-tag'>体验</span>"
								+"</p>"
								+"</div>"
								+"<div class='ufeed-content'>"
								+result.esspage.list[i].content
								+"<span class='JS_showmore ufeed-showmore'>查看全部<i class='iconcom iconcom-more'></i></span>"
								+"</div>"
								+"<div class='compic-big'>"
								+"<a class='l' title='上一张' href='javascript:;'></a><a class='r' title='下一张' href='javascript:;'></a>"
								+"<p></p>"
								+"</div>";
						}
						if(result.esspage.list[i].remarkimg!=null){
							str+="<div class='compic-scoll'>"
								+"<span class='compic-bigbtn fl'>"
								+"<i class='iconcom iconcom-scollleft'></i></span>"
								+"<div class='compic-small fl'>"
								+"<ul>";
								for(var j=0;j<result.esspage.list[i].remarkimg.length;j++){
									str+="<li data-src="+result.esspage.list[i].remarkimg[j].path+"><img src="+result.esspage.list[i].remarkimg[j].path+" alt='成都欢乐谷'></li>"
								}
								str+="</ul>"
									+"</div>"
									+"<a href='javascript:;' class='JS_close copic-bigup'>收起<i class='iconcom iconcom-bigup'></i></a>"
									+"<span class='compic-bigbtn fr'><i class='iconcom iconcom-scollright'></i></span>"
									+"</div>";
						} 
						if(result.esspage.list[i].remlike!=null){
							str+="<div class='com-userinfo' >"
								+"<a href='javascript:;' class='JS_reply fr com-dcom' rel='nofollow'>"
								if(result.esspage.list[i].remarks!=null){
									str+="<i class='iconcom iconcom-dcom'></i>回复<em>"+result.esspage.list[i].remarks.length+"</em></a>"
								}else{
									str+="<i class='iconcom iconcom-dcom'></i>回复<em>"+0+"</em></a>"
								}
								str+="<a href='javascript:;' onclick='addUsefulCount("+result.allpage.list[i].id+")' class='fr com-enjoy' id='userfulCount_all_6530776' rel='nofollow'>"
								+"<i class='iconcom iconcom-enjoy'></i>有用<em>"+result.esspage.list[i].remlike.length+"</em></a>"
								+"<p>"
								+"<a href='javascript:;' title="+result.esspage.list[i].user.username+" rel='nofollow'>"+result.esspage.list[i].user.username+"</a>"
								+"发表点评 "
								+"</p>"
								+"</div>";
						}else{
							str+="<div class='com-userinfo'>"
								+"<a href='javascript:;' class='JS_reply fr com-dcom' rel='nofollow'>"
								+"<i class='iconcom iconcom-dcom'></i>回复<em>"+0+"</em></a>"
								+"<a href='javascript:;' class='fr com-enjoy' id='userfulCount_all_6530776' rel='nofollow' onclick='addUsefulCount("+result.esspage.list[i].id+")'>"
								+"<i class='iconcom iconcom-enjoy'></i>有用<em>"+0+"</em></a>"
								+"<p>"
								+"<a href='javascript:;' title="+result.esspage.list[i].user.username+" rel='nofollow'>"+result.esspage.list[i].user.username+"</a>"
								+"发表点评 "
								+"</p>"
								+"</div>";
						}
						if(result.esspage.list[i].remarks==null){
							str+="<div class='com-answer combd clearfix'>"
								+"<i class='iconcom iconcom-boxdir'></i>"
								+"<div class='com-answer-form'>"
								+"<a data-cid='6530776' data-ctype='all' data-reply='0' class='com-answer-submit radio5 fr' onclick='commentjhCommit("+result.esspage.list[i].id+")' href='javascript:;'>回复</a>"
								+"<input class='com-answerinput' name='remarkjhContent"+result.esspage.list[i].id+"' id='remarkjhContent"+result.esspage.list[i].id+"' type='text'>"
								+"</div>"
								+"<ul class='com-answer-li'></ul>"
								+"</div>"
						}
						if(result.esspage.list[i].remarks!=null){
							str+="<div class='com-answer combd clearfix open'>"
								+"<i class='iconcom iconcom-boxdir'></i>"
								+"<div class='com-answer-form'>"
								+"<a data-cid='5405748' data-ctype='' data-reply='2' class='com-answer-submit radio5 fr' onclick='commentjhCommit("+result.esspage.list[i].id+")' href='javascript:;'>回复</a>"
								+"<input class='com-answerinput' name='remarkjhContent"+result.esspage.list[i].id+"' id='remarkjhContent"+result.esspage.list[i].id+"' type='text'>"
								+"</div>"
								+"<ul class='com-answer-li'>";
								for(var s=0;s<result.esspage.list[i].remarks.length;s++){
									str+="<li>"
				                      	+"<p><span>"+result.esspage.list[i].user.username+"：</span>"+result.esspage.list[i].remarks[s].content+"</p>"
				                   		+"</li>";
								}
								str+="</ul>"
									+"</div>";
						}
							str+="</div>";
					}
					
					str+="<div class='paging orangestyle'>"
						+"<div class='pagebox'>";
						if(result.esspage.hasPreviousPage==false){
							str+="<span class='prevpage'><i class='larr'></i></span>";
						}else{
							str+="<a href='javascript:;' class='prevpage' hidefocus='false' onclick='getPageimg("+(result.esspage.pageNum-1)+","+result.scenId+")'><i class='larr'></i></a>"
						}
						for(var p=0;p<result.esspage.navigatepageNums.length;p++){
							if(result.esspage.navigatepageNums[p]==result.esspage.pageNum){
								str+="<span class='pagesel'>"+result.esspage.navigatepageNums[p]+"</span>";
							}else{
								str+="<a href='javascript:;' hidefocus='false' onclick='getPageimg("+result.esspage.navigatepageNums[p]+","+result.scenId+")' >"+result.esspage.navigatepageNums[p]+"</a>";
							}
						}
						if(result.esspage.hasNextPage==false){
							str+="<span class='nextpage'><i class='rarr'></i></span>";
						}else{
							str+="<a href='javascript:;' class='nextpage' onclick='getPageimg("+result.esspage.pageNum+1+","+result.scenId+")'><i class='rarr'></i></a>"
						}
						str+="</div>"
							+"</div>";
					$("#bestCmtComment").append(str);
				}
			})
		}
		
		function getPageimg(pageIndex,scenId){
			$.ajax({
				url:"queryPageImg",
				type:"post",
				data:{
					pageIndex:pageIndex,
					scenId:scenId
				},success:function(result){
					$("#picCmtComment").empty();
					var str="";
					 for(var i=0;i<result.imgpage.list.length;i++){
						str+="<div class='comment-li'>"
							+"<div class='ufeed-info'>"
							+"<p class='ufeed-score'>";
						if(result.imgpage.list[i].essence==1){
							str+="<span class='tags tags-red'>精华</span>";
						}
						if(result.imgpage.list[i].mark!=null){
							if(result.imgpage.list[i].mark.id==5){
								str+="<span class='ufeed-level'><i data-level='5' data-mark='' style='width: 100%;'></i></span>"
							}
							if(result.imgpage.list[i].mark.id==4){
								str+="<span class='ufeed-level'><i data-level='4' data-mark='' style='width: 80%;'></i></span>"
							}
							if(result.imgpage.list[i].mark.id==3){
								str+="<span class='ufeed-level'><i data-level='3' data-mark='' style='width: 60%;'></i></span>"
							}
							if(result.imgpage.list[i].mark.id==2){
								str+="<span class='ufeed-level'><i data-level='2' data-mark='' style='width: 40%;'></i></span>"
							}
							if(result.imgpage.list[i].mark.id==1){
								str+="<span class='ufeed-level'><i data-level='1' data-mark='' style='width: 20%;'></i></span>"
							} 
						}
						if(result.imgpage.list[i].mark!=null){
							str+="<span class='ufeed-item'> <em>景区服务&nbsp;</em>"
								+"<i>"+result.imgpage.list[i].mark.id+"(推荐)</i>"
								+"</span> <span class='ufeed-item'> <em>游玩体验&nbsp;</em> <i>"+result.imgpage.list[i].mark.id+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>预订便捷&nbsp;</em> <i>"+result.imgpage.list[i].mark.id+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>性价比&nbsp;</em> <i>"+result.imgpage.list[i].mark.id+"(推荐) </i>"
								+"</span> <span class='ufeed-tag'>体验</span>"
								+"</p>"
								+"</div>"
								+"<div class='ufeed-content'>"
								+result.imgpage.list[i].content
								+"<span class='JS_showmore ufeed-showmore'>查看全部<i class='iconcom iconcom-more'></i></span>"
								+"</div>"
								+"<div class='compic-big'>"
								+"<a class='l' title='上一张' href='javascript:;'></a><a class='r' title='下一张' href='javascript:;'></a>"
								+"<p></p>"
								+"</div>";
							
						}else{
							str+="<span class='ufeed-item'> <em>景区服务&nbsp;</em>"
								+"<i>"+0+"(推荐)</i>"
								+"</span> <span class='ufeed-item'> <em>游玩体验&nbsp;</em> <i>"+0+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>预订便捷&nbsp;</em> <i>"+0+"(推荐) </i>"
								+"</span> <span class='ufeed-item'> <em>性价比&nbsp;</em> <i>"+0+"(推荐) </i>"
								+"</span> <span class='ufeed-tag'>体验</span>"
								+"</p>"
								+"</div>"
								+"<div class='ufeed-content'>"
								+result.imgpage.list[i].content
								+"<span class='JS_showmore ufeed-showmore'>查看全部<i class='iconcom iconcom-more'></i></span>"
								+"</div>"
								+"<div class='compic-big'>"
								+"<a class='l' title='上一张' href='javascript:;'></a><a class='r' title='下一张' href='javascript:;'></a>"
								+"<p></p>"
								+"</div>";
						}
						if(result.imgpage.list[i].remarkimg!=null){
							str+="<div class='compic-scoll'>"
								+"<span class='compic-bigbtn fl'>"
								+"<i class='iconcom iconcom-scollleft'></i></span>"
								+"<div class='compic-small fl'>"
								+"<ul>";
								for(var j=0;j<result.imgpage.list[i].remarkimg.length;j++){
									str+="<li data-src="+result.imgpage.list[i].remarkimg[j].path+"><img src="+result.imgpage.list[i].remarkimg[j].path+" alt='成都欢乐谷'></li>"
								}
								str+="</ul>"
									+"</div>"
									+"<a href='javascript:;' class='JS_close copic-bigup'>收起<i class='iconcom iconcom-bigup'></i></a>"
									+"<span class='compic-bigbtn fr'><i class='iconcom iconcom-scollright'></i></span>"
									+"</div>";
						} 
						if(result.imgpage.list[i].remlike!=null){
							str+="<div class='com-userinfo' >"
								+"<a href='javascript:;' class='JS_reply fr com-dcom' rel='nofollow'>";
								if(result.imgpage.list[i].remarks!=null){
									str+="<i class='iconcom iconcom-dcom'></i>回复<em>"+result.imgpage.list[i].remarks.length+"</em></a>";
								}else{
									str+="<i class='iconcom iconcom-dcom'></i>回复<em>"+0+"</em></a>";
								}
								str+="<a href='javascript:;' onclick='addUsefulCount("+result.imgpage.list[i].id+")' class='fr com-enjoy' id='userfulCount_all_6530776' rel='nofollow'>"
								+"<i class='iconcom iconcom-enjoy'></i>有用<em>"+result.imgpage.list[i].remlike.length+"</em></a>"
								+"<p>"
								+"<a href='javascript:;' title="+result.imgpage.list[i].user.username+" rel='nofollow'>"+result.imgpage.list[i].user.username+"</a>"
								+"发表点评 "
								+"</p>"
								+"</div>";
						}else{
							str+="<div class='com-userinfo'>"
								+"<a href='javascript:;' class='JS_reply fr com-dcom' rel='nofollow'>"
								+"<i class='iconcom iconcom-dcom'></i>回复<em>"+0+"</em></a>"
								+"<a href='javascript:;' class='fr com-enjoy' id='userfulCount_all_6530776' rel='nofollow' onclick='addUsefulCount("+result.imgpage.list[i].id+")'>"
								+"<i class='iconcom iconcom-enjoy' ></i>有用<em>"+0+"</em></a>"
								+"<p>"
								+"<a href='javascript:;' title="+result.imgpage.list[i].user.username+" rel='nofollow'>"+result.imgpage.list[i].user.username+"</a>"
								+"发表点评 "
								+"</p>"
								+"</div>";
						}
						if(result.imgpage.list[i].remarks==null){
							str+="<div class='com-answer combd clearfix'>"
								+"<i class='iconcom iconcom-boxdir'></i>"
								+"<div class='com-answer-form'>"
								+"<a data-cid='6530776' data-ctype='all' data-reply='0' onclick='commentCommit("+result.imgpage.list[i].id+")' class='com-answer-submit radio5 fr' href='javascript:;'>回复</a>"
								+"<input class='com-answerinput' name='remarkimgContent"+result.imgpage.list[i].id+"' id='remarkimgContent"+result.imgpage.list[i].id+"' type='text'>" 
								+"</div>"
								+"<ul class='com-answer-li'></ul>"
								+"</div>"
						}
						if(result.imgpage.list[i].remarks!=null){
							str+="<div class='com-answer combd clearfix open'>"
								+"<i class='iconcom iconcom-boxdir'></i>"
								+"<div class='com-answer-form'>"
								+"<a data-cid='5405748' data-ctype='' data-reply='2' class='com-answer-submit radio5 fr' onclick='commentimgCommit("+result.imgpage.list[i].id+")' href='javascript:;'>回复</a>"
								+"<input class='com-answerinput' name='remarkimgContent"+result.imgpage.list[i].id+"' id='remarkimgContent"+result.imgpage.list[i].id+"' type='text'>"
								+"</div>"
								+"<ul class='com-answer-li'>";
								for(var s=0;s<result.imgpage.list[i].remarks.length;s++){
									str+="<li>"
				                      	+"<p><span>"+result.imgpage.list[i].user.username+"：</span>"+result.imgpage.list[i].remarks[s].content+"</p>"
				                   		+"</li>";
								}
								str+="</ul>"
									+"</div>";
						}
							str+="</div>";
					}
					str+="<div class='paging orangestyle'>"
						+"<div class='pagebox'>";
						if(result.imgpage.hasPreviousPage==false){
							str+="<span class='prevpage'><i class='larr'></i></span>";
						}else{
							str+="<a href='javascript:;' class='prevpage' hidefocus='false' onclick='getPageimg("+(result.imgpage.pageNum-1)+","+result.scenId+")'><i class='larr'></i></a>"
						}
						for(var p=0;p<result.imgpage.navigatepageNums.length;p++){
							if(result.imgpage.navigatepageNums[p]==result.imgpage.pageNum){
								str+="<span class='pagesel'>"+result.imgpage.navigatepageNums[p]+"</span>";
							}else{
								str+="<a href='javascript:;' hidefocus='false' onclick='getPageimg("+result.imgpage.navigatepageNums[p]+","+result.scenId+")' >"+result.imgpage.navigatepageNums[p]+"</a>";
							}
						}
						if(result.imgpage.hasNextPage==false){
							str+="<span class='nextpage'><i class='rarr'></i></span>";
						}else{
							str+="<a href='javascript:;' class='nextpage' onclick='getPageimg("+result.imgpage.pageNum+1+","+result.scenId+")'><i class='rarr'></i></a>"
						}
						str+="</div>"
							+"</div>";
					$("#picCmtComment").append(str);
				}
			});
		}
		
		function getPagetra(pageIndex,scenicId){
			$.ajax({
				url:"getPagetra",
				type:"post",
				data:{
					scenId:scenicId,
					pageIndex:pageIndex
				},success:function(result){
					$("#allTrip").empty();
					var res="";
					for(var i=0;i<result.page.list.length;i++){
						res+="<li><a class='trip-listPic' target='_blank' href='javascript:;' title='' hidefocus='false' data='0'>"
							+"<img src="+result.page.list[i].coverimg+" width='190' height='127' alt="+result.page.list[i].coverimg.title+">"
							+"</a>"
							+"<div class='trip-listInfo'>"
							+"<p class='trip-listTiy' date-travel='1'>"
							+"<a target='_blank' href='javascript:;' hidefocus='false' data='0'>"+result.page.list[i].title+"</a>"
							+"</p>"
							+"<p class=‘trip-listTime’>由兔爸爸攻略编辑发表于"+result.page.list[i].time+"</p>"
							+"<p class='trip-listCon'>"
							+"<span class='icon dicon-yhL'></span>"
							+"<span class='icon dicon-yhR'></span>"
							+result.page.list[i].content+"..."
							+"</p>"
							+"</div></li>"
					}
					res+="<div class='paging orangestyle'>"
						+"<div class='pagebox'>";
						if(result.page.hasPreviousPage==false){
							res+="<span class='prevpage'><i class='larr'></i></span>";
						}else{
							res+="<a href='javascript:;' class='prevpage' hidefocus='false' onclick='getPagetra("+(result.page.pageNum-1)+","+result.scenId+")'><i class='larr'></i></a>"
						}
						for(var p=0;p<result.page.navigatepageNums.length;p++){
							if(result.page.navigatepageNums[p]==result.page.pageNum){
								res+="<span class='pagesel'>"+result.page.navigatepageNums[p]+"</span>";
							}else{
								res+="<a href='javascript:;' hidefocus='false' onclick='getPagetra("+result.page.navigatepageNums[p]+","+result.scenId+")' >"+result.page.navigatepageNums[p]+"</a>";
							}
						}
						if(result.page.hasNextPage==false){
							res+="<span class='nextpage'><i class='rarr'></i></span>";
						}else{
							res+="<a href='javascript:;' class='nextpage' onclick='getPagetra("+result.page.pageNum+1+","+result.scenId+")'><i class='rarr'></i></a>"
						}
						res+="</div>"
							+"</div>";
						$("#allTrip").append(res);
				}
			})
		}
		
		$("#picCmt").bind("click", function() {
			var count = $("#picCmtComment").find(".comment-li").length;
			if (count <= 0) {
				Comment.newLoadPaginationOfComment({
					type : "pic",
					currentPage : 1,
					totalCount : 3477,
					placeId : '121200',
					productId : '',
					placeIdType : 'PLACE',
					isPicture : "Y",
					isBest : "N",
					isPOI : "Y",
					isELong : "N"
				});
			}
		});
		
		//攻略事件
		$('.strategy').live('click', function() {
			var _this = $(this);
			var suc = function() {
				window.location.href = "";
			};
			var fail = function() {
				//记录按钮
				publicCallBack.btn = _this;
			}
			loginDo(suc, fail);
		});

		//是否收藏
		function isCollect() {
			
		}

		
		<!--统计点击驴友点评访问量-->
		$('[date_id="comments"]').bind("click", function() {
			cmCreateElementTag("景点门票_驴友点评", "驴友点评tab点击");
		});
		<!--统计点击相关游记访问量-->
		$('[date_id="product-customer-trip"]').bind("click", function() {
			cmCreateElementTag("景点门票_相关游记", "相关游记tab点击");
		});
		
		function showRiskDialog(errorMessage) {
			errorMessage = errorMessage || "领券通道暂时拥堵，请稍后再试";
			$(".risk-management-dialog p").html(errorMessage);
			$(".risk-management-overlay, .risk-management-dialog").show();
			$(".risk-management-dialog .btn").on("click", function() {
				$(".risk-management-overlay, .risk-management-dialog").hide();
			});
		}

		$(".tags").poptip();

		$(".pdetails-tab li").live(
				'click',
				function() {
					var $me = $(this), $index = $me.index();
					$me.addClass('active').siblings().removeClass('active');
					$me.parents('.pdetails-tabBox').find('.pdetails-tabCon')
							.eq($index).show().siblings('.pdetails-tabCon')
							.hide();
				});

		var type = 'BAIDU';
		var content=$("#titlescenic").val();
		lvmap({
			type : type.toLowerCase(),//地图类型,支持google, baidu. 默认google
			marker : true,//是否显示地图标记. 默认不显示
			coordinate : {
				lng : 104.041179,
				lat : 30.727287
			},//地图中心点的经度(lng)和纬度(lat)
			zoom : 15,//缩放等级. 默认15,即街道级别. 数值越大,可视区域越小,地标显示越清晰
			keyType : 1,//key的类型仅在google地图有效，0是没有key(默认是0)，1是频道页的key
			containerID : "traffic-map",//地图容器的ID
			markerTips : {
				title : content,
				content : content,
				maxWidth : 150,
				maxHeight : 100
			}
		//地图标记信息: marker为true且content有值时显示. 默认不显示. 支持自定义提示框宽高.
		});
		
	</script>
	
	
	
	<script src="http://api.map.baidu.com/getscript?v=1.4"></script>

	<script type="text/javascript"
		src="http://pic.lvmama.com/min/index.php?f=/js/common/losc.js"></script>
	<!--360聚效开始-->
	<script type="text/javascript">
		var _mvq = window._mvq || [];
		window._mvq = _mvq;
		_mvq.push([ '$setAccount', 'm-193368-0' ]);
		_mvq.push([ '$setGeneral', 'goodsdetail', '', '', '' ]);
		_mvq.push([ '$logConversion' ]);
		_mvq.push([ 'setPageUrl', 'http://ticket.lvmama.com/scenic-121200' ]);
		_mvq
				.push([
						'$addGoods',
						'',
						'', /*产品名称*/
						'成都欢乐谷',/*产品ID*/
						'182386',/*产品售价*/
						'55', /*产品图片url*/
						'http://pic.lvmama.com//uploads/pc/place2/2018-10-12/8870dbb0-75dc-4232-b3c6-08bb7fb9b90e_480_320.jpg',
						'', '', /*产品库存状态1在售或是0售完或下架*/'1', '', '', '', /*品类,productType_categoryName*/
						'门票', '', '' ]);
		_mvq.push([ '$addPricing', '' ]);
		_mvq.push([ '$logData' ]);
	</script>
	<!--360聚效结束-->


	<div class="complete_box" style="display: none">
		<ul class="complete_list"></ul>
	</div>
	<div class="complete_box_hotel hotelDestBox" style="display: none"></div>
	<div class="complete_box_hotel hotelKeywordBox" style="display: none"></div>
	<div class="complete_error_tips" style="display: none;">
		<span>找不到目的地：</span><span class="word"></span><i>×</i>
	</div>
	<div id="right-bottom-tools">
		<a id="sideInve" target="_blank"
			href="https://wj.qq.com/s/1293296/f5ae" title="有奖问卷"></a><a
			id="goTopBtn" target="_self" href="javascript:;" title="返回顶部"
			class="" style="visibility:hidden;"></a><a
			href="http://www.lvmama.com/userCenter/user/transItfeedBack.do"
			target="_blank" id="Feedback" title="意见反馈" class=""
			style="visibility: hidden;"></a>
	</div>
	<div id="userdata_el" style="visibility: hidden; position: absolute;"></div>
</body>
</html>