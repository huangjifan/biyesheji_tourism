<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写订单</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/header_new.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/fillInOrderForm.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
</head>
<body class="order-group">
	<div class="order-header">
	    <div class="header-inner clearfix">
	        <a class="logo" href="${pageContext.request.contextPath}/index">自助游天下 就找驴妈妈</a>
	        <!--未登录  添加class="logo-describe-before",登陆后去掉class="logo-describe-before" -->
	                    <div class="logo-describe logo-describe-login logo-describe-before">
	                <p class="serve-phone">24小时服务热线 <span>1010-6060</span></p>
	            </div>
	
	        <ol class="ui-step">
	            <li class="ui-step-start ui-step-active">
	                <div class="ui-step-arrow">
	                    <i class="step-num">1</i>
	                </div>
	                <span class="ui-step-text">填写订单</span>
	            </li>
	            <li class="ui-step-middle">
	                <div class="ui-step-arrow">
	                    <i class="step-num">2</i>
	                </div>
	                <span class="ui-step-text">在线支付</span>
	            </li>
	            <li class="ui-step-end">
	                <div class="ui-step-arrow">
	                    <i class="step-num">3</i>
	                </div>
	                <span class="ui-step-text">预定成功</span>
	            </li>
	        </ol>
	    </div>
	</div>

	<form method="POST" action="${pageContext.request.contextPath}/indent/submitIndent" name="orderForm" id="order_submit">
		<!-- 景点id -->
		<input id="userId" type="hidden" value="${userid}">
		<!-- 景点id -->
		<input id="scenicId" name="scenic.id" type="hidden" value="${scenicId}">
		<!-- 旅游路线id -->
		<input id="scenicwayId" name="scenicway.id" type="hidden" value="${scenicwayId}">
		<!-- 旅游分类 -->
		<input id="atrtitle" type="hidden" value="${atrtitle}">
		<!-- 名称 -->
		<input id="name" name="commodity" type="hidden" value="${name}">
		<!-- indent.描述 -->
		<input id="description" name="scenicway.description" type="hidden" value="${description}">
		<!-- 出发城市 -->
		<input id="departCity" type="hidden" value="${departCity}">
		<!-- indentdetails.出发时间 -->
		<input id="departDate" name="starttime" type="hidden" value="${departDate}">
		<!-- indentdetails.返回时间 -->
		<input id="returnDate" name="endtime" type="hidden" value="${returnDate}">
		<!-- 成人人数 -->
		<input id="adultNumber" type="hidden" value="${adultNumber}">
		<!-- 儿童人数 -->
		<input id="childrenNumber" type="hidden" value="${childrenNumber}">
		<!-- indentdetails.人数 -->
		<input name="peopleCount" type="hidden" value="${childrenNumber + adultNumber}">
		<!-- indentdetails.份数 -->
		<input name="copies" type="hidden" value="${childrenNumber + adultNumber}">
		<!-- indentdetails.下单时间 -->
		<input id="orderstime" name="orderstime" type="hidden" value="">
		<!-- 单价/成人价 -->
		<input id="adultPrice" name="costExplains[0].price" type="hidden" value="${adultPrice}">
		<!-- 原价 -->
		<input id="totalPrice" type="hidden" value="${totalPrice}">
		<!-- indent.优惠后的金额 -->
		<input name="indent.price" type="hidden" value="${money}">
		<!-- 优惠后的金额 -->
		<input id="money" name="grossAmount" type="hidden" value="${money}">
		<!-- 优惠金额 -->
		<input id="discountsMoney" name="concessionsMoney" type="hidden" value="${discountsMoney}">
		<!-- 优惠卷id -->
		<input id="couponId" name="couponId" type="hidden" value="">
		
		<div class="mainBox orderGroup">
		    <div class="wrap clearfix">
	            <div class="orderInfo orderTicketInfo order-charges" style="position: fixed;top: 90px;left: 1000.5px;">
	                <div class="orderTicketInfo-fix">
	                    <div class="orderTicketInfo-list" id="priceInfoDiv">
	                        <h3>费用明细</h3>
							
							<ul class="nobd" id="mainPriceInfo" data-totalprice="510000">
								<li class="primary">
									<em>基本团费</em>
									<dfn>
										<i>¥</i>
									</dfn>
								</li>
								<!-- 
								<li>
									<p class="ensurance-details">机票</p>
									<dfn>
										<i></i>x2
									</dfn>
								</li>
								<li>
									<p class="ensurance-details">机票</p>
									<dfn>
										<i></i>x2
									</dfn>
								</li> 
								-->
								<li>
									<p class="ensurance-details"></p>
									<dfn>
										<i></i>x
									</dfn>
								</li>
							</ul>
							<ul id="optionalPriceInfo" style="display: none;"></ul>
	                        <ul id="promotionPriceInfo" data-totalprice="10000">
	                            <li class="primary"><em>优惠信息</em><dfn class="minus"><i>- ¥</i></dfn></li>
	                            <li class="fk_promotionAmount"><p>促销</p><dfn><i>¥</i></dfn></li>
	                        </ul>
	                        
	
	                    </div>
	                    <div class="ticketPriceTotal">
	                        <em>订单金额：</em>
	                        <div class="priceCount">
	                            <dfn><span class="yh">¥</span></dfn><br>
	                        </div>
	                        <div class="side_next_box" style="display: block;">
	                            <p class="check checked xieyi_checkbox js_checkbox" onclick="checkedOrCancel(this)"><span class="checkbox"></span>我已同意以下预订须知及合同条款</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="orderMainLeft order-main">
                    <!-- 未登录提示 -->
                    <div class="tiptext tip-info order_login" style="display: none;">
                        <span class="tip-icon tip-icon-info"></span>您当前未登录，如您是驴妈妈会员，请先<a class="order_login_btn" href="${pageContext.request.contextPath}/login">登录</a>
                    </div>
	
	                <div id="product" class="order-details">
	                    <div class="order-details-header">
	                        <h1 class="detail_product_tit">
	                            <b></b>&nbsp;&nbsp;
	                        </h1>
	                        <div class="order-title-details clearfix">
	                            <p>
	                                	出发城市：<span></span>
	                            </p>
	                            <p>
	                               	 	出发日期：<span></span>
	                            </p>
	                            <p>
	                                	返回日期：<span></span>
	                            </p>
	                            <p>
	                               		 出发人数：<span></span>
	                            </p>
	                        </div>
	                    </div>
	                    <div class="order-details-body">
		                    <!--交通-->
							<!-- 机票 -->
							<!-- 其他票 -->
							
							<!-- 当地游 -->
							<dl class="order-product-dl order-product-hide" style="display: block;">
							    <dt><span class="order-icon order-icon-local"></span></dt>
						        <dd class="order-product-dd-hotel">
						            <p class="order-product-name"></p>
						            <ul class="order-product-info">
						                <li>出游时间：<b></b></li>
						                <li></li>
						            </ul>
						        </dd>
							</dl>
	
	                        <a class="btn_detail_show detail_hide">收起明细<span>◆<b>◆</b></span></a>
	                    </div>
	                </div>
	                <div class="order-box">
						<!-- 联系人信息 开始 -->
						<div class="orderBox">
						    <div class="orderTit">
						        <span class="iconBg"><b class="order-icon orderIcon-checkIn2"></b></span>
						        <h3>购买人信息</h3>
						    </div>
						        <div class="ticketInput">
									<div class="playerLi js_copy_info">
										<p class="orderUser">
											<span>1</span>
											<em>购买人</em>
										</p>
										<dl class="orderDl">
											<dt><span class="red">*</span>中文姓名：</dt>
											<dd>
												<input class="input js_yz js-copy-name" type_name="username" name="realname" id="contactFullName" buyerid="" maxlength="20" type="text" placeholder="请输入中文姓名">
												<span class="error_text" style="display: none;"><i class="tip-icon tip-icon-error"></i></span>
											</dd>
										</dl>
										
										<dl class="orderDl">
											<dt><span class="red">*</span>手机号码：</dt>
											<dd>
												<input class="input js_yz js_textBig  js-copy-phone" id="contactMobile" name="iphone" maxlength="11" type="text" placeholder="通过手机可接收订单短信">
						                        <span class="ts_text">此手机号为接收短信所用，作为订购与取票凭证，请准确填写。</span>
						                        <span class="error_text" zitem="exception"><i class="tip-icon tip-icon-error"></i>手机号码不正确</span>
											</dd>
										</dl>
						
										<dl class="orderDl">
											<dt><span class="red">*</span>Email邮箱：</dt>
											<dd>
												<input class="input js_yz" name="email" id="contactEmail" emailnow="true" type_name="email" type="text" placeholder="请输入邮箱">
												<span class="ts_text">
														此邮箱地址为接收旅游合同等重要信息，请准确填写
													</span>
												<span class="error_text"><i class="tip-icon tip-icon-error"></i>邮箱地址不正确</span>
											</dd>
										</dl>
						            </div>
						        </div>
						</div>
						<!-- 联系人信息 结束 -->
						
						<!-- 出游人信息 开始 -->
						<div class="orderBox" id="Jtenantlist">
						    <div class="orderTit">
						        <span class="iconBg"><b class="orderIcon orderIcon-checkIn"></b></span>
						        <h3>出游人信息</h3>
						    </div>
						
						    <div class="nova-tip nova-tip-warning">
						        <span class="nova-icon-xs nova-icon-warning"></span>
						        为了保障您的合法权益，请准确、完整的填写游客证件信息，错误的身份信息可能造成额外的退、改费用，保险拒赔等问题，由此产生的费用或损失可能由您个人承担。
						    </div>
						    <div class="nameListbox">
						    </div>
						   	<div class="ticketInput">
							</div>
						</div>
						<!-- 联系人信息 结束 -->
						
	                   	<!-- 国内跟团游、当地游出游人预订限制start -->
                        <div class="orderBox">
                            <div class="orderTit" id="playlimit">
                                <span class="iconBg"><b class="order-icon order-icon-limit"></b></span>
                                <h3>出游人限制</h3>
                            </div>
                            <div class="order_people_limit">
                                <div class="people_limit_text">
                                        <p><i>*</i>出于安全考虑，本产品不支持孕妇预订，建议选择其他出行方式，敬请谅解；</p>
                                        <p><i>*</i>若出行人中有70周岁以上（含）客人，烦请预订前致电驴妈妈客服咨询是否可以参团，给您带来的不便敬请谅解；</p>
                                </div>
                                <div class="people_limit_more" style="display: none;">查看更多<span>◆<b>◆</b></span></div>
                                <a href="javascript:;" class="people_limit_agreement check js_checkbox checked" onclick="checkedOrCancel(this)"><span class="checkbox"></span>我已认真阅读并确认所有出游人均满足出游条件</a>
                            </div>
                        </div>
	                    <!-- 国内跟团游、当地游出游人预订限制end -->
						<!-- 当地游游玩人 开始 -->
						<!-- 当地游游玩人 结束 -->
						<!-- 上车地点 开始 -->
						<div class="orderBox">
							 <!-- 当地游产品去程和返程上下车选择项 -->
						</div>
						
						<!--配送方式-->
						<!-- 新版发票 -->
						
						<!-- 优惠及抵扣 开始 -->
						<div class="orderBox">
						    <div class="yhq-order-box">
						        <div class="order-tit">
						            <span class="yh-tip js_tips" tip-content="温馨提示：若您在下单后对出游时间或出游人数进行变更，将无法享受促销优惠。">优惠说明</span>
						            <span class="icon-grey-yhq"></span>
						            <h3>优惠方式</h3>
						        </div>
						        <!----隐藏：是否互斥及互斥选择---->
						        <!----0：不互斥；1：互斥-选择促销；2：互斥-选择优惠券---->
						      	<div id="activityShow" class="yhfs-content">
						            
						            <div class="yhfs-tip" style="margin-left: 50px;display: none;" id="nologinBox"><a href="${pageContext.request.contextPath}/login" class="order_login_btn">登录</a>可享账户内优惠券或添加优惠券码</div>
						        </div>
						    </div>
						    <div class="youhui_box" style="display: none">
						        <ul class="youhui_list2">
						            <li>
						                <div class="youhui_info" style="display: none">
						                    <!--可用优惠券列表-->
						                    <table class="youhui_table youhui_table_new">
						
						                    </table>
						                    <div class="youhui_table_box">
						                        <table class="youhui_table youhui_table_new">
						                            <tbody class="fixedCouponTbody">
						                            <tr class="no_youhuiquanTr">
						                                <td colspan="5">
						                                    <!--没有优惠券的时候提示-->
						                                    <div class="no_youhuiquan">
						                                        <i class="order_icon order_lvhead"></i><span id="no_use">很遗憾，您暂无可用优惠券</span>
						                                    </div>
						
						                                </td>
						                            </tr>
						
						
						                            </tbody>
						                            <tbody class="border_t1_dotted freeCouponTbody">
						
						                            </tbody>
						                        </table>
						                    </div>
						                    <!--展开后的箭头-->
						                    <div class="info_arrow"><span>◆</span><i>◆</i></div>
						                </div>
						            </li>
						        </ul>
						    </div>
						
						</div>
						<!-- 优惠及抵扣 结束 -->
						
						
						<!-- 优惠券模板 -->
						<div class="yhfs-yhq-list-body">
						    <div class="yhfs-yhq-list clearfix">
						        <!-- 已选加yhfs-yhq-item-active -->
						    </div>
						</div>
						<!-- 无敌券模板 -->
						<div class="yhfs-wdq-list-body">
						    <div class="yhfs-wdq-list clearfix">
						        <!-- 已选加yhfs-yhq-item-active -->
						    </div>
						</div>                
					</div>
					<!--风控检测开始-->
	                <div class="orderMobileCode" id="risk_sms_box" style="display:none">
	                    <div class="tiptext tip-info order_login">
	                        <span class="tip-icon tip-icon-info"></span> 为了您资金的安全，请输入短信验证码
	                    </div>
	                    <div class="user_info no_bd">
	                        <dl class="orderDl" id="hasBindMobile">
	                            <dt><span class="red">*</span>短信验证码：</dt>
	                            <dd>
	                                <input class="input" type="text" placeholder="请输入验证码" id="riskSms" name="riskSms">
	                                <span class="btn btn-lg mg0 js_order_yzm_risk">获取验证码</span>
	                                <span class="ts_text" id="riskHiddenMobileSpan"><i class="tip-icon tip-icon-info" id="riskHiddenMobile"></i></span>
	                                <span class="error_text" id="riskErrorSpan"><i class="tip-icon tip-icon-error"></i>短信验证码有误，请重新获取</span>
	                            </dd>
	                        </dl>
	
	                        <div class="ml20" id="noBindMobile" style="display:none">
	                            <span class="btn cbtn-default" data-action="bindingPhone">绑定手机号</span>
	                            <span class="ts_text ml10"><i class="tip-icon tip-icon-info"></i>绑定后刷新页面继续付款</span>
	                        </div>
	                    </div><!--短信验证码  结束-->
	                </div>
	                
	                <!--风控检测结束-->
	                <!--付款按钮-->
	                <div class="fk_box_fixed mt20">
	                    <div class="fk_box js_hide_next_box" style="position: fixed;">
	                        <!-- 按钮禁止下单样式 增加class：stop_fk -->
	                        <a class="btn_fk js_tijiao" onclick="submit()" submitflag="true">同意以下协议，去付款</a>
	
	                        <div class="fk_l">
	                            <div class="fk_jg">
	                                <p class="fk_p1">应付<span><small>¥</small></span></p>
	                                <!-- <p class="fk_p2">点评返现 ¥ 0</p> -->
	                            </div>
	                        </div>
	                    </div>
	                </div>
					
					<div class="bl-agree xieyi_ok JS_xieyi_ok">
					    <p class="check checked xieyi_checkbox js_checkbox" onclick="checkedOrCancel(this)"><span class="checkbox"></span>我已同意以下预订须知及合同条款</p>
					</div>
					
					<!--协议书-->
					<div class="battery-limit">
					    <div class="bl-content">
					        <h3>预订须知</h3>
					                    <p>
					                    费用包含<br>
					                    1、用车：海南地接指定委派GPS安全监控系统旅游车配置空调旅游车（实行滚动发班，确保每人一个正座）。
					2、住宿：行程中所列酒店标准间（备选酒店详见行程），如您选择0元换购三亚京海国际假日酒店高级海景小套房，则按照换购的酒店进行安排
					（如需加床，差价请现询客服）；
					3、用餐：含4正4早（不用不退费）；（其中1餐标25元/人，1餐标30元/人，1餐标48元/人，1餐标80元/人）
					4、门票：行程中注明含的景点首道门票。（行程为综合打包价格，持有任何优惠证件，均不退优惠差价，请您谅解。）
					5、导游服务：当地导游服务。
					6、接送机服务：由公司派专职人员负责机场接送；
					7、 购物须知：全程绝不增加任何购物店。（部分景区、酒店内设有购物场所，属于自行商业行为。
					8、旅游保险：已购买《海南旅行社责任险》，强烈建议游客自行购买旅游意外险。
					9、儿童费用包含：2岁以上1.2米以下儿童只含半价正餐+旅游车位。不占床位不含早餐，如产生门票等费用请自理。
					10、每单赠送一份海南特产礼盒，不用不退。
					 ,成人、2-12周岁儿童均含往返机票;以上报价已包含机票税和燃油附加费。<br>
					            </p><br>
					            <p>
					                    费用不包含<br>
					                1、不提供自然单间，产生单房差或加床费用自理。非免费餐饮费、洗衣、电话、饮料、烟酒、付费电视、行李搬运等费用。
					2、自由活动期间交通费、餐费、等私人费用。
					3、行程中未提到的其它费用：如特殊门票、游船（轮）、景区内二道门票、观光车、电瓶车、缆车、索道、动车票等费用。
					4、儿童的“旅游费用包含”内容以外的所有费用。例如产生超高餐费、门票等需客人另付！
					5、个人购物、娱乐（潜水、拖曳伞等海上项目）消费。
					6、因交通延误、取消等意外事件或不可抗力原因导致的额外费用，及个人所产生的费用等。
					7、因旅游者违约、自身过错、自身疾病，导致的人身财产损失而额外支付的费用。
					8、赠送项目：所有行程内标明赠送项目，如不参加，视为自动放弃，不做退费处理；
					9、保险：本产品不含旅游人身意外险,我们强烈建议游客购买。游客可在填写订单时勾选附加产品
					中的相关保险购买。
					10、红树林酒店儿童早餐收费标准：0.7米-1.2米的儿童需收取早餐费用35元/人/餐，1.2米以上99元/人/餐，酒店现付，以酒店对外公布为准；
					
					
					温馨提示：为了您在出游过程中获得更为全面的保障，强烈建议旅游者出游时根据个人意愿和需要，自行投保人身意外伤害保险等个人险种。
					<br>
					            </p>
					
					                <p>
					                    出行警示及说明<br>
					                    </p><p>
						行前须知
					</p>
					<p>
						1） 
					若旅游行程内含有购物店，旅游者有权选择是否参加，如旅游者不愿参加，可选择预订其他旅游产品线路。旅游行程中的自由活动期间内，旅行社将会视旅游者需求
					及实际情况推荐部分自费项目，如旅游者自愿参加，应与旅行社另行签署书面协议，并不得影响同团其他客人在此期间的活动安排。<br>
					2） 旅行过程中须经过景区、博物馆等衍生设置的购物店，请您特别注意商品的价格合理性及品质，谨慎选择。在付款前务必仔细检查，确保商品完好无损、配件齐全并具备相应的鉴定证书，明确了解商品售后服务流程；购买后妥善保管相关票据以备维权
					</p>
					<p>
						1.根据国家法律规定，为确保您的游程顺利，请随身携带并自行保管好您的有效身份证明（12岁以下儿童携带户口簿原件或者护照）。
					</p>
					<p>
						2.此旅游产品为团队游，未经随团领队同意，游客在游览过程中不允许离团（行程中自由活动除外），不便之处敬请谅解。游客个人或结伴未经领队或导游同意私自外出所发生一切意外事故或事件引起的任何责任与后果，均由游客自负，与旅行社无关。
					</p>
					<p>
						3.为了不耽误您的行程，请您严格按照《出团通知书》要求，在航班起飞前规定时间到达机场集合并办理登机和出入境相关手续。出团通知书会在出发前1天给到客人。
					</p>
					<p>
						预定须知
					</p>
					<p>
						<br>
					</p>
					<p>
						1、
					旅游者如系(60)岁以上（含(60)岁）人员出游的，本人需充分考虑自身健康状况能够完成本次旅游活动，谨慎出游，建议要有亲友陪同出游，如因旅游者自
					身身体原因引发疾病或其他损害由旅游者本人承担相关责任。未满18周岁的旅游者请由家属陪同参团。岁）人员出游的，本人需充分考虑自身健康状况能够完成本
					次旅游活动，谨慎出游，建议要有亲友陪同出游，如因旅游者自身身体原因引发疾病或其他损害由旅游者本人承担相关责任。未满18周岁的旅游者请由家属陪同参
					团。
					</p>
					<p>
						2、游客必须保证自身身体健康良好的前提下，参加旅行社安排的旅游行程，不得欺骗隐瞒，若因游客身体不适而发生任何意外，旅行社不承担责任。
					</p>
					<p>
						3、单房差：报价是按照2人入住1间房计算的价格，如出现单男或单女情况，本公司将于出发前通知是否可以拼房或加床并支付附加费，如未能拼房，就需支付单人房附加费，享用单人房间。
					</p>
					<p>
						4、若本旅游产品未达到最低成团人数，我司将在游客报名参加本旅游产品时约定的出发日前通知；
					</p>
					<p>
						5、旅游线路产品，已将相关景点进行优惠打包，因此不可重复享受优惠（如特殊证件、优惠门票等），特别情况下涉及退费也仅退回优惠后的门票费用；任何费用一律不现退，统一在回程后，由驴妈妈旅游网退还至游客的驴妈妈账户！
					</p>
					<p>
						6、行程当中约定景点等其它项目（非赠送、升级类），如遇不可抗力因素造成无法履行，仅按游客意愿替换或按团队采购成本价格退费；行程当中关于赠送、免费升级等项目，如遇不可抗力因素或因游客自身原因无法实现及自愿放弃的，均不退费、不更换。<span style="font-size:9.0pt;font-family:宋体;"></span> 
					</p>
					<p>
						7、、海南酒店标准比内地偏低，请旅游者提前做好心理准备。如遇旺季酒店资源紧张或政府临时征用等特殊情况，我社有权调整为同等级标准酒店。酒店的退房时间
					为中午的12:00，返程为晚班机的旅游者可把行李寄存在酒店前台后自由活动或自行开钟点房休息。
					</p>
					<p>
						8、折扣机票，不可退票、改签，请成人（16周岁以上）带好有效的证件（身份证），儿童带好户口本；
					</p>
					<p>
						9、旅游者如需新增购物或参加另行付费的旅游项目，需和地接社协商一致并在海南当地补签相关自愿合同或证明，敬请广大游客理性消费。
					</p>
					<p>
						10、蜈支洲岛景区因集中上岛游客较多，团队上岛可能会造成排队等候时间过长；分界洲岛、西岛、蜈支洲岛景区规定60岁以上及行动不便游客（包括孕妇）需填写景区的免责声明方可登船上岛；70周岁以上老年人出于安全考虑，景区不予接待（我社按团队采购成本价格予以退费）
					</p>
					<p>
						<br>
					</p>
					<p>
						游玩提示
					</p>
					<p>
						1.按国家规定，可以不占座位的儿童的标准为0.8米以下怀抱婴儿，0.8米以上儿童必须占座，否则，我社导游可依据《新交通法规》的有规定，为了保证车上其他游客的正常行程及生命安全，有权拒绝儿童参加本次旅游活动，由此产生的一切后果和损失由游客自负。
					</p>
					<p>
						2.
					旅游者参加高原地区旅游或风险旅游项目（包括但不限于：游泳、浮潜、冲浪、漂流等水上活动以及骑马、攀岩、登山等高风险的活动）或患有不宜出行旅游的病情
					（包括但不限于：恶性肿瘤、心血管病、高血压、呼吸系统疾病、癫痫、怀孕、精神疾病、身体残疾、糖尿病、传染性疾病、慢性疾病健康受损），建议在报名前自
					行前往医疗机构体检或自行咨询医院专业医生意见，以确保自身身体条件能够完成本次旅游活动。
					</p>
					<p>
						3.如自身身体条件不适宜出游而参加旅游活动
					的，在行程中因自身身体条件引发的疾病或其他损害由旅游者本人承担相关责任；旅游者如系60岁以上（含60岁）人员出游的，本人需充分考虑自身健康状况能
					够完成本次旅游活动，谨慎出游，建议要有亲友陪同出游，如因旅游者自身身体原因引发疾病或其他损害由旅游者本人承担相关责任。
					</p>
					<p>
						4.上述内容作为乙方给予旅游者的重要出游安全提示，如旅游者仍坚持参加旅游活动，由此造成任何人身意外及不良后果将由旅游者本人承担全部责任。为了获得更为全面的保障，乙方强烈建议旅游者出游时根据个人意愿和需要自行投保人身意外伤害保险等个人险种。
					</p>
					<p>
						5.
					不可抗力是指不能预见、不能避免并不能克服的客观情况。不可抗力、意外事件等不可归责于旅行社的客观原因包括但不限于，恶劣天气、自然灾害、战争、罢工、
					骚乱、飞机故障、航班保护、恐怖事件、政府行为、公共卫生事件等客观原因，造成旅游行程安排的交通服务延误、景区临时关闭、宾馆饭店临时被征用、出境管
					制、边境关闭、目的地入境政策临时变更、我国政府机构发布橙色及以上旅游预警信息等，均会导致旅游目的无法实现，旅行社不承担违约责任。
					</p>
					<p>
						6.产品中描述的旅游行程安排可能因不可抗力、意外事件等不可归责于旅行社的客观原因进行调整或者变更。在旅游行程中，当发生不可抗力、危及旅游者人身、财产安全，或者非旅行社责任造成的意外情形，旅行社不得不调整或者变更旅游合同约定的行程安排时
					</p>
					<p>
						7.不可抗力或意外事件等导致本次团队旅游行程变更或取消的，产生的损失费用旅行社不承担任何责任，因此增加的旅游费用由旅游者承担，因此减少的旅游费用退还旅游者。
					</p>
					<p>
						8.
					旅游者在旅游过程中应遵从领队、导游和当地相关人员安排，听从有关人员指导，否则责任由旅游者自行承担。游览、观光过程中应谨慎拍照、摄像，在拍照、摄像
					时应注意往来车辆、所处位置进行拍照、摄像是否有危险或是否有禁拍标志，切忌在可能有危险或设有危险标志的地方停留。旅游者在行程中发现自身权益受到侵
					害，应及时告知领队、导游以及旅游者的紧急联系人，因没有及时提出而造成的损失由旅游者自负。
					</p>
					<p>
						9.在自行安排活动期间，旅游者应在自己能够控制风险的范围内活动，旅游者应选择自己能够控制风险的活动项目，并对自己的安全负责。
					</p>
					<p>
						10.
					旅游期间或自行安排活动期间请注意人身和财产安全。旅游者因违约、自身过错、自行安排活动期间内的行为或自身疾病引起的人身、财产损失由其自行承担；由此
					给旅行社或其他服务提供方造成损失的，旅游者应当承担赔偿责任。为了获得更为全面的保障，乙方强烈建议旅游者出游时根据个人意愿和需要自行投保人身意外伤
					害保险等个人险种。
					</p>
					<p>
						<br>
					</p>
					<br>
					<p>
						<br>
					</p><br>
					                <p></p>
					
					        <p>安全须知</p><br>
							<p>1.为了您人身、财产的安全，请您避免在公开场合暴露贵重物品及大量现金。外出时需时刻看管好首饰、相机等随身物品。</p>
							<p>2.游泳、漂流、潜水、浮潜、冲浪、快艇、滑雪、滑冰、热气球、高空跳伞、滑翔伞、动力伞、攀岩、登山、骑马、驾驶、温泉、冲沙、索道、蹦极等活动项目，均存在危险。参与前请根据自身条件，充分参考当地相关部门及其它专业机构的相关公告和建议后量力而行。请您在预订前阅读驴妈妈为您整理各项高风险活动的。<strong><a target="_blank" href="http://zt.lvmama.com/subject/gaofengxian01-1959">《安全须知》</a></strong></p>
					    </div>
					    <a class="more" onclick="lookFullTextOrPackUp()">查看全文<i></i></a>
					</div>
					<div class="order_box contarct_box_div">
					    <div class="lv-agree xieyi_show">
					        <h4>团队境内旅游合同</h4>
					        <div class="contractDiv">﻿ 
					  
					  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
					 <title>团队境内旅游合同（同锦江版本）</title> 
					 <style type="text/css"> 
						{margin:0;padding:0;}
						
						.txt-hetong {color:#666;width:635px;margin:10px auto;text-align:center;font:12px/1.5 arial,SimSun;}
						.stamp{background:url(http://super.lvmama.com/vst_order/img/) no-repeat;width:160px;height:160px;display:block;position:absolute;left:420px;top:0px;}
						.txt-hetong h1,.st2 {font:700 18px/2 SimSun;color:#333;}
						.txt-hetong .st2 {display:block;}
						.txt-hetong .st3 {display:block;text-align:center;font:700 14px SimSun;padding-bottom:5px;}
						.txt-hetong h1.h1-title {font:700 24px/2 SimSun;}
						.txt-hetong strong.st1 {font:14px/1.5 SimSun;color:#333;display:block;}
						.txt-hetong b {color:#333;font-weight:700;}
						.txt-hetong p {text-align:left;overflow:hidden; zoom:1;}
						.txt-hetong h2 {text-align:left;font:700 14px/2 SimSun;color:#333;margin-top:10px;}
						.txt-hetong .txt-right {float:right;}
						.txt-hetong .txt-right2{float:right;color:#333;font:16px/2 SimSun; clear:both;}
						.txt-hetong .all-line {font-style:normal;display:inline-block;border-bottom:1px solid #666;padding:0 5px;margin:0 5px;color:#333}
						.txt-hetong .all-line1 {width:50px;}
						.txt-hetong .all-line2 {width:255px;}
						.txt-hetong .all-line3 {width:80%;}
						.txt-hetong .b1 {font-family:SimSun;font-size:15px;}
						.txt-hetong .b2 {font:15px/1.5 SimSun;}
						.txt-hetong .kaiti {font-family:SimSun;font-size:16px;}
						.txt-hetong .kaiti1 {font-family:SimSun;font-size:18px;}
						table {font-size:12px;color:#666}
						.tab1 {border-collapse:collapse;background-color:#ccc;width:90%;margin:10px auto;}
						.tab1 td{border:1px solid #ccc;}
						.tab1 td,.tab1 th {padding:5px;vertical-align:middle;background-color:#fff;}
						.ul1 {width:90%;border-left:1px solid #ccc;border-top:1px solid #ccc;margin:10px auto;list-style:none;}
						.ul1 li {border-right:1px solid #ccc;border-bottom:1px solid #ccc;height:18px;font:14px/18px SimSun;text-align:left;text-indent:3em;}
						.text1 {width:250px;margin:20px auto;height:80px;font:14px SimSun;color:#333;}
						.text1 span {display:block;text-align:left;}
						.text1 .textLeft {float:left;width:150px;line-height:30px;}
						.text1 .textRight {float:left;width:100px;line-height:60px;}
						.ul2 {width:635px;list-style:none;}
						.ul2 li {width:317px;float:left;text-align:left;}
						.div1 {background-color: #FFFFFF;width:15px; height:15px;display:block; border: #000000 inset 1px;}
						.buchongbox{padding:9px 9px 18px;border:2px solid #ddd;display:block;}
					 </style> 
					  
					
					  
					 <div class="txt-hetong">
					     <br>
					     <br>
					     <br>
					     <br>
					     <br>
					     <br>
					     <br>
					    <h1 class="h1-title">
					        团队境内旅游合同
					    </h1>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <h1 class="h1-title" style="line-height:30px;">
					        参照二〇一四年四月国家旅游局示范文本制定
					    </h1>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <h1 class="h1-title">
					       使　用　说　明
					    </h1>
					    <br>
					    <br>
					    <p>
					        1、本合同为示范文本，供中华人民共和国境内（不含港、澳、台地区）旅行社与旅游者之间签订团队境内包价旅游合同<br>
					                               时使用（不含赴港、澳、台地区旅游及边境游） 。<br>
					        2、双方当事人应当结合具体情况选择本合同协议条款中所提供的选择项，空格处应当以文字形式填写完整。<br>
					        3、双方当事人可以书面形式对本示范文本内容予以变更或者补充，但变更或者补充的内容，不得减轻或者免除应当由旅<br>
					                              行社承担的责任。<br>
					        4、本示范文本由国家旅游局和国家工商行政管理总局共同制定、解释，在全国范围内推行使用。<br>
					    </p>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <br>
					    <h1 class="h1-title">
					       团队境内旅游合同
					    </h1>
					    <br>
					    <p>
					        第一章  术语和定义
					        <br><br>
					        第一条　本合同术语和定义
					        <br>
					        1、团队境内旅游服务，指旅行社依据《中华人民共和国旅游法》、《旅行社条例》等法律、法规，组织旅游者在中华<br>
					                             人民共和国境内（不含香港、澳门、台湾地区）旅游，代订公共交通客票，提供餐饮、住宿、游览等两项以上服务<br>
					                             活动。<br>
					        2、旅游费用，指旅游者支付给旅行社，用于购买本合同约定的旅游服务的费用。<br>
					        　  旅游费用包括：<br>
					        　  (1)交通费；<br>
					        　  (2)住宿费；<br>
					        　  (3)餐费（不含酒水费）；<br>
					        　  (4)旅行社统一安排的景区景点门票费；<br>
					        　  (5)行程中安排的其他项目费用；<br>
					        　  (6)导游服务费；<br>
					        　  (7)旅行社（含地接社）的其他服务费用。<br>
							　  旅游费用不包括：<br>
					        　  (1)旅游者投保的人身意外伤害保险费用；<br>
					        　  (2)合同未约定由旅行社支付的费用，包括但不限于行程以外非合同约定活动项目所需的费用、自行安排活动期间发生的<br>
					                   费用；<br>
					    (3)行程中发生的旅游者个人费用，包括但不限于交通工具上的非免费餐饮费、行李超重费，住宿期间的洗衣、电话、饮
					                     料 及酒类费，个人娱乐费用，个人伤病医疗费，寻找个人遗失物品的费用及报酬，个人原因造成的赔偿费用。<br>
							3.履行辅助人，指与旅行社存在合同关系，协助其履行本合同义务，实际提供相关服务的法人、自然人或者其他组织。<br>
							4.自由活动，特指《旅游行程单》中安排的自由活动。<br>
							5.自行安排活动期间，指《旅游行程单》中安排的自由活动期间、旅游者不参加旅游行程活动期间、每日行程开始前、<br>
							结束后旅游者离开住宿设施的个人活动期间、旅游者经导游同意暂时离团的个人活动期间。<br>
					        6.不合理的低价，指旅行社提供服务的价格低于接待和服务费用或者低于行业公认的合理价格，且无正当理由和充分证据<br>
					                               证明该价格的合理性。其中，接待和服务费用主要包括旅行社提供或者采购餐饮、住宿、交通、游览、导游等服务所支<br>
					                               出的费用。<br>
					        7.具体购物场所，指购物场所有独立的商号以及相对清晰、封闭、独立的经营边界和明确的经营主体，包括免税店，大型<br>
					                             购物商场，前店后厂的购物场所，景区内购物场所，景区周边或者通往景区途中的购物场所，服务旅游团队的专门商店，<br>
					                             商品批发市场和与餐饮、娱乐、停车休息等相关联的购物场所等。<br>
					        8.旅游者投保的人身意外伤害保险，指旅游者自己购买或者通过旅行社、航空机票代理点、景区等保险代理机构购买的以<br>
					                             旅行期间自身的生命、身体或者有关利益为保险标的的短期保险，包括但不限于航空意外险、旅游意外险、紧急救援保险、<br>
					                             特殊项目意外险。<br>
					        9.离团，指团队旅游者经导游同意不随团队完成约定行程的行为。<br>
					        10.脱团，指团队旅游者未经导游同意脱离旅游团队，不随团队完成约定行程的行为。<br>
					        11.转团，指由于未达到约定成团人数不能出团，旅行社征得旅游者书面同意，在行程开始前将旅游者转至其他旅行社<br>
					                                所组的境内旅游团队履行合同的行为。<br>
					        12.拼团，指旅行社在保证所承诺的服务内容和标准不变的前提下，在签订合同时经旅游者同意，与其他旅行社招徕的<br>
					                                 旅游者拼成一个团，统一安排旅游服务的行为。<br>
					        13.不可抗力，指不能预见、不能避免并不能克服的客观情况，包括但不限于因自然原因和社会原因引起的，如自然灾<br>
					                                害、战争、恐怖活动、动乱、骚乱、罢工、突发公共卫生事件、政府行为。<br>
					        14.已尽合理注意义务仍不能避免的事件，指因当事人故意或者过失以外的客观因素引发的事件，包括但不限于重大礼<br>
					                                 宾活动导致的交通堵塞，飞机、火车、班轮、城际客运班车等公共客运交通工具延误或者取消，景点临时不开放。<br>
					        15.必要的费用， 指旅行社履行合同已经发生的费用以及向地接社或者履行辅助人支付且不可退还的费用， 包括乘坐<br>
					                                飞机 （车、船）等交通工具的费用（含预订金） 、饭店住宿费用（含预订金） 、旅游观光汽车的人均车租等。<br>
					        16.公共交通经营者，指航空、铁路、航运客轮、城市公交、地铁等公共交通工具经营者。<br> <br>
							第二章  合同的订立<br> <br> 
					        第二条	旅游行程单<br>
					        旅行社应当提供带团号的《旅游行程单》 （以下简称《行程单》），经双方签字或者盖章确认后作为本合同的组成部分。 《行程单》应当对如下内容作出明确的说明：<br>
					        （1）旅游行程的出发地、途经地、目的地、结束地，线路行程时间和具体安排（按自然日计算，含乘飞机、车、船等在<br>
					                   途时间，不足 24 小时以一日计）；<br>
					        （2）地接社的名称、地址、联系人和联系电话；<br>
					        （3）交通服务安排及其标准（明确交通工具及档次等级、出发时间以及是否需中转等信息）；<br>
					        （4）住宿服务安排及其标准（明确住宿饭店的名称、地点、星级，非星级饭店应当注明是否有空调、热水、独立卫生间<br>
					                  等相关服务设施）；<br>
					        （5）用餐（早餐和正餐）服务安排及其标准（明确用餐次数、地点、标准）；<br>
					        （6）旅行社统一安排的游览项目的具体内容及时间（明确旅游线路内容包括景区点及游览项目名称等，景区点停留的最<br>
					                   少时间）；<br>
					        （7）自由活动的时间；<br>
					        （8）行程安排的娱乐活动（明确娱乐活动的时间、地点和项目内容）；<br>
					                 《行程单》用语须准确清晰，在表明服务标准用语中不应当出现“准×星级”、“豪华”、“仅供参考”、“以××为准”、<br>
					                 “与××同级”等不确定用语。<br>
					        第三条	订立合同<br>
					        旅游者应当认真阅读本合同条款、 《行程单》， 在旅游者理解本合同条款及有关附件后， 旅行社和旅游者应当签订书面合同。<br>
					        由旅游者的代理人订立合同的，代理人需要出具被代理的旅游者的授权委托书。<br>
					        第四条	旅游广告及宣传品<br>
					        旅行社的旅游广告及宣传品应当遵循诚实信用的原则，其内容符合《中华人民共和国合同法》要约规定的，视为本合同的<br>
					        组成部分，对旅行社和旅游者双方具有约束力。<br><br>
							第三章  合同双方的权利义务<br><br>
					        第五条 旅行社的权利<br>
					        1、根据旅游者的身体健康状况及相关条件决定是否接纳旅游者报名参团；<br>
					        2、核实旅游者提供的相关信息资料；<br>
					        3、按照合同约定向旅游者收取全额旅游费用；<br>
					        4、旅游团队遇紧急情况时，可以采取安全防范措施和紧急避险措施并要求旅游者配合；<br>
					        5、拒绝旅游者提出的超出合同约定的不合理要求；<br>
					        6、 要求旅游者对在旅游活动中或者在解决纠纷时损害旅行社合法权益的行为承担赔偿责任；<br>
					        7、要求旅游者健康、文明旅游，劝阻旅游者违法和违反社会公德的行为。<br>
					        第六条  旅行社的义务<br>
					        1、按照合同和《行程单》约定的内容和标准为旅游者提供服务，不擅自变更旅游行程安排；<br>
					        2、向合格的供应商订购产品和服务；<br>
					        3、不以不合理的低价组织旅游活动，诱骗旅游者，并通过安排购物或者另行付费旅游项目获取回扣等不正当利益；组织、<br>
					                              接待旅游者，不指定具体购物场所，不安排另行付费旅游项目，但是，经双方协商一致或者旅游者要求，且不影响其他<br>
					                              旅游者行程安排的除外；<br>
					        4、在出团前如实告知具体行程安排和有关具体事项，具体事项包括但不限于所到旅游目的地的重要规定、风俗习惯；旅<br>
					                              游 活动中的安全注意事项和安全避险措施、旅游者不适合参加旅游活动的情形；旅行社依法可以减免责任的信息；应<br>
					                              急联  络方式以及法律、法规规定的其他应当告知的事项；<br>
					        5、按照合同约定，为旅游团队安排符合《中华人民共和国旅游法》 、 《导游人员管理条例》规定的持证导游人员；<br>
					        6、妥善保管旅游者交其代管的证件、行李等物品；<br>
					        7、为旅游者发放用固定格式书写、由旅游者填写的安全信息卡（包括旅游者的姓名、血型、应急联络方式等）；<br>
					        8、旅游者人身、财产权益受到损害时，应当采取合理必要的保护和救助措施，避免旅游者人身、财产权益损失扩大；<br>
					        9、积极协调处理旅游行程中的纠纷，采取适当措施防止损失扩大；<br>
					        10、提示旅游者投保人身意外伤害保险；<br>
					        11、向旅游者提供发票；<br>
					        12、依法对旅游者个人信息保密；<br>
					        13、旅游行程中解除合同的，旅行社应当协助旅游者返回出发地或者旅游者指定的合理地点。<br>
							第七条  旅游者的权利<br>
					        1、要求旅行社按照合同及《行程单》约定履行相关义务；<br>
					        2、拒绝未经事先协商一致的转团、拼团行为；<br>
					        3、有权自主选择旅游产品和服务，有权拒绝旅行社未与旅游者协商一致或者未经旅游者要求而指定购物场所、安排旅游<br>
					                               者 参加另行付费旅游项目的行为，有权拒绝旅行社的导游强迫或者变相强迫旅游者购物、参加另行付费旅游项目的<br>
					                               行为；<br>
					        4、在支付旅游费用时要求旅行社出具发票；<br>
					        5、人格尊严、民族风俗习惯和宗教信仰得到尊重；<br>
					        6、在人身、财产安全遇有危险时，有权请求救助和保护；人身、财产受到损害的，有权依法获得赔偿；<br>
					        7、在合法权益受到损害时向有关部门投诉或者要求旅行社协助索赔；<br>
					        8、《中华人民共和国旅游法》、 《中华人民共和国消费者权益保护法》和有关法律、法规赋予旅游者的其他各项权利。<br>
					        第八条  旅游者的义务<br>
					        1、如实填写《旅游报名表》 、游客安全信息卡等各项内容，告知与旅游活动相关的个人健康信息，并对其真实性负责，保证所<br>
					                               提供的联系方式准确无误且能及时联系；<br>
					        2、按照合同约定支付旅游费用；<br>
					        3、遵守法律、法规和有关规定，不在旅游行程中从事违法活动，不参与色情、赌博和涉毒活动；<br>
					        4、遵守公共秩序和社会公德，尊重旅游目的地的风俗习惯、文化传统和宗教信仰，爱护旅游资源，保护生态环境，遵守《中
					        国公民国内旅游文明行为公约》等文明行为规范；<br>
					        5、对国家应对重大突发事件暂时限制旅游活动的措施以及有关部门、机构或者旅游经营者采取的安全防范和应急处置措<br>
					                              施予以配合；<br>
					        6、妥善保管自己的行李物品，随身携带现金、有价证券、贵重物品，不在行李中夹带；<br>
					        7、在旅游活动中或者在解决纠纷时，应采取措施防止损失扩大，不损害当地居民的合法权益；不干扰他人的旅游活动；<br>
					                               不损害旅游经营者和旅游从业人员的合法权益，不采取拒绝上、下机（车、船）、拖延行程或者脱团等不当行为；<br>
					        8、自行安排活动期间，应当在自己能够控制风险的范围内选择活动项目，遵守旅游活动中的安全警示规定，并对自己的<br>
					                                安全负责。<br><br>
							第四章  合同的变更与转让<br><br>
					        第九条  合同的变更<br>
					        1、旅行社与旅游者双方协商一致，可以变更本合同约定的内容，但应当以书面形式由双方签字确认。由此增加的旅游费<br>
					                               用及给 对方造成的损失，由变更提出方承担；由此减少的旅游费用，旅行社应当退还旅游者。<br>
					        2、行程开始前遇到不可抗力或者旅行社、履行辅助人已尽合理注意义务仍不能避免的事件的，双方经协商可以取消行程<br>
					                               或者延期 出行。取消行程的，按照本合同第十四条处理；延期出行的，增加的费用由旅游者承担，减少的费用退还旅<br>
					                               游者。<br>
					        3、行程中遇到不可抗力或者旅行社、履行辅助人已尽合理注意义务仍不能避免的事件，影响旅游行程的，按以下方式<br>
					        处理：<br>
					             （1）合同不能完全履行的，旅行社经向旅游者作出说明，旅游者同意变更的，可以在合理范围内变更合同，因此增加的<br>
					             费用由旅游者承担，<br>
					                       减少的费用退还旅游者。<br>
					             （2）危及旅游者人身、财产安全的，旅行社应当采取相应的安全措施，因此支出的费用，由旅行社与旅游者分担。<br>
					             （3）造成旅游者滞留的，旅行社应采取相应的安置措施。因此增加的食宿费用由旅游者承担，增加的返程费用双方分担。<br>
					        第十条  合同的转让<br>
					                       旅游行程开始前，旅游者可以将本合同中自身的权利义务转让给第三人，旅行社没有正当理由的不得拒绝，并办理相<br>
					                       关转让手续，因此增加的费用由旅游者和第三人承担。<br>
					                       正当理由包括但不限于：对应原报名者办理的相关服务不可转让给第三人的；无法为第三人安排交通等情形的；旅游<br>
					                       活动对于旅游者的身份、资格等有特殊要求的。<br>
					        第十一条  不成团的安排<br>
					        当旅行社组团未达到约定的成团人数不能成团时，旅游者可以与旅行社就如下安排在本合同第二十三条中做出约定。<br>
					        1、转团：旅行社可以在保证所承诺的服务内容和标准不降低的前提下，经事先征得旅游者书面同意，委托其他旅行社<br>
					                              履行合同，并就受委托出团的旅行社违反本合同约定的行为先行承担责任，再行追偿。旅游者和受委托出团的旅行<br>
					                              社另行签订合同的，本合同的权利义务终止。<br>
					        2、延期出团和改变线路出团：旅行社经征得旅游者书面同意，可以延期出团或者改变其他线路出团，因此增加的费用<br>
					                                 由旅游者承担，减少的费用旅行社予以退还。需要时可以重新签订旅游合同。<br><br>
					        第五章  合同的解除<br><br>
					        第十二条 旅行社解除合同<br>
					        1.未达到约定的成团人数不能成团时，旅行社解除合同的，应当采取书面等有效形式。旅行社在行程开始前 7 日<br>
					                            （按照出发日减去解除合同通知到达日的自然日之差计算，下同）以上（含第 7 日，下同）提出解除合同的，不<br>
					                                承担违约责任，旅行社向旅游者退还已收取的全部旅游费用；旅行社在行程开始前 7 日以内（不含第 7 日，下同）<br>
					                                提出解除合同的，除向旅游者退还已收取的全部旅游费用外，还应当按本合同第十七条第 1 款的约定，承担相应<br>
					                                的违约责任。<br>
					        2.旅游者有下列情形之一的，旅行社可以解除合同：<br>
					         （1）患有传染病等疾病，可能危害其他旅游者健康和安全的；<br>
					            （2） 携带危害公共安全的物品且不同意交有关部门处理的；<br>
					            （3）从事违法或者违反社会公德的活动的；<br>
					            （4）从事严重影响其他旅游者权益的活动，且不听劝阻、不能制止的；<br>
					            （5）法律、法规规定的其他情形。<br>
					        旅行社因上述情形解除合同的，应当以书面等形式通知旅游者，按照本合同第十五条相关约定扣除必要的费用后，<br>
					        将余款退还旅游者。<br>
					        第十三条 旅游者解除合同<br>
					        1、未达到约定的成团人数不能成团时，旅游者既不同意转团，也不同意延期出行或者改签其他线路出团的，旅行社应及<br>
					                                时发出不能成团的书面通知，旅游者可以解除合同。旅游者在行程开始前 7 日以上收到旅行社不能成团通知的，<br>
					                                旅行社不承担违约责任，向旅游者退还已收取的全部旅游费用；旅游者在行程开始前 7 日以内收到旅行社不能<br>
					                                成团通知的， 按照本合同第十七条第 1 款相关约定处理。<br>
					        2、除本条第 1 款约定外，在旅游行程结束前，旅游者亦可以书面等形式解除合同。旅游者在行程开始前 7 日以上提<br>
					                             出解除合同的，旅行社应当向旅游者退还全部旅游费用；旅游者在行程开始前 7 日以内和行程中提出解除合同的，<br>
					                               旅行社按照本合同第十五条相关约定扣除必要的费用后，将余款退还旅游者。<br>
					        3、旅游者未按约定时间到达约定集合出发地点，也未能在出发中途加入旅游团队的，视为旅游者解除合同，按照本合同<br>
					                              第十五条相关约定处理。<br>
					        第十四条 因不可抗力或者已尽合理注意义务仍不能避免的事件解除合同<br>
					        因不可抗力或者旅行社、履行辅助人已尽合理注意义务仍不能避免的事件，影响旅游行程，合同不能继续履行的，旅行社<br>
					        和旅游者均可以解除合同；合同不能完全履行，旅游者不同意变更的，可以解除合同。合同解除的，旅行社应当在扣除已<br>
					        向地接社或者履行辅助人支付且不可退还的费用后，将余款退还旅游者。<br>
					        第十五条 必要的费用扣除<br>
					        1.旅游者在行程开始前 7 日以内提出解除合同或者按照本合同第十二条第 2 款约定由旅行社在行程开始前解除合同的，按下列标准扣除必要的费用：<br>
					        　　行程开始前6日至4日，按旅游费用总额的20%；<br>
					        　　行程开始前3日至1日，按旅游费用总额的40%；<br>
					        　　行程开始当日，按旅游费用总额的60%；<br>
					        2.在行程中解除合同的，必要的费用扣除标准为：<br>
					        旅游费用×行程开始当日扣除比例+（旅游费用-旅游费用×行程开始当日扣除比例)÷旅游天数×已经出游的天数。<br>
					        如按上述第 1 款或者第 2 款约定比例扣除的必要的费用低于实际发生的费用， 旅游者按照实际发生的费用支付， 但最高额不应当超过旅游费用总额。<br>
					        解除合同的，旅行社扣除必要的费用后，应当在解除合同通知到达日起 5 个工作日内为旅游者办结退款手续。<br>
					        第十六条 旅行社协助旅游者返程及费用承担<br>
					        旅游行程中解除合同的， 旅行社应协助旅游者返回出发地或者旅游者指定的合理地点。 因旅行社或者履行辅助人的原因导致合同解除的，返程费用由旅行社承担；行程中按照本合同第十二条第 2 款，第十三条第 2 款约定解除合同的，返程费用由旅游者承担；按照本合同第十四条约定解除合同的，返程费用由双方分担。<br><br>
					        第六章  违约责任<br><br>
					        第十七条　旅行社的违约责任<br>
					        1.旅行社在行程开始前 7 日以内提出解除合同的，或者旅游者在行程开始前 7 日以内收到旅行社不能成团通知，不同意转团、延期出行和改签线路解除合同的，旅行社向旅游者退还已收取的全部旅游<br>    
					        费用，并按下列标准向旅游者支付违约金：<br>
					        　　行程开始前6日至4日，支付旅游费用总额10%的违约金；<br>
					        　　行程开始前3日至1日，支付旅游费用总额15%的违约金；<br>
					        　　行程开始当日，支付旅游费用总额20%的违约金；<br>
					        如按上述比例支付的违约金不足以赔偿旅游者的实际损失，旅行社应当按实际损失对旅游者予以赔偿。<br>
					        旅行社应当在取消出团通知或者旅游者不同意不成团安排的解除合同通知到达日起 5 个工作日内， 为旅游者办结退还全部旅游费用的手续并支付上述违约金。<br>
					        2.旅行社未按合同约定提供服务，或者未经旅游者同意调整旅游行程（本合同第九条第 3 款规定的情形除外），造成项目减少、旅游时间缩短或者标准降低的，应当依法承担继续履行、采取补救措施或者赔偿损<br>
					        失等违约责任。<br>
					        3.旅行社具备履行条件，经旅游者要求仍拒绝履行本合同义务的，旅行社向旅游者支付旅游费用总额 30%的违约金，旅游者采取订同等级别的住宿、用餐、交通等补救措施的，费用由旅行社承担；造成旅游者人身损害、<br>
					        滞留等严重后果的，旅游者还可以要求旅行社支付旅游费用一倍以上三倍以下的赔偿金。<br>
					        4.未经旅游者同意，旅行社转团、拼团的，旅行社应向旅游者支付旅游费用总额 25%的违约金；旅游者解除合同的，旅行社还应向未随团出行的旅游者退还全部旅游费用， 向已随团出行的旅游者退还尚未发生的旅游费用。 如违约金不足以赔偿旅游者的实际损失，旅行社应当按实际损失对旅游者予以赔偿。<br>
					        5.旅行社有以下情形之一的，旅游者有权在旅游行程结束后 30 日内，要求旅行社为其办理退货并先行垫付退货货款，或者退还另行付费旅游项目的费用：<br>
					        （1）旅行社以不合理的低价组织旅游活动，诱骗旅游者，并通过安排购物或者另行付费旅游项目获取回扣等不正当<br>
					        利益的；<br>
					        （2）未经双方协商一致或者未经旅游者要求，旅行社指定具体购物场所或者安排另行付费旅游项目的。<br>
					        6.与旅游者出现纠纷时，旅行社应当采取积极措施防止损失扩大，否则应当就扩大的损失承担责任。<br>
					        第十八条  旅游者的违约责任<br>
					        1、旅游者因不听从旅行社及其导游的劝告、提示而影响团队行程，给旅行社造成损失的，应当承担相应的赔偿责任。<br>
					        2、旅游者超出本合同约定的内容进行个人活动所造成的损失，由其自行承担。<br>
					        3、由于旅游者的过错，使旅行社、履行辅助人、旅游从业人员或者其他旅游者遭受损害的，旅游者应当赔偿损失。<br>
					        4、旅游者在旅游活动中或者在解决纠纷时，应采取措施防止损失扩大，否则应当就扩大的损失承担相应的责任。<br>
					        5、旅游者违反安全警示规定，或者对国家应对重大突发事件暂时限制旅游活动的措施、安全防范和应急处置措施不予<br>
					                               配合，造成旅行社损失的，应当依法承担相应责任。<br>
					        第十九条 其他责任<br>
					        1、由于旅游者自身原因导致本合同不能履行或者不能按照约定履行，或者造成旅游者人身损害、财产损失的，旅行社不<br>
					                              承担责任。<br>
					        2、旅游者在自行安排活动期间人身、财产权益受到损害的，旅行社在事前已尽到必要警示说明义务且事后已尽到必要救<br>
					                              助义务的，旅行社不承担赔偿责任。<br>
					        3、由于第三方侵害等不可归责于旅行社的原因导致旅游者人身、财产权益受到损害的，旅行社不承担赔偿责任。但因旅<br>
					                               行社不履行协助义务致使旅游者人身、财产权益损失扩大的，旅行社应当就扩大的损失承担赔偿责任。<br>
					        4、由于公共交通经营者的原因造成旅游者人身损害、财产损失依法应承担责任的，旅行社应当协助旅游者向公共交通经<br>
					        营者索赔。<br><br>
							第七章  协议条款<br><br>
					        <span style="float:right">合同编号：<em class="all-line" style="width:200px">  　</em></span><br><br>
					        旅游者（甲方）：<em class="all-line" style="width:200px">
					                	
					                </em>共
					             <em class="all-line" style="width:50px"> 　</em>人（名单可附页，需旅行社和旅游者代表签字盖章确认）；<br>
					        旅行社（乙方）：<em class="all-line" style="width:240px"> 　</em>;<br>
					        旅行社业务经营许可证编号：<em class="all-line" style="width:200px">　</em><br><br>
					        第二十条  线路行程时间<br>
							出发时间<em class="all-line" style="width:100px">　</em>
							     <em class="all-line" style="width:30px">　/ </em>时，
					                       结束时间<em class="all-line" style="width:100px">　 </em>
					             <em class="all-line" style="width:30px">　/ </em>时；
					                                  共<em class="all-line" style="width:30px">　</em>天，
					                      饭店住宿<em class="all-line" style="width:130px">　 具体以行程单为准 </em>夜。<br>
					        第二十一条  旅游费用及支付（以人民币为计算单位）<br>
					        成人<em class="all-line" style="width:100px">　/ </em>元/人，
					        儿童（不满14岁）<em class="all-line" style="width:100px">　/ </em>元/人；
					        其中，导游服务费<em class="all-line" style="width:100px">　/ </em>元/人；<br>
					        旅游费用合计：<em class="all-line" style="width:100px">　 / </em>元。<br>
					        旅游费用支付方式：<em class="all-line" style="width:100px">　在线支付 </em>。<br>
					        旅游费用支付时间：<em class="all-line" style="width:100px">　以实际支付时间为准 </em>。<br>
							第二十二条  人身意外伤害保险<br>
					        1.旅行社提示旅游者购买人身意外伤害保险；<br>
					        2.旅游者可以做以下选择：<br>
					        <img src="file:////var/www/webapps/vst_order/WEB-INF/resources/econtractTemplate/image/uncheckedRadioButton.jpg">
					                         委托旅行社购买（旅行社不具有保险兼业代理资格的，不得勾选此项）：保险产品名称<em class="all-line" style="width:130px">  
					 </em>投保的相关信息以实际保单为准）；<br>
					        <img src="file:////var/www/webapps/vst_order/WEB-INF/resources/econtractTemplate/image/checkedRadioButton.jpg">
					                          自行购买；<br>             
					        <img src="file:////var/www/webapps/vst_order/WEB-INF/resources/econtractTemplate/image/uncheckedRadioButton.jpg">
					                         放弃购买。<br>
					        第二十三条  成团人数与不成团的约定<br>
					        成团的最低人数：<em class="all-line" style="width:100px">　</em>人。<br>
					        如不能成团，旅游者是否同意按下列方式解决：<br>
					        1.<em class="all-line" style="width:80px">　同意 </em>（同意或者不同意，打勾无效）旅行社委托<br>
					        <em class="all-line" style="width:100px">　指定 </em>旅行社履行合同；<br>
					        2.<em class="all-line" style="width:80px">　同意 </em>（同意或者不同意，打勾无效）延期出团；<br>
					        3.<em class="all-line" style="width:80px">　同意 </em>（同意或者不同意，打勾无效）改签其他线路出团；<br>
					        4.<em class="all-line" style="width:80px">　同意 </em>（同意或者不同意，打勾无效）解除合同。<br>
					        第二十四条  
					                       组团方式<br>
					           <img src="file:////var/www/webapps/vst_order/WEB-INF/resources/econtractTemplate/image/uncheckedRadioButton.jpg"> 自行组团<br>
					           <img src="file:////var/www/webapps/vst_order/WEB-INF/resources/econtractTemplate/image/checkedRadioButton.jpg">
					                                 委托组团  委托社为<em class="all-line" style="width:130px"> 	海南椰晖旅行社有限公司<br>
					</em>，具体的旅游服务和操作由委托社提供。<br>
					        <img src="file:////var/www/webapps/vst_order/WEB-INF/resources/econtractTemplate/image/uncheckedRadioButton.jpg">          
					                       拼团  旅游者为<em class="all-line" style="width:60px">　</em>（同意或者不同意，打勾无效）采用拼团方式拼至<em class="all-line" style="width:100px">　</em>旅行社成团。<br>
					        第二十五条  自愿购物和参加另行付费旅游项目约定<br>
					        1、旅游者可以自主决定是否参加旅行社安排的购物活动、另行付费旅游项目；<br>
					        2、旅行社可以在不以不合理的低价组织旅游活动、不诱骗旅游者、不获取回扣等不正当利益，且不影响其他旅游者行程<br>
					                              安排的前提下，按照平等自愿、诚实信用的原则，与旅游者协商一致达成购物活动、另行付费旅游项目协议；<br>
					        3、购物活动、另行付费旅游项目安排应不与《行程单》冲突；<br>
					        4、地接社及其从业人员在行程中安排购物活动、另行付费旅游项目的，责任由订立本合同的旅行社承担；<br>
					        5、 购物活动、另行付费旅游项目具体约定见《自愿购物活动补充协议》 （附件 3） 、 《自愿参加另行付费旅游项目补<br>
					                                充协议》（附件 4） 。<br>
						第二十六条  争议的解决方式<br>
					                               本合同履行过程中发生争议，由双方协商解决；亦可向合同签订地的旅游质监执法机构、消费者协会、有关的调解组<br>
					                               织等有关部门或者机构申请调解。协商或者调解不成的，按下列第<em class="all-line" style="width:100px;text-align:center;"> 2 </em>种方式解决：<br>
					        1.提交<em class="all-line" style="width:100px;"></em>仲裁委员会仲裁；<br>
					        2.依法向人民法院起诉。<br>
					        第二十七条  其他约定事项<br>
					        未尽事宜，经旅游者和旅行社双方协商一致，可以列入补充条款。 （如合同空间不够，可以另附纸张，由双方签字或者盖章确认。 ）<br>
					        <em class="all-line" style="padding:0 10px;width:100%;text-align:center;">详见补充条款　</em>
							<em class="all-line" style="padding:0 10px;width:100%;">　</em>
					        第二十八条　合同效力<br>
					        本合同一式<em class="all-line" style="width:50px"> 贰　</em>份，双方各持<em class="all-line" style="width:50px">壹　</em>份，具有同等法律效力，自双方当事人签字或者盖章之日起生效。<br>
					     </p><br><br><br><br><br>
					     <p style=" position:relative;">
					     	<span class="stamp"></span>
					     	旅游者代表签字（盖章）：<em class="all-line" style="width:100px">
					                	
					                 </em>
					     	旅行社盖章：<em class="all-line" style="width:174px">　</em><br>   
					        证件号码：<em class="all-line" style="width:200px"> 详见旅游报名表　　</em>
					        签约代表签字（盖章）：<em class="all-line" style="width:128px">　</em><br>
					        住　　址：<em class="all-line" style="width:200px">　/ </em>
					        营业地址：<em class="all-line" style="width:200px">　 </em><br>     
					        联系电话：<em class="all-line" style="width:200px">　/　</em>
					        联系电话：<em class="all-line" style="width:200px">　1010-6060 </em><br>      
					        传　　真：<em class="all-line" style="width:200px">　/</em>
					        传　　真：<em class="all-line" style="width:200px">　/</em><br> 
					        邮　　编：<em class="all-line" style="width:200px">　/</em>
					        邮　　编：<em class="all-line" style="width:200px">　 </em><br> 
					        电子信箱：<em class="all-line" style="width:200px">　/</em>
					        电子信箱：<em class="all-line" style="width:200px">　service@lvmama.com　</em><br> 
					        签约日期：<em class="all-line" style="width:200px">  </em>
					       签约日期：<em class="all-line" style="width:200px">　 </em><br>
					        签约地点：<em class="all-line" style="width:200px">　/</em><br><br>
					        
					        
					        
					        旅行社监督、投诉电话：<em class="all-line" style="width:200px"> /　</em><br>
					        <em class="all-line" style="width:80px;"> /　</em>省
					        <em class="all-line" style="width:80px;">　/ </em>市旅游质监执法机构：<br>
					        投诉电话：<em class="all-line" style="width:200px;">　/</em><br>   
					        电子邮箱：<em class="all-line" style="width:200px;">/　</em><br>
					        地　　址：<em class="all-line" style="width:200px;">/　</em><br> 
					        邮　　编：<em class="all-line" style="width:200px;">　/</em><br><br><br><br>                           
					     </p>
					<p>
					     	附件1：旅游报名表<br>
					        旅游线路及编号<em class="all-line" style="width:520px;">　</em>
					        旅游者出团意向时间<em class="all-line" style="width:200px;">　</em><br>
					        </p><table border="0" cellspacing="1" cellpadding="0" class="tab1">
					         <tbody><tr>
					                <td width="100px">姓名</td>
					                <td width="150px"></td>
					                <td width="80px">性别</td>
					                <td width="80px"></td>
					                <td width="80px">民族</td>
					                <td width="80px"></td>
					                <td width="120px">出生日期</td>
					                <td width="200px"></td>
					            </tr>
					            <tr>
					                <td colspan="2">证件号码</td>
					                <td colspan="4"></td>
					                <td>联系电话</td>
					                <td></td>
					            </tr>
					            <tr>
					                <td colspan="2">身体状况</td>
					                <td colspan="6" style="text-align:left;"><span></span><br>（需注明是否有身体残疾、精神疾病、高血压、心脏病等健康受损病症、病史，是否为妊娠期妇女。）</td>
					            </tr>
					            <tr>
					            	<td colspan="8" style="text-align:left;">
					                	旅游者全部同行人名单及分房要求（所列同行人均视为旅游者要求必须同时安排出团）：<br>
					                    <em class="all-line" style="width:50px;">　</em>与<em class="all-line" style="width:50px;">　</em>同住，
					                    <em class="all-line" style="width:50px;">　</em>与<em class="all-line" style="width:50px;">　</em>同住，
					                    <em class="all-line" style="width:50px;">　</em>与<em class="all-line" style="width:50px;">　</em>同住，<br>
					                    <em class="all-line" style="width:50px;">　</em>与<em class="all-line" style="width:50px;">　</em>同住，
					                    <em class="all-line" style="width:50px;">　</em>与<em class="all-line" style="width:50px;">　</em>同住，
					                    <em class="all-line" style="width:50px;">　</em>与<em class="all-line" style="width:50px;">　</em>同住，<br>
					                    <em class="all-line" style="width:50px;">　</em>为单男/单女需要安排与他人同住，<em class="all-line" style="width:50px;">　</em>不占床位，<br>
					                    <em class="all-line" style="width:120px;">　</em>全程要求入住单间（同意补交房费差额）。
					                </td>
					            </tr>
					            <tr>
					            	<td colspan="8" valign="bototm" style="text-align:left;">
										其他补充约定：<br>
					                    <span></span><br>
					                                                             旅游者确认签名（盖章）：<em class="all-line" style="width:70px;">
					                	
					                　</em>　　
					                   <em class="all-line" style="width:70px;margin-left:300px;">　</em>
					                </td>
					                
					            </tr>
					            <tr>
					            	<td>备注</td>
					                <td colspan="7" style="text-align:left">（年龄低于18周岁，需要提交监护人书面同意出行书）<br>(如游客众多，不足填写可附页)<span></span></td>
					            </tr>
					            <tr>
					                <td colspan="8" style="text-align:left">以　　下　　由　　旅　　行　　社　　工　　作　　人　　员　　填　　写</td>
					            </tr>
					            <tr>
					                <td colspan="2">服务网点名称</td>
					                <td colspan="3"></td>
					                <td colspan="2">旅行社经办人</td>
					                <td colspan="1"></td>
					            </tr>
					        </tbody></table>  
					       
					           
					     <p></p><br><br><br><br><br>
					     <p>
					     	附件2：《旅游行程单》<br>
					        <span>行程单另附</span><br>
					        旅游者：（代表人签字）<em class="all-line" style="width:120px;">
					                	
					                </em>
					        旅行社：（盖章）<em class="all-line" style="width:120px;"> </em><br>
					        <span style="margin-left:272px;">经办人：（签字）<em class="all-line" style="width:120px;">　</em></span><br>
					        <span style="float:right">
					        	<em class="all-line" style="width:120px;">　 </em>
					        </span>
					     </p><br><br><br><br><br>
					     <p>
					     	附件3：<br>
					        </p><table border="0" cellspacing="1" cellpadding="0" class="tab1">
					        	<tbody><tr>
					            	<td colspan="7">自愿购物活动补充协议</td>
					            </tr>
					            <tr>
					            	<td width="150px">具体时间</td>
					                <td width="40px">地点</td>
					                <td width="70px">购物场所名称</td>
					                <td width="70px">主要商品信息</td>
					                <td width="70px">最长停留时间（分钟）</td>
					                <td width="70px">其他说明</td>
					                <td width="200px">旅游者签名同意</td>
					            </tr>
					            
					            <tr>
					            	<td style="text-align:left;">
					                </td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td style="text-align:left;">签名：</td>
					            </tr>
					             <tr>
					            	<td style="text-align:left;">
					                </td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td style="text-align:left;">签名：</td>
					            </tr>
					             <tr>
					            	<td style="text-align:left;">
					                </td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td style="text-align:left;">签名：</td>
					            </tr>
					        </tbody></table><br>
					        旅行社经办人签名：<em class="all-line" style="width:120px;">　</em><br><br><br><br><br>
					<p></p>
					     <p>
					     	附件4：<br>
					        </p><table border="0" cellspacing="1" cellpadding="0" class="tab1">
					        	<tbody><tr>
					            	<td colspan="7">自愿参加另行付费旅游项目补充协议</td>
					            </tr>
					            <tr>
					            	<td width="150px">具体时间</td>
					                <td width="40px">地点</td>
					                <td width="70px">项目名称和内容</td>
					                <td width="70px">费用（元）</td>
					                <td width="70px">项目时长（分钟）</td>
					                <td width="70px">其他说明</td>
					                <td width="200px">旅游者签名同意</td>
					            </tr>
					            <tr>
					            	<td style="text-align:left;">
					                </td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td style="text-align:left;">签名：</td>
					            </tr>
					             <tr>
					            	<td style="text-align:left;">
					                </td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td style="text-align:left;">签名：</td>
					            </tr>
					             <tr>
					            	<td style="text-align:left;">
					                </td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td></td>
					                <td style="text-align:left;">签名：</td>
					            </tr>
					         </tbody></table>
					     <br>
					        旅行社经办人签名：<em class="all-line" style="width:120px;">　</em><br><br><br><br><br>
					     <p></p>
					     <p>
					         附件5：<br>
					     </p><table border="0" cellspacing="1" cellpadding="0" class="tab1">
					         <tbody><tr>
					             <td style="text-align:center;">产品信息描述说明</td>
					         </tr>
					         <tr>
					             <td style="height: 600px;">
					                <p> 
					                  
					<br>
					                  
					                </p>
					             </td>
					         </tr>
					     </tbody></table>
					     <br>
					     <br><br><br><br><br>
					     <p></p>
					     <p>
					         附件6：<br>
					     </p>
					     <p style="text-align: center;color: #333;">补充条款<br></p>
					     <p>
					         1、为办理甲方旅游的证件、预留机位、酒店及行程中交通等，甲方签订旅游合同时，应支付乙方旅游预付款，乙方应出<br>
					                                  具该款项的收款凭证。<br>
					         2、甲方对向乙方提供的办理参加旅游活动的所有资料真实性及完整性负责，并对签证审查中须增补材料的情形给予充分<br>
					                                  的理解和配合。<br>
					         3、甲方应根据自身健康状况报名参加旅游活动，甲方应在报名参团时向乙方提供个人正确信息（包括健康状况等信息或<br>
					                                  证明） 。若因甲方虚报、瞒报上述有关情况，一经发现或旅途中发生意外，由甲方承担全部责任和后果；且乙方有权<br>
					                                  单方面解除旅游合同，拒绝甲方继续参团；给乙方造成损失的，甲方应当承担赔偿责任。<br>
					         4、甲方报名参团发生自然单间或加床时需另补差价；甲方同意乙方可根据参团客源情况拼房；旅游行程中，甲方同意乙<br>
					                                   方 的拼房方案后，应对自身拼房风险和结果以及对拼房后的生活习惯差异等情况负责，若因甲方原因不成行的，应<br>
					                                   自行承担单房差的实际损失。<br>
					         5、甲方已清楚旅游行程中关于酒店等级标准的说明，在不使用国际统一标准的国家和地区以当地行业标准为准。<br>
					         6、<em style="font-style: normal;color: #333;">甲方已清楚且愿意遵守 ：</em>乙方提供的<br>
					                                    机票系特价舱位机票或乙方与航空公司约定不签转、 更改或退票的机票， 不得签转、 更改或退票。<br>
					         7、由公共交通经营者（包括但不限于航空公司，铁路公司、航运公司等）的原因造成甲方人身损害或财产损失的，由公<br>
					                                  共交 通经营者依法承担赔偿责任，乙方不承担责任，乙方应协助甲方向公共交通经营者索赔。<br>
					         8、<em style="font-style: normal;color: #333;">乙方 明确告知甲方：</em>乙方不组织行程<br>
					                                  单以外任何活动，应甲方的要求，安排购物或者另付费旅游项目的，经双方协商一致且不影响其他旅游者行程安排的除外。<br>
					                                  甲方在购物时应知晓商品的质量和价格，并获取相关凭证。<br>
					         9、甲方同意：乙方可在不影响和不降低行程单旅游景点内容及服务标准的情况下，对旅游行程作适当调整。<br>
					         10 、<em style="font-style: normal;color: #333;">乙方已提示甲方购买人身意外伤害保险和 <br>
					                                  旅游意外保险。经乙方推荐的保险，甲方已经阅读并明确知晓保险的保险条款及其保单内容，相关投保信息和约定以保单<br>
					                                  及其保险条款为准。</em><br>
					         11 、<em style="font-style: normal;color: #333;">具有下列情形的旅行社免责：</em><br>
					         （1）因甲方原因造成自己人身损害、财产损失或造成他人损失的，由甲方承担相应责任，但乙方应协助处理。<br>
					         （2）因不可抗力造成甲方人身损害、财产损失的，乙方不承担赔偿责任，但应积极采取救助措施。<br>
					         （3）在自行安排活动期间甲方人身、财产权益受到损害的，乙方在事前已尽到必要警示说明义务且事后已尽到必要救助<br>
					         义 务的，乙方不承担赔偿责任。<br>
					         （4）甲方因参加非乙方安排或推荐的活动导致人身损害、财产损失的，乙方不承担赔偿责任。<br>
					         （5）由于公共交通经营者的原因造成甲方人身损害、财产损失的，由公共交通经营者依法承担赔偿责任，乙方应当协助<br>
					                   甲  方向公共交通经营者索赔。因公共交通工具延误，导致合同不能按照约定履行的，乙方不承担违约责任，但应向<br>
					                   甲方退还未实际发生的费用。<br>
					         12 、<em style="font-style: normal;color: #333;">关于自愿购物和参加另行付费旅游项目约定如下：</em><br>
					         （1）甲方可以自主决定是否参加乙方安排的购物活动、另行付费旅游项目；<br>
					         （2） 乙方可以在不以不合理的低价组织旅游活动、 不诱骗旅游者、 不获取回扣等不正当利益， 且不影响其他旅游者行
					         程安排的前提下，按照平等自愿、诚实信用的原则，与甲方协商一致达成购物活动、另行付费旅游项目协议；<br>
					         （3）购物活动、另行付费旅游项目安排应不与《行程单》冲突；<br>
					         （4） 购物活动、另行付费旅游项目具体约定见《自愿购物活动补充协议》 （附件 3） 、 《自愿参加另行付费旅游项目补充协
					         议》 （附件 4） ，本补充协议关于自愿购物和另行付费旅游项目的约定与《自愿购物活动补充协议》 、 《自愿参加另行付费旅游
					         项目补充协议》约定不一致的，以《自愿购物活动补充协议》 、 《自愿参加另行付费旅游项目补充协议》的约定为准。<br>
					         13 、<em style="font-style: normal;color: #333;">甲乙 双方 一致同意：</em>本次行程若系“自由行”产品 ( 以乙方网站展示的产品性质为唯一标准 ) 的 , 甲方要求乙方不
					         再安排导游人员 ,因无乙方人员陪同出行的各项协助工作均由甲方自行完成。<br>
					         14、若甲乙双方有违反本补充条款之约定的，均可参照主合同违约条款追究违约责任。<br>
					         15 、 <em style="font-style: normal;color: #333;">甲方</em> 同意：甲方签收的《出团通知书》及其行程附件作为本合同组成部分，与合同具有同等效力。<br>
					         16 、 <em style="font-style: normal;color: #333;">甲乙双方一致同意 </em>：电子版旅游合同自旅行社明确告知旅游者其所预订的旅游产品 / 服务可提供且旅游者已付清全部费用时生效。<br>
					         17 、<em style="font-style: normal;color: #333;">旅游合同签署的客人以及代表人阅读上述《补充条款》后，经公司人员详细解释说明，已完全知晓上述补充条款的全部内容；并愿意遵守和同意将此《补充条款》作为旅游合同附件，与旅游合同具有同等效力。且旅游合同的签署代表对自身的代理权真实性和合法性承担法律责任，并承担负责转告未签名旅游者上述补充条款全部内容的责任。</em><br>
					         <br>
					         <br>
					         <br>
					         <br>
					         <span style="float:right">签字：<em class="all-line" style="width:150px">
					                	
					                </em></span>
					         <br>
					         <br>
					         <br>
					         <br>
					     </p>
					     <p>
					         附件7：<br>
					     </p>
					     <p style="text-align: center;color: #333;">旅游安全提示警示告知书<br></p>
					     <p>
					         <em style="font-style: normal;color: #333;">尊敬的游客：</em><br>
					         为了确保您的旅游行程安全顺利，我公司特就旅游行程中应注意的安全事项，向您提示、警示并明确告知，请您仔细阅读。<br>
					         一、旅游出行前建议购买旅游者人身意外伤害保险，并请您出行前告知家人参团旅行社名称及行程、紧急联系电话等。<br>
					         二、临行前确保身体健康，如有体质较弱或者曾患病者必须坚持治疗，防止旧病复发；平时需要用药治疗者，出游时请带足所需药品；旅行 社不建议患有高血压、心脏病、糖尿病以及身体残疾等身体状况不适宜旅游的客人参团出游，如执意参加者须征得医生同意，自备药品，或 者征得家属同意或由家属陪伴；如因自身原因发生任何意外情形，责任自负，公司按客人书面请求给予协助。<br>
					         三、70 岁以上老年人、18 周岁以下未成年人参团旅游的，须由家属陪同出游，并做好安全防护措施，保证前述人员的安全。否则，因其自 身原因导致的任何意外情形，责任自负，公司根据客人的书面请求给予协助。未有家人同行的情况下，公司可根据实际情况决定是否接受前 述人员报名参团； 如获准参加， 前述人员的安全及因其自身原因导致的任何意外情形，责任自负。<br>
					         四、对于有身孕（5 个月以下）的客人（怀孕 5 个月以上，边检将限制出入境。若虚报或隐瞒怀孕月份，在出入境边检时受阻，其后果自负） ， 因在旅途中存在诸多对孕妇不利因素，如长途乘机、坐车及颠簸震动、景点上下、气候变化等，故公司不建议参团出游，尤其是出境旅游； 若客人隐瞒孕情或坚持参团，须对自身健康和孕情负责；若在旅游行程中发生任何意外情形，责任自负，公司按客人书面请求给予协助。<br>
					         五、<em style="font-style: normal;color: #333;">公司郑重提醒客人：</em>根据自身健康状况，谨慎参加赛车、骑马、攀岩、滑翔、探险、漂流、潜水、游泳、滑雪、滑冰、滑板、跳伞、热气球、 蹦极、冲浪等高风险活动或不在公司旅游行程内的活动；游客在自由活动时间内须选择自身能够控制风险的活动及旅游项目， 并在自己能够 控制风险的范围内进行活动； 若客人违反本安全警示告知而所导致的人身伤害或财产损失，公司不承担赔偿责任。<br>
					         六、<em style="font-style: normal;color: #333;">公司郑重提示警示自由行旅游客人：</em>请您在自由行旅游过程中，务必充分了解拟参与的旅游活动或项目的内容及风险，并根据自身身体状况和健康状况慎重评估后选择，自觉遵守该旅游活动或项目的安全规定。公司对您违反本提示所发生的任何意外事故不承担任何责任。<br>
					         七、<em style="font-style: normal;color: #333;">公司郑重提示警示客人：</em>旅游中，客人在乘坐任何交通工具（包括车辆、游船、游艇以及任何游览项目中承载游客的设施或设备）时， 不得将身体任何部位置于交通工具外；并正确使用所配备的所有安全设施和设备；客人未经驾驶人员或管理人员或导游及领队许可，在交通 工具运行时且乘坐期间，客人的身体各部位不得擅自以任何方式脱离座位；若客人违反本提示警示而造成人身或财产损害时，责任自负。<br>
					         八、<em style="font-style: normal;color: #333;">公司郑重提示告知客人：</em>凡参加涉及海边旅游时，不得在非指定区域游泳或嬉水、须根据自身水性和身体及健康状况掌握游泳距离及下 水时间；禁止患高血压、心脏病、中耳炎、急性眼结膜炎、孕妇等客人游泳；禁止剧烈运动后游泳和长时间曝晒游泳及游泳后立即进食；若客人不遵守本提示而导致意外发生,将自行承担后果。<br>
					         九、客人在旅游中须严防“病从口入” ，特别在选择公司安排的餐饮以外的就餐或选购食品时，请注意饮食卫生，防止消化不良、病毒性肝炎、痢疾、伤寒等肠道传染病；品尝海鲜、风味小吃、土特产等食物时，应视本人肠胃状况酌量适用，并应事先了解不宜同时饮用的忌口。非公司安排就餐引起的疾病，公司不承担任何责任。<br>
					         十、<em style="font-style: normal;color: #333;">公司提示客人：</em>客人有义务保管好自身携带的货币，证件和物品；在离开酒店或交通工具、以及购物或游览期间，应将货币和贵重物品随身携带；并须自身做好防盗防窃安全措施。若客人携带财产遭受损失时，应立即报警报案，公司予以协助。<br>
					         十一、<em style="font-style: normal;color: #333;">公司提示客人：</em>客人在游览、观光过程中应谨慎拍照、摄像，在拍照、摄像时应注意往来车辆、所处位置进行拍照、摄像是否有危险 或是否有禁拍标志， 切忌在可能有危险或设有危险标志的地方停留。 旅游者在行程中发现自身权益受到侵害，应及时告知领队、导游以及旅 游者的紧急联系人，因没有及时提出而致损失扩大的，游客自负。<br>
					         十二、<em style="font-style: normal;color: #333;">旅游合同签署的客人以及代表人阅读上述 《旅游安全提示警示告知书》后，经公司人员详细解释说明，已完全知晓上述安全提示警示 告知的全部内容；并愿意遵守和同意将此告知书作为旅游合同附件，与旅游合同具有同等效力。且旅游合同的签署代表对自身的代理权真实 性和合法性承担法律责任，并承担负责转告未签名旅游者上述安全提示警示告知全部内容的责任。</em><br>
					         <br>
					         <br>
					         <br>
					         <br>
					         <span style="float:right">签字：<em class="all-line" style="width:150px">
					                	
					                </em></span>
					         <br>
					         <br>
					         <br>
					         <br>
					     </p>
					     <p>
					         附件8：<br>
					         <br>
					         <br>
					         <br>
					         <span style="text-align: center;display: block;">
					             <em style="font-style: normal;color: #333;">中国公民文明旅游公约</em><br><br>
					             重安全，讲礼仪；<br><br>
					             不喧哗，杜陋习；<br><br>
					             守良俗，明事理；<br><br>
					             爱环境，护古迹；<br><br>
					             文明行，最得体。<br><br>
					         </span>
					         <br>
					         <br>
					         <span style="text-align:right;display: block;padding-right: 160px;">
					             中央文明办 国家旅游局<br><br>
					             二〇一六年八月三日<br>
					         </span>
					         <br>
					         <br>
					         <br>
					         <br>
					         <br>
					         <br>
					         <br>
					         <br>
					     </p></div>
					  
					 </div>
					    </div>
					</div>
	            </div>
	        </div>
    	</div><!-- //warp -->
<!-- //mainBox -->
    </form>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/product/fillInOrderForm.js"></script>
</body>
</html>