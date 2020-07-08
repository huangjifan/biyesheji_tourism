var userId = $("#userId").val();
var scenicId = $("#scenicId").val();
var scenicwayId = $("#scenicwayId").val();
//旅游分类
var atrtitle = $("#atrtitle").val();
//旅游路线名称
var name = $("#name").val();
//路线描述
var description = $("#description").val();
//游玩天数
var scenicday = $("#scenicday").val();
//出发城市
var departCity = $("#departCity").val();
//出发时间
var departDate = $("#departDate").val();
//返回时间
var returnDate = $("#returnDate").val();
//成人人数
var adultNumber = parseInt($("#adultNumber").val());
//儿童人数
var childrenNumber = parseInt($("#childrenNumber").val());
//原价
var totalPrice = $("#totalPrice").val();
//优惠后的金额
var money = $("#money").val();
//优惠金额
var discountsMoney = $("#discountsMoney").val();
//优惠卷id
var couponId;

$(function(){
	isExist();
	//获取旅游路线信息
	$.ajax({
		url: "/scenicway/queryById",
		dataType: "json",
		data: {
			scenicwayId: scenicwayId
		},
		success: function(res){
			scenicway = res.scenicway;
			console.log(scenicway);
			//loadActivity(scenicway.discounts);
		}
	});
	//获取活动信息
	$.ajax({
		url: "/discounts/queryDiscountsByScenicwayIdOrScenicIdAndMoney",
		dataType: "json",
		data:{
			scenicwayId: scenicwayId,
			totalPrice: totalPrice
		},
		success: function(res){
			list = res.data;
			discountsMoneys = res.discountsMoney;
			loadActivity(list,discountsMoneys);
		}
	});
	isLogin();
	loadProduct();
	loadCost();
	loadTheVisitors();
	formValidate();
});

/**
 * 表单验证
 */
function formValidate(){
	//中文姓名验证  
	jQuery.validator.addMethod("isZhongWen", function(value, element) {  
	 var length = value.length;  
	 var mobile = /^[\u4E00-\u9FA5]{1,5}$/;  
	 return this.optional(element) || (mobile.test(value)); 
	}, "请填写中文");
	//手机号码验证  
	jQuery.validator.addMethod("isMobile", function(value, element) {  
	 var length = value.length;  
	 var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;  
	 return this.optional(element) || (length == 11 && mobile.test(value));  
	}, "请正确填写手机号码");
	$("#order_submit").validate({
		rules: {
			realname: {
				required: true,
				rangelength:[2,6],
				isZhongWen: true,
			},
			iphone:{
				required: true,
				rangelength:[11,11],
				isMobile : true
			},
			email:{
				required: true,
				email:true
			}
		},
		messages: {
			realname: {
				required: "请输入姓名。",
				rangelength:"姓名只能是2到6个汉字。",
				isZhongWen: "请输入中文姓名。"
			},
			iphone: {
				required: "请输入电话号码。",
				rangelength: "手机号必须是11位。",
				isMobile : "请正确填写手机号码。"
			},
			email:{
				required: "请输入邮箱。",
				email:"请输入正确的邮箱格式。"
			}
		},
		errorPlacement: function(error, element) {
			//console.log(error);
			//console.log(11);
			//element.next().show();
			element.next(".ts_text").hide();
			//console.log(element.nextAll(".error_text").text());
			element.nextAll(".error_text")
				.text($(error).text())
				.css("display","inline-block")
			;
		},
		success: function(label) {
			//console.log(123);
			console.log($(label));
			//$(label).parent().prevAll(".ts_text").show();
			//$(label).parent().hide();
			//console.log(label);
		    //label.html("&nbsp;").addClass("checked");
		    //label.parent().hide();
		}
		//debug:true
	});
}
/**
 * 判断用户是否登录
 * @param 无
 * @returns 无
 */
function isLogin(){
	if(!userId){
		$(".tiptext.tip-info.order_login:first").show();
		$("#nologinBox").show();
	}
}
/**
 * 判断是否需要退出?
 * @returns
 */
function isExist(){
	if(!scenicId && !scenicwayId){
		alert("产品状态异常!,返回产品详细界面.");
		history.go(-1);
	}
}

/**
 * 加载产品信息
 * @returns
 */
function loadProduct(){
	//console.log("name:"+name);
	//console.log($("#product .detail_product_tit b"));
	$("#product .detail_product_tit b")
		.text(name)
		.parent()
		.append(description)
	;
	let i = 0;
	$("#product .order-title-details.clearfix span").each(function(){
		let val = i == 0?departCity:i == 1?departDate+" ("+getWeekByDay(departDate)+")":i == 2?returnDate+" ("+getWeekByDay(returnDate)+")":adultNumber+"成人 "+childrenNumber+"儿童";
		$(this).text(val)
		i++;
	});
	//console.log($("#product .order-product-dl.order-product-hide dt"));
	//console.log(atrtitle);
	$("#product .order-product-dl.order-product-hide dt")
		.append(atrtitle)
	;
	$("#product .order-product-dl.order-product-hide dd p")
		.append(name+atrtitle+"( "+description+") 成人/儿童/房差")
	;
	$("#product .order-product-dl.order-product-hide .order-product-info li b")
		.append(departDate)
	;
	$("#product .order-product-dl.order-product-hide .order-product-info li:eq(1)")
		.append("人数："+adultNumber+"成人、"+childrenNumber+"儿童")
	;
}

/**
 * 判断日期是星期几
 * @param dayValue 日期
 * @returns 返回日期对应的星期几
 */
function getWeekByDay(dayValue){ //dayValue=“2014-01-01”
    var day = new Date(Date.parse(dayValue.replace(/-/g, '/'))); //将日期值格式化
    var today = new Array("周日","周一","周二","周三","周四","周五","周六"); //创建星期数组
    //console.log(today[day.getDay()])
    return today[day.getDay()];  //返一个星期中的某一天，其中0为星期日
}
/**
 * 加载活动
 * @param discounts 活动记录
 * @param discountsMoneys 优惠今额
 * @return 无
 */
function loadActivity(discounts,discountsMoneys){
	let moneySum = 0;
	for(let i = 0;i < discounts.length;i++){
		activity = discounts[i].activity;
		console.log(activity);
		typeid = activity.typeid;
		$("#activityShow").prepend(
			"<div class='yhfs-item clearfix yhfs-item-cx yhfs-item-hc yhfs-item-active' style='margin-left: 50px;'>" 
				+ "<span class='yhfs-hc-radio'></span>"
				+ "<div class='yhfs-left'>" +
						"<span class='cx-tag'>"+typeid.name+"</span><span class='yhl-price'>-￥<em>"+discountsMoneys[i]+"</em></span>" 
				+ "</div>"
                + "<div class='yhfs-center nova-radio-group'>" +
                		"<p class='yhl-cx-selected' >"+activity.way+"<em>-￥"+discountsMoneys[i]+"</em></p>"
                + "</div>" +
			"<div>"
		);
		moneySum = moneySum + discountsMoneys[i];
	}
	if(userId){
		console.log("userId:"+userId);
		//获取用户优惠卷
		$.ajax({
			url: "/coupon/queryUserCoupon",
			dataType: "json",
			data:{
				
			},
			success: function(res){
				list = res.data;
				console.log(list);
				for(let i = 0;i < list.length;i++){
					$("#activityShow").prepend(
						"<div name='优惠卷' class='yhfs-item clearfix yhfs-item-cx yhfs-item-hc' style='margin-left: 50px;'>" 
							+ "<span onclick='selectYouHuiJuan(this)' cid='"+list[i].id+"' class='yhfs-hc-radio'></span>"
							+ "<div class='yhfs-left'>" +
									"<span class='cx-tag'>优惠卷</span><span class='yhl-price'>-￥<em>"+list[i].couponMoney+"</em></span>" 
							+ "</div>"
			                + "<div class='yhfs-center nova-radio-group'>" +
			                		"<p class='yhl-cx-selected' >优惠卷<em>-￥"+list[i].couponMoney+"</em></p>"
			                + "</div>" +
		                "<div>"
		            );
					console.log(list[i].couponMoney);
		            moneySum = moneySum + list[i].couponMoney;
				}
			}
		});
	}
	$("#promotionPriceInfo .primary dfn")
		.append(moneySum);
	$("#promotionPriceInfo .fk_promotionAmount dfn").append(moneySum);
	money = totalPrice - moneySum;
	discountsMoney = moneySum;
	$(".ticketPriceTotal .priceCount dfn").text(money);
	$(".fk_box_fixed.mt20 .fk_p1 span:first").text(money);
}

function selectYouHuiJuan(root){
	//console.log(root);
	$("[name='优惠卷'].yhfs-item-active").removeClass("yhfs-item-active");
	$(root).parent().addClass("yhfs-item-active");
	m = parseInt($(root).next().find("em").text());
	//console.log(m+","+money);
		//parseInt($(".ticketPriceTotal .priceCount dfn").text());
	old = money;
	money = money - m;
	$("#promotionPriceInfo .fk_promotionAmount dfn").text(discountsMoney + m);
	$(".ticketPriceTotal .priceCount dfn").text(money)
	$(".fk_box_fixed.mt20 .fk_p1 span:first").text(money);
	money = old;
	couponId = $(root).attr("cid");
	console.log("优惠卷:"+couponId);
}
/**
 * 加载费用
 * @param 无
 * @returns 无
 */
function loadCost(){
	$("#mainPriceInfo .primary dfn").append(totalPrice);
	$("#mainPriceInfo .ensurance-details")
		.append(atrtitle)
		.next("dfn")
		.append(adultNumber+childrenNumber)
	;
	
	$("#promotionPriceInfo .primary dfn")
		.append('<input type="hidden" name="costExplains[0].content" value="基本团费"/>')
		.append('<input type="hidden" name="costExplains[0].number" value="'+(adultNumber+childrenNumber)+'"/>')
	;
}
/**
 * 加载出游人信息
 * @param 无
 * @returns 无
 */
function loadTheVisitors(){
	content = "";
	first = '';
	adultOrChildren = '';
	for(let i = adultNumber+childrenNumber;i > 0;i--){
		realname = "";
		if(i == 1){
			first = 
			'<dl class="orderDl">'
	            +'<dt><span class="red">*</span>手机号码：</dt>'
	            +'<dd>'
	                +'<input class="input js_yz js_textBig" id="mobile0" name="playMans['+(i-1)+'].iphone" maxlength="11" type="text" placeholder="请输入手机号码">'
	                +'<span class="error_text"><i class="tip-icon tip-icon-error"></i>手机号码不正确</span>'
	            +'</dd>'
	        +'</dl>'
			;
		}
		if(i > adultNumber){
			adultOrChildren = '<p class="orderUser-child"><span>'+i+'</span><em>儿童</em></p>';
		}else{
			adultOrChildren = '<p class="orderUser"><span>'+i+'</span><em>成人</em></p>';
		}
		
		div = 
		'<div class="playerLi" index="'+i+'">'
			+adultOrChildren
			+'<dl class="orderDl">'
		        +'<dt><span class="red">*</span>中文姓名：</dt>'
		        +'<dd>'
		            +'<input class="input js_yz" id="fullName1" name="playMans['+(i-1)+'].realname" type="text" index="1" placeholder="请与登机所持证件姓名一致" maxlength="20">'
		            +'<span class="error_text"><i class="tip-icon tip-icon-error"></i>请输入姓名</span>'
		        +'</dd>'
		    +'</dl>'
		    +first
		    +'<dl class="orderDl">'
	            +'<dt><span class="red">*</span>证件类型：</dt>'
	            +'<dd>'
	                +'<div id="selectbox_1541833400006" class="selectbox selectbox-idCard"><p class="select-info like-input"><span class="select-arrow"><i class="ui-arrow-bottom dark-ui-arrow-bottom"></i></span><span class="select-value">身份证</span></p><div class="selectbox-drop" style="display: none;"><ul class="select-results"><li rel="ID_CARD" class="liActive">身份证</li><li rel="HUZHAO" class="">护照</li><li rel="TAIBAOZHENG" class="">台胞证</li><li rel="HUIXIANG" class="">回乡证</li><li rel="CHUSHENGZHENGMING" class="">出生证明</li><li rel="HUKOUBO" class="">户口簿</li><li rel="SHIBING" class="">士兵证</li><li rel="JUNGUAN" class="">军官证</li></ul></div></div><select data-class="selectbox-idCard" class="selectFixWidth js_select_ID js_zhengjian" id="idType1" num="1" name="travellers[1].idType" selectlinkid="1541833400006" data-linkid="selectlinkid_1541833400006" style="display: none;">'
	                        +'<option value="ID_CARD">身份证</option>'
	                +'</select>'
	                +'<input class="input js_yz js_textBig" name="playMans['+(i-1)+'].identity" type="text" maxlength="18" placeholder="请输入证件号码">'
	                +'<span class="ts_text"><i class="tip-icon tip-icon-info"></i>为了您能顺利出游，请务必确认所填姓名、证件类型和证件号码与所持证件保持一致；</span>'
	                +'<span id="idNoError1" class="error_text"><i class="tip-icon tip-icon-error"></i>证件错误</span>'
	            +'</dd>'
	        +'</dl>'
		    +'<span class="clear_input js_clear_input">清空</span>'
		+
		'</div>';
		$("#Jtenantlist .ticketInput").prepend(div);
	}
}
/**
 * 确认选择或取消选择
 * @param root 源元素
 * @return 无
 */
function checkedOrCancel(root){
	$(root).toggleClass("checked");
}
/**
 * 查看全文或收起
 * @param 无
 * @return 无
 */
function lookFullTextOrPackUp(){
	$(".battery-limit .bl-content").toggleClass("expand");
	$(".battery-limit .more").toggleClass("expand",function(){
		if($(this).text() == "查看全文"){
			$(this).text("收起");
		}else{
			$(this).text("查看全文");
		}
	});
}/**
 
/*
 * 
 * 订单提交
 */
function submit(){
	console.log("订单提交");
	$("#departDate").val(new Date(departDate));
	$("#returnDate").val(new Date(returnDate));
	$("#orderstime").val(new Date());
	$("input[name='indent.price']").val(money);
	$("input[name=grossAmount]").val(money);
	$("input[name=concessionsMoney]").val(money);
	$("input[name=couponId]").val(couponId);
	//alert($("input[name='indent.price']").val());
	$("#order_submit").submit();
}