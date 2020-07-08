var scenicwayId = $("#scenicwayId").val();
var userId = $("#userId").val();
//旅游分类
var atrtitle;
//旅游路线名称
var name;
//路线描述
var description;
//游玩天数
var scenicday;
//出发城市
var departCity;
//出发时间
var departDate;
//返回时间
var returnDate;
//成人人数
var adultNumber = 2;
//成人价
var adultPrice;
//儿童人数
var childrenNumber = 0;
//儿童价
var childrenPrice;
//总价
var totalPrice;

$(function(){
	console.log("scenicwayId:"+scenicwayId);
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
			$('title').text(scenicway.way);
			//获取旅游路线分类面包屑
			$.ajax({
				url: "/scenicwayOrscenic/queryScenicwayOrscenicByScenicwayId",
				dataType: "json",
				data:{
					scenicwayId: scenicwayId,
				},
				success: function(res){
					list = res.data;
					loadScenicwayClassify(scenicway,list);
				}
			});
			//loadScenicwayClassify(scenicway);
			loadFirstScreenProductIntroduction(scenicway);
			//loadActivity(scenicway.discounts);
		}
	});
	//获取旅游路线的评论信息
	$.ajax({
		url: "/remark/queryRemarkByScenicwayIdOrScenicId",
		dataType: "json",
		data:{
			scenicwayId: scenicwayId
		},
		success: function(res){
			list = res.data;
			loadRemark(list);
		}
	});
	var now = new Date();
	//获取旅游路线出发时间信息
	$.ajax({
		url: "/scenicwayDepart/queryScenicwayDepartByScenicwayId",
		dataType: "json",
		data:{
			scenicwayId: scenicwayId,
			year: now.getFullYear(),
			month: now.getMonth()+1,
		},
		success: function(res){
			list = res.data;
			loadScenicwayDepartTime(list);
		}
	});
	//获取该旅游路线是否已收藏了
	$.ajax({
		url: "/collect/queryCollectByUserIdAndScenicIdOrScenicwayId",
		dataType: "json",
		data:{
			scenicwayId: scenicwayId,
		},
		success: function(res){
			flag = res.isCollect;
			if(flag){
				$("#collect").addClass("favorites_yes");
				$("#collect").children("span").text("已收藏");
				$("#collect").attr("isCollect","true");
			}
		}
	});
	//获取活动信息
	$.ajax({
		url: "/discounts/queryDiscountsByScenicwayIdOrScenicId",
		dataType: "json",
		data:{
			scenicwayId: scenicwayId,
		},
		success: function(res){
			list = res.data;
			loadActivity(list);
		}
	});
});
/**
 * 加载旅游路线分类面包屑
 * @param scenicway 旅游路线信息
 * @returns 无
 */
function loadScenicwayClassify(scenicway,list){
	if(!scenicway.attractions){
		return;
	}
	//旅游分类
	atrtitle = scenicway.attractions.atrtitle;
	atid = scenicway.attractions.atid;
	let scope = 0;
	scenic = list[0].scenic;
	//console.log(scenic);
	$("#scenicwayClassify .crumbs-link")
		.append("<a href='../../search?key="+scenic.province+"&fromPath="+scenic.province+"&scope="+atid+"' target='_blank'>"+scenic.province+atrtitle+"</a>&gt;")
		.append("<a href='../../search?key="+scenic.city+"&fromPath="+scenic.city+"&scope="+atid+"' target='_blank'>"+scenic.city+atrtitle+"</a>&gt;")
		.append("<span>"+scenicway.startpath+"到"+scenicway.endpath+atrtitle+"</span>")
	;
}
/**
 * 加载首屏产品介绍
 * @param scenicway 旅游路线信息
 * @returns 无
 */
function loadFirstScreenProductIntroduction(scenicway){
	//旅游路线名称+旅游路线描述
	$("#firstScreenProductIntroduction .detail_product_tit")
		.append("<b>"+scenicway.way+"</b>")
		.append("&nbsp;&nbsp;"+scenicway.description);
	;
	name = scenicway.way;
	description = scenicway.description;
	$("#firstScreenProductIntroduction .detail_product_num")
		.append("<span class='dpn_group'>"+scenicway.attractions.atrtitle+"</span>")
		.append("<i>产品编号："+scenicway.id+"</i>")
		.append("本产品委托社为北京瑞途国际旅行社有限公司，具体的旅游服务和操作由委托社提供。")
	;
	//旅游路线图片
	scenicimages = scenicway.scenicimages;
	for(i = 0;i < scenicimages.length;i++){
		$("#firstScreenProductIntroduction .product_top_box.clearfix .img_scroll_list")
			.append("<li><img src='../../"+scenicimages[i].path+"'></li>");
		$("#firstScreenProductIntroduction .product_top_box.clearfix .img_scroll_tab_list")
			.append("<li><img src='../../"+scenicimages[i].path+"'></li>");
	}
	$($("#firstScreenProductIntroduction .product_top_box.clearfix .img_scroll_tab_list li")
			.get(0)).addClass("active");
	//日历
	$("#firstScreenProductIntroduction .product_top_l .calendar-tab-price span").append(scenicway.floor_price);
	
	$("#firstScreenProductIntroduction .product_top_r .product_info dd .price_num")
		.append("<dfn>"+scenicway.floor_price+"</dfn>")
		.after("起/人(最少成团人数:"+scenicway.minimumGroupSize+"人)")
	;
	$("#firstScreenProductIntroduction .product_top_r .product_top_dp_left")
		.append("<span>"+scenicway.feedback.toFixed(2)+"<small>%</small></span>")
	;
	$("#remark .new-cominfo .com-count .percentum.f60").append(scenicway.feedback.toFixed(2));
	//console.log($("#firstScreenProductIntroduction .product_top_r .product_info dd").get(0));
	$($("#firstScreenProductIntroduction .product_top_r .product_info_hr ~ .product_info")
			.get(0)).append(scenicway.endpath)
	;
	$($("#firstScreenProductIntroduction .product_top_r .product_info_hr ~ .product_info")
			.get(1)).append(scenicway.scenicday+"天"+(scenicway.scenicday-1)+"晚")
	;
	scenicday = scenicway.scenicday;
	
	$("#firstScreenProductIntroduction .product_top_r .product_top_booking .start_city_input")
		.append(scenicway.startpath)
	;
	departCity = scenicway.startpath;
	
	$("#firstScreenProductIntroduction .product_top_booking #adultPriceDesc .c_f60")
		.text("¥"+scenicway.floor_price)
	;
}
/**
 * 加载评论
 * @param list 评论信息list
 * @return 无
 */
function loadRemark(list){
	$($("#firstScreenProductIntroduction .product_top_r .product_top_dp_right span i").get(0))
		.append(list.length)
	;
	$("#remark .new-cominfo .com-count em .f60").append(list.length);
	$("#remark .comheatd .active span").append("("+list.length+")");
	for(let i = 0;i < list.length;i++){
		console.log(list[i]);
		mark = list[i].mark;
		user = list[i].user;
		div = 
			'<div class="comment-li">'
				+ '<div class="ufeed-info">'
			            +'<p class="ufeed-score">'
			            +'<span class="ufeed-level"><i data-level="5" data-mark="" style="width: '+(mark.number * 20)+'%;"></i></span>'
			            +'</p>'
			    + '</div>'
			    + '<div class="ufeed-content">'
            	 	+list[i].content
		        + '</div>'
		        + '<div class="com-userinfo">'
		        	+ '<a class="fr com-enjoy" id="userfulCount__2648232" rel="nofollow" hidefocus="false"><i class="iconcom iconcom-enjoy"></i>有用<em>5</em></a>'
		        	+ '<p>'
		        	+ '    <a href="javascript:;" rel="nofollow" hidefocus="false">'+user.username+'</a>'
		        	+ '</p>'
		        + '</div>'
			+"</div>"
		;
		//console.log($("#remark .comment-list.com-all"));
		$("#remark .comment-list.com-all").append(div);
	}
}
/**
 * 写评论
 * @param 无
 * @returns 无
 */
function writeRemark(){
	if(!userId){
		alert("请登录!");
		return;
	}
	//判断用户是否有改产品的待评论订单
	$.ajax({
		url: "/remark/checkUserRemark",
		dataType: "json",
		data:{
			scenicwayId: scenicwayId,
		},
		success: function(res){
			flag = res.success;
			if(!flag){
				alert("你无该旅游路线的待评价订单");
				return;
			}
			console.log("开始写订单");
			$("#writeRemark").show();
		}
	});
}
/**
 * 发表评论
 */
function submitRemark(){
	let content = $('#writeRemark textarea').val();
	let number = $('#writeRemark select').val();
	console.log(content);
	console.log(number);
	if(!content){
		alert("不能发表空的评论");
		return;
	}
	if(content.length > 300){
		content = content.substring(0,300);
		alert("不能发表超过300字的评论");
		$('#writeRemark textarea').val(content);
		return;
	}
	$.ajax({
		url: "/remark/submitRemark",
		dataType: "json",
		data:{
			scenicwayId: scenicwayId,
			content: content,
			number: number
		},
		success: function(res){
			flag = res.success;
			if(!flag){
				alert("发表失败");
				return;
			}
			alert("发表成功");
			$('#writeRemark textarea').text('');
			$('#writeRemark').hide();
		}
	});
}
/**
 * 加载活动
 * @param discounts 活动记录
 * @return 无
 */
function loadActivity(discounts){
	for(let i = 0;i < discounts.length;i++){
		console.log(discounts[i]);
		$("#firstScreenProductIntroduction .product_top_r .liner-discount-container")
			.append("<li>" +
					"<span class='liner-discount-icon'></span>" +
					"<span class='liner-discount-content'>&nbsp;"+discounts[i].activity.way+"</span>"+
					"<li>")
		;
	}
}
/**
 *  加载旅游路线出发时间
 *  @param list 旅游路线出发时间信息list
 *  @param discounts 活动记录
 *  @return 无
 */
function loadScenicwayDepartTime(list){
	//console.log(list);
	var now = new Date();
	$("#firstScreenProductIntroduction .product_top_l .calendar-tab-month").append(now.getFullYear()+"年"+(now.getMonth()+1)+"月");
	//console.log(getFirstDay(now.getFullYear(),now.getMonth()+1));
	let td = $("#firstScreenProductIntroduction .product_top_l .calendar-box .caltable tbody td");
	showCalendar(td,true,now.getFullYear(),now.getMonth()+1,now.getDate(),list);
	$("#dateOfVisit .caltitle .mtitle").text(now.getFullYear()+"年"+(now.getMonth()+1)+"月");
	showCalendar($("#dateOfVisit .caltable tbody td"),false,now.getFullYear(),now.getMonth()+1,now.getDate(),list);
}

/**
 * 加载日历 
 * @param rootTd 日历元素的td数据
 * @param flag 是否是左侧的日历
 * @param _year 年
 * @param _month 月
 * @param firstDay 今天
 * @param list 旅游路线出发时间list
 * @returns 无
 */
function showCalendar(rootTd,flag,_year,_month,firstDay,list) {
    var i = 0,
        monthDay = 0,
        showStr = "",
        today = new Date();
        //月份的天数
    switch(_month) {
        case 1: monthDay = 31; break;
        case 2:
            if(runNian(_year)) { monthDay = 29; }
            else { monthDay = 28; }
            break;
        case 3: monthDay = 31; break;
        case 4: monthDay = 30; break;
        case 5: monthDay = 31; break;
        case 6: monthDay = 30; break;
        case 7: monthDay = 31; break;
        case 8: monthDay = 31; break;
        case 9: monthDay = 30; break;
        case 10: monthDay = 31; break;
        case 11: monthDay = 30; break;
        case 12: monthDay = 31; break;
    }

    let index = getFirstDay(_year,_month);

    let td = rootTd;
    //显示当前月的天数
    for (let i=1; i<=monthDay; i++) {
    	day = i;
    	if(i < 10){
    		day = "0"+day;
    	}
    	//console.log(i);
        //当日的日期
        if(_year === today.getFullYear() && _month === today.getMonth()+1 && i === today.getDate()) {
        	if(flag){
        		$($(td).get(index)).find("div div:first").append("今天");
        	}else{
        		$($(td).get(index)).find("div").append("今天");
        	}
        } 
        //当日之前的日期（这个判断是因为我有工作需求，就是要求之前的日期不能点击）
        else if(_year < today.getFullYear() || (_year === today.getFullYear() && _month <= today.getMonth()) || (_year === today.getFullYear() && _month === today.getMonth()+1 && i < today.getDate()) ) {
        	if(flag){
        		$($(td).get(index)).find("div div:first").append(day);
        	}else{
        		$($(td).get(index)).find("div").append(day);
        	}
        }
        //其他普通的日期
        else {
        	//$($(td).get(index)).find(".date").removeClass("nodate");
            //$($(td).get(index)).find(".date").removeClass("caldisabled");
            if(flag){
        		$($(td).get(index)).find("div div:first").append(day);
        	}else{
        		$($(td).get(index)).find("div").append(day);
        	}
        }
        $($(td).get(index)).attr("date",_year+"-"+_month+"-"+day);
        index++;
    }
    
    index = getFirstDay(_year,_month);
    for(let i = 0;i < list.length;i++){
    	//console.log(parseInt(list[i].departtime.substring(8,10))+index-1);
    	if(parseInt(list[i].departtime.substring(8,10))+1 < today.getDate()){
    		continue;
    	}
    	let td2 = $($(td).get(parseInt(list[i].departtime.substring(8,10))+index-1));
    	$(td2).attr("price",list[i].price);
    	if(flag){
    		td2.find(".date").removeClass("nodate");
        	td2.find(".date").removeClass("caldisabled");
        	td2.find(".calprice").append("<i>¥</i><em>"+list[i].price+"</em>起");
        	td2.click(function(){
        		changeDate($(this),true);
        	});
    	}else{
    		td2.find("div").removeClass("nodate");
        	td2.find("div").removeClass("caldisabled");
        	//td2.find("div").append("<input type='hidden' value='"+list[i].price+"'/>");
        	td2.click(function(){
        		changeDate($(this),false);
        	});
    	}
    }
}

/**
 * 判断闰年
 * @param _year 年
 * @returns 是闰年返回true,反之返回false
 */
function runNian(_year) {
    if(_year%400 === 0 || (_year%4 === 0 && _year%100 !== 0) ) {
        return true;
    }
    else { return false; }
}

/**
 * 判断某年某月的1号是星期几
 * @param _year 年
 * @param _month 月
 * @returns 返回某年某月的1号是星期几
 */
function getFirstDay(_year,_month) {
    var allDay = 0, y = _year-1, i = 1;
    allDay = y + Math.floor(y/4) - Math.floor(y/100) + Math.floor(y/400) + 1;
    for ( ; i<_month; i++) {
        switch (i) {
            case 1: allDay += 31; break;
            case 2: 
                if(runNian(_year)) { allDay += 29; }
                else { allDay += 28; }
                break;
            case 3: allDay += 31; break;
            case 4: allDay += 30; break;
            case 5: allDay += 31; break;
            case 6: allDay += 30; break;
            case 7: allDay += 31; break;
            case 8: allDay += 31; break;
            case 9: allDay += 30; break;
            case 10: allDay += 31; break;
            case 11: allDay += 30; break;
            case 12: allDay += 31; break;
        }
    }
    return allDay%7;
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
 * 隐藏游玩日期日历
 * @param 无
 * @returns 无
 */
function hideDateOfVisit(){
	//console.log($("#mouseFlag").val());
	if($("#mouseFlag").val() == "0"){
		$("#dateOfVisit").hide();
	}
}
/**
 * 切换出发日期
 * @param root td元素
 * @param flag 是否是左侧日历
 * @returns 无
 */
function changeDate(root,flag){
	//console.log(root);
	$(root).parent("tr").parent("tbody").find(".td-selected").each(function(){
		$(this).removeClass("td-selected");
		return true;
	});
	$(root).addClass("td-selected");
	$(".js_playtime").val($(root).attr("date"));
	$(".js_playtime").prev().remove();
	let date = $(root).attr("date");
	let year = $(root).attr("date").substring(0,5);
	//console.log(year);
	let month_day = $(root).attr("date").substring(5);
	let month_ = $(root).attr("date").substring(5,8);
	let sum_day = parseInt($(root).attr("date").substring(8,10))+scenicday;
	$(".js_playtime").before("<span>"+month_day+" "+getWeekByDay(date)
			+"出发 -- "+month_+sum_day+" "+getWeekByDay(year+month_+sum_day)+"返回</span>");
	$("#firstScreenProductIntroduction .product_top_booking #adultPriceDesc .c_f60")
		.text("¥"+$(root).attr("price"))
	;
	adultPrice = parseFloat($(root).attr("price"));
	childrenPrice = adultPrice - 100;
	departDate = date;
	returnDate = year+month_+sum_day;
	i = 0;
	$(root).parent("tr").parent("tbody").find("td").each(function(){
		//console.log($(root).attr("date")+","+$(this).attr("date"));
		if($(root).attr("date") == $(this).attr("date")){
			return false;
		}
		i++;
		return true;
	});
	if(flag){
		root = $("#dateOfVisit .caltable tbody td:eq("+i+")");
	}else{
		$("#mouseFlag").val("0");
		hideDateOfVisit();
		root = $("#firstScreenProductIntroduction .product_top_l .calendar-box .caltable tbody td:eq("+i+")");
	}
	
	$(root).parent("tr").parent("tbody").find(".td-selected").each(function(){
		$(this).removeClass("td-selected");
		return true;
	});
	$(root).addClass("td-selected");
}

/**
 * 收藏与取消收藏
 * @param 无
 * @return 无
 */
function collectAndCancelCollect(){
	flag = $("#collect").attr("isCollect");
	console.log("用户编号:"+userId);
	if(!userId){
		alert("请登录!");
		return;
	}
	if(flag == "true"){
		console.log("取消收藏");
		$.ajax({
			url: "/collect/cancelCollect",
			type: "get",
			dataType: "json",
			data: {
				scenicwayId: scenicwayId
			},
			success: function(res){
				flag = res.success;
				console.log("取消收藏结果:"+flag);
				if(flag){
					$("#collect").removeClass("favorites_yes");
					$("#collect").children("span").text("收藏");
					$("#collect").attr("isCollect","false");
				}else{
					alert("取消收藏失败");
				}
			}
		});
	}else{
		console.log("收藏");
		$.ajax({
			url: "../../collect/insertCollect",
			type: "post",
			dataType: "json",
			data: {
				userId: userId,
				scenicwayId: scenicwayId
			},
			success: function(res){
				flag = res.success;
				console.log("收藏结果:"+flag);
				if(flag){
					$("#collect").addClass("favorites_yes");
					$("#collect").children("span").text("已收藏");
					$("#collect").attr("isCollect","true");
				}else{
					alert("收藏失败");
				}
			}
		});
	}
}
/**
 * 预订
 * @param root 事件源元素
 * @returns 无
 */
function reservation(root){
	playtime = $(".js_playtime").val();
	if(!playtime){
		console.log("未选择出发时间");
		$(".product-info-start-tip").slideDown(1000).delay(5000).slideUp(1000);
		return;
	}
	totalPrice = adultNumber * adultPrice + childrenNumber * childrenPrice;
	console.log(totalPrice+","+childrenPrice);
	
	$("#reservationForm [name=scenicwayId]").val(scenicwayId);
	$("#reservationForm [name=atrtitle]").val(atrtitle);
	$("#reservationForm [name=name]").val(name);
	$("#reservationForm [name=description]").val(description);
	$("#reservationForm [name=departCity]").val(departCity);
	$("#reservationForm [name=departDate]").val(departDate);
	$("#reservationForm [name=returnDate]").val(returnDate);
	$("#reservationForm [name=adultNumber]").val(adultNumber);
	$("#reservationForm [name=adultPrice]").val(adultPrice);
	$("#reservationForm [name=childrenNumber]").val(childrenNumber);
	$("#reservationForm [name=childrenPrice]").val(childrenPrice);
	$("#reservationForm [name=totalPrice]").val(totalPrice);
	$("#reservationForm").submit();
	/*console.log(
	$("#reservationForm [name=adultNumber]").val()+","+
	$("#reservationForm [name=adultPrice]").val()+","+
	$("#reservationForm [name=childrenNumber]").val()+","+
	$("#reservationForm [name=childrenPrice]").val()+","+
	$("#reservationForm [name=totalPrice]").val());*/
}
/**
 * 切换人数
 * @param root 源
 * @returns 无
 */
function togglePeopleNumber(root){
	$(root).toggleClass("opened");
	let val = $(root).find(".flag").text();
	//console.log(val);
	if(val != "0"){
		$(root).find(".nova-select-toggle em").text(val);
		$(root).find(".nova-select-option.active").removeClass("active");
		let num = (parseInt(val)-1);
		$(root).find(".nova-select-option:eq("+num+")").addClass("active");
		if( $(root).find(".flag").attr("name") == "adult"){
			adultNumber = num+1;
		}else{
			childrenNumber = num+1;
		}
		console.log(adultNumber);
	}
	$(root).find(".nova-select-dropdown").show();
}