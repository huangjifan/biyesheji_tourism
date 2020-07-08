/**
 * 
 */
$(function() {
	/*$(".next").click(function() {
		if ($(".next").hasClass("loading")) {
			var temp = $(".search-page-num em").html();
			var pageCount = $(".search-page-num").text().split('/');
			pageCount = pageCount[pageCount.length - 1];
			var count = parseInt(temp) + 1;
			$(".search-page-num em").html(count);
			if ($(".search-page-num em").text() > 1) {
				$(".prev").removeClass("disabled");
				$(".prev").addClass("loading");
			}
			if (parseInt(pageCount) == parseInt($(".search-page-num em").html())) {
				$(".next").removeClass("loading");
				$(".next").addClass("disabled");
			}
		}
	})*/
	/*$(".prev").click(function() {
		if ($(".prev").hasClass("loading")) {
			var temp = $(".search-page-num em").text();
			var pageCount = $(".search-page-num").text().split('/');
			pageCount = pageCount[pageCount.length - 1];
			var count = parseInt(temp) - 1;
			$(".search-page-num em").html(count);
			if ($(".search-page-num em").text() == 1) {
				$(".prev").removeClass("loading");
				$(".prev").addClass("disabled");
			}
			if (parseInt(pageCount) > parseInt($(".search-page-num em").text())) {
				$(".next").removeClass("disabled");
				$(".next").addClass("loading");
			}
		}
	});*/
	$("#price1").focus(function() {
		$("#price1").parent().parent().parent().addClass("active");
		$("#search-filter-price-new-dropdown").focus();
	});
	$("#price2").focus(function() {
		$("#price2").parent().parent().parent().addClass("active");
	});
	$("#search-filter-price-new-dropdown").blur(function() {
		$("#search-filter-price-new-dropdown").removeClass("active");
	});
	$("#price1").keyup(function() {
		if (parseInt($("#price1").val()) > 0)
			$("#priceBtn").removeClass("btn-disabled");
		else
			$("#priceBtn").addClass("btn-disabled");
	});
	$("#price2").keyup(function() {
		if (parseInt($("#price2").val()) > 0 || (parseInt($("#price2").val()) <= parseInt(9999))) {
			$("#priceBtn").removeClass("btn-disabled");
		} else
			$("#priceBtn").addClass("btn-disabled");
	});
	$("#clearbtn").click(function() {
		$("#price1").val('');
		$("#price2").val('');
		$("#search-lists").focus();
		$(".search-filter-price-new-dropdown").blur();
	});
});
var FilterPanel = $('.search-nav.clearfix').offset().top;
/* 滑动鼠标滚轮时触发 */
function checkscroll() {
	if ($('.search-nav.clearfix').length > 0) {
		/* 网页与页面的距离document.documentElement.scrollTop */
		/* 判断元素距离页面的高度<=网页与页面的高度时用固定定位 */
		if ($('.search-nav.clearfix').offset().top <= document.documentElement.scrollTop) {
			$('.search-nav.clearfix').css({
				position : "fixed",
				'top' : 0,
				'left' : $('.search-nav.clearfix').offset().left,
				'z-index' : 200
			});
		}

		/* 判断元素距离页面的高度>=网页与页面的高度时取消固定定位 */
		if (document.documentElement.scrollTop <= FilterPanel) {
			$('.search-nav.clearfix').css({
				position : "",
				'top' : "",
				'left' : "",
				'z-index' : ""
			});
		}
	}
}
var str2 = '',
	v,
	fromPath,
	scope;
var arr = $(".search_type_list");
for (var i = 0; i < arr.length; i++) {
	if ($(arr[i]).css("display") === 'block') {
		v = $(arr[i]).children("form").children("input").val();
		fromPath = $(arr[i]).children("div").children(".btn_city.js_searchbox").children("b").text();
	}
	if (fromPath == '') {
		fromPath = $(arr[1]).children("div").children(".btn_city.js_searchbox").children("b").text();
	}
}
$(function() {
	/*var str = ''
		+ '<div class="search-list clearfix" '
		+ '	style="background-color: rgb(204, 232, 207);">'
		+ '	<div class="search-theme">主题</div>'
		+ '	<div class="search-all active">'
		+ '		<a href="javascript:;"'
		+ '			onclick="searchRedirect()">不限</a>'
		+ '	</div>'
		+ '	<ul class="search-content clearfix">'
		+ '		<li><label class="search-label "> <a title="温泉" '
		+ '				href="http://s.lvmama.com/ticket/H9K310000T3?keyword=%E5%8C%97%E4%BA%AC&amp;tabType=scenictour#list">'
		+ '					温泉 (<span>44</span>)'
		+ '			</a>'
		+ '		</label></li>'
		+ '	</ul>'
		+ '	<div class="search-content-more">'
		+ '		<a><span>更多</span><i class="grayArrow"></i></a>'
		+ '	</div>'
		+ '</div>';*/
	var str = '<div class="tipbox tip-warning tip_style" style="background-color: rgb(204, 232, 207);">'
		+ '<span class="tip-icon-big tip-icon-nobg-big-warning"></span>'
		+ '<div class="tip-content">'
		+ '<h3 class="tip-title">非常抱歉，没有找到符合“' + v + '”的产品</h3>'
		+ '<p class="tip-explain">建议您: 变更出发地,关键字或筛选条件重新搜索</p>'
		+ ' <p class="tip-proposal">或者马上来定制属于自己的行程吧</p>'
		+ '<a href="company.jsp" class="tip-proposal-btn">立即定制</a>'
		+ '</div>'
		+ '</div>';

	var $a = $(".search-nav.clearfix a");
	if ($(".btn_type.js_btn_type b").text() == '景点门票') {
		if ($($a[2]).children("b").text() > 0) {
			$(".btn_type.js_btn_type b").attr("data-type", 'TICKET');
			$("#freetour_destroute_fromPlaces_1").show();
			$("#freetour_destroute_fromPlaces_1").siblings().hide();
			$($a[2]).addClass("active");
			scope = 3;
		} else
			$("#search-ajax-box").html(str);
	} else if ($(".btn_type.js_btn_type b").text() == '自由行') {
		if ($($a[3]).children("b").text() > 0) {
			$(".btn_type.js_btn_type b").attr("data-type", 'FREETOUR');
			$("#freetour_destroute_fromPlaces").show();
			$("#freetour_destroute_fromPlaces").siblings().hide();
			$($a[3]).addClass("active");
			scope = 102;
		} else
			$("#search-ajax-box").html(str);
	} else if ($(".btn_type.js_btn_type b").text() == '当地游') {
		if ($($a[4]).children("b").text() > 0) {
			$(".btn_type.js_btn_type b").attr("data-type", 'LOCAL');
			$("#localyou").show();
			$("#localyou").siblings().hide();
			$($a[4]).addClass("active");
			scope = 103;
		} else
			$("#search-ajax-box").html(str);
	} else if ($(".btn_type.js_btn_type b").text() == '跟团游') {
		if ($($a[1]).children("b").text() > 0) {
			$(".btn_type.js_btn_type b").attr("data-type", 'GROUP');
			$("#group_fromPlaces").show();
			$("#group_fromPlaces").siblings().hide();
			$($a[1]).addClass("active");
			scope = 101;
		} else
			$("#search-ajax-box").html(str);
	} else {
		if ($($a[1]).children("b").text() > 0) {
			$($a[0]).addClass("active");
			scope = 1;
		} else
			$("#search-ajax-box").html(str);
	}

	function addmore() {
		var $addmore = $('.js_addmore');
		for (var i = 0; i < $addmore.length; i++) {
			var thisAdd = $addmore.eq(i);
			if (thisAdd.height() > 40 && thisAdd.siblings('.search-content-more').length < 1) {
				if (thisAdd.parent('.search-list').hasClass('expanded')) {
					thisAdd.after('<div class="search-content-more expanded"><a><span>收起</span><i class="grayArrow"></i></a></div>');
				} else {
					thisAdd.after('<div class="search-content-more"><a><span>更多</span><i class="grayArrow"></i></a></div>');
				}
			}
		}
	}
	;
	var $document = $(document);
	addmore();(function() {
		var EXPAND = "更多";
		var SHRINK = "收起";
		$document.on("click", ".search-content-more", function() {
			var $this = $(this);
			var $searchList = $this.parents(".search-list");
			if ($this.is(".expanded")) {
				$searchList.removeClass("expanded");$this.removeClass("expanded");$this.find("span").text(EXPAND);
			} else {
				$this.find("span").text(SHRINK);$searchList.addClass("expanded");$this.addClass("expanded");
			}
		})
	})();(function() {
		$document.on("click", function(e) {
			var $searchFilterPriceDropdown = $(".search-filter-price-dropdown");
			var $target = $(e.target);
			var $parent = $target.parents(".search-filter-price-dropdown");
			if ($target.is(".search-filter-price-dropdown") || $parent.length > 0) {
				$searchFilterPriceDropdown.addClass("active");
			} else {
				$searchFilterPriceDropdown.removeClass("active");
			}
		});$document.on("click", ".search-filter-price-dropdown .btn", function(e) {
			var $searchFilterPriceDropdown = $(".search-filter-price-dropdown");
			$searchFilterPriceDropdown.removeClass("active");e.stopPropagation();
		});$document.on("click", ".search-filter-price-dropdown .cls", function(e) {
			var $searchFilterPriceDropdown = $(".search-filter-price-dropdown");
			var $searchFilterPriceDropdownInput = $searchFilterPriceDropdown.find("input");
			$searchFilterPriceDropdownInput.val("");$searchFilterPriceDropdownInput.first().trigger("focus");e.stopPropagation();
		});$(document).on('click', '.caltitle', function(e) {
			e.preventDefault();e.stopPropagation();
		});
	})();(function() {
		$document.on("click", function(e) {
			var $searchMore = $(".search-more");
			var $target = $(e.target);
			var $parent = $target.parents(".search-more");
			if (($target.is(".search-title") || $target.parents(".search-title").length > 0) && $searchMore.is(".active")) {
				$searchMore.removeClass("active");
			} else if ($target.is(".search-more") || $parent.length > 0) {
				$searchMore.addClass("active");
			} else {
				$searchMore.removeClass("active");
			}
		});$document.on("mouseenter", ".search-more", function() {
			var $searchMore = $(".search-more");
			$searchMore.addClass("active");
		});$document.on("mouseleave", ".search-more", function() {
			var $searchMore = $(".search-more");
			$searchMore.removeClass("active");
		});$document.on("click", ".search-more-dropdown a", function(e) {
			var $searchTitle = $(".search-title");
			var $searchMore = $(".search-more");
			var $this = $(this);
			var value = $this.attr("data-value");
			var text = $this.text();
			$searchTitle.find("span").text(text);
			if (value === "TRAFFIC_AND_SERVES") {
				$searchTitle.addClass("pink");
			} else {
				$searchTitle.removeClass("pink");
			}
			e.stopPropagation();$searchMore.removeClass("active");
		});
	})();(function() {
		var EXPAND = "更多筛选";
		var SHRINK = "收起筛选";
		$document.on("click", ".search-filter-more", function() {
			var $searchListsHidden = $(".search-lists-hidden");
			var $searchFilterMore = $(".search-filter-more");
			if ($searchFilterMore.is(".expanded")) {
				$searchFilterMore.removeClass("expanded");$searchFilterMore.find("i").text(EXPAND);$searchListsHidden.removeClass("search-lists-hidden-show");
			} else {
				EXPAND = $searchFilterMore.find("i").text();$searchFilterMore.find("i").text(SHRINK);$searchFilterMore.addClass("expanded");$searchListsHidden.addClass("search-lists-hidden-show");$searchListsHidden.each(function(index, hidden) {
					var $hidden = $(hidden);
					var $last = $hidden.find(".search-label.active").last();
					if ($last.length > 0) {
						var lastTop = $last.offset().top;
						var $searchContent = $last.parents(".search-content");
						var contentTop = $searchContent.offset().top;
						if (lastTop - contentTop > 30) {
							var $searchMore = $hidden.find(".search-content-more");
							$searchMore.addClass("expanded");$searchMore.find("span").html("收起")
							$hidden.addClass("expanded");
						}
					}
				})
			}
			addmore();
		});
	})();
});
function routeSelectAjax(doc) {
	if ($(doc).hasClass("active")) {
		$(doc).removeClass("active");
	} else
		$(doc).addClass("active").parent().siblings().children().removeClass("active");
	var day,
		startpath,
		scenic,
		title,
		price,
		praise,
		footprice,
		topprice,
		activity,
		order,flag=true;
	var arr = $(".search-label");
	for (var i = 0; i < arr.length; i++) {
		if ($(arr[i]).hasClass("active")) {
			var index = $(arr[i]).parent().parent().parent().index();
			if (index == 0) {
				day = $(arr[i]).text().trim().substr(0, 1)
			} else if (index == 1) {
				startpath = $(arr[i]).text().trim();
			} else if (index == 2) {
				scenic = $(arr[i]).text().trim();
			} else if (index == 3) {
				title = $(arr[i]).text().trim();
			}
		}
	}
	var value = $(doc).text().trim();
	if (value == '综合') {
		$(doc).parent().addClass("active");
		$(doc).parent().siblings().removeClass("active");
	} else if (value == '价格' || value == '好评率') {
		if ($(doc).parent().hasClass("up")) {
			$(doc).parent().removeClass("up").addClass("down active");
		} else {
			$(doc).parent().removeClass("down").addClass("up active");
			order=1;
		}
		if (value == "价格") {
			price=1;
		}
		if (value == "好评率") {
			praise=1;
		}
		$(doc).parent().siblings().removeClass("active");
	} else if (value == '促销活动') {
		$(doc).parent().siblings().removeClass("active");
		activity = 1;
	} else if (value == "确定") {
		if (!$("#priceBtn").hasClass("btn-disabled")) {
			if (parseInt($("#price1").val()) > 0 && parseInt($("#price2").val()) > 0 && parseInt($("#price1").val()) >= parseInt($("#price2").val())) {
				$(".price-tip").html('<span style="color:red">最低价不能大于或等于最高价</span>');
				flag=false;
			}else if((parseInt($("#price1").val()) > 0&&parseInt($("#price1").val())>9999)||(parseInt($("#price2").val()) > 0&&parseInt($("#price2").val())>9999)){
				$(".price-tip").html('本次价格区间<span class="price-low">0</span>至<span class="price-high">9999</span>');
				flag=false;
			}else {
				$(".search-filter-price-new-dropdown").blur();
				if (parseInt($("#price1").val()) > 0) {
					footprice = parseInt($("#price1").val());
				}
				if (parseInt($("#price2").val()) > 0) {
					topprice = parseInt($("#price2").val());
				}
			}
		} else {
			flag=false;
		}
	}
	if($(doc).parent().hasClass("pagebox")){
		flag=false;
	}
	if(flag){
		$.ajax({
			url : 'searchAjax',
			type : 'post',
			data : {
				'day' : day,
				'startpath' : startpath,
				'scenic' : scenic,
				'title' : title,
				'price' : price,
				'praise' : praise,
				'footprice' : footprice,
				'topprice' : topprice,
				'activity' : activity,
				'order' : order,
				'key' : v,
				"fromPath" : fromPath,
				"scope" : scope
			},
			beforeSend:function(XMLHttpRequest){
				$(".loading_box").css("display","block");
				$(".product-item.clearfix").css("display","none");
			},
			success : function(data) {
				$(".loading_box").css("display","none");
				$(".product-item.clearfix").css("display","block");
				var s='';
				if(data.data.length>0){
					for(var i=0;i<data.data.length;i++){
						s+='<div class="product-item clearfix"'
							+'style="background-color: rgb(204, 232, 207);">'
							+'<div class="product-left" '
							+'>'
							+'<a href="scenicway/tourRouteProductShow/'+data.data[i].id+'" '
							+'target="_blank" title="" class="product-picture"> <img '
							+'rel="nofollow" '
							+'src="'+data.data[i].scenicwayImage+'" '
							+'alt="" width="150" height="100"> <span '
							+'class="product-label product-label-alpha">'+data.data[i].attractions.atrtitle+'</span>'
							+'<div class="contrastAdd">'
							+'<input type="hidden" class="contrastInput-img" '
							+'value="'+data.data[i].scenicwayImage+'">'
							+'<input type="hidden" class="contrastInput-tit" '
							+'value="'+data.data[i].way+'"> '
							+'<input type="hidden" class="contrastInput-href" '
							+'value="http://dujia.lvmama.com/group/1166468-D9"> <input '
							+'type="hidden" class="contrastInput-price" value="'+data.data[i].floor_price+'">'
							+'<input type="hidden" class="contrastInput-proId" '
							+'value="'+data.data[i].id +'"> <span class="contrastBg"></span>'
							+'<div class="contrastText">'
							+'<span class="contrastIcon contrastIcon-add"></span> <b>加入收藏</b>'
							+'<b class="contrastTextAdded">已加入</b> <b '
							+'class="contrastTextExitAdd">取消加入</b>'
							+'</div>'
							+'</div>'
							+'</a>'
							+'</div>'
							+'<div class="product-section">'
							+'<h3 class="product-title">'
							+'<a href="scenicway/tourRouteProductShow/'+data.data[i].id+'" '
							+'style="cursor: pointer" target="_blank" '
							+'class="product-title-a" '
							+'onclick="filterData()">'
							+'<span '
							+'title="">'
							+'<em>'+data.data[i].way+'</em>'+data.data[i].description
							+'</span>'
							+'</a> <a target="_blank" '
							+'href="scenicway/tourRouteProductShow/'+data.id+'"> <span '
							+'class="icon-drill icon-drill-five" '
							+'tip-content="酒店精品且舒适，高端品质"></span>'
							+'</a>'
							+'</h3>';
						if(data.data[i].discounts!=null&&data.data[i].discounts.length>0){
							s+='<div class="product-details product-details-sale clearfix">'
								+'		<div class="product-dropdown">'
								+'		<div class="product-ticket-dropdown" '
								+'			style="background-color: rgb(204, 232, 207);">'
								+'			<b class="hotTips hotTips-cx">促销</b> <span '
								+'			class="grayArrow"></span>';
									for(var j=0;j<data.data[i].discounts.length;j++){
										s+='<p>'+data.data[i].discounts[j].activity.way +'</p>';
									}
							s+=''
								+'		</div>'
								+'		</div>'
								+'</div>';
						}
						s+=''
							+'<div class="product-address">'
							+'<em> <span class="icon-point"></span>'+data.data[i].startpath
							+'</em>'
							+'</div>'
							+'</div>'
							+'<div class="product-info" id="1166468">'
							+'<div class="product-price">'
							+'<b>¥</b> <em> '+data.data[i].floor_price +'</em> <i id="p1166468">起/人</i>'
							+'</div>'
							+'<a href="scenicway/tourRouteProductShow/'+data.id+'" '
							+'target="_blank" class="btn btn-orange btn-lg product-view" '
							+'>'
							+'查看详情 </a>'
							+'<ul class="product-number">'
							+'<li><b>'+data.data[i].feedback+'%</b>好评率</li>'
							+'</ul>'
							+'</div>'
							+'</div>';
					}//循环结束
				}else{
				s+='<div class="tipbox tip-warning tip_style" style="background-color: rgb(204, 232, 207);">'
				+ '<span class="tip-icon-big tip-icon-nobg-big-warning"></span>'
				+ '<div class="tip-content">'
				+ '<h3 class="tip-title">非常抱歉，没有找到符合“' + v + '”的产品</h3>'
				+ '<p class="tip-explain">建议您: 变更出发地,关键字或筛选条件重新搜索</p>'
				+ ' <p class="tip-proposal">或者马上来定制属于自己的行程吧</p>'
				+ '<a href="http://www.lvmama.com/companyOrder?pageType=personal" class="tip-proposal-btn">立即定制</a>'
				+ '</div>'
				+ '</div>';
				}
				$(".product-list").html(s);
			}
		});
	}
}
function searchFour(doc){
	var sss,ss;
	for(var i=0;i<$(doc).prev().children().length;i++){
		if($($(doc).prev().children()[i]).css("display")==='block'){
			
				if($($(doc).prev().prev().children().children()[0]).text()=='跟团游'){
					ss=101;
				}else if($($(doc).prev().prev().children().children()[0]).text()=='当地游'){
					ss=103;
				}else if($($(doc).prev().prev().children().children()[0]).text()=='自由行'){
					ss=102;
				}else if($($(doc).prev().prev().children().children()[0]).text()=='景点门票'){
					ss=3;
				}else{
					ss=1;
				}
				sss=$($(doc).prev().children()[i]).children("form").children("input").val().trim();
		}
	}
	if(sss.trim()==''){
		alert("搜索内容不能为空");
	}else{
		str2 = 'key=' + sss + '&fromPath=' + fromPath + '&scope=' + ss;
		location.href='search?' + str2;
	}
}
function searchTwo(doc, value) {
	str2 = 'key=' + v + '&fromPath=' + fromPath + '&scope=' + value;
	$(doc).attr("href", 'search?' + str2);
}
function searchThree(doc) {
	var page;
	if($(doc).hasClass("prevpage")){
		page=parseInt($('.pagesel').text().trim())-1;
	}else if($(doc).hasClass("nextpage")){
		page=parseInt($('.pagesel').text().trim())+1;
	}else{
		page=parseInt($('.pagesel').text().trim());
	}
	var str4 = 'key=' + v + '&fromPath=' + fromPath + '&scope=' + scope+'&pageNum='+page;
	$(doc).attr("href", 'search?' + str4);
}
/**********************************************************/

(function(window, $, lv, nova) {
	"use strict";
	if (!Array.prototype.forEach) {
		Array.prototype.forEach = function(callback, thisArg) {
			var T,
				k;
			if (this == null) {
				throw new TypeError(' this is null or not defined');
			}
			var O = Object(this);
			var len = O.length >>> 0;
			if (typeof callback !== "function") {
				throw new TypeError(callback + ' is not a function');
			}
			if (arguments.length > 1) {
				T = thisArg;
			}
			k = 0;
			while (k < len) {
				var kValue;
				if (k in O) {
					kValue = O[k];callback.call(T, kValue, k, O);
				}
				k++;
			}
		};
	}
	if (lv.calendar) {
		return false;
	}
	var $document = $(document);
	var $body = $("body");
	var today = new Date();
	var fiveMinutes = 1000 * 60 * 5;
	var monthSize = {
		0 : 31,
		1 : 28,
		2 : 31,
		3 : 30,
		4 : 31,
		5 : 30,
		6 : 31,
		7 : 31,
		8 : 30,
		9 : 31,
		10 : 30,
		11 : 31
	};
	function getEpochOfCST() {
		var epoch = new Date(1970, 0, 1);
		return epoch;
	}
	function padNumber(num, digits, trim) {
		var neg = "";
		if (num < 0) {
			neg = "-";
			num = -num;
		}
		num = "" + num;
		while (num.length < digits) {
			num = "0" + num;
		}
		if (trim) {
			num = num.substr(num.length - digits);
		}
		return neg + num;
	}
	function dateGetter(name, size, offset, trim) {
		return function(date) {
			var value = date["get" + name]();
			if (offset > 0 || value > -offset) {
				value += offset;
			}
			if (value === 0 && offset === -12) {
				value = 12;
			}
			return padNumber(value, size, trim);
		}
	}
	function dateSetter(name, size, offset, trim) {
		return function(date, value) {
			if (offset > 0 || value > -offset) {
				value -= offset;
			}
			if (value === 0 && offset === -12) {
				value = 12;
			}
			date["set" + name](value);
		}
	}
	var DATE_FORMATS_SPLIT = /((?:[^yMdHhmsaZE']+)|(?:E+|y+|M+|d+|H+|h+|m+|s+|a|Z))(.*)/;
	var DATE_FORMATS = {
		yyyy : [ "FullYear", 4 ],
		yy : [ "FullYear", 2, 0 ],
		MM : [ "Month", 2, 1 ],
		M : [ "Month", 1, 1 ],
		dd : [ "Date", 2 ],
		d : [ "Date", 1 ],
		HH : [ "Hours", 2 ],
		H : [ "Hours", 1 ],
		hh : [ "Hours", 2, -12 ],
		h : [ "Hours", 1, -12 ],
		mm : [ "Minutes", 2 ],
		m : [ "Minutes", 1 ],
		ss : [ "Seconds", 2 ],
		s : [ "Seconds", 1 ],
		E : [ "Day", 1 ]
	};
	function Factory(options) {
		options = $.extend({}, Factory.defaults, options);return new Calendar(options);
	}
	Factory.defaults = {
		weekHeader : false,
		weekInterval : false,
		priceTipText : "因最低价实时变化，请以实际价格为准",
		showPriceTip : true,
		sectionSelect : false,
		allowMutiSelected : false,
		triggerEvent : "click",
		date : "",
		target : "body",
		offsetAmount : {
			top : 0,
			left : 0
		},
		englishWeekTitle : {
			0 : 'sun',
			1 : 'mon',
			2 : 'tue',
			3 : 'wed',
			4 : 'thu',
			5 : 'fri',
			6 : 'sat'
		},
		weekShortTitle : {
			0 : "日",
			1 : "一",
			2 : "二",
			3 : "三",
			4 : "四",
			5 : "五",
			6 : "六"
		},
		wrapClass : "",
		weekTitle : {
			0 : "星期日",
			1 : "星期一",
			2 : "星期二",
			3 : "星期三",
			4 : "星期四",
			5 : "星期五",
			6 : "星期六"
		},
		titleTip : "{{year}}年{{month}}月",
		template : "big",
		bimonthly : false,
		dateFormat : "yyyy-MM-dd",
		monthChangeOffset : 1,
		sourceFn : null,
		selectDateCallback : null,
		cancelDateCallback : null,
		completeCallback : null,
		clearCallback : null,
		okCallback : null,
		renderReadonly : true,
		cascading : false,
		cascadingMin : 1,
		cascadingOffset : 1,
		cascadingMax : -1,
		cascadingNextAuto : true,
		minLimit : null,
		maxLimit : null,
		monthNext : 6,
		monthPrev : 0,
		dayNext : -1,
		dayPrev : 0,
		dayDisableNext : 0,
		isTodayClick : true,
		numberOfDays : "{{num}}晚",
		division : false,
		showNumberOfDays : false,
		isBirthday : false,
		hasTime : false,
		clickDocumentHide : true,
		festival : {
			'2017-01-01' : {
				name : '元旦',
				vacationName : '元旦'
			},
			'2017-01-02' : {
				vacationName : '元旦假期'
			},
			'2017-01-27' : {
				name : '除夕',
				vacationName : '除夕'
			},
			'2017-01-28' : {
				name : '春节',
				vacationName : '春节'
			},
			'2017-01-29' : {
				vacationName : '春节假期'
			},
			'2017-01-30' : {
				vacationName : '春节假期'
			},
			'2017-01-31' : {
				vacationName : '春节假期'
			},
			'2017-02-01' : {
				vacationName : '春节假期'
			},
			'2017-02-02' : {
				vacationName : '春节假期'
			},
			'2017-04-02' : {
				vacationName : '清明节假期'
			},
			'2017-04-03' : {
				vacationName : '清明节假期'
			},
			'2017-04-04' : {
				name : '清明',
				vacationName : '清明节'
			},
			'2017-04-29' : {
				vacationName : '劳动节假期'
			},
			'2017-04-30' : {
				vacationName : '劳动节假期'
			},
			'2017-05-01' : {
				name : '劳动',
				vacationName : '劳动节'
			},
			'2017-05-28' : {
				vacationName : '端午节假期'
			},
			'2017-05-29' : {
				vacationName : '端午节假期'
			},
			'2017-05-30' : {
				name : '端午',
				vacationName : '端午节'
			},
			'2017-10-01' : {
				name : '国庆',
				vacationName : '国庆节'
			},
			'2017-10-02' : {
				vacationName : '国庆节、中秋节假期'
			},
			'2017-10-03' : {
				vacationName : '国庆节、中秋节假期'
			},
			'2017-10-04' : {
				name : '中秋',
				vacationName : '中秋节'
			},
			'2017-10-05' : {
				vacationName : '国庆节、中秋节假期'
			},
			'2017-10-06' : {
				vacationName : '国庆节、中秋节假期'
			},
			'2017-10-07' : {
				vacationName : '国庆节、中秋节假期'
			},
			'2017-10-08' : {
				vacationName : '国庆节、中秋节假期'
			},
			'2017-12-30' : {
				vacationName : '元旦假期'
			},
			'2017-12-31' : {
				vacationName : '元旦假期'
			},
			'2018-01-01' : {
				name : '元旦',
				vacationName : '元旦'
			},
			'2018-02-15' : {
				name : '除夕',
				vacationName : '除夕'
			},
			'2018-02-16' : {
				name : '春节',
				vacationName : '春节'
			},
			'2018-02-17' : {
				vacationName : '春节假期'
			},
			'2018-02-18' : {
				vacationName : '春节假期'
			},
			'2018-02-19' : {
				vacationName : '春节假期'
			},
			'2018-02-20' : {
				vacationName : '春节假期'
			},
			'2018-02-21' : {
				vacationName : '春节假期'
			},
			'2018-04-05' : {
				name : '清明',
				vacationName : '清明节'
			},
			'2018-04-06' : {
				vacationName : '清明节假期'
			},
			'2018-04-07' : {
				vacationName : '清明节假期'
			},
			'2018-04-29' : {
				vacationName : '劳动节假期'
			},
			'2018-04-30' : {
				vacationName : '劳动节假期'
			},
			'2018-05-01' : {
				name : '劳动',
				vacationName : '劳动节'
			},
			'2018-06-16' : {
				vacationName : '端午节假期'
			},
			'2018-06-17' : {
				vacationName : '端午节假期'
			},
			'2018-06-18' : {
				name : '端午',
				vacationName : '端午节'
			},
			'2018-09-22' : {
				vacationName : '中秋节假期'
			},
			'2018-09-23' : {
				vacationName : '中秋节假期'
			},
			'2018-09-24' : {
				name : '中秋',
				vacationName : '中秋节'
			},
			'2018-10-01' : {
				name : '国庆',
				vacationName : '国庆节'
			},
			'2018-10-02' : {
				vacationName : '国庆节假期'
			},
			'2018-10-03' : {
				vacationName : '国庆节假期'
			},
			'2018-10-04' : {
				vacationName : '国庆节假期'
			},
			'2018-10-05' : {
				vacationName : '国庆节假期'
			},
			'2018-10-06' : {
				vacationName : '国庆节假期'
			},
			'2018-10-07' : {
				vacationName : '国庆节假期'
			}
		},
		cascadingEndNotShowStart : false,
		weekOffset : 0,
		dayOffset : 0,
		yearTitle : "年",
		monthTitle : "月",
		todayTitle : "今天"
	};
	function Calendar(options) {
		this.init(options);
	}
	Calendar.now = function() {
		return new Date();
	};
	Calendar.pad = function(number) {
		var r = String(number);
		if (r.length === 1) {
			r = '0' + r;
		}
		return r;
	};
	Calendar.isSameDay = function(dateA, dateB) {
		if (dateA.getFullYear() !== dateB.getFullYear()) {
			return false;
		}
		if (dateA.getMonth() !== dateB.getMonth()) {
			return false;
		}
		if (dateA.getDate() !== dateB.getDate()) {
			return false;
		}
		return true;
	};
	Calendar.isSameMonth = function(dateA, dateB) {
		if (dateA.getFullYear() !== dateB.getFullYear()) {
			return false;
		}
		if (dateA.getMonth() !== dateB.getMonth()) {
			return false;
		}
		return true;
	};
	Calendar.isLeapYear = function(fullYear) {
		if ((fullYear % 400 === 0) || ((fullYear % 4 === 0) && (fullYear % 100 !== 0))) {
			return true;
		} else {
			return false;
		}
	};
	Calendar.dateFormat = function(date, format) {
		var text = "";
		var match;
		var parts = [];
		var fn;
		while (format) {
			match = DATE_FORMATS_SPLIT.exec(format);
			if (match) {
				parts = parts.concat(match.slice(1));
				format = parts.pop();
			} else {
				parts.push(format);
				format = null;
			}
		}
		parts.forEach(function(value) {
			var dateGetterParameter = DATE_FORMATS[value];
			if (dateGetterParameter) {
				text += dateGetter.apply(this, dateGetterParameter)(date)
			} else {
				text += value;
			}
		});return text;
	};
	Calendar.getDateFromFormattedString = function(str, format) {
		var date = getEpochOfCST();
		var match;
		var parts = [];
		var strParts = [];
		var fn;
		while (format) {
			match = DATE_FORMATS_SPLIT.exec(format);
			if (match) {
				parts = parts.concat(match.slice(1));
				format = parts.pop();
				var matchSize = (match[1].length);
				var leftStr = str.substr(0, matchSize);
				str = str.substr(matchSize);strParts.push(leftStr);
			} else {
				parts.push(format);strParts.push(str);
			}
		}
		for (var i = 0; i < parts.length; i++) {
			var part = parts[i];
			var strPart = strParts[i];
			if (strPart == "") {
				break
			}
			var number = parseInt(strPart, 10);
			var dateSetterParameter = DATE_FORMATS[part];
			if (dateSetterParameter) {
				fn = dateSetter.apply(this, dateSetterParameter);
				if (!isNaN(number)) {
					fn(date, number);
				}
			}
		}
		if (+date === +getEpochOfCST()) {
			date = new Date();
			date.isInvalidDate = true;
		}
		return date;
	};
	Calendar.getDaysBetween = function(start, end) {
		return Math.abs(start - end) / 60 / 60 / 1000 / 24;
	};
	Calendar.getFirstDateInMonth = function(date) {
		return new Date(date.getFullYear(), date.getMonth(), 1);
	};
	Calendar.getLastDateInMonth = function(date) {
		return new Date(date.getFullYear(), date.getMonth() + 1, 0);
	};
	Calendar.getDaysInMonth = function(month, fullYear) {
		if (month === 1 && fullYear !== undefined && Calendar.isLeapYear(fullYear)) {
			return 29;
		}
		return monthSize[month];
	};
	Calendar.monthOffset = function(date, monthOffset) {
		var newDate = new Date(date);
		newDate.setMonth(newDate.getMonth() + monthOffset);return newDate;
	};
	Calendar.yearOffset = function(date, yearOffset) {
		var newDate = new Date(date);
		newDate.setFullYear(newDate.getFullYear() + yearOffset);return newDate;
	};
	Calendar.dateOffset = function(date, dayOffset) {
		var newDate = new Date(date);
		newDate.setDate(newDate.getDate() + dayOffset);return newDate;
	};
	Calendar.dateToDay = function(date) {
		return new Date(date.getFullYear(), date.getMonth(), date.getDate());
	};
	Calendar.dayToMS = function(days) {
		return days * 1000 * 60 * 60 * 24;
	};
	var n = 0;
	Calendar.prototype = {
		version : "1.0.0.0",
		construction : Calendar,
		destruction : function() {
			this.unLoadCal();
		},
		initLimit : function() {
			var maxLimit = this.options.maxLimit;
			var minLimit = this.options.minLimit;
			if (maxLimit) {
				this.maxLimitDate = Calendar.getDateFromFormattedString(maxLimit, this.options.dateFormat);
			}
			if (minLimit) {
				this.minLimitDate = Calendar.getDateFromFormattedString(minLimit, this.options.dateFormat);
			}
		},
		init : function(options) {
			var template;
			if (options.template == "birthday") {
				this.isBirthday = true;
			}
			if (typeof options.template == "object") {
				template = $.extend(true, {}, smallTemplate);
				for (var temp in options.template) {
					template[temp] = options.template[temp];
				}
			} else {
				switch (options.template) {
				case "big":
					template = bigTemplate;
					break;case "birthday":
					template = birthdayTemplate;
					break;case "small":
					template = smallTemplate;
					break;default:
					template = smallTemplate;
					break;
				}
			}
			options.template = template;
			if (options.isBirthday && Factory.defaults.titleTip == options.titleTip) {
				options.titleTip = '<span class="cal-year-select">{{year}}' + options.yearTitle + '<i></i></span><span class="cal-month-select">{{month}}' + options.monthTitle + '<i></i></span>';
			}
			this.options = options;
			this.defaults = Factory.defaults;
			this.wrap = this.wrap || this.initWrap();
			this.date = new Date();
			this.selected = {};
			this.selectedTime = getEpochOfCST();
			this.cascadingSelected = {
				start : null,
				end : null,
				startTime : getEpochOfCST(),
				endTime : getEpochOfCST()
			};
			this.cascadingIndex = 0;
			this.id = n++;this.initLimit();this.initNow();this.loadCal();
		},
		initNow : function() {
			var dateStr = this.options.date;
			if (typeof dateStr == "string" && dateStr !== "") {
				this.now = Calendar.getDateFromFormattedString(dateStr, this.options.dateFormat);
			} else {
				this.now = new Date()
			}
		},
		initWrap : function() {
			var html = $.trim(this.options.template.wrap);
			html = this.replaceWith(html, {
				bimonthly : 'data-bimonthly="' + this.options.bimonthly + '"',
				float : 'data-float="' + !this.options.autoRender + '"'
			});return $(html);
		},
		loadCal : function() {
			var options = this.options;
			if (options.autoRender) {
				this.render();this.bindEvent();$(options.trigger).append(this.wrap)
			} else {
				$(document).off(options.triggerEvent, options.trigger, this.triggerEventHandler);$(document).on(options.triggerEvent, options.trigger, {
					self : this
				}, this.triggerEventHandler);this.triggerBlur();
			}
		},
		unLoadCal : function() {
			var options = this.options;
			$(document).off(options.triggerEvent, options.trigger, this.triggerEventHandler);this.unBindEvent();
		},
		triggerBlur : function() {
			var self = this;
			$document.on("click", {
				self : self
			}, this.destroyHandler);
		},
		destroy : function() {
			this.wrap.remove();$(".calhover").remove();$(".cal-number-of-days").remove();
		},
		destroyHandler : function(e) {
			var $target = $(e.target);
			var self = e.data.self;
			var $calendar = $target.parents(".ui-calendar");
			var options = self.options;
			if ($calendar.length <= 0 && options.clickDocumentHide == true) {
				self.destroy();
			}
		},
		triggerEventHandler : function(e) {
			var self = e.data.self;
			e.stopPropagation();
			var $this = $(this);
			var date;
			if (self.options.cascading) {
				var start = self.cascadingSelected.start;
				var end = self.cascadingSelected.end;
				var $triggers = $(self.options.trigger);
				var $triggerFirst = $triggers.first();
				var triggerFirstValue = $triggerFirst.val();
				var $triggerLast = $triggers.last();
				var triggerLastValue = $triggerLast.val();
				if (!start) {
					if (triggerFirstValue) {
						start = triggerFirstValue;
						self.cascadingSelected.start = start
					}
				}
				if (!end) {
					if (triggerLastValue) {
						end = triggerLastValue;
						self.cascadingSelected.end = end
					}
				}
				var index = $triggers.index($this);
				if (index == 0) {
					if (start) {
						date = Calendar.getDateFromFormattedString(start, self.options.dateFormat);
					}
				} else if (index == 1) {
					if (end) {
						date = Calendar.getDateFromFormattedString(end, self.options.dateFormat);
					}
				}
				if (date) {
					self.now = date;
				}
			} else {
				var value = $this.val();
				if (value) {
					date = Calendar.getDateFromFormattedString(value, self.options.dateFormat);
					self.selected = {};
					self.selected[value] = true;
					self.now = date;
				}
			}
			if ($this.is("[readonly]") && !self.options.renderReadonly) {
				return false;
			}
			self.$trigger = $this;
			var offset = self.getOffset();
			self.wrap.css({
				"top" : offset.top,
				"left" : offset.left
			});
			var zIndex = self.options.zIndex;
			if (zIndex) {
				self.wrap.css("z-index", zIndex);
			}
			var $target = $(self.options.target);
			$('.ui-calendar[data-float=true]').remove();$target.append(self.wrap);self.render();self.bindEvent();
		},
		getOffset : function() {
			var $trigger = this.$trigger;
			var offsetAmount = this.options.offsetAmount;
			var top = this.getInt($trigger.offset().top + $trigger.outerHeight(false) + offsetAmount.top);
			var left = this.getInt($trigger.offset().left + offsetAmount.left);
			return {
				top : top,
				left : left
			};
		},
		getInt : function(floatNumber) {
			var intNumber = parseInt(floatNumber, 10);
			return intNumber;
		},
		bindEvent : function() {
			this.bindMonthChangeEvent();this.bindSelectEvent();this.bindMouseOverEvent();this.bindMouseLeaveEvent();this.bindBirthdayEvent();
		},
		bindBirthdayEvent : function() {
			this.wrap.off("click", this.hideDropdownHandler);this.wrap.on("click", {
				self : this
			}, this.hideDropdownHandler);this.wrap.off("click", ".cal-year-select", this.yearDropdownHandler);this.wrap.on("click", ".cal-year-select", {
				self : this
			}, this.yearDropdownHandler);this.wrap.off("click", ".cal-month-select", this.monthDropdownHandler);this.wrap.on("click", ".cal-month-select", {
				self : this
			}, this.monthDropdownHandler);this.wrap.off("click", ".cal-year-dropdown li", this.yearSelectHandler);this.wrap.on("click", ".cal-year-dropdown li", {
				self : this
			}, this.yearSelectHandler);this.wrap.off("click", ".cal-month-dropdown li", this.monthSelectHandler);this.wrap.on("click", ".cal-month-dropdown li", {
				self : this
			}, this.monthSelectHandler);this.wrap.off("click", ".cal-birthday-clear", this.birthdayClearHandler);this.wrap.on("click", ".cal-birthday-clear", {
				self : this
			}, this.birthdayClearHandler);this.wrap.off("click", ".cal-birthday-ok", this.birthdayOkHandler);this.wrap.on("click", ".cal-birthday-ok", {
				self : this
			}, this.birthdayOkHandler);this.wrap.off("click", ".cal-hour", this.birthdayHourHandler);this.wrap.on("click", ".cal-hour", {
				self : this
			}, this.birthdayHourHandler);this.wrap.off("click", ".cal-minute", this.birthdayMinuteHandler);this.wrap.on("click", ".cal-minute", {
				self : this
			}, this.birthdayMinuteHandler);this.wrap.off("click", ".cal-hour-dropdown li", this.hourSelectHandler);this.wrap.on("click", ".cal-hour-dropdown li", {
				self : this
			}, this.hourSelectHandler);this.wrap.off("click", ".cal-minute-dropdown li", this.minuteSelectHandler);this.wrap.on("click", ".cal-minute-dropdown li", {
				self : this
			}, this.minuteSelectHandler);this.wrap.off("click", ".cal-minute-dropdown .close", this.minuteCloseHandler);this.wrap.on("click", ".cal-minute-dropdown .close", {
				self : this
			}, this.minuteCloseHandler);this.wrap.off("click", ".cal-hour-dropdown .close", this.hourCloseHandler);this.wrap.on("click", ".cal-hour-dropdown .close", {
				self : this
			}, this.hourCloseHandler);
		},
		hourCloseHandler : function(e) {
			e.stopPropagation();
			var self = e.data.self;
			var $hourDropdown = self.wrap.find(".cal-hour-dropdown");
			$hourDropdown.remove();self.wrap.find(".cal-hour").removeClass("active");
		},
		minuteCloseHandler : function(e) {
			e.stopPropagation();
			var self = e.data.self;
			var $minuteDropdown = self.wrap.find(".cal-minute-dropdown");
			$minuteDropdown.remove();self.wrap.find(".cal-minute").removeClass("active");
		},
		validateTime : function() {
			var cascadingSelected = this.cascadingSelected;
			if (cascadingSelected.start && (cascadingSelected.start == cascadingSelected.end)) {
				var startTime = cascadingSelected.startTime;
				var endTime = cascadingSelected.endTime;
				var lastTime = getEpochOfCST();
				lastTime.setHours(23);lastTime.setMinutes(55);
				if (+startTime == +lastTime) {
					this.cascadingSelected.end = null;
					this.cascadingSelected.endTime = getEpochOfCST();
				} else if (startTime >= endTime) {
					startTime = new Date(startTime.getTime() + fiveMinutes);this.cascadingSelected.endTime.setTime(startTime);
				}
			}
		},
		hourSelectHandler : function(e) {
			e.stopPropagation();
			var self = e.data.self;
			var $this = $(this);
			if ($this.is('[data-disabled="true"]')) {
				return false;
			}
			var hourStr = $this.attr("data-hour");
			var hour = parseInt(hourStr, 10);
			var $calHour = self.wrap.find(".cal-hour");
			if (self.options.cascading) {
				if (self.cascadingIndex === 0) {
					self.cascadingSelected.startTime.setHours(hour);
				} else {
					self.cascadingSelected.endTime.setHours(hour);
				}
				self.validateTime();
			} else {
				self.selectedTime.setHours(hour);
			}
			var $hourDropdown = self.wrap.find(".cal-hour-dropdown");
			$hourDropdown.remove();$calHour.html(hourStr).removeClass("active");
		},
		minuteSelectHandler : function(e) {
			e.stopPropagation();
			var self = e.data.self;
			var $this = $(this);
			if ($this.is('[data-disabled="true"]')) {
				return false;
			}
			var minuteStr = $this.attr("data-minute");
			var $calMinute = self.wrap.find(".cal-minute");
			var minute = parseInt(minuteStr, 10);
			if (self.options.cascading) {
				if (self.cascadingIndex === 0) {
					self.cascadingSelected.startTime.setMinutes(minute);
				} else {
					self.cascadingSelected.endTime.setMinutes(minute);
				}
				self.validateTime();
			} else {
				self.selectedTime.setMinutes(minute);
			}
			var $minuteDropdown = self.wrap.find(".cal-minute-dropdown");
			$minuteDropdown.remove();$calMinute.html(minuteStr).removeClass("active");
		},
		birthdayHourHandler : function(e) {
			var self = e.data.self;
			var $this = $(this);
			var val = $this.html();
			$this.addClass("active");self.wrap.find(".cal-hour-dropdown").remove();self.wrap.find(".cal-minute-dropdown").remove();
			var $hourDropdown = $('' + '<div class="cal-hour-dropdown">' + '<div class="title">小时<div class="close"><i></i></div></div>' + '</div>');
			var $ul = $("<ul></ul>");
			var liArr = [];
			var activeClass;
			var startHour = 0;
			var disabled;
			if (self.options.cascading && self.cascadingIndex === 1) {
				var start = self.cascadingSelected.start;
				var end = self.cascadingSelected.end;
				var startTime = self.cascadingSelected.startTime;
				if (start && (start == end)) {
					startHour = startTime.getHours();
				}
			}
			for (var i = 0; i < 24; i += 1) {
				var dataHour = padNumber(i, 2);
				if (dataHour == val) {
					activeClass = true;
				} else {
					activeClass = false;
				}
				if (i < startHour) {
					disabled = true;
				} else {
					disabled = false;
				}
				liArr.push('' + '<li' + ' class="' + (activeClass ? 'active' : '') + '"' + ' data-disabled="' + (disabled ? 'true' : 'false') + '"' + ' data-hour="' + dataHour + '">' +
					i + '</li>');
			}
			var liStr = liArr.join("");
			$ul.html(liStr);$hourDropdown.append($ul);self.wrap.append($hourDropdown);
		},
		birthdayMinuteHandler : function(e) {
			var $this = $(this);
			var self = e.data.self;
			$this.addClass("active");
			var val = $this.html();
			var startMinute = 0;
			var disabled;
			var sameDayAndHour = false;
			self.wrap.find(".cal-hour-dropdown").remove();self.wrap.find(".cal-minute-dropdown").remove();
			if (self.options.cascading && self.cascadingIndex === 1) {
				var start = self.cascadingSelected.start;
				var end = self.cascadingSelected.end;
				var startTime = self.cascadingSelected.startTime;
				var endTime = self.cascadingSelected.endTime;
				if (start && (start == end)) {
					var startHour = startTime.getHours();
					var endHour = endTime.getHours();
					if (startHour === endHour) {
						sameDayAndHour = true;
						startMinute = startTime.getMinutes();
					}
				}
			}
			var $minuteDropdown = $('' + '<div class="cal-minute-dropdown">' + '<div class="title">分钟<div class="close"><i></i></div></div>' + '</div>');
			var $ul = $("<ul></ul>");
			var liArr = [];
			var activeClass;
			for (var i = 0; i < 60; i += 5) {
				var dataMinute = padNumber(i, 2);
				if (dataMinute == val) {
					activeClass = true;
				} else {
					activeClass = false;
				}
				if (sameDayAndHour && (i < startMinute + 5)) {
					disabled = true;
				} else {
					disabled = false;
				}
				liArr.push('' + '<li class="' + (activeClass ? 'active' : '') + '"' + ' data-disabled="' + (disabled ? 'true' : 'false') + '"' + ' data-minute="' + dataMinute + '">' + i + '</li>');
			}
			var liStr = liArr.join("");
			$ul.html(liStr);$minuteDropdown.append($ul);self.wrap.append($minuteDropdown);
		},
		birthdayOkHandler : function(e) {
			e.stopPropagation();
			var self = e.data.self;
			self.inputTime();self.destroy();
			var okCallback = self.options.okCallback;
			if (okCallback && $.isFunction(okCallback)) {
				okCallback.call(self, self);
			}
			self.toNextCal();
		},
		inputTime : function() {
			var self = this;
			var date;
			var start = self.cascadingSelected.start;
			var end = self.cascadingSelected.end;
			var result;
			if (self.options.cascading) {
				if ((self.cascadingIndex === 0) && start) {
					date = Calendar.getDateFromFormattedString(start, self.options.dateFormat);
					result = self.getDateResult(date);
				} else if (end) {
					date = Calendar.getDateFromFormattedString(end, self.options.dateFormat);
					result = self.getDateResult(date);
				}
				if (result) {
					self.$trigger.val(result);
				}
			}
		},
		birthdayClearHandler : function(e) {
			var self = e.data.self;
			self.$trigger.val("");
			if (self.options.cascading) {
				if (self.cascadingIndex === 0) {
					self.cascadingSelected.start = null;
					self.cascadingSelected.startTime = getEpochOfCST();
				} else {
					self.cascadingSelected.end = null;
					self.cascadingSelected.endTime = getEpochOfCST();
				}
			} else {
				self.selected = {};
				self.selectedTime = getEpochOfCST();
			}
			self.destroy();
			var clearCallback = self.options.clearCallback;
			if (clearCallback && $.isFunction(clearCallback)) {
				clearCallback.call(self, self);
			}
			e.stopPropagation();
		},
		monthSelectHandler : function(e) {
			var self = e.data.self;
			var $this = $(this);
			var selectedMonth = $this.attr("data-month");
			var month = parseInt(selectedMonth, 10);
			self.now.setDate(1);self.now.setMonth(month);self.render();self.bindEvent();e.stopPropagation();
		},
		limitDropdown : function() {
			var minLimitDate = this.minLimitDate;
			var maxLimitDate = this.maxLimitDate;
			var now = this.now;
			var nowYear = now.getFullYear();
			var nowMonth = now.getMonth();
			if (minLimitDate && nowYear == minLimitDate.getFullYear()) {
				var minMonth = minLimitDate.getMonth();
				if (nowMonth < minMonth) {
					this.now.setDate(1);this.now.setMonth(minMonth)
				}
			}
			if (maxLimitDate && nowYear == maxLimitDate.getFullYear()) {
				var maxMonth = maxLimitDate.getMonth();
				if (nowMonth > maxMonth) {
					this.now.setDate(1);this.now.setMonth(maxMonth)
				}
			}
		},
		yearSelectHandler : function(e) {
			var self = e.data.self;
			var $this = $(this);
			var selectedYear = $this.attr("data-year");
			var year = parseInt(selectedYear, 10);
			self.now.setFullYear(year);self.limitDropdown();self.render();self.bindEvent();e.stopPropagation();
		},
		hideDropdownHandler : function(e) {
			var self = e.data.self;
			var $target = $(e.target);
			var $yearDropdown = self.wrap.find(".cal-year-dropdown-box");
			var $monthDropdown = self.wrap.find(".cal-month-dropdown-box");
			var $hourDropdown = self.wrap.find(".cal-hour-dropdown");
			var $minuteDropdown = self.wrap.find(".cal-minute-dropdown");
			var $hour = self.wrap.find(".cal-hour");
			var $minute = self.wrap.find(".cal-minute");
			$yearDropdown.hide();$monthDropdown.hide();$hourDropdown.hide();$minuteDropdown.hide();$hour.removeClass("active");$minute.removeClass("active");
			if ($target.is(".cal-year-select") || $target.parents(".cal-year-select").length > 0) {
				$yearDropdown.show();
			}
			if ($target.is(".cal-month-select") || $target.parents(".cal-month-select").length > 0) {
				$monthDropdown.show();
			}
			if ($target.is(".cal-hour") || $target.is(".cal-hour-dropdown") || $target.parents(".cal-hour-dropdown").length > 0) {
				$hourDropdown.show();$hour.addClass("active");
			}
			if ($target.is(".cal-minute") || $target.is(".cal-minute-dropdown") || $target.parents(".cal-minute-dropdown").length > 0) {
				$minuteDropdown.show();$minute.addClass("active");
			}
		},
		yearDropdownHandler : function(e) {
			var self = e.data.self;
			var $this = $(this);
			var $yearDropdown = self.wrap.find(".cal-year-dropdown-box");
			if ($yearDropdown.length <= 0) {
				$yearDropdown = self.createYearDropdown($this);
			}
			if ($this.hasClass("active")) {
				$yearDropdown.hide();
			} else {
				$yearDropdown.show();
			}
			var calOffset = {
				top : self.wrap.offset().top,
				left : self.wrap.offset().left
			};
			var offset = {
				top : $this.offset().top,
				left : $this.offset().left
			};
			var calDate = self.now;
			var calYear = calDate.getFullYear();
			var $yearCurrentLi = $yearDropdown.find("[data-year=" + calYear + "]");
			$yearDropdown.css({
				top : offset.top - calOffset.top,
				left : offset.left - calOffset.left
			});self.wrap.append($yearDropdown);$yearCurrentLi.addClass("active");
			var currentLiHeight = $yearCurrentLi.outerHeight();
			var currentLiIndex = $yearCurrentLi.index();
			var currentLiTop = currentLiHeight * currentLiIndex;
			$yearDropdown.find(".cal-year-dropdown").scrollTop(currentLiTop)
		},
		monthDropdownHandler : function(e) {
			var self = e.data.self;
			var $this = $(this);
			var $monthDropdown = self.wrap.find(".cal-month-dropdown-box");
			if ($monthDropdown.length <= 0) {
				$monthDropdown = self.createMonthDropdown($this);
			}
			if ($this.hasClass("active")) {
				$monthDropdown.hide();
			} else {
				$monthDropdown.show();
			}
			var calOffset = {
				top : self.wrap.offset().top,
				left : self.wrap.offset().left
			};
			var offset = {
				top : $this.offset().top,
				left : $this.offset().left
			};
			var calDate = self.now;
			var calMonth = calDate.getMonth();
			var $yearCurrentLi = $monthDropdown.find("[data-month=" + calMonth + "]");
			$monthDropdown.css({
				top : offset.top - calOffset.top,
				left : offset.left - calOffset.left
			});self.wrap.append($monthDropdown);$yearCurrentLi.addClass("active");
			var currentLiHeight = $yearCurrentLi.outerHeight();
			var currentLiIndex = $yearCurrentLi.index();
			var currentLiTop = currentLiHeight * currentLiIndex;
			$monthDropdown.scrollTop(currentLiTop)
		},
		createMonthDropdown : function() {
			var minLimitDate = this.minLimitDate;
			var maxLimitDate = this.maxLimitDate;
			var minYear = minLimitDate ? minLimitDate.getFullYear() : 1900;
			var maxYear = maxLimitDate ? maxLimitDate.getFullYear() : 2099;
			var minMonth = 0;
			var maxMonth = 11;
			var nowYear = this.now.getFullYear();
			if (nowYear == minYear && minLimitDate) {
				minMonth = minLimitDate.getMonth();
			}
			if (nowYear == maxYear && maxLimitDate) {
				maxMonth = maxLimitDate.getMonth();
			}
			var $dropdownBox = $('' + '<div class="cal-month-dropdown-box">' + '    <div class="cal-month-select-active">' + (this.now.getMonth() + 1) + this.options.monthTitle + '<i></i></div>' + '</div>');
			var $ul = $('<ul class="cal-month-dropdown"></ul>');
			$dropdownBox.append($ul);
			var liStr = [];
			for (var index = minMonth; index <= maxMonth; index++) {
				liStr.push('<li data-month="' + index + '">' + (index + 1) + '</li>');
			}
			$ul.html(liStr.join(""));return $dropdownBox;
		},
		createYearDropdown : function() {
			var minLimitDate = this.minLimitDate;
			var maxLimitDate = this.maxLimitDate;
			var minYear = minLimitDate ? minLimitDate.getFullYear() : 1900;
			var maxYear = maxLimitDate ? maxLimitDate.getFullYear() : 2099;
			var $dropdownBox = $('' + '<div class="cal-year-dropdown-box">' + '    <div class="cal-year-select-active">' + this.now.getFullYear() + this.options.yearTitle + '<i></i></div>' + '</div>');
			var $ul = $('<ul class="cal-year-dropdown"></ul>');
			$dropdownBox.append($ul);
			var liStr = [];
			for (var i = minYear; i <= maxYear; i++) {
				liStr.push('<li data-year="' + i + '">' + i + '</li>');
			}
			$ul.html(liStr.join(""));return $dropdownBox;
		},
		bindMouseOverEvent : function() {
			this.wrap.off("mouseenter", "[data-date-map]", this.bindMouseOverHandler);this.wrap.on("mouseenter", "[data-date-map]", {
				self : this
			}, this.bindMouseOverHandler);
		},
		bindMouseLeaveEvent : function() {
			this.wrap.off("mouseleave", "[data-date-map]", this.bindMouseLeaveHandler);this.wrap.on("mouseleave", "[data-date-map]", {
				self : this
			}, this.bindMouseLeaveHandler);
		},
		bindMouseLeaveHandler : function(e) {
			var self = e.data.self;
			if (self.options.cascading) {
				self.hideNumberOfDays();self.renderSelected(false, false);
			}
			if (self.options.sectionSelect) {
				self.renderSelected(false, false);
			}
		},
		bindMouseOverHandler : function(e) {
			var self = e.data.self;
			var $this = $(this);
			var dateStr = $this.attr("data-date-map");
			if (self.options.cascading) {
				if (!$this.children().is(".nodate,.caldisabled")) {
					if (!self.options.cascadingEndNotShowStart) {
						self.renderSelected(dateStr, false);
					}
				}
			}
			if (self.options.sectionSelect && self.sectionSelectFlag) {
				if (!$this.children().is(".notThisMonth,.nodate")) {
					self.renderSelected(dateStr, false);
				}
			}
		},
		bindSelectEvent : function() {
			this.wrap.off("click", "[data-date-map]", this.bindSelectHandler);this.wrap.on("click", "[data-date-map]", {
				self : this
			}, this.bindSelectHandler);
		},
		getDateResult : function(dateVal) {
			var self = this;
			if (self.options.cascading) {
				if (self.cascadingIndex === 0) {
					var startTime = self.cascadingSelected.startTime;
					dateVal.setHours(startTime.getHours());dateVal.setMinutes(startTime.getMinutes());
				} else {
					var endTime = self.cascadingSelected.endTime;
					dateVal.setHours(endTime.getHours());dateVal.setMinutes(endTime.getMinutes());
				}
			} else {
				var time = self.selectedTime;
				dateVal.setHours(time.getHours());dateVal.setMinutes(time.getMinutes());
			}
			var dateResult = Calendar.dateFormat(dateVal, self.options.dateFormat);
			return dateResult;
		},
		canSectionSelect : function(td, self, date) {
			var hasProductStr = td.attr("data-has-product");
			var hasProduct = false;
			if (hasProductStr == "true") {
				hasProduct = true;
			}
			var canSelect = 0;
			if (!self.sectionSelectFlag) {
				if (hasProduct) {
					self.sectionSelectFlag = true;
					self.sectionSelectEnd = null;
					self.sectionSelectStart = date;
					self.sectionSelectEnd = Calendar.dateOffset(date, 1)
				}
			} else {
				var middle;
				var sectionSelectStart;
				var sectionSelectEnd;
				var middleStr;
				if (+self.sectionSelectStart == +date) {
				} else {
					if (self.sectionSelectStart > date) {
						if (hasProduct) {
							return 4;
						} else {
							return 3;
						}
					} else {
						sectionSelectStart = self.sectionSelectStart;
						sectionSelectEnd = date;
					}
					canSelect = 1;
					middle = Calendar.dateOffset(sectionSelectStart, 1);
					while (middle < sectionSelectEnd) {
						middleStr = Calendar.dateFormat(middle, self.options.dateFormat);var $middle = self.wrap.find('[data-date-map=' + middleStr + ']');
						if ($middle.attr("data-has-product") !== "true") {
							canSelect = 2;break;
						}
						middle = Calendar.dateOffset(middle, 1);
					}
				}
			}
			return canSelect;
		},
		bindSelectHandler : function(e) {
			e.stopPropagation();
			var self = e.data.self;
			var selectDateCallback = self.options.selectDateCallback;
			var cancelDateCallback = self.options.cancelDateCallback;
			var autoRender = self.options.autoRender;
			var $this = $(this);
			function runSelectDateCallback() {
				if (selectDateCallback) {
					selectDateCallback.call(self, self, $this);
				}
			}
			function runCancelDateCallback() {
				if (cancelDateCallback) {
					cancelDateCallback.call(self, self, $this);
				}
			}
			if ($this.children().first().is(".nodate,.caldisabled")) {
			} else if ($this.children().is(".notThisMonth") && self.options.bimonthly) {
			} else {
				var dateStr = $this.attr("data-date-map");
				var format = self.options.dateFormat;
				if (dateStr) {
					var date = Calendar.getDateFromFormattedString(dateStr, format);
					if (!self.options.sectionSelect) {
						self.now = new Date(date);
					}
				}
				var end = self.cascadingSelected.end;
				if (end) {
					var endDate = Calendar.getDateFromFormattedString(end, format);
				}
				if (self.options.cascading) {
				} else if (self.options.sectionSelect) {
					var canSelect = self.canSectionSelect($this, self, date);
					if (canSelect == 1 || canSelect == 2) {
						self.sectionSelectFlag = false;
						self.sectionSelectEnd = date;
					}
					if (canSelect == 1 || canSelect == 0 || canSelect == 4) {
						runSelectDateCallback()
					} else {
						runCancelDateCallback()
					}
					if (canSelect == 4) {
						self.sectionSelectFlag = true;
						self.sectionSelectStart = date
						self.sectionSelectEnd = Calendar.dateOffset(date, 1);
					}
					self.renderSelected();self.bindEvent();
				} else {
					var hasInventory = $this.children().hasClass("hasInventory");
					if (self.options.allowMutiSelected) {
						var isSelect = $this.is(".td-selected");
						if (isSelect) {
							delete self.selected[dateStr];
							$this.removeClass("td-selected");
							if (autoRender) {
								runCancelDateCallback();
							}
						} else {
							self.selected[dateStr] = true;$this.addClass("td-selected");
							if (autoRender) {
								runSelectDateCallback();
							}
						}
					} else {
						self.selected = {};
						self.selected[dateStr] = true;
						var $date = self.wrap.find("[data-date-map]");
						$date.removeClass("td-selected");$this.addClass("td-selected");
						if (autoRender) {
							runSelectDateCallback();
						}
					}
				}
			}
			if (!autoRender) {
				var $td = $this;
				if ($this.find(".nodate,.caldisabled").length > 0) {
					return false;
				}
				if ($this.children().is(".notThisMonth") && self.options.bimonthly) {
					return false;
				}
				var dateMap = $td.attr("data-date-map");
				var dateVal = Calendar.getDateFromFormattedString(dateMap, self.options.dateFormat);
				var dateResult = self.getDateResult(dateVal);
				self.$trigger.val(dateResult);runSelectDateCallback();
				if (self.options.cascading) {
					if (self.cascadingIndex === 0) {
						self.cascadingSelected.start = dateMap
					} else {
						self.cascadingSelected.end = dateMap
					}
					if (self.cascadingIndex === 0 && end && dateStr) {
						var max = self.options.cascadingMax;
						var min = self.options.cascadingMin;
						var offset = self.options.cascadingOffset;
						var dayNext = self.options.dayNext;
						var thisDate = Calendar.dateToDay(self.date);
						var newEndDate;
						var maxDate = new Date(+date + Calendar.dayToMS(max));
						if (maxDate < endDate && max != -1) {
							newEndDate = Calendar.dateFormat(maxDate, format);
							self.cascadingSelected.end = newEndDate;
						}
						var offsetDate = new Date(+date + Calendar.dayToMS(offset));
						if (offsetDate > endDate) {
							newEndDate = Calendar.dateFormat(offsetDate, format);
							self.cascadingSelected.end = newEndDate;
						}
						if (dayNext != -1) {
							var lastDate = Calendar.dateOffset(thisDate, dayNext);
							if (offsetDate && (+offsetDate > +lastDate)) {
								newEndDate = Calendar.dateFormat(lastDate, format);
								self.cascadingSelected.end = newEndDate;
							}
						}
					}
					self.validateTime();
					if (!self.options.hasTime) {
						self.destroy();self.toNextCal();
					} else {
						self.dateValidate();self.render();self.bindEvent();
					}
				} else {
					self.destroy();
				}
			}
		},
		unBindEvent : function() {
			this.unBindMonthChangeEvent();
		},
		bindMonthChangeEvent : function() {
			var monthChangeOffset = this.options.monthChangeOffset || 1;
			var $monthPrev = this.wrap.find(".month-prev");
			var $monthNext = this.wrap.find(".month-next");
			$monthPrev.off("click", this.monthChangeHandler);$monthPrev.on("click", {
				self : this,
				monthOffset : -monthChangeOffset
			}, this.monthChangeHandler);$monthNext.off("click", this.monthChangeHandler);$monthNext.on("click", {
				self : this,
				monthOffset : +monthChangeOffset
			}, this.monthChangeHandler);
		},
		unBindMonthChangeEvent : function() {
			var $monthPrev = this.wrap.find(".month-prev");
			var $monthNext = this.wrap.find(".month-next");
			$monthPrev.off("click", this.monthChangeHandler);$monthNext.off("click", this.monthChangeHandler);
		},
		dateValidate : function() {
			var $triggers = $(this.options.trigger);
			var end = this.cascadingSelected.end;
			if (end) {
				var endDate = Calendar.getDateFromFormattedString(end, this.options.dateFormat);
				var endTime = this.cascadingSelected.endTime;
				endDate.setHours(endTime.getHours());endDate.setMinutes(endTime.getMinutes());
				var endDateStr = Calendar.dateFormat(endDate, this.options.dateFormat);
				$triggers.eq(1).val(endDateStr);
			} else {
				$triggers.eq(1).val("");
			}
		},
		toNextCal : function() {
			var $triggers = $(this.options.trigger);
			var triggerSize = $triggers.length;
			var cascadingCallback = this.options.cascadingCallback;
			this.dateValidate();
			if (this.options.cascadingNextAuto) {
				var index = $triggers.index(this.$trigger);
				if (triggerSize - 1 == index) {
				} else {
					var eventName = this.options.triggerEvent;
					$triggers.eq(index + 1).trigger(eventName);
					if (cascadingCallback) {
						cascadingCallback.call(this, this, $triggers.eq(index + 1));
					}
				}
			}
		},
		monthLimit : function() {
			var mosNext = this.options.monthNext;
			var mosPrev = this.options.monthPrev;
			var upperLimit = Calendar.monthOffset(Calendar.getFirstDateInMonth(today), mosNext);
			var lowerLimit = Calendar.monthOffset(Calendar.getFirstDateInMonth(today), -mosPrev);
			if (mosNext != -1 && Calendar.isSameMonth(upperLimit, this.now)) {
				this.hideMonthNext();
			}
			if (mosPrev != -1 && Calendar.isSameMonth(lowerLimit, this.now)) {
				this.hideMonthPrev();
			}
		},
		DateLimit : function() {
			if (this.maxLimitDate) {
				var isSameMonthNext = Calendar.isSameMonth(this.maxLimitDate, this.now);
				if (isSameMonthNext) {
					this.hideMonthNext();
				}
			}
			if (this.minLimitDate) {
				var isSameMonthPrev = Calendar.isSameMonth(this.minLimitDate, this.now);
				if (isSameMonthPrev) {
					this.hideMonthPrev();
				}
			}
		},
		hideMonthNext : function() {
			this.wrap.find(".month-next").hide();
		},
		hideMonthPrev : function() {
			this.wrap.find(".month-prev").hide();
		},
		showMonthNext : function() {
			this.wrap.find(".month-next").show();
		},
		showMonthPrev : function() {
			this.wrap.find(".month-prev").show();
		},
		monthChangeHandler : function(e) {
			var self = e.data.self;
			var monthOffset = e.data.monthOffset;
			self.now.setDate(1);
			self.now = Calendar.monthOffset(self.now, monthOffset);self.render();self.bindEvent();e.stopPropagation();
		},
		toMonth : function(yearStr, monthStr) {
			var year = parseInt(yearStr, 10);
			var month = parseInt(monthStr, 10) - 1;
			if (typeof year === "number") {
				this.now.setFullYear(year);
			}
			if (typeof month === "number") {
				this.now.setDate(1);this.now.setMonth(month);
			}
			this.render();this.bindEvent();
		},
		hideNumberOfDays : function() {
			$(".cal-number-of-days").hide();
		},
		render : function(disableCallback) {
			var self = this;
			if (this.options.cascading) {
				var $trigger = self.$trigger;
				var $triggers = $(self.options.trigger);
				this.cascadingIndex = $triggers.index($trigger);
			}
			this.hideNumberOfDays();this.wrap.html("");this.wrap.append(this.createHead());this.wrap.append(this.createBody());
			if (this.wrap.is(".ui-calendar-big") && this.options.showPriceTip) {
				this.wrap.append("<div class='nova-calendar-tip'><i></i>" + this.options.priceTipText + "</div>")
			}
			var sourceFn = this.options.sourceFn;
			if (!disableCallback && $.isFunction(sourceFn)) {
				sourceFn.call(self, self);
			}
			this.wrap.addClass(this.options.wrapClass);
			var completeCallback = this.options.completeCallback;
			this.renderFestival();this.renderSelected(false, true);this.renderTime();this.monthLimit();this.DateLimit();
			if (!disableCallback && $.isFunction(completeCallback)) {
				completeCallback.call(this, this);
			}
		},
		renderTime : function() {
			if (this.options.hasTime) {
				this.wrap.find(".cal-pane").children().css({
					"display" : "inline-block"
				});
			}
			if (this.options.cascading) {
				this.renderCascadingTime();
			} else {
				this.renderNormalTime();
			}
		},
		setTimeHtml : function(time) {
			var hour = time.getHours();
			var minute = time.getMinutes();
			var hourStr = padNumber(hour, 2);
			var minuteStr = padNumber(minute, 2);
			var $hour = this.wrap.find(".cal-hour");
			var $minute = this.wrap.find(".cal-minute");
			$hour.html(hourStr);$minute.html(minuteStr);
		},
		renderNormalTime : function() {
			this.setTimeHtml(this.selectedTime);
		},
		renderCascadingTime : function() {
			var startTime = this.cascadingSelected.startTime;
			var endTime = this.cascadingSelected.endTime;
			if (this.cascadingIndex === 0) {
				this.setTimeHtml(startTime);
			} else if (this.cascadingIndex === 1) {
				this.setTimeHtml(endTime);
			}
		},
		renderSelected : function(mouseOverEnd, isClick) {
			var self = this;
			var selected = this.selected;
			var $dates = this.wrap.find("[data-date-map]").has(".caldate");
			var cascadingMin = this.options.cascadingMin;
			var cascadingMax = self.options.cascadingMax;
			var cascadingEndNotShowStart = self.options.cascadingEndNotShowStart;
			$dates.children().removeClass("calmiddle");
			var dateFormat = self.options.dateFormat;
			if (self.options.cascading) {
				var start = self.cascadingSelected.start;
				var end = mouseOverEnd || self.cascadingSelected.end;
				var $startDate = $dates.filter('[data-date-map="' + start + '"]').has(".caldate");
				var $endDate = $dates.filter('[data-date-map="' + end + '"]').has(".caldate");
				if (start) {
					var startDate = Calendar.getDateFromFormattedString(start, dateFormat);
				}
				if (end) {
					var endDate = Calendar.getDateFromFormattedString(end, dateFormat);
				}
				if (this.cascadingIndex === 0) {
				} else {
					if (start) {
						$dates.each(function(index, domEle) {
							var $date = $(domEle);
							var dateStr = $date.attr("data-date-map");
							var date = Calendar.getDateFromFormattedString(dateStr, self.options.dateFormat);
							if (end) {
								if (date > startDate && date < endDate) {
									if (!self.options.cascadingEndNotShowStart) {
										$date.children().addClass("calmiddle");
									}
								}
							}
							if (cascadingMin != -1) {
								if (date < +startDate + Calendar.dayToMS(cascadingMin)) {
									$date.children().addClass("caldisabled")
								}
							}
							if (cascadingMax != -1) {
								if (date > +startDate + Calendar.dayToMS(cascadingMax)) {
									$date.children().addClass("caldisabled");
								}
							}
						});
						if (end && $endDate.length > 0) {
							var numberOfDays = Calendar.getDaysBetween(startDate, endDate);
							var size = {
								width : $endDate.width(),
								height : $endDate.height(),
								left : $endDate.offset().left,
								top : $endDate.offset().top
							};
							var $numberOfDays = $(".cal-number-of-days");
							if ($numberOfDays.length <= 0) {
								$numberOfDays = $('' + '<div class="cal-number-of-days">' + '    <div class="triangle"></div>' + '    <span></span>' + '</div>');
							}
							$numberOfDays.css({
								left : 0,
								top : 0
							});
							var $numberOfDaysSpan = $numberOfDays.children("span");
							var template = self.options.numberOfDays;
							var numberOfDaysHtml = self.replaceWith(template, {
								num : numberOfDays
							});
							$numberOfDaysSpan.html(numberOfDaysHtml);$body.append($numberOfDays);
							var width = $numberOfDays.width();
							$numberOfDays.css({
								left : size.left - ~~(width - size.width / 2) + 2,
								top : size.top + size.height + 7
							});
							if (self.options.zIndex) {
								$numberOfDays.css("zIndex", self.options.zIndex + 1);
							}
							if (self.options.showNumberOfDays) {
								$numberOfDays.show();
							}
						}
					}
					if (end) {
						if (!mouseOverEnd) {
							$endDate.addClass("td-selected");
						}
					}
				}
				if (end && mouseOverEnd && !self.options.hasTime) {
					$dates.removeClass("td-selected");
				}
				if (start && !((cascadingEndNotShowStart && this.cascadingIndex === 1))) {
					$startDate.addClass("td-selected")
				}
			}
			if (self.options.sectionSelect) {
				var $wrap = self.wrap;
				var $tds = $wrap.find("td[data-date-map]").filter(function(index, ele) {
					var $ele = $(ele);
					if ($ele.find(".notThisMonth").length > 0) {
						return false
					} else {
						return true;
					}
				});
				$tds.removeClass("td-selected").children().removeClass("calmiddle").find(".calday").each(function(index, ele) {
					var $ele = $(ele);
					var backup = $ele.attr("data-backup");
					if (backup) {
						$ele.text(backup);
					}
				});
				var sectionSelectStart = self.sectionSelectStart;
				var sectionSelectEnd = self.sectionSelectEnd;
				if (mouseOverEnd) {
					sectionSelectEnd = Calendar.getDateFromFormattedString(mouseOverEnd, self.options.dateFormat);
				}
				if (+sectionSelectStart == +sectionSelectEnd) {
					return;
				}
				if (sectionSelectStart && sectionSelectEnd) {
					if (+sectionSelectStart > +sectionSelectEnd) {
						sectionSelectStart = null;
						sectionSelectEnd = null;
						if (!mouseOverEnd) {
							self.sectionSelectStart = sectionSelectStart;
							self.sectionSelectEnd = sectionSelectEnd;
						}
					}
					var middle = Calendar.dateOffset(sectionSelectStart, 1);
					var $middle;
					var middleStr;
					while (+middle < +sectionSelectEnd) {
						middleStr = Calendar.dateFormat(middle, dateFormat);
						$middle = $tds.filter('td[data-date-map=' + middleStr + ']');$middle.children().addClass("calmiddle");
						middle = Calendar.dateOffset(middle, 1);
					}
				}
				if (sectionSelectStart) {
					var sectionSelectStartStr = Calendar.dateFormat(sectionSelectStart, dateFormat);
					var $start = $tds.filter('td[data-date-map=' + sectionSelectStartStr + ']');
					$start.addClass("td-selected");
					var $startCalDay = $start.find(".calday");
					$startCalDay.attr("data-backup", $startCalDay.text()).text("入住");
				}
				if (sectionSelectEnd) {
					var sectionSelectEndStr = Calendar.dateFormat(sectionSelectEnd, dateFormat);
					var $end = $tds.filter('td[data-date-map=' + sectionSelectEndStr + ']');
					$end.addClass("td-selected");
					var $endCalDay = $end.find(".calday");
					$endCalDay.attr("data-backup", $endCalDay.text()).text("退房");
				}
			}
			$dates.each(function(index, domEle) {
				var $td = $(domEle);
				if (!$td.find(".nodate").length > 0) {
					var date = $td.attr("data-date-map");
					if (self.selected[date]) {
						if (self.options.autoRender) {
							$td.addClass("td-selected");
						} else {
							if (self.$trigger.val() != "") {
								$td.addClass("td-selected");
							}
						}
						var $thisTd = self.wrap.find('[data-date-map="' + date + '"]');
						if ($thisTd.length > 1) {
							$thisTd.has(".notThisMonth").removeClass("td-selected");
						}
					}
				}
			});
		},
		renderFestival : function() {
			var festival = this.options.festival;
			var self = this;
			var $tds = this.wrap.find('td[data-date-map]');
			var dateToday = new Date(self.date.getFullYear(), self.date.getMonth(), self.date.getDate());
			var dateTodayStr = Calendar.dateFormat(dateToday, self.options.dateFormat);
			$tds.each(function(i, domEle) {
				var $td = $(domEle);
				var $date = $td.find(".caldate");
				var $calActive = $date.find(".calactive");
				var $calday = $date.find(".calday");
				var date = $td.attr("data-date-map");
				var tdFestival = festival[date];
				if (tdFestival) {
					if ($(self.wrap).is(".ui-calendar-mini")) {
						if (tdFestival.name) {
							$date.html(tdFestival.name);$date.addClass("festival");
						}
					} else {
						var $calFestival = $('<div class="calfestival">休</div>');
						$calActive.append($calFestival);
						if (tdFestival.name) {
							$date.addClass("festival");$calday.html(tdFestival.name);
						}
					}
				}
				if (dateTodayStr === date && self.options.todayTitle != null) {
					if ($(self.wrap).is(".ui-calendar-mini")) {
						$date.html(self.options.todayTitle);
					} else {
						$calday.html(self.options.todayTitle);
					}
				}
				var thisDate = Calendar.getDateFromFormattedString(date, self.options.dateFormat);
				var thisDateMonth = thisDate.getMonth();
				var thisDateDay = thisDate.getDate();
				if (self.options.division && thisDateDay == 1) {
					if ($(self.wrap).is(".ui-calendar-mini")) {
					} else {
						$calday.html((thisDateMonth + 1) + "月" + thisDateDay + "日");
					}
				}
			})
		},
		createHead : function() {
			return this.options.template.calControl;
		},
		createBody : function() {
			var options = this.options;
			var html = "";
			var date = this.now;
			html += this.createSingleCalendar(date, 0);
			if (options.bimonthly) {
				var nextMonthDate = new Date(date);
				nextMonthDate.setDate(1);
				nextMonthDate = Calendar.monthOffset(nextMonthDate, 1);
				html += this.createSingleCalendar(nextMonthDate, 1);
			}
			html = this.replaceWith(options.template.calWrap, {
				content : html
			});return html;
		},
		createSingleCalendar : function(date, offset) {
			var html = "";
			var options = this.options;
			var month = date.getMonth();
			var year = date.getFullYear();
			var nextMonthDate = Calendar.monthOffset(Calendar.getFirstDateInMonth(date), 1);
			var nextMonthYear = nextMonthDate.getFullYear();
			var nextMonthMonth = nextMonthDate.getMonth();
			var weekHeaderTh = "";
			if (this.options.weekHeader) {
				weekHeaderTh = '<th class="ui-calendar-week-header"></th>';
			}
			html += this.replaceWith(options.template.calTitle, {
				month : this.replaceWith(options.titleTip, {
					year : year,
					month : month + 1
				})
			});
			if (this.options.division) {
				var nextMonthTitle = this.replaceWith(options.template.calTitle, {
					month : this.replaceWith(options.titleTip, {
						year : nextMonthYear,
						month : nextMonthMonth + 1
					})
				});
				nextMonthTitle = nextMonthTitle.replace("caltitle", "caltitle caltitlenext");
				html += nextMonthTitle
			}
			var weekOffset = this.options.weekOffset;
			var dayOffset = this.options.dayOffset;
			var englishWeekTitle = this.options.englishWeekTitle;
			var weekShortTitle = this.options.weekShortTitle;
			html += this.replaceWith(options.template.calBody, {
				month : month + 1,
				date : this.createDate(date),
				'weekHeader' : weekHeaderTh,
				'englishWeekTitle[0]' : englishWeekTitle[(0 + weekOffset + dayOffset) % 7],
				'englishWeekTitle[1]' : englishWeekTitle[(1 + weekOffset + dayOffset) % 7],
				'englishWeekTitle[2]' : englishWeekTitle[(2 + weekOffset + dayOffset) % 7],
				'englishWeekTitle[3]' : englishWeekTitle[(3 + weekOffset + dayOffset) % 7],
				'englishWeekTitle[4]' : englishWeekTitle[(4 + weekOffset + dayOffset) % 7],
				'englishWeekTitle[5]' : englishWeekTitle[(5 + weekOffset + dayOffset) % 7],
				'englishWeekTitle[6]' : englishWeekTitle[(6 + weekOffset + dayOffset) % 7],
				'shortWeekTitle[0]' : weekShortTitle[(0 + weekOffset + dayOffset) % 7],
				'shortWeekTitle[1]' : weekShortTitle[(1 + weekOffset + dayOffset) % 7],
				'shortWeekTitle[2]' : weekShortTitle[(2 + weekOffset + dayOffset) % 7],
				'shortWeekTitle[3]' : weekShortTitle[(3 + weekOffset + dayOffset) % 7],
				'shortWeekTitle[4]' : weekShortTitle[(4 + weekOffset + dayOffset) % 7],
				'shortWeekTitle[5]' : weekShortTitle[(5 + weekOffset + dayOffset) % 7],
				'shortWeekTitle[6]' : weekShortTitle[(6 + weekOffset + dayOffset) % 7]
			});
			html = this.replaceWith(options.template.calMonth, {
				content : html,
				offset : 'data-offset="' + offset + '"'
			});return html;
		},
		createDate : function(date) {
			var self = this;
			var html = "";
			var dateHtml = "";
			var dates = this.getDateArrayByMonth(date);
			var dateSize = dates.length;
			var options = this.options;
			var weekHeader = self.options.weekHeader;
			var weekInterval = self.options.weekInterval;
			dates.forEach(function(row, index) {
				dateHtml = "";
				if (weekHeader) {
					dateHtml += "<td class='ui-calendar-week-header'></td>";
				}
				row.forEach(function(cal) {
					if (cal) {
						var dateMap = Calendar.dateFormat(cal, self.options.dateFormat);
						var singleDateHtml = self.replaceWith(options.template.day, {
							week : cal.getDay(),
							day : Calendar.dateFormat(cal, "dd"),
							className : self.getClass(cal, date),
							dateMap : 'data-date-map="' + dateMap + '"'
						});
					} else {
						singleDateHtml = '<td><div class="date caldate caldisabled"></div></td>';
					}
					dateHtml += singleDateHtml;
				});
				html += self.replaceWith(options.template.weekWrap, {
					week : dateHtml
				});
				if (weekInterval) {
					if (dateSize - 1 === index) {
					} else {
						html += '<tr><td class="ui-calendar-week-interval" colspan="8"></td></tr>'
					}
				}
			});return html;
		},
		getClass : function(cal, date) {
			var year = cal.getFullYear();
			var month = cal.getMonth();
			var calDate = Calendar.dateToDay(cal);
			var className = "date";
			var thisDate = Calendar.dateToDay(this.date);
			var dayNext = this.options.dayNext;
			var dayPrev = this.options.dayPrev;
			var dayDisableNext = this.options.dayDisableNext;
			var cascadingOffset = this.options.cascadingOffset;
			var cascadingMin = this.options.cascadingMin;
			var cascading = this.options.cascading;
			if ((year == date.getFullYear()) && (month == date.getMonth())) {
				className += " caldate";
			} else if (this.options.division) {
				className += " caldate notThisMonth";
			} else {
				if (this.wrap.is(".ui-calendar-mini")) {
					className += " nodate notThisMonth";
				} else {
					className += " caldate notThisMonth";
				}
			}
			var dayBetween = Calendar.getDaysBetween(thisDate, calDate);
			if (calDate > thisDate && dayNext != -1 && dayBetween > dayNext) {
				className += " nodate";
			}
			if (calDate >= thisDate && dayBetween < dayDisableNext) {
				className += " nodate";
			}
			if (cascading && this.cascadingIndex === 0) {
				var minDate = Calendar.dateOffset(calDate, cascadingMin);
				var lastDate = Calendar.dateOffset(thisDate, dayNext);
				if (minDate > lastDate && dayNext != -1) {
					className += " nodate";
				}
			}
			if ((calDate < thisDate) && (dayPrev != -1) && (dayBetween > dayPrev)) {
				className += " nodate";
			}
			if (Calendar.isSameDay(thisDate, cal)) {
				className += " today";
				if (!this.options.isTodayClick) {
					className += " caldisabled"
				}
			}
			return className;
		},
		replaceWith : function(str, obj) {
			for (var i in obj) {
				str = str.replace("{{" + i + "}}", obj[i]);
			}
			return str;
		},
		getDate : function() {
			return this.now.getDate();
		},
		getMonth : function() {
			return this.now.getMonth();
		},
		getFullYear : function() {
			return this.now.getFullYear();
		},
		getDay : function() {
			return this.now.getDay();
		},
		getWeekTitle : function(i) {
			return this.options.weekTitle[i];
		},
		getWeekShortTitle : function(i) {
			return this.options.weekShortTitle[i];
		},
		getDateArrayByMonth : function(date) {
			var division = this.options.division;
			var dateArray = [];
			var year = date.getFullYear();
			var month = date.getMonth();
			var firstDate = new Date(year, month, 1);
			var nextMonthFirstDate = new Date(year, month + 1, 1);
			var firstDateDay = firstDate.getDay();
			var index = -firstDateDay + this.options.weekOffset;
			index = index > 0 ? index - 7 : index;
			index += this.options.dayOffset;
			var row = 0;
			var col = 0;
			var space;
			var spaceStart = false;
			if (division) {
				var lastDayIndex = firstDateDay + Calendar.getDaysInMonth(month, year);
				if (lastDayIndex > 35) {
					index += 22;
				} else {
					index += 15;
				}
				if (lastDayIndex == 35) {
					space = 0
				} else {
					space = 7;
				}
				for (row = 0; row < 6; row++) {
					dateArray[row] = [];
					for (col = 0; col < 7; col++) {
						var newDate = new Date(firstDate.getFullYear(), firstDate.getMonth(), index);
						if (space && (spaceStart || (+nextMonthFirstDate == +newDate))) {
							space--;
							dateArray[row][col] = null;
						} else {
							index++;
							dateArray[row][col] = newDate;
						}
					}
				}
			} else {
				for (row = 0; row < 6; row++) {
					dateArray[row] = [];
					for (col = 0; col < 7; col++) {
						index++;
						dateArray[row][col] = new Date(firstDate.getFullYear(), firstDate.getMonth(), index);
					}
				}
			}
			return dateArray;
		},
		getSelect : function() {
			var cascading = this.options.cascading;
			if (cascading) {
				return [ this.cascadingSelected.start, this.cascadingSelected.end ];
			} else {
				var selected = [];
				for (var s in this.selected) {
					selected.push(s)
				}
				return selected;
			}
		},
		getDayOfWeek : function(date, noFestival) {
			date = date || this.now;
			if (date) {
				if (Calendar.isSameDay(today, date)) {
					return this.options.todayTitle;
				}
				if (!noFestival) {
					var nowStr = Calendar.dateFormat(date, this.options.dateFormat);
					if (nowStr) {
						var festival = this.options.festival[nowStr];
						if (festival) {
							if (festival.name) {
								return festival.name;
							}
						}
					}
				}
				var dayOfTheWeek = date.getDay();
				return this.options.weekTitle[dayOfTheWeek];
			}
		},
		loading : function() {
			var $loading = this.wrap.find(".month-loading");
			$loading.show();
		},
		loaded : function() {
			var $loading = this.wrap.find(".month-loading");
			$loading.hide();
		}
	};
	var calControl = '<span class="month-prev" title="上一月">‹</span><span class="month-next" title="下一月">›</span>';
	var calWrap = '<div class="calwrap clearfix">{{content}}</div>';
	var calMonth = '<div class="calmonth" {{offset}}>{{content}}</div>';
	var calTitle = '<div class="caltitle"><span class="mtitle">{{month}}</span></div>';
	var calTable = '<table class="caltable">' + '    <thead>' + '        <tr>' + '            {{weekHeader}}' + '            <th class="{{englishWeekTitle[0]}}">{{shortWeekTitle[0]}}</th>' + '            <th class="{{englishWeekTitle[1]}}">{{shortWeekTitle[1]}}</th>' + '            <th class="{{englishWeekTitle[2]}}">{{shortWeekTitle[2]}}</th>' + '            <th class="{{englishWeekTitle[3]}}">{{shortWeekTitle[3]}}</th>' + '            <th class="{{englishWeekTitle[4]}}">{{shortWeekTitle[4]}}</th>' + '            <th class="{{englishWeekTitle[5]}}">{{shortWeekTitle[5]}}</th>' + '            <th class="{{englishWeekTitle[6]}}">{{shortWeekTitle[6]}}</th>' + '        </tr>' + '    </thead>' + '    <tbody>' + '        {{date}}' + '    </tbody>' + '    </table>';
	var calBody = '' + '<div class="calbox">' +
		calTable + '    <div class="month-loading"></div>' + '</div>';
	var weekWrap = '<tr>{{week}}</tr>';
	var smallTemplate = {
		wrap : '<div class="ui-calendar ui-calendar-mini" {{bimonthly}} {{float}}></div>',
		calControl : calControl,
		calWrap : calWrap,
		calMonth : calMonth,
		calTitle : calTitle,
		calBody : calBody,
		weekWrap : weekWrap,
		day : '' + '<td data-week="{{week}}" {{dateMap}}>' + '    <div class="{{className}}">{{day}}</div>' + '</td>'
	};
	var bigTemplate = {
		wrap : '<div class="ui-calendar ui-calendar-big" {{bimonthly}} {{float}}></div>',
		calControl : calControl,
		calWrap : calWrap,
		calMonth : calMonth,
		calTitle : calTitle,
		calBody : calBody,
		weekWrap : weekWrap,
		day : '' + '<td data-week="{{week}}" {{dateMap}}>' + '    <div class="{{className}}">' + '        <div class="calday">{{day}}</div>' + '        <div class="calinfo"></div>' + '        <div class="calprice"></div>' + '        <div class="calactive"></div>' + '        <div class="calselected"></div>' + '    </div>' + '</td>'
	};
	var birthdayTemplate = {
		wrap : '<div class="ui-calendar ui-calendar-mini ui-calendar-birthday" {{bimonthly}} {{float}}></div>',
		calControl : calControl,
		calWrap : calWrap,
		calMonth : calMonth,
		calTitle : calTitle,
		calBody : '' + '<div class="calbox">' +
			calTable + '<div class="cal-pane">' + '<span class="cal-time-text">时间</span>' + '<span class="cal-time-input">' + '<span class="cal-hour">00</span><span class="cal-time-to">:</span><span class="cal-minute">00</span>' + '</span>' + '<span class="btn btn-xs cal-birthday-clear">清空</span>' + '<span class="btn btn-xs cal-birthday-ok">确定</span>' + '</div>' + '<div class="month-loading"></div>' + '</div>',
		weekWrap : weekWrap,
		day : '' + '<td data-week="{{week}}" {{dateMap}}>' + '    <div class="{{className}}">{{day}}</div>' + '</td>'
	};
	lv.calendar = Factory;
	window.lv = lv;
	nova.calendar = Factory;
	window.nova = nova;
	for (var c in Calendar) {
		if (typeof Calendar[c] === "function") {
			Factory[c] = Calendar[c]
		}
	}
})(window, jQuery, window.lv || {}, window.nova || {});
;$(function() {
	$(document).on('click', '.common_diqu_list', function() {
		$(this).addClass('active').siblings().removeClass('active');
	});
});
function addLosc(elem, loscid) {
	elem.find('a').each(function() {
		var $This = $(this),
			$herf = $This.attr('href');
		$This.attr('href', $herf + '?losc=' + loscid + '&ict=i');
	});
}
;
function QueryString(item) {
	var sValue = (location.search + location.hash).match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
	return sValue ? sValue[1] : sValue;
}
function getLOSCCookie(objName) {
	var arrStr = document.cookie.split("; ");
	var temp;
	for (var i = 0, l = arrStr.length; i < l; i++) {
		if (objName == 'uid') {
			temp = arrStr[i].replace('=', ',').split(",");
		} else {
			temp = arrStr[i].split("=");
		}
		if (temp[0] == objName) {
			return unescape(temp[1]);
		}
	}
	return '';
}
function writeCookie(objName, objValue, expire) {
	var now = new Date();
	now.setDate(now.getDate() + expire);
	document.cookie = objName + "=" + escape(objValue) + ";path=/;domain=.lvmama.com;expires=" + now.toGMTString();
}
function getLOSCDate() {
	var myDate = new Date();
	var month = myDate.getMonth() + "";
	if (month.length == 1) {
		month = "0" + month;
	}
	var day = myDate.getDate() + "";
	if (day.length == 1) {
		day = "0" + day;
	}
	return month + day;
}
function isValidLOSCDate(data) {
	var p1 = /^[0-9]{4}$/;
	if (!p1.test(data)) {
		return false;
	}
	var _month = parseInt(data.substr(0, 2), 10);
	var _day = parseInt(data.substr(2, 2), 10);
	var month = new Date().getMonth();
	var day = new Date().getDate();
	if (month - _month < 0) {
		month = month + 12;
	}
	if (month - _month >= 0 && month - _month < 3) {
		return true;
	}
	if (month - _month >= 4) {
		return false;
	}
	if (month - _month == 3) {
		return day - _day <= 0;
	}
	return false;
}
function updateOrderInnerChannel(value) {
	var p1 = /^[0-9]{6}$/;
	if (!p1.test(value)) {
		return;
	}
	var channelType = "oUC";
	var timeType = "oUT";
	if (QueryString('ict') != undefined) {
		channelType = "oIC";
		timeType = "oIT";
	}
	var currentOrderInnerChannel = getLOSCCookie(channelType);
	var currentOrderChannelTime = getLOSCCookie(timeType);
	if (currentOrderInnerChannel == undefined) {
		currentOrderInnerChannel = value;
	} else {
		currentOrderInnerChannel = currentOrderInnerChannel + value;
	}
	if (currentOrderChannelTime == undefined) {
		currentOrderChannelTime = getLOSCDate();
	} else {
		currentOrderChannelTime = currentOrderChannelTime + getLOSCDate();
	}
	for (var i = 0; i < currentOrderInnerChannel.length / 6 - currentOrderChannelTime / 4; i++) {
		currentOrderChannelTime = currentOrderChannelTime + getLOSCDate();
	}
	if (currentOrderInnerChannel.length > 24) {
		if (isValidLOSCDate(currentOrderChannelTime.substr(0, 4))) {
			currentOrderInnerChannel = currentOrderInnerChannel.substr(0, 6) + currentOrderInnerChannel.substr(currentOrderInnerChannel.length - 18, 18);
			currentOrderChannelTime = currentOrderChannelTime.substr(0, 4) + currentOrderChannelTime.substr(currentOrderChannelTime.length - 12, 12);
		} else {
			currentOrderInnerChannel = currentOrderInnerChannel.substr(6, currentOrderInnerChannel.length - 6);
			currentOrderChannelTime = currentOrderChannelTime.substr(4, currentOrderChannelTime.length - 4);
		}
	}
	writeCookie(channelType, currentOrderInnerChannel, 30);writeCookie(timeType, currentOrderChannelTime, 30);
}
(function() {
	var length = document.getElementsByTagName('script').length,
		leng = 0;
	for (var i = 0; i < length; i++) {
		if (/\/losc\.js$/.test(document.getElementsByTagName('script')[i].src)) {
			leng = i;
		}
	}
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;m.parentNode.insertBefore(a, m)
	})
	var orderChannel = getLOSCCookie("oUC");
	var orderChannelTime = getLOSCCookie("oUT");
	while (orderChannelTime != undefined && orderChannelTime.substr(0, 4) != "" && !isValidLOSCDate(orderChannelTime.substr(0, 4))) {
		orderChannel = orderChannel.substr(6, orderChannel.length - 6);
		orderChannelTime = orderChannelTime.substr(4, orderChannelTime.length - 4);
	}
	orderChannel = getLOSCCookie("oIC");
	orderChannelTime = getLOSCCookie("oIT");
	while (orderChannelTime != undefined && orderChannelTime.substr(0, 4) != "" && !isValidLOSCDate(orderChannelTime.substr(0, 4))) {
		orderChannel = orderChannel.substr(6, orderChannel.length - 6);
		orderChannelTime = orderChannelTime.substr(4, orderChannelTime.length - 4);
	}
	var seoKeyWords = [ "baidu", "google", "sogou", "soso", "youdao", "bing", "hao123", "etao", "360", "yahoo", "haosou", "sm", "so" ];
	var seoChannelCode = [ "018115", "018116", "018117", "018118", "018119", "018128", "018122", "018123", "018120", "018121", "042525", "081691", "081692" ];
	var orderFromChannel = QueryString('losc');
	if (orderFromChannel == undefined || orderFromChannel == null) {
		var ref = document.referrer;
		if (ref != "" && ref.indexOf("losc=") == -1) {
			var re = new RegExp('^(?:f|ht)tp(?:s)?\://([^/?#]+)', 'im');
			ref = ref.match(re)[1];
			for (var i = 0, l = seoKeyWords.length; i < l; i++) {
				if (ref.indexOf(seoKeyWords[i]) != -1) {
					updateOrderInnerChannel(seoChannelCode[i]);
				}
			}
		}
	}
	if (orderFromChannel != undefined && orderFromChannel != null) {
		updateOrderInnerChannel(orderFromChannel);
	}
	var pr = QueryString('_pr');
	if (pr != undefined && pr != null) {
		updateOrderInnerChannel(pr);
	}
})();
var _hmt = _hmt || [];
(function() {
	var hm = document.createElement("script");
	hm.src = "//hm.baidu.com/hm.js?cb09ebb4692b521604e77f4bf0a61013";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);
})();
var _mvq = window._mvq || [];
window._mvq = _mvq;_mvq.push([ '$setAccount', 'm-193368-0' ]);_mvq.push([ '$logConversion' ]);(function() {
	var mvl = document.createElement('script');
	mvl.type = 'text/javascript';
	mvl.async = true;
	mvl.src = ('https:' == document.location.protocol ? 'https://static-ssl.mediav.com/mvl.js' : 'http://static.mediav.com/mvl.js');
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(mvl, s);
})();
var _fxcmd = _fxcmd || [];
_fxcmd.sid = '5f97534d550a22ed0b9ba7f419383409';
_fxcmd.trackAll = false;(function() {
	var _pzfx = document['createElement']('script');
	_pzfx.type = 'text/javascript';
	_pzfx.async = true;
	_pzfx.src = '//static.w3t.cn/fx/1/1/fx.js';
	var sc = document.getElementsByTagName('script')[0];
	sc.parentNode.insertBefore(_pzfx, sc);
})();(function() {
	var bp = document.createElement('script');
	var curProtocol = window.location.protocol.split(':')[0];
	if (curProtocol === 'https') {
		bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
	} else {
		bp.src = 'http://push.zhanzhang.baidu.com/push.js';
	}
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(bp, s);
})();
;$(function() {
	var $document = $(document);
	var $body = $("body");
	var refreshEvent = {
		events : [],
		add : function(fn) {
			this.events.push(fn);
		},
		run : function() {
			for (var i = 0; i < this.events.length; i++) {
				this.events[i]();
			}
		}
	};
	window.refreshEvent = refreshEvent;
	(function() {
		var $productRecommend = $(".product-recommend");
		var $recommendItem = $productRecommend.children(".product-item");
		var besideRecommendLink = $(".beside-recommend .recommend-link");
		$recommendItem.first().addClass("first-item");$recommendItem.last().addClass("last-item");besideRecommendLink.last().addClass("last-item");
	})();


	if (!$('.search_noResult').length) {
		var activeDate = lv.calendar({
			autoRender : false,
			trigger : ".JS_active_date",
			triggerEvent : "click",
			bimonthly : true,
			template : "small",
			cascading : true,
			cascadingMin : 0,
			showNumberOfDays : true,
			cascadingOffset : 5,
			monthNext : 2,
			selectDateCallback : function(self, $this) {
				self.$trigger.change();
			}
		});
	}
	function focus(settings) {
		function setImg(obj, index) {
			var indexImg = obj.children().eq(index).find('img');
			var js_to = indexImg.attr('js_to');
			var js_sc = indexImg.attr('js_sc');
			var to = indexImg.attr('to');
			var to_sc = indexImg.attr('to_sc');
			var trd = indexImg.attr('to_trd');
			var trdU,
				img;
			((trd != 'null') && (trd != undefined)) && (trdU = new Image().src = trd);js_to && indexImg.attr('src', js_to).removeAttr('js_to');js_sc && (img = new Image().src = js_sc, indexImg.removeAttr('js_sc'));to && indexImg.attr('src', to).removeAttr('to');to_sc && (img = new Image().src = to_sc, indexImg.removeAttr('to_sc'));
		}
		var $area = settings.$area;
		var $prev = settings.$prev;
		var $next = settings.$next;
		var $tab = settings.$tab;
		var width = settings.width;
		var haoye = settings.haoye;
		var autoPlay = settings.autoPlay;
		var autoPlayTimeInterval = settings.autoPlayTimeInterval || 5000;
		if ($tab) {
			var $tabList = $tab.children();
			$tabList.first().addClass("active");
		}
		var num = settings.num;
		var $focus = settings.$focus;
		var $list = settings.$list;
		var $item = $list.children();
		var size = $item.length;
		var pos = 0;
		if (!width) {
			width = $item.outerWidth(true);
		}
		$list.css({
			"width" : width * (size + num)
		});
		function show(index) {
			if (index < 0) {
				index = 0;
			}
			if (index >= size - num) {
				index = size - num;
			}
			pos = index;$list.stop();$list.animate({
				"left" : -index * width
			}, 200);
			if ($tabList) {
				$tabList.eq(index).addClass("active").siblings().removeClass("active");
			}
			if (haoye) {
				setImg($list, index)
			}
		}
		show(0);$prev.on("click", function() {
			pos--;show(pos);
		});$next.on("click", function() {
			pos++;show(pos);
		});
		if ($tabList) {
			$tabList.on("click", function() {
				var $this = $(this);
				var index = $this.index();
				show(index);
			})
		}
		if (autoPlay) {
			var flag = true;
			$area.on("mouseenter", function() {
				flag = false;
			});$area.on("mouseleave", function() {
				flag = true;
			});setInterval(function() {
				if (!flag) {
					return false;
				}
				if (pos < size - 1) {
					show(pos + 1);
				} else {
					show(0);
				}
			}, autoPlayTimeInterval)
		}
	}
	function hotView() {
		var $area = $(".all-hot-scenic");
		var $prev = $area.find(".prev");
		var $next = $area.find(".next");
		var $focus = $area.find(".all-content");
		var $list = $focus.find(".all-content-list");
		focus({
			$area : $area,
			$prev : $prev,
			$next : $next,
			$focus : $focus,
			$list : $list,
			num : 4
		});
	}
	hotView();refreshEvent.add(hotView);
	function hotHotel() {
		var $area = $(".all-hot-hotel");
		var $prev = $area.find(".prev");
		var $next = $area.find(".next");
		var $focus = $area.find(".all-content");
		var $list = $focus.find(".all-content-list");
		focus({
			$area : $area,
			$prev : $prev,
			$next : $next,
			$focus : $focus,
			$list : $list,
			num : 4
		});
	}
	hotHotel();refreshEvent.add(hotHotel);
	function promo() {
		var $area = $(".beside-promo");
		var $prev = $area.find(".prev");
		var $next = $area.find(".next");
		var $focus = $area;
		var $list = $focus.find(".beside-tab-content");
		var $tab = $area.find(".beside-tab");
		focus({
			$area : $area,
			$prev : $prev,
			$next : $next,
			$focus : $focus,
			$list : $list,
			$tab : $tab,
			num : 1,
			width : 230,
			haoye : true,
			autoPlay : true,
			autoPlayTimeInterval : 5000
		});
	}
	promo();refreshEvent.add(promo);
	function sale() {
		var $area = $(".beside-sale");
		var $prev = $area.find(".prev");
		var $next = $area.find(".next");
		var $focus = $area;
		var $list = $focus.find(".beside-tab-content");
		var $tab = $area.find(".beside-tab");
		focus({
			$area : $area,
			$prev : $prev,
			$next : $next,
			$focus : $focus,
			$list : $list,
			$tab : $tab,
			num : 1
		});
	}
	sale();refreshEvent.add(sale);
	function quickNav() {
		$(".nav_link .title li").bind("click", function() {
			var index = $(this).index();
			$(this).addClass("active").siblings().removeClass("active");$(this).parent().parent().siblings(".link_list:eq(" + index + ")").show().siblings(".link_list").hide();
			var oMore = $('.link_list_more');
			oMore.each(function() {
				var thisDd = $(this).find('dd');
				if (thisDd.height() > 30) {
					thisDd.find('.more_btn').show();
				}
			})
		});var scrollVariable = {
			$window : $(window),
			$recomWrap : $(".recom_wrap"),
			$scrollInside : $(".scroll_inside")
		};
		var $li = scrollVariable.$scrollInside.find("li");
		$li.on("click", function(e) {
			var $this = $(this);
			var href = $this.find("a").attr("href");
			var $section = $(href);
			var top = $section.offset().top - 50;
			$("html,body").stop();$("html,body").animate({
				"scrollTop" : top
			});e.preventDefault()
		});scrollVariable.$scrollInside.parent().css("height", scrollVariable.$recomWrap.height());$(window).bind("scroll", function() {
			try {
				var scT = $(document).scrollTop(),
					boxT = $('.search-filter').offset().top;
				if (scT > boxT) {
					$('.search-nav-box').addClass("fixed");
				} else {
					$('.search-nav-box').removeClass("fixed");
				}
				try {
					var prdT = $('.product-recommend-departure-start').offset().top;
					var prdB = $('.product-recommend-departure-end').offset().top;
					if (scT > prdT - 43 && scT < prdB) {
						$('.product-recommend-departure').addClass("fixed");
					} else {
						$('.product-recommend-departure').removeClass("fixed");
					}
				} catch (e) {}
				var currentTop = scrollVariable.$recomWrap.offset().top - scrollVariable.$window.scrollTop();
				if (currentTop <= 10) {
					var maxBottom = scrollVariable.$recomWrap.height() + scrollVariable.$recomWrap.offset().top - scrollVariable.$window.scrollTop();
					if (maxBottom <= scrollVariable.$scrollInside.height()) {
						scrollVariable.$scrollInside.removeAttr("style").css({
							"bottom" : 0,
							"position" : "absolute"
						});
					} else {
						scrollVariable.$scrollInside.removeAttr("style").css({
							"top" : 10,
							"position" : "fixed"
						});
					}
					scrollVariable.$recomWrap.find(".all-section").each(function(index, item) {
						var itemTop = $(item).offset().top - scrollVariable.$window.scrollTop();
						if (itemTop <= 51 && itemTop >= -20) {
							var id = $(item).attr("id");
							scrollVariable.$scrollInside.find("a[anchor=" + id + "]").parent().addClass("active").siblings().removeClass("active");return false;
						}
					});
				} else {
					scrollVariable.$scrollInside.css("position", "static");
				}
			} catch (e) {}
		});$('.search-nav>a').last().find('.search-nav-line').remove();
	}
	quickNav();refreshEvent.add(quickNav);$document.on('click', ".nav_link .more_btn", function() {
		var $this = $(this);
		if (!$this.parents('dl').hasClass('more_show')) {
			$this.html('收起<i class="icon_arrow"></i>');$this.parents('dl').addClass('more_show');
		} else {
			$this.html('更多<i class="icon_arrow"></i>');$this.parents('dl').removeClass('more_show');
		}
	});(function() {
		var isInDropdown = false;
		$document.on("mouseenter", ".search-list-freetour .search-label", function() {
			var $this = $(this);
			$this.addClass("expanded");
			var $dropdown = $this.siblings(".search-label-dropdown");
			var $content = $this.parents(".search-content");
			var $list = $this.parents(".search-list");
			var left = $content.offset().left - $list.offset().left;
			$dropdown.css({
				left : left
			});$dropdown.show();
		});$document.on("mouseleave", ".search-list-freetour .search-label", function() {
			var $this = $(this);
			setTimeout(function() {
				if (!isInDropdown) {
					$(".search-label-dropdown").hide()
					$this.removeClass("expanded")
				}
			}, 1)
		});$document.on("mouseenter", ".search-label-dropdown", function() {
			isInDropdown = true;
		});$document.on("mouseleave", ".search-label-dropdown", function() {
			$(".search-list-freetour .search-label").removeClass("expanded")
			isInDropdown = false;
			var $this = $(this);
			$this.hide();
		})
	})();(function() {
		$document.on('click', '.hisFav-titTab h4', function() {
			var $this = $(this),
				$ul = $this.parent().next().find('ul').eq($this.index());
			$this.addClass('current').siblings().removeClass('current');$ul.addClass('current').siblings().removeClass('current');$ul.find('img').each(function() {
				var $me = $(this),
					$src = $me.attr('to');
				$src && $me.attr('src', $src).removeAttr('to');
			});
		});
	})();try {
		$("[tip-content]:not(.JS_contrastTip,.contrastAdd)").poptip({
			place : 6
		});
	} catch (e) {}
	function autoExpandInner() {
		var $searchLists = $(".search-list");
		for (var i = 0; i < $searchLists.length; i++) {
			var $searchList = $searchLists.eq(i);
			(function() {
				var $searchContentActiveLast = $searchList.find(".search-content .search-label.active").last();
				if ($searchContentActiveLast.length <= 0) {
					return false
				}
				var lastTop = $searchContentActiveLast.offset().top;
				var $searchContent = $searchContentActiveLast.parents(".search-content");
				var contentTop = $searchContent.offset().top;
				if (lastTop - contentTop > 30) {
					var $searchMore = $searchList.find(".search-content-more");
					$searchMore.addClass("expanded");$searchMore.find("span").html("收起")
					$searchList.addClass("expanded");
				}
			})();
		}
		var $hiddenActive = $searchLists.filter(".search-lists-hidden").find(".search-content .search-label.active");
		if ($hiddenActive.length > 0) {
			$(".search-filter-more").click();
		}
	}
	autoExpandInner();refreshEvent.add(autoExpandInner);
	function rightAutoExpand() {
		$(".common_diqu_list").first().addClass("active");
	}
	rightAutoExpand();refreshEvent.add(rightAutoExpand);
	function imgDelayLoad() {
		$.expr[":"].loading = function(elt, index) {
			var height = $(window).height() + 200;
			var top = $(elt).offset().top;
			return top > $(window).scrollTop() && top < (height + $(window).scrollTop())
		};
		$.expr[":"].loaded = function(elt, index) {
			var height = $(window).height() + 200;
			var top = $(elt).offset().top;
			return top < height
		};var loadImg = function() {
			var This = $(this);
			if (!This.is(':hidden')) {
				var to_sc = This.attr('to_sc'),
					js_sc = This.attr('js_sc'),
					to = This.attr('to');
				if (to_sc) {
					This.removeAttr('to_sc');
					var img = new Image().src = to_sc;
				}
				if (!js_sc) {
					this.src = This.css({
						'opacity' : 0
					}).attr("to");This.removeAttr("to");
					if (This.load()) {
						This.animate({
							'opacity' : 1
						}, 300, function() {
							This.removeAttr('style')
						});
					}
					this.onerror = function() {
						this.src = "http://pic.lvmama.com/img/cmt/img_120_60.jpg"
					}
				}
			}
		};
		var imgTimeId = null;
		var scrollImgLoading = function() {
			clearTimeout(imgTimeId);
			imgTimeId = setTimeout(function() {
				$("img[to]:loading").each(function() {
					loadImg.call(this)
				});
				if ($("img[to]").size() == 0) {
					$(window).unbind('scroll', scrollImgLoading)
				}
			}, 200)
		};
		$(window).bind('scroll', scrollImgLoading);$("img[to]:loaded").each(function() {
			loadImg.call(this)
		});setTimeout(function() {
			$("img[to]:loaded").each(function() {
				loadImg.call(this)
			})
		}, 1000);
	}
	refreshEvent.add(imgDelayLoad);(function() {
		$document.off("click", ".psi-item-nav-tabs>li", itemNavTabsHandler);$document.on("click", ".psi-item-nav-tabs>li", itemNavTabsHandler);
		function itemNavTabsHandler() {
			var $this = $(this);
			var $parent = $this.parents(".product-special-items-details").eq(0);
			var index = $this.index();
			var $tabs = $parent.find(".psi-item-nav-tabs>li");
			var $contents = $parent.find(".psi-tab-content");
			$tabs.eq(index).addClass("active").siblings().removeClass("active");$contents.eq(index).addClass("active").siblings().removeClass("active");
		}
		$document.off("click", ".product-special-items-main", itemsDetailsHandler);$document.on("click", ".product-special-items-main", itemsDetailsHandler);
		function itemsDetailsHandler() {
			var $this = $(this);
			var $parent = $this.parents(".product-special-list").eq(0);
			$parent.toggleClass("show-details");
		}
		$document.off("click", ".product-special-items-details .shrink", itemsDetailsShrinkHandler);$document.on("click", ".product-special-items-details .shrink", itemsDetailsShrinkHandler);
		function itemsDetailsShrinkHandler() {
			var $this = $(this);
			var $parent = $this.parents(".product-special-list").eq(0);
			$parent.toggleClass("show-details");
		}
		$document.off("click", ".psh-nav-tabs>li", pshTabContentsHandler);$document.on("click", ".psh-nav-tabs>li", pshTabContentsHandler);
		function pshTabContentsHandler() {
			var $this = $(this);
			var $parent = $this.parents(".product-special").eq(0);
			var index = $this.index();
			var $tabs = $parent.find(".psh-nav-tabs>li");
			var $contents = $parent.find(".psh-tab-content");
			$tabs.eq(index).addClass("active").siblings().removeClass("active");$contents.eq(index).addClass("active").siblings().removeClass("active");
			index != 0 ? $parent.addClass('freetour') : $parent.removeClass('freetour');
		}
		$document.off("click", ".psh-tab-content .expand>a", overflowHandler);$document.on("click", ".psh-tab-content .expand>a", overflowHandler);
		function overflowHandler() {
			var expandText = "展开";
			var collapseText = "收起";
			var $this = $(this);
			var $parent = $this.parents(".psh-tab-content").eq(0);
			var $expand = $parent.find(".expand");
			var isAlreadyShow = $expand.hasClass("show-overflow");
			if (isAlreadyShow) {
				$parent.removeClass("show-overflow");$expand.removeClass("show-overflow");$expand.find("b").text(expandText);
			} else {
				$parent.addClass("show-overflow");$expand.addClass("show-overflow");$expand.find("b").text(collapseText);
			}
		}
	})();
});$(function() {
	var $searchFilter = $('.search-filter');
	var $subCon = $('.search_subCon');
	var $subConLi = $subCon.find('.search_subCon_list');
	var isActive = false;
	var $searchTheme = $('.search-theme-list');
	var $searchThemeLi = $searchTheme.find('li');
	$searchTheme.on('mouseenter', 'li', function(event) {
		var event = event || window.event;
		var _this = $(this),
			h = _this.height() - 1,
			index = _this.index();
		if (!_this.hasClass('active')) {
			_this.addClass('active').siblings().removeClass('active');$subCon.show().css('top', _this.offset().top - $searchFilter.offset().top + h + 'px');$subConLi.eq(index).show().siblings().hide();
			isActive = true;
		}
	});$('.search-theme-list').on('mouseleave', 'li', function(event) {
		var event = event || window.event;
		var _this = $(this);
		isActive = false;setTimeout(function() {
			if (!isActive) {
				_this.removeClass('active');$subCon.hide();
			}
		}, 300);
	});$subCon.hover(function() {
		isActive = true;
	}, function() {
		isActive = false;setTimeout(function() {
			if (!isActive) {
				$searchThemeLi.removeClass('active');$subCon.hide();
			}
		}, 300);
	});
	var commentScroll = {
		timer : null,
		hotBox : $('.commentScroll'),
		init : function() {
			if ($('.commentScroll').length > 0) {
				this.hotUp();
				this.hotBox = $('.commentScroll');
			}
		},
		hotUp : function() {
			var _this = this;
			clearInterval(_this.timer);this.play();this.hotBox.hover(function() {
				clearInterval(_this.timer);
			}, function() {
				_this.play();
			});
		},
		getHotHeight : function() {
			var lc_hot = this.hotBox.find('li');
			var h = -lc_hot.first().outerHeight();
			var first_html = lc_hot.first().html();
			lc_hot.first().animate({
				"margin-top" : h
			}, 500, function() {
				lc_hot.last().after("<li>" + first_html + "</li>");$(this).remove();
			});
		},
		play : function() {
			var _this = this;
			this.timer = setInterval(function() {
				_this.getHotHeight();
			}, 5000);
		}
	}
	window.commentScroll = commentScroll;commentScroll.init();
});
var hotelMap = {
	isload : true,
	init : function(data) {
		if (this.isload) {
			this.isload = false;$(document).on('click', '.hotel_name', function(e) {
				var $parent = $(this).parent();
				if ($parent.hasClass('hotel_active')) {
					$parent.removeClass('hotel_active').siblings().removeClass('hotel_active');
				} else {
					$parent.addClass('hotel_active').siblings().removeClass('hotel_active');hotelMap.hotelScenic($(this));
				}
				;
			});$(document).on('click', '.scenic_list li', function(e) {
				$(this).addClass('active').siblings().removeClass('active');hotelMap.scenicMove($(this));
			});$(document).on('click', '.map_scenic_tip a', function(e) {
				e.preventDefault();e.stopPropagation();window.open($(this).attr('href'));
			});$(document).on('click', '.mapinfo_close', function(e) {
				e.preventDefault();e.stopPropagation();$(this).parents('dl').hide().siblings('.map_tip_jt').hide();
			});
		}
		;
		var map = new BMap.Map('hotel_map');
		this.mapHotelDom(map, data);
	},
	mapHotelDom : function(map, data) {
		try {
			var data = JSON.parse(data),
				self = this;
		} catch (e) {
			console.log('%c地图渲染出错，先检查json数据关键字请用双引号，如：{"lng":121.26, "lat": 31.1,"name":"上海维也纳酒店"}。如果还是不行，请联系前端:杨安云。', 'color:red');$('.hotel_map').html('<span class="c_f00 fs14" style="display:block;text-align: center;"><br>酒店经纬度信息错误!</span>');$('.hotel_map_r').html('<span class="c_f00 fs14" style="display:block;text-align: center;"><br>酒店/景点查询失败！</span>');return;
		}
		this.map = map;
		this.data = data;
		var mapRhtml = '';
		var pointArr = [];
		for (var i = 0; i < data.length; i++) {
			mapRhtml += (i == 0 ? '<div class="hotel_list_box">' : '<div class="hotel_list_box">')
				+ '<div class="hotel_name" data-point="' + data[i].lng + ',' + data[i].lat + '"><i>' + (i + 1) + '</i><b title="' + data[i].title + '">' + data[i].title + '</b><span class="sl_icon"></span></div>'
				+ '<h4><span>周边景区</span></h4>'
				+ '<ul class="scenic_list">'
				+ '<img src="http://pic.lvmama.com/img/new_v/ui_scrollLoading/loading.gif" alt="" />'
				+ '</ul>'
				+ '</div>';var thispoint = new BMap.Point(data[i].lng, data[i].lat);
			pointArr.push(thispoint);this.overlay(thispoint, i, data[i].title);
		}
		;$('.hotel_map_r').html(mapRhtml);$('.scenic_list').height(329 - (data.length - 1) * 37);$('.hotel_name').eq(0).click();
		var point = new BMap.Point(data[0].lng, data[0].lat);
		map.centerAndZoom(point, 11);map.enableScrollWheelZoom();
		var polyline = new BMap.Polyline(pointArr, {
			strokeColor : "#f90",
			strokeWeight : 6,
			strokeOpacity : 1
		});
		map.addOverlay(polyline);
	},
	hotelScenic : function($this) {
		var self = this;
		var map = this.map;
		var pointArr = $this.attr('data-point').split(',');
		var hotelpoint = new BMap.Point(pointArr[0], pointArr[1]);
		var num = $this.parent().index();
		map.centerAndZoom(hotelpoint, 11);
		var options = {
			onSearchComplete : function(results) {
				if (local.getStatus() == BMAP_STATUS_SUCCESS) {
					var scenicListHtml = '';
					var resultsLength = results.getCurrentNumPois();
					var scenicData = [];
					for (var i = 0; i < resultsLength; i++) {
						scenicData.push(results.getPoi(i));
					}
					;scenicData.sort(function(a, b) {
						var aDistance = map.getDistance(hotelpoint, a.point),
							bDistance = map.getDistance(hotelpoint, b.point);
						a.distance = aDistance;
						b.distance = bDistance;return aDistance - bDistance;
					});
					for (var i = 0; i < scenicData.length; i++) {
						var thisPoi = scenicData[i];
						var thispoint = thisPoi.point;
						var active = '';
						var thisType = '未知';
						if (thisPoi.tags) {
							thisType = thisPoi.tags.length > 1 ? thisPoi.tags[1] : thisPoi.tags[0].replace(/\".*\"/, '""');
						}
						;var scenicInfo = {
							'title' : thisPoi.title,
							'lv' : '未知',
							'type' : thisType.replace(/殡葬/, '古镇'),
							'price' : '未知',
							'time' : '未知',
							'phoneNumber' : thisPoi.phoneNumber,
							'address' : thisPoi.address,
							'detailUrl' : thisPoi.detailUrl
						};
						scenicListHtml += '<li class="' + active + '" data-point="' + thispoint.lng + ',' + thispoint.lat + '"><i>' + (i + 1) + '</i><b>' + thisPoi.title + '</b><span>' + (thisPoi.distance / 1000).toFixed(1) + '公里</span></li>';self.scenicOverlay(thispoint, i + 1, scenicInfo);
					}
					$('.hotel_list_box').eq(num).find('.scenic_list').html(scenicListHtml);
				}
			}
		};
		var allOverlay = map.getOverlays();
		for (var i = 0; i < allOverlay.length; i++) {
			if (allOverlay[i]._div && allOverlay[i]._div.className == 'map_scenic_tip') {
				map.removeOverlay(allOverlay[i]);
			}
			;
		}
		;
		var local = new BMap.LocalSearch(map, options);
		local.search("景点");
	},
	overlay : function(point, h, title) {
		var map = this.map;
		function ComplexCustomOverlay(point, text, mouseoverText) {
			this._point = point;
			this._text = text;
			this._overText = mouseoverText;
		}
		ComplexCustomOverlay.prototype = new BMap.Overlay();
		ComplexCustomOverlay.prototype.initialize = function(map) {
			this._map = map;
			var div = this._div = document.createElement("div");
			div.className = "map_tip_box";
			div.innerHTML = '<span class="sl_icon">' + (h + 1) + '</span><p>' + title + '</p>';map.getPanes().labelPane.appendChild(div);return div;
		}
		ComplexCustomOverlay.prototype.draw = function() {
			var map = this._map;
			var pixel = map.pointToOverlayPixel(this._point);
			this._div.style.left = pixel.x + "px";
			this._div.style.top = pixel.y - 28 + "px";
		}
		var myCompOverlay = new ComplexCustomOverlay(point);
		map.addOverlay(myCompOverlay);
	},
	scenicOverlay : function(thispoint, num, scenicInfo) {
		var map = this.map;
		function ComplexCustomOverlay(point, text, scenicInfo) {
			this._point = point;
			this._text = text;
			this._scenicInfo = scenicInfo;
		}
		ComplexCustomOverlay.prototype = new BMap.Overlay();
		ComplexCustomOverlay.prototype.initialize = function(map) {
			this._map = map;
			var thisInfo = this._scenicInfo;
			var div = this._div = document.createElement("div");
			div.className = "map_scenic_tip";
			div.innerHTML = this._text + '<dl><dt><i class="mapinfo_close">X</i>' + thisInfo.title + '</dt><dd><b>景区类别:</b><p>' + thisInfo.type + '</p></dd><dd><b>景区电话:</b><p>' + (thisInfo.phoneNumber ? thisInfo.phoneNumber : '未知') + '</p></dd><dd><b>景区地址:</b><p>' + thisInfo.address + '</p></dd></dl><span class="sl_icon map_tip_jt"></span>';map.getPanes().labelPane.appendChild(div);return div;
		}
		ComplexCustomOverlay.prototype.draw = function() {
			var map = this._map;
			var pixel = map.pointToOverlayPixel(this._point);
			this._div.style.left = pixel.x + "px";
			this._div.style.top = pixel.y - 28 + "px";
		}
		var myCompOverlay = new ComplexCustomOverlay(thispoint, num, scenicInfo);
		map.addOverlay(myCompOverlay);
	},
	scenicMove : function($this) {
		var map = this.map;
		var pointArr = $this.attr('data-point').split(',');
		var num = $this.index();
		map.panTo(new BMap.Point(pointArr[0], pointArr[1]));setTimeout(function() {
			var thisOverlay = $('.map_scenic_tip').eq(num);
			thisOverlay.css('z-index', 9).stop(true, true).animate({
				'margin-top' : -15
			}, 300, function() {
				thisOverlay.animate({
					'margin-top' : 0
				}, 400);thisOverlay.find('dl,.map_tip_jt').show();
			});thisOverlay.siblings('.map_scenic_tip').css('z-index', '').find('dl,.map_tip_jt').hide();
		}, 300);
	}
}
$(function() {
	if (!$('body').is('.search_list_youlun')) {
		return false;
	}
	var $searchFilter = $('.search-filter'),
		$searchLists = $('.search-lists'),
		h = 0,
		timer = null,
		$activeLi;
	$(document).on('mouseenter', '.youlun-cpy li', function() {
		var $self = $(this),
			t = $self.offset().top - $searchFilter.offset().top,
			html = $self.find('script').html();
		h = 1;$self.addClass('on').siblings().removeClass('on');$('.popup').remove();$searchLists.append(html);$('.popup').css({
			'top' : t + 22,
			'display' : 'block'
		});
		$activeLi = $self;
	}).on('mouseleave', '.youlun-cpy li,.popup', function() {
		h = 0;
		timer = setTimeout(function() {
			if (!h) {
				$('.popup').hide();$activeLi.removeClass('on');
			}
		}, 200);
	}).on('mouseenter', '.popup', function() {
		h = 1;
	});
});