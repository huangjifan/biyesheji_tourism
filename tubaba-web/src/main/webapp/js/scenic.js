function user_edit(title,url,id,w,h){
		if($("#check").val()==null||$("#check").val()==""){
			title="用户登录";
		}
		layer_show(title,url,w,h);
	}
	
var isTemai = 'false';
var isTemaiFlag = $("#isTemaiSuppGoods").val();
var firstuppGoodsPrice = $("#firstuppGoodsPrice").val();
var firstSuppGoodsMarkerPrice = $("#firstSuppGoodsMarkerPrice").val();
if (isTemaiFlag == 'Y') {
	isTemai = 'true';
}
//流量二期部码(详情页)
/* 	    losc.cmCreatePageviewTag('detail', {
 pi : '182386',//产品id
 pn : '成都欢乐谷',//产品名称
 ss : isTemai,//是否热卖
 sp : firstuppGoodsPrice,//售卖价格
 msp : firstSuppGoodsMarkerPrice,//市场价
 ci : '11',//品类id
 cn : '景点门票'//品类名称
 }); */

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

/*  $(function(){
     //更改游记里面href链接
     updateTripsHref();
     //异步加载点评
     asynLoadingComment();
     $("input:[name='searchText']").keyup(function(){
         if(event.keyCode == 13){
             document.getElementById("searchButton").click();
         }
     });
     //异步加载
     asynloadingProductDetail();
     isCollect();

     if($.xcookie.getCookie('_ip_city_name')){
         $('.lv_city').text($.xcookie.getCookie('_ip_city_name'));
     }

     $(".JS_order_detail_poptip").poptip({
         //点钟方位，默认7点钟方向
         place : 6
     });
 }); */

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
function getProductDetailData(currentItem, trigger) {
	var ptlink = currentItem.find('.ptlink');
	var suppGoodsId = ptlink.attr('data');
	var branchType = ptlink.attr('data1');
	var key = ptlink.attr('key');
	var productId = '182386';
	var bizCategoryId = '11';
	$.ajax({
		data : "suppGoodsId=" + suppGoodsId + "&branchType="
				+ branchType + "&productId=" + productId
				+ "&bizCategoryId=" + bizCategoryId + "&key="
				+ encodeURIComponent(encodeURIComponent(key)),
		type : "GET",
		url : "/scenic_front/scenic/asyncLoadingTicketDetail.do",
		success : function(data) {
			currentItem.append(data);
			if (trigger == "clk") {
				currentItem.find(".pdetails").show();
				currentItem.addClass("ptditem-selected");
			}
		},
		error : function(data) {
			//                        $.alert("加载失败,请刷新页面.");
			console.log(data);
		}
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

function asynLoadingComment() {
	$.ajax({
		data : "placeId=121200&productId=&placeIdType=PLACE",
		type : "GET",
		dataType : 'json',
		url : "/scenic_front/scenic/asynLoadingComment.do",
		success : function(data) {
			if (data.code == "SUCCESS") {
				$(".pj_list").html(data.message);
			} else {
				$(".pj_list").html("暂无精华点评");
			}
		},
		error : function(data) {
			//为了保证页面优先显示
			$(".pj_list").html("暂无精华点评");
		}
	});
}
//预订如果是景点套餐传入的是产品，如果是其它种类传入的是商品
function bookGoods(goodsId, type, aperiodPackageFlag) {
	var url = "";
	if ("Y" == type) {
		if ("Y" == aperiodPackageFlag) {
			url = "http://www.lvmama.com/scenic_front/book/ticket/ticketReservation.do?productId="
					+ goodsId
					+ "&aperiodPackageFlag="
					+ aperiodPackageFlag + "&urlId=" + 121200;
		} else {
			url = "http://www.lvmama.com/scenic_front/book/ticket/ticketReservation.do?productId="
					+ goodsId + "&urlId=" + 121200;
		}
	} else {
		url = "http://www.lvmama.com/scenic_front/book/ticket/ticketReservation.do?goodsId="
				+ goodsId;
	}
	window.open(url);
}
//特卖会商品跳转下单页
function temaiBookGoods(visitTime, objectId, ProductType,
		prodSeckillId, prodSeckillType, buyNum, stratTime, endTime,
		buCode) {
	if (checkEndTime(stratTime, endTime, prodSeckillType, objectId,
			ProductType)) {
		var url = "http://www.lvmama.com/tnt_order/sale/ticket/fill";
		var temaiForm = document.createElement("form");
		temaiForm.id = "temaiForm";
		temaiForm.method = "post";
		temaiForm.action = url;
		temaiForm.target = "_blank";
		temaiForm.style.display = 'none';
		if (ProductType == 'BRANCH') {
			var goodsIdhideInput = document.createElement("input");
			goodsIdhideInput.type = "hidden";
			goodsIdhideInput.name = "goodsId";
			goodsIdhideInput.value = objectId;
			temaiForm.appendChild(goodsIdhideInput);
		} else if (ProductType == 'PROD') {
			var productIdhideInput = document.createElement("input");
			productIdhideInput.type = "hidden";
			productIdhideInput.name = "productId";
			productIdhideInput.value = objectId;
			temaiForm.appendChild(productIdhideInput);
		}
		if (prodSeckillType == '108') {
			var tidhideInput = document.createElement("input");
			tidhideInput.type = "hidden";
			tidhideInput.name = "tid";
			tidhideInput.value = prodSeckillId;
			temaiForm.appendChild(tidhideInput);
		} else if (prodSeckillType == '110') {
			var sIdhideInput = document.createElement("input");
			sIdhideInput.type = "hidden";
			sIdhideInput.name = "sId";
			sIdhideInput.value = prodSeckillId;
			temaiForm.appendChild(sIdhideInput);
		}
		var buyNumhideInput = document.createElement("input");
		buyNumhideInput.type = "hidden";
		buyNumhideInput.name = "buyNum";
		buyNumhideInput.value = buyNum;
		temaiForm.appendChild(buyNumhideInput);
		var buCodehideInput = document.createElement("input");
		buCodehideInput.type = "hidden";
		buCodehideInput.name = "checkCode";
		buCodehideInput.value = buCode;
		temaiForm.appendChild(buCodehideInput);
		if (document.all) {
			temaiForm.attachEvent("onsubmit", function() {
			}); //IE
		} else {
			var subObj = temaiForm.addEventListener("submit",
					function() {
					}, false); //firefox
		}
		document.body.appendChild(temaiForm);
		if (document.all) {
			temaiForm.fireEvent("onsubmit");
		} else {
			temaiForm.dispatchEvent(new Event("submit"));
		}
		temaiForm.submit();
		document.body.removeChild(temaiForm);
	}
}
function MyAutoRun() {
	document.location.reload();
}
//团购秒杀效验
function checkEndTime(startTime, endTime, prodSeckillType, objectId,
		branchType) {
	var start = new Date(startTime.replace("-", "/").replace("-", "/"));
	var now = new Date();
	var end = new Date(endTime.replace("-", "/").replace("-", "/"));
	var flag = false;
	if (start <= now && now <= end) {
		if (prodSeckillType == '110') {
			$.ajax({
				data : {
					objectId : objectId,
					branchType : branchType,
					productId : '182386',
					destId : '121200'
				},
				type : "post",
				async : false,
				dataType : 'json',
				url : "/scenic_front/ticket/ajax/getSaleStockNum.do",
				success : function(result) {
					if (result.flag == '0') {
						flag = true;
					} else {
						flag = false;
						$.alert(result.msg);
						if (result.flag == '1') {
							document.location.reload();
						}
					}
				}
			});
		} else {
			flag = true;
		}
	} else if (now > end) {
		$.alert("活动已经结束！");
		flag = false;
	} else {
		if (prodSeckillType == '108') {
			$.alert(startTime + " 开始团购！");
		} else if (prodSeckillType == '110') {
			$.alert(startTime + " 开始秒杀");
		}
		flag = false;
	}
	return flag;
}

/**
 * 这个是没有登录的时候,弹出框用的,里面是空的就可以
 */
function loginFormSubmit() {
	if($("#check").val()==null||$("#check").val()==""){
		$("#login").css("dispay","block")
	}else{
		location.href="myOrder";
	}
	
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
	$.getJSON(
					"http://login.lvmama.com/nsso/ajax/checkLoginStatus.do?jsoncallback=?",
					{},
					function(data) {
						if (data.success) {
							$.ajax({
								type : "get",
								async : false,
								dataType : "json",
								url : "http://ticket.lvmama.com/collect/ticket/ajax/isCollection",
								data : {
									objectId : '182386'
								},
								success : function(data) {
									if (data.success) {
										$(".btn_collect")
												.addClass(
														"current");
									}
								},
								error : function() {
									$.alert("收藏失败");
								}
							});
						}
					});
}

<!--收藏-->
$(".btn_collect")
		.bind(
				"click",
				function() {
					var url = '';
					if ('scenic' == "scenic") {
						url = "http://ticket.lvmama.com/scenic-121200";
					} else {
						url = "http://ticket.lvmama.com/scenic-182386";
					}
					//流量二期布码
					if ($(".btn_collect").hasClass("current")) {
						losc.cmCreateClickTag('detail', 'delete', {
							pi : '182386',//产品id
							pn : '成都欢乐谷',//产品名称
							ss : isTemai,//特卖标志
							sp : firstuppGoodsPrice,//售卖价格
							msp : firstSuppGoodsMarkerPrice,//市场价
							ci : '11',//品类id
							cn : '景点门票',//品类名称
							con : 'false'//取消收藏

						});
					} else {
						//流量二期布码
						losc.cmCreateClickTag('detail', 'collect', {
							pi : '182386',//产品id
							pn : '成都欢乐谷',//产品名称
							ss : isTemai,//特卖标志
							sp : firstuppGoodsPrice,//售卖价格
							msp : firstSuppGoodsMarkerPrice,//市场价
							ci : '11',//品类id
							cn : '景点门票',//品类名称
							con : 'true'//收藏

						});
					}

					;
					var imageUrl = "";
					var comPhoto = "";
					if (comPhoto != null && comPhoto.length > 0) {
						imageUrl = comPhoto[0].photoUrl;
					}
					$
							.getJSON(
									"http://login.lvmama.com/nsso/ajax/checkLoginStatus.do?jsoncallback=?",
									{},
									function(data) {
										if (data.success) {
											//判断是否以收藏
											var operation = "addcollection";
											if ($(".btn_collect")
													.hasClass("current")) {
												operation = "removeCollection";
											}

											$
													.ajax({
														type : "get",
														async : false,
														dataType : "json",
														url : "http://ticket.lvmama.com/collect/ticket/ajax/"
																+ operation,
														data : {
															objectId : '182386',
															objectName : '成都欢乐谷',
															imageUrl : imageUrl,
															isValid : "Y",
															sellPrice : 5500
														},
														success : function(
																data) {
															if (data.success) {
																if (operation == "addcollection") {
																	$(
																			".btn_collect")
																			.addClass(
																					"current");
																} else {
																	$(
																			".btn_collect")
																			.removeClass(
																					"current");
																}
															} else {
																$
																		.alert("操作失败");
															}
														},
														error : function() {
															$
																	.alert("操作失败");
														}
													});
										} else {
											loginURL(url);
										}
									});
				});
<!--搜索-->
$("#searchButton").bind(
		"click",
		function() {
			var searchText = $("input[name='searchText']").val();
			if (searchText == "" || jQuery.trim(searchText) == "") {
				return false;
			}
			$(this)
					.attr(
							"href",
							"http://s.lvmama.com/ticket/?keyword="
									+ searchText);
		});
<!--统计点击驴友点评访问量-->
$('[date_id="comments"]').bind("click", function() {
	cmCreateElementTag("景点门票_驴友点评", "驴友点评tab点击");
});
<!--统计点击相关游记访问量-->
$('[date_id="product-customer-trip"]').bind("click", function() {
	cmCreateElementTag("景点门票_相关游记", "相关游记tab点击");
});
<!--领红包-->
$(function() {
	$(".tagsback-bonus").poptip({
		offsetX : 0
	});
	$(document).on("click", ".bonus-dialog-close", function() {
		$(".bonus-overlay, .bonus-dialog").hide();
	});
	$(document)
			.on(
					"click",
					".red-packets-list .red-packets",
					function() {
						var $this = $(this);
						$
								.getJSON(
										"http://login.lvmama.com/nsso/ajax/checkLoginStatus.do?jsoncallback=?",
										{}, function(data) {
											if (data.success) {
												addRedPack($this);
											} else {
												showLogin(function() {
													addRedPack($this);
													$('.dialog-close')
															.click();//如果没有关闭当前窗口，则调用这个click。
												});
											}
										});

					});
});
function addRedPack($this) {
	var id = $this.attr("receiveId");
	var couponId = $this.attr("couponId");
	var type = $this.attr("dataType");
	var useDesc = $this.attr("useDesc");
	var argumentY = $this.attr("argumentY");
	var redPack = $this.attr("redPackName");
	var useTime = $this.attr("useTime");
	var useScope = $this.attr("useScope");
	$
			.ajax({
				type : "get",
				contentType : 'application/json;charset=utf-8',
				url : "/scenic_front/ticket/ajax/bindRedPack.do",
				cache : false,
				data : {
					id : id,
					couponId : couponId,
					categoryId : '11'
				},
				success : function(data) {
					if (data.success == "true") {
						var $dialog = $(".bonus-overlay, .bonus-success-dialog");
						if (type == "EVERY_COUPON") {
							$dialog.find('#title').html(
									"已领取<br/><span>" + useDesc
											+ "</span>");
						}
						if (type == "CASH_COUPON") {
							$dialog.find('#title').html(
									"已领取<dfn>￥</dfn><em>" + argumentY
											+ "</em><br/><span>"
											+ useDesc + "</span>");
						}
						if (type == "FULL_COUPON") {
							$dialog.find('#title').html(
									"已领取<dfn>￥</dfn><em>" + argumentY
											+ "</em><br/><span>"
											+ useDesc + "</span>");
						}
						if (type == "DISCOUNT_COUPON") {
							$dialog.find('#title').html(
									"已领取<em>" + argumentY
											+ "折</em><br/><span>"
											+ useDesc + "</span>");
						}
						$dialog.find('#redName').html(
								redPack + "<br/>" + useTime);
						$dialog.find('#useScope').html(useScope);
						$(".bonus-overlay, .bonus-success-dialog")
								.show();

					} else if (data.success == "false") {
						if (data.code == "-3") {
							var maxNumber = data.maxNumber;
							$(".bonus-overlay, .bonus-picked-dialog")
									.find("#maxNumber").html(maxNumber);
							$(".bonus-overlay, .bonus-picked-dialog")
									.show();
						} else if (data.code == "-5") {
							var errorMessage = data.errorMessage;
							$("#bonusFailMsg").html(errorMessage);
							$(".bonus-overlay, .bonus-fail-dialog")
									.show();
						} else if (data.code == "-6") {
							showRiskDialog();
						} else {
							$("#bonusFailMsg").html("红包领取失败，请重新领取");
							$(".bonus-overlay, .bonus-fail-dialog")
									.show();
						}
					} else {
						$("#bonusFailMsg").html("红包领取失败，请重新领取");
						$(".bonus-overlay, .bonus-fail-dialog").show();
					}

				},
				error : function() {
					$("#bonusFailMsg").html("红包领取失败，请重新领取");
					$(".bonus-overlay, .bonus-fail-dialog").show();
				}
			});

}

function showRiskDialog(errorMessage) {
	errorMessage = errorMessage || "领券通道暂时拥堵，请稍后再试";
	$(".risk-management-dialog p").html(errorMessage);
	$(".risk-management-overlay, .risk-management-dialog").show();
	$(".risk-management-dialog .btn").on("click", function() {
		$(".risk-management-overlay, .risk-management-dialog").hide();
	});
}

$(".tags").poptip();

(function() {
	try {
		//初始化线路losc
		addLosc($('#guess_list_ticket'), '061585');
		addLosc($('#hotel_list_ticket'), '061585');
		addLosc($('#good_common_list_ticket'), '068375');

		addLosc($('#ticket_hotel'), '071326');
		addLosc($('#traffic_hotel'), '071037');
		addLosc($('#ticket_group'), '071038');
		addLosc($('#popular_attraction_list'), '061586');
	} catch (error) {
	}
})();

$(".pdetails-tab li").live(
		'click',
		function() {
			var $me = $(this), $index = $me.index();
			$me.addClass('active').siblings().removeClass('active');
			$me.parents('.pdetails-tabBox').find('.pdetails-tabCon')
					.eq($index).show().siblings('.pdetails-tabCon')
					.hide();
		});
//景点详情按钮弹层
var alertBox = $('.resortAlert'), $body = $("body");
$('.resortInfo .btn')
		.live(
				'click',
				function() {
					var productId = $(this).attr("keepvalue");
					if (productId != "") {
						var url = "";
						$
								.ajax({
									data : "productId=" + productId,
									type : "GET",
									dataType : 'json',
									url : "/scenic_front/scenic/getPopData.do",
									success : function(data) {
										if (data.code == "SUCCESS") {
											alertBox.find(
													".resortAlert-tit")
													.remove();
											alertBox.find(".clearfix")
													.remove();
											alertBox.find(
													".resortComList")
													.remove();
											alertBox
													.find(
															".resortAlert-info")
													.remove();
											alertBox
													.append(data.message);
											alertScroll();
											var overlay = '<div class="resortOverlay"></div>';
											if ($('.overlay.z10').length == 0) {
												$body.append(overlay);
												alertBox.show();
												//阻止遮罩层在滚动时，body也跟着滚动
												$body
														.attr(
																'style',
																'overflow:none;+overflow:hidden;_overflow:hidden;height=100%;overflow:hidden;+overflow:none;_overflow:none;padding:0 17px 0 0');
											}
										} else {
											//什么也不做
										}
									},
									error : function(data) {
										//什么也不做
										$.alert("error");
									}
								});
					}
				});

var type = 'BAIDU';
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
		title : '成都欢乐谷',
		content : '成都欢乐谷',
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

