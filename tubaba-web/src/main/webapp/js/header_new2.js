// JavaScript Document

if (!searchStatistics) {
	var searchStatistics = function(city, text) {
		var isHome = $("body").is(".home");
		if (isHome) {
			//cmCreateElementTag("出发地_搜索词", "首页顶部搜索框");
			var $lv_search_box = $(".lv_search_box");
			var $city = $lv_search_box.find(".btn_city:visible>b");
			var $input = $lv_search_box.find(".lv_search:visible");
			if (!city) {
				city = $city.text();
			}
			if (!text) {
				text = $.trim($input.val());
			}
			if (typeof cmCreateElementTag != "undefined") {
				cmCreateElementTag(city + "_" + text, "首页顶部搜索框");
			}
		}
	}
}

$(function() {

	(function() {
		//如果是1000宽的页面
		if ($("body").is(".w_1000")) {
			//删除无锡网店分布
			var $link = $(".lv_topbar .lv_link[href='http://www.lvmama.com/md/wuxi/']");
			var $li = $link.parent("li.border_l");
			$li.hide();
		}
	})();

	//首页品质一日游链接
	$(".lv_s_search_quality").on("click", function() {
		window.open("http://www.lvmama.com/local?losc=098688&ict=i");
	});

	var $lv_city_box = $('.lv_city_box'),
		$search_city = $('.search_city'),
		$search_type = $(".search_type");
	$(document).bind("click", function() {
		$lv_city_box.removeClass('lv_city_hover');
		$search_city.removeClass('search_city_hover');
		$(".complete_box,.complete_box_hotel,.search_hot_tips,.search_hotel_mdd,.search_hotel_keyword,.lv_search_tips").hide();
		$search_type.removeClass("search_type_show");
	});



	var $js_btn_type = $('.js_btn_type');

	//页面加载时，分类搜索显示当前频道分类
	searchType();
	function searchType() {
		var $search_type_tab = $('.search_type_tab');
		var typeNum = 0;
		if ($('body').hasClass('around') || $('body').hasClass('zijia')) {
			var typeNum = 2;
		} else if ($('body').hasClass('ticket')) {
			typeNum = 5;
		} else if ($('body').hasClass('hotel')) {
			typeNum = 6;
		} else if ($('body').hasClass('liner')) {
			typeNum = 7;
		} else if ($('body').hasClass('visa')) {
			typeNum = 8;
		} else if ($('body').hasClass('localfun')) {
			typeNum = 4;
		}
		if ($('body').hasClass('around_bus')) {
			typeNum = 0
		}

		var typeIndex = $search_type_tab.find('li').eq(typeNum),
			typeText = typeIndex.text(),
			typeData = typeIndex.attr('data-type');
		typeIndex.hide().siblings().show();
		$('.search_type_list').eq(typeNum).show().siblings().hide();
		//$js_btn_type.find('b').text(typeText).attr('data-type',typeData);

	}
	;



	//产品分类按钮
	$js_btn_type.bind("click", function(e) {
		var $this = $(this);

		e.stopPropagation();
		$(".complete_box,.search_hot_tips").hide();
		$search_city.removeClass('search_city_hover');
		if ($this.siblings('.search_type_tab').is(':hidden')) {
			$this.parent().addClass('search_type_show');
		} else {
			$this.parent().removeClass('search_type_show');
		}
	});

	//分类列表点击 
	$('.search_type_tab li').click(function() {
		var $this = $(this);
		var typeText = $this.text(),
			typeCode = $this.attr("data-type"),
			num = $this.index();
		$this.hide().siblings().show();
		$this.parents('.search_type').removeClass('search_type_show').find('.btn_type').find('b').attr("data-type", typeCode).text(typeText);
		$('.search_type_list').eq(num).show().siblings().hide();
	});

	//ABCD排列出发地切换 
	$('.lv_cfd_tab li').bind("click", function(e) {
		e.stopPropagation();
		var $this = $(this);
		var num = $this.index();
		$this.addClass('active').siblings().removeClass('active');
		$this.parent().siblings('.lv_cfd_list').find('li').eq(num).show().siblings().hide();
	});

	$(".js_cf_city,.lv_s_city").bind("click", function(e) {
		e.stopPropagation();
		var target = e.target || e.srcElement;

		var $target = $(target);
		if ($target.is("li") && $target.parent().is(".nav-tabs")) {
			var $li = $target;
			var index = $li.index();
			var $parent = $li.parents(".search-station-cities").eq(0);
			var $tabs = $parent.find(".nav-tabs>li");
			var $pane = $parent.find(".search-station-cities-pane");
			$tabs.eq(index).addClass("active").siblings().removeClass("active");
			$pane.eq(index).addClass("active").siblings().removeClass("active");
		}

		if (target.tagName.toLowerCase() === "a") {
			var $p = $target.parentsUntil(".search_city");
			var length = $p.length - 1;
			var dataid = $target.attr("data-id"),
				datacode = $target.attr("data-code");
			$($p[length]).siblings(".btn_city").find("b").attr("data-id", dataid).html($target.html()).siblings('span').show().html('出发');
			$($p[length]).parent().removeClass("search_city_hover");
		}
	});

	//酒店热门目的地选择
	$(".search_hotel_mdd").bind({
		"click" : function(e) {
			e = e || window.event;
			if (e.stopPropagation)
				e.stopPropagation();
			else
				e.cancelBubble = true;
			var target = e.target || e.srcElement;
			switch (target.tagName.toLowerCase()) {
			case "a":
				var text = $(target).text();
				$("input:text[active]").val(text); //当前激活的文本框内填写. 激活属性在补全js里
				if ($(target).attr("data-id"))
					$(".js_searchDest").val(text).attr("data-id", $(target).attr("data-id")).removeClass('lv_s_error');
				$(this).hide();
				break;
			case "li":
				var $this = $(target);
				$this.addClass('active').siblings().removeClass('active');
				$this.parent().siblings('.mdd_list').find("li:eq(" + $this.index() + ")").show().siblings().hide();
				break;
			case "span":
				$(this).hide();
				break;
			}
		},
		"mousedown" : function(e) {
			e = e || window.event;
			if (e.stopPropagation)
				e.stopPropagation();
			else
				e.cancelBubble = true;
		}
	});
	//酒店热门关键词选择
	/*  $(".search_hotel_keyword").bind({
	      "click": function (e) {
	          e = e || window.event;
	          if (e.stopPropagation)
	              e.stopPropagation();
	          else
	              e.cancelBubble = true;
	          var target = e.target || e.srcElement;
	          if (target.tagName.toLowerCase() == "a") {
	              var text = $(target).text();
	              if ($('body').hasClass('home')) {
	              	$("input:text[active]").val(text).css('color','#333');
	              } else {
	              	$("input:text[active]").val(text).removeClass("des_tip");//当前激活的文本框内填写. 激活属性在补全js里
	              }
	              
	              $(this).hide();


	          }
	      },
	      "mousedown": function (e) {
	          e = e || window.event;
	          if (e.stopPropagation)
	              e.stopPropagation();
	          else
	              e.cancelBubble = true;
	      }
	  });*/



	/*搜索城市展开*/
	$('.js_searchbox,.js_s_city_btn').click(function(e) {
		e.stopPropagation();
		$(".complete_box,.search_hot_tips").hide();
		$search_type.removeClass("search_type_show");
		if ($(this).siblings('.lv_city_down').is(':hidden')) {
			$search_city.addClass('search_city_hover');
			$(".search_type_list:visible").find(".search-station-cities .nav-tabs li").eq(0).click();
		} else {
			$search_city.removeClass('search_city_hover');
		}
		$(".lv_s_city .search-station-cities .nav-tabs").each(function(index, ele) {
			var $ele = $(ele);
			$ele.find("li").eq(0).click();
		})
	});

	try {
		//自动补全调用
		$(".lv_search").focus(function() {
			$search_city.removeClass('search_city_hover');
			$search_type.removeClass("search_type_show");
		}).searchComplete();
		//酒店自动补全调用
		$(".lv_search2").focus(function() {
			$search_city.removeClass('search_city_hover');
			$search_type.removeClass("search_type_show");
		}).searchComplete_hotelAddon();

	} catch (e) {}

	var oldValue = [ '请输入目的地、主题、或关键词', //all
		'请输入目的地、主题、或关键词', //group
		'请输入目的地、主题、或关键词', //h & v
		'请输入目的地、主题、或关键词', //t & h
		'请输入目的地、主题、或关键词', //local
		'请输入目的地、主题或景区名称', //ticket
		'请输入航线、邮轮公司或邮轮名称', //ship
		'请输入您需要签证的国家/地区', //visa
		'请输入目的地、主题、或关键词' ]; //localfun
	var lv_search = $('.form_search .lv_search');
	for (var i = 0; i < lv_search.length; i++) {
		lv_search.eq(i).attr('num', i);
	}
	$(".btn_lv_search").bind("click", function(e) {
		for (var i = 0; i < oldValue.length; i++) {
			var $input = lv_search.eq(i);
			if ($input.val() == oldValue[i] && !$input.is(':hidden')) {
				$input.css('color', '#333');
				$input.addClass("empty");
				//return;
			}
		}

		var type = $(".js_btn_type b").attr("data-type");
		if (type.toLowerCase() == "hotel") {
			e.stopPropagation();
			$.searchComplete_hotelAddon.searchAndJump();
		} else {
			//首页顶部搜索框 鼠标点击搜索按钮统计
		//	searchStatistics();
			// var $list = $(".complete_box_all:visible [data-url][data-search-value]");
			// if($list.length > 0){
			//     var city  = $list.attr("data-search-value");
			//     var url = $list.attr("data-url");
			//     window.setHistory(city);
			//     window.location.href = url;
			// }else{
			//     $.searchComplete.searchAndJump(null, null, null, "button");
			// }
			//$.searchComplete.searchAndJump(null, null, null, "button");
		}
	});

	$(".search_hot_tips").bind("click", function(e) {
		e.stopPropagation();
		var target = e.target || e.srcElement;
		if (target.tagName.toLowerCase() === "a") {
			var place = $(target).html();
			//$.searchComplete.searchAndJump(null, null, place, "hotTips");
		}
	});
});


(function($) {
	$.searchType = {
		showType : function(type) {
			var typeNum = 0;
			if (type == 'GROUP') {
				typeNum = 1;
			} else if (type == 'SCENICTOUR') {
				typeNum = 2;
			} else if (type == 'FREETOUR') {
				typeNum = 3;
			} else if (type == 'LOCAL') {
				typeNum = 4;
			} else if (type == 'TICKET') {
				typeNum = 5;
			} else if (type == 'HOTEL') {
				typeNum = 6;
			} else if (type == 'SHIP') {
				typeNum = 7;
			} else if (type == 'VISA') {
				typeNum = 8;
			} else if (type == 'LOCALPLAY') {
				typeNum = 9;
			}
			var $search_type_tab = $('.search_type_tab'),
				typeIndex = $search_type_tab.find('li').eq(typeNum),
				typeText = typeIndex.text(),
				typeData = typeIndex.attr('data-type');
			typeIndex.hide().siblings().show();
			$('.search_type_list').eq(typeNum).show().siblings().hide();
			$('.js_btn_type').find('b').text(typeText).attr('data-type', typeData);
		}
	}

})(jQuery);


$(function() {
	//调用当前搜索频道
	//$.searchType.showType('ROUTE');
	/*切换当前城市*/
	$('.lv_city_btn').click(function(e) {
		e.stopPropagation();
		if ($(this).parent().siblings('.lv_city_down').is(':hidden')) {
			$('.lv_city_box').addClass('lv_city_hover');
		} else {
			$('.lv_city_box').removeClass('lv_city_hover');
		}
		;
	})


	//热门分类展开
	$('.lv_nav_hot').hover(function() {
		$(this).addClass('lv_nav_hot_hover');
	}, function() {
		$(this).removeClass('lv_nav_hot_hover');
	});
	////////////////////////////////////////////////////////////////


	var $box = $("div.js_box");
	$("div.Js_LISTFIRST a").live('click', function(e) {
		e.stopPropagation();
		var $body = $('body'),
			$this = $(this),
			citypinyin = $this.attr('pinyin');

		var provinceId = $this.attr("provinceId");
		var cityId = $this.attr("cityId");
		var zhandianName = $this.text();
		if ($(this).hasClass('city_stop')) {
			return;
		}

		if ($body.hasClass('ticket_city')) {
			$.xcookie.setCookie('_ticket_ip_province_place_id', provinceId, {
				path : '/',
				expires : 10,
				domain : 'lvmama.com'
			});
			$.xcookie.setCookie('_ticket_ip_city_place_id', cityId, {
				path : '/',
				expires : 10,
				domain : 'lvmama.com'
			});
			$.xcookie.setCookie('_ticket_ip_city_name', zhandianName, {
				path : '/',
				expires : 10,
				domain : 'lvmama.com'
			});
		} else if (!/dujiaseolist/.test($body.attr('id'))) {
			$.xcookie.setCookie('_ip_province_place_id', provinceId, {
				path : '/',
				expires : 10,
				domain : 'lvmama.com'
			});
			$.xcookie.setCookie('_ip_city_place_id', cityId, {
				path : '/',
				expires : 10,
				domain : 'lvmama.com'
			});
			$.xcookie.setCookie('_ip_city_name', zhandianName, {
				path : '/',
				expires : 10,
				domain : 'lvmama.com'
			});
		}
		;

		if (!$body.hasClass('search_list') && !$body.hasClass('d_list')) { //屏蔽搜索列表页，切换城市操作。搜索列表页开发做了单独得出发城市切换。
			var _form = $("<form method=\"post\" >" +
				"<input type=\"hidden\" name=\"provinceId\" value=\"" + provinceId + "\" />" +
				"<input type=\"hidden\" name=\"cityId\" value=\"" + cityId + "\" />" +
				"<input type=\"hidden\" name=\"stationName\" value=\"" + zhandianName + "\" /></form>");
			$box.prepend(_form);
			_form.submit();
		} else {

			var url = '';
			//度假跳转
			if (/dujiaseolist/.test($body.attr('id'))) {
				var dataid = $(this).attr('data-id');
				if (!dataid) return;
				url = dujiaUrl(dataid);
			} else {
				//搜索页点击跳转时重构url增加出发地参数
				var cityid = $(this).attr("cityid");
				if (!cityid)
					return;
				//处理香港,澳门的F20000和F10000
				if (cityid == "F20001" || cityid == "F10001") {
					cityid = cityid.replace("F", "");
				}
				url = rebuildUrl(cityid)
			}

			if (url) {
				window.location.href = url;
			}
		}
	});

	$('.Js_LISTFIRST').live('click', function(e) {
		e.stopPropagation();
	});

	function dujiaUrl(dataid) {
		var typeOfSeo = [ "route", "group", "local", "around", "freetour", 'scenictour', 'play', 'ziyouxing' ];
		var url = window.location.href;
		var newUrl = url;

		for (var i = 0; i < typeOfSeo.length; i++) {
			var thisType = "/" + typeOfSeo[i];
			if (url.indexOf(thisType) >= 0) {
				var parrten = new RegExp('(' + thisType + ')([^\?]+)'),
					urltext = url.replace(parrten, '$1');
				newUrl = urltext + '-H' + dataid;
				break;
			} else if (i == typeOfSeo.length - 1) {
				newUrl = url.split('#')[0] + "/route-H" + dataid;
			}
		}
		;
		return newUrl;
	}
	//重构搜索页跳转链接 增加出发地参数
	function rebuildUrl(placeid) {
		var tempAnchor = null,
			tempParam = null,
			partten = null;
		var typeOfLink = [ "s.lvmama", "ticket.lvmama" ];
		var url = window.location.href;
		if (url.match(/K\d+/))
			url = url.replace(/K\d+/, "K" + placeid);else {
			if (url.match(/#/)) { //处理锚点后的乱七八糟东西
				tempAnchor = url.match(/#[\s\S]*/)[0];
				url = url.replace(/#[\s\S]*/, "");
			}
			if (url.match(/\?/)) { //处理参数
				tempParam = url.match(/\?[\s\S]*/)[0];
				url = url.replace(/\?[\s\S]*/, "");
			}

			if (url.indexOf(typeOfLink[0]) >= 0) {
				partten = new RegExp("[A-Z][0-9]*");
				if (partten.test(url)) {
					//处理http://s.lvmama.com/ticket/H1/,删除最后的/
					url = url.replace(/\/$/, "");
				} else {
					//处理http://s.lvmama.com/ticket,补全最后的/
					partten = new RegExp("\/$");
					if (!partten.test(url))
						url += "/";
				}
				url += "K" + placeid;
			} else if (url.indexOf(typeOfLink[1]) >= 0) {
				partten = new RegExp("tf\-");
				if (partten.test(url)) {
					//处理http://ticket.lvmama.com/a-shanghai79/tf-D3/,删除最后一个/并追加参数
					url = url.replace(/\/$/, "");
					url += "K" + placeid;
				} else {
					//处理http://ticket.lvmama.com/a-shanghai79, 追加/后再追加tf-参数
					partten = new RegExp("\/$");
					if (!partten.test(url))
						url += "/";
					url += "tf-K" + placeid;
				}
			} else {
				//链接不属于typeOfLink数组中的类型时返回null
				return null;
			}

			//追加参数及锚点
			if (tempParam)
				url += tempParam;
			if (tempAnchor)
				url += tempAnchor;
		}
		return url;
	}

	//绑定切换城市的click事件
	var $search_box = $("div.js_searchbox");
	$("div.js_LISTSECOND a").live('click', function() {
		var placeName = $(this).attr("data-name");
		var placeCode = $(this).attr("data-code");
		var placeId = $(this).attr("data-id");
		$search_box.attr("data-city-name", placeName);
		$search_box.attr("data-city-id", placeId);
		$search_box.attr("data-city-code", placeCode);
		$('#js_cityId').html(placeName);
	});




	/*顶部微信，电话展开*/
	$('.dropdown').hover(function() {
		$(this).addClass('dropdown_hover');
	}, function() {
		$(this).removeClass('dropdown_hover');
	});

	/*我的驴妈妈展开*/
	$('.lv_my_box').hover(function() {
		$(this).addClass('lv_my_hover');
	}, function() {
		$(this).removeClass('lv_my_hover');
	});

	//二级导航默认显示
	showPnavDown();

	//二级导航
	if ($('body').hasClass('freetour_zyx')) {
		$('#freetour .down_nav a:first').addClass('active');
	}
	if ($('body').hasClass('freetour_gty')) {
		$('#freetour .down_nav a:last').addClass('active');
	}
	$('.pnav_down').hover(function() {
		$('.pnav_down').removeClass('hover_this');
		$(this).addClass('hover_this');
		pnavDown($(this));
	}, function() {
		$('.pnav_down').removeClass('hover_this');
		showPnavDown();
	});

	/* 判断默认显示二级导航方法*/
	function showPnavDown() {
		var $bodyClass = $('body').attr('class');
		/around/.test($bodyClass) && pnavDown($('#around'));
		/localfun/.test($bodyClass) && pnavDown($('#abroad'));
		$('body').hasClass('visa') && pnavDown($('#abroad'));
		/wifi_list/.test($bodyClass) && pnavDown($('#abroad'));
		/abroad/.test($bodyClass) && pnavDown($('#abroad'));
		/hotel/.test($bodyClass) && pnavDown($('#hotel'));
		/flight_fit/.test($bodyClass) && pnavDown($('#destroute'));
		/super-free/.test($bodyClass) && pnavDown($('#destroute'));
		/flight_gnjp/.test($bodyClass) && pnavDown($('#flight'));
		/custom_personal/.test($bodyClass) && pnavDown($('#custom'));
		/custom_company/.test($bodyClass) && pnavDown($('#custom'));
		/lvyou/.test($bodyClass) && pnavDown($('#lvyou'));
		/destroute/.test($bodyClass) && pnavDown($('#destroute'));
		/ticket/.test($bodyClass) && pnavDown($('#ticket'));
		/zijia/.test($bodyClass) && pnavDown($('#zijia'));
		/liner/.test($bodyClass) && pnavDown($('#liner'));
		/QA/.test($bodyClass) && pnavDown($('#lvyou'));
		/ft-airline/.test($bodyClass) && pnavDown($('#flight'));
		/flight_international/.test($bodyClass) && pnavDown($('#flight'));
	}

	/*二级导航定位计算*/
	function pnavDown(nav) {
		nav.addClass('hover_this');
		if (nav.length != 0) {
			var ThisL = nav.offset().left,
				navL = $('.lv_nav').offset().left,
				navW = $('.lv_nav').width(),
				winW = $('body').width(),
				pW = nav.find('p').width() / 2,
				thisW = nav.width() / 2,
				downL = ThisL + thisW;
			nav.find('.down_nav_t').css('left', downL - 5);
			if (navL > downL - pW) { //检测二级导航是否超过导航左侧
				downL = navL + pW
			} else if (navL + navW < ThisL + pW + thisW) { //检测二级导航是否超过导航右侧
				downL = navL + navW - pW - 1;
			}
			nav.find('.down_nav').css({
				'width' : winW,
				'left' : -ThisL
			}).find('p').css({
				'left' : downL - pW
			});

		}

	}



	//首页底部展开更多
	$('.btn_links').live('click', function() {
		if ($(this).hasClass('links_up')) {
			$(this).removeClass('links_up').html('更多<i class="icon_arrow"></i>').parent().css('height', 22);
		} else {
			$(this).addClass('links_up').html('收起<i class="icon_arrow"></i>').parent().css('height', 'auto');
		}
	});
	$('.links_list').each(function() {
		var find_dd = $(this).find('dd');
		if (find_dd.height() > 30) {
			find_dd.css('height', 22);
			find_dd.append('<span class="btn_links">更多<i class="icon_arrow"></i></span>')
		}
	});

	//首页顶部公告，通栏通知
	/*if($('body').hasClass('home')){
		$('.lv_topbar').after('<div class="index_tips"><i class="lv_icon icon-dp"></i>温馨提示：驴妈妈网站将于2015年9月9日星期三 凌晨1：00——5：00进行系统升级维护，维护期间可能导致访问异常，敬请谅解！ </div>')
	}*/


	// 右侧浮动APP代码
	//     var appRight = '<div class="app_right">'
	//             + ' <a href="http://m.lvmama.com/download?ch=xuanfu" class="app_href" target="_blank"></a>'
	//             + ' <a href="javascript:;" class="app_close"></a>'
	//             + ' </div>';
	//     var COOKIE_NAME = 'floatRcookie';
	//     if(!$.xcookie.getCookie(COOKIE_NAME) && $('.sj_pop').length==0){
	//         $('body').append(appRight);
	//     }

	// 浮动广告 设置cookie，通过时间间隔
	// $(".app_close").click(function(){
	//     $(this).parent().hide();
	//     $.xcookie.setCookie(COOKIE_NAME, 'floatRcookie', { path: '/', expires: 365});
	//     return false;
	// })


	/*******************
	*
	* 首页置顶广告
	*
	********************/
	//首页置顶广告
	// if ($('body').hasClass('home')) {
	// 	syAdTop();
	// }
	// function syAdTop(){
	// 	var _activebox = '<div class="syAdTop"><iframe marginheight="0" marginwidth="0" frameborder="0" width="1200" height="60" scrolling="no" src="http://lvmamim.qtmojo.com/main/s?user=lvmama_2015|shouye_2015|shouye_2015_button&db=lvmamim&border=0&local=yes"></iframe><span class="lv_icon syAdTopClose"></span></div>';
	// 	var syAdTop = 'syadtop_cookie';

	// 	if(!$.xcookie.getCookie(syAdTop)){
	// 		 $('.home .lv_topbar').after(_activebox);

	// 		 //关闭广告，消失30天
	// 		$(document).on('click','.syAdTopClose',function(){
	// 			var par = $(this).parents('.syAdTop');
	// 			par.slideUp(function(){par.remove()});
	// 			$.xcookie.setCookie(syAdTop, 'syadtop_cookie', { path: '/', expires: 1});
	// 		});

	// 		//10秒关闭
	// 		// setTimeout(function(){
	// 		// 	$('.syAdTop').slideUp();
	// 		// },10000);
	// 	}
	// }

	/*返回顶部*/
	if ($('#goTopBtn').length == 0) {
		var $body = $("body"),
			//url = window.location.href,
			inveLink;
		if (!$body.hasClass('home')) {

			var rightBottomDom = "<div id='right-bottom-tools'>";

			//无问卷
			inveLink = null;

			//详情页问卷
			if ($(".crumbs-link,.nav_mb_list").length > 0) {
				inveLink = "https://wj.qq.com/s/1293296/f5ae";
			}

			//搜索列表页问卷
			if ($body.hasClass('search_list')) {
				inveLink = "https://wj.qq.com/s/1293296/f5ae";
			}

			//个人中心页问卷
			if (($body).hasClass('lv_newhome')) {
				inveLink = "https://wj.qq.com/s/1293296/f5ae";
			}

			//支付成功页问卷
			if ($body.hasClass('paysuccess-hotel')) {
				inveLink = "http://wj.qq.com/s/929977/a20d";
			}

			//攻略-写点评
			if ($body.hasClass('lvyou') && /www\.lvmama\.com\/comment/.test(window.location.href)) {
				inveLink = "http://wj.qq.com/s/929977/a20d";
			}

			if (inveLink && $("#sideInve").length == 0) {
				// $body.append('<a id="sideInve" target="_blank" href="'+inveLink+'" title="有奖问卷"></a>');
				rightBottomDom += ('<a id="sideInve" target="_blank" href="' + inveLink + '" title="有奖问卷"></a>');
			}

			// $body.append('<a id="goTopBtn" target="_self" href="javascript:;" title="返回顶部"></a><a href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" target="_blank" id="Feedback" title="意见反馈"></a>');

			rightBottomDom += ('<a id="goTopBtn" target="_self" href="javascript:;" title="返回顶部"></a><a href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" target="_blank" id="Feedback" title="意见反馈"></a>');
			rightBottomDom += "</div>";
			$body.append(rightBottomDom);
			var gotop = true;
			var isie6 = !-[ 1, ] && !window.XMLHttpRequest;
			$(window).scroll(function() {
				if (gotop == true) {
					gotop = false;
					var timer = setTimeout(show, 300);
				}
				function show() {
					var nowT = $(document).scrollTop();
					if (nowT > 200) {
						$('#goTopBtn,#Feedback,#FeedbackNew').css({
							'visibility' : 'visible'
						}).addClass('goTopShow');
						if (isie6) {
							$('#goTopBtn,#Feedback,#FeedbackNew').show();
						}
					} else {
						$('#goTopBtn,#Feedback,#FeedbackNew').css({
							'visibility' : 'hidden'
						}).removeClass('goTopShow');
						if (isie6) {
							$('#goTopBtn,#Feedback,#FeedbackNew').hide();
						}
					}
					;
					gotop = true;
				}
				;
			});
		}
		;

	}

	$(document).on('click', '#goTopBtn', function() {
		$(document).scrollTop(0);
	});

	$(document).on('mouseenter', '#rbtWeixin', function() {
		$(".rbtWxCode").show();
	});

	$(document).on('mouseleave', '#rbtWeixin', function() {
		$(".rbtWxCode").hide();
	});


	/*登陆*/
	function loginCas() {
		window.location = "http://login.lvmama.com/nsso/login?service=" + encodeURIComponent(document.location)
	}
	;

	function xhshowtips() {
		$('.tapbar-inner').append('<span id="stips" class="stips"><i class="sarrow"></i>验证邮箱可获300积分，<a href="http://www.lvmama.com/myspace/userinfo.do" hidefocus="false">立即验证</a><i class="sclose">×</i></span>');
		var useremail = "";

		try {
			var userCookie = decodeURIComponent(document.cookie).match(/EMV\=.+/) + "";
			useremail = userCookie.replace('EMV=', '');
			if (useremail.indexOf(";") >= 0) {
				useremail = useremail.substring(0, useremail.indexOf(";"));
			} else {
				useremail = useremail.substring(0, useremail.length);
			}
		} catch (e) {
			var userCookie = unescape(document.cookie).match(/EMV\=.+/) + "";
			useremail = userCookie.replace('EMV=', '');
			useremail = useremail.substring(0, useremail.indexOf(";"));
			if (useremail.indexOf(";") >= 0) {
				useremail = useremail.substring(0, useremail.indexOf(";"));
			} else {
				useremail = useremail.substring(0, useremail.length);
			}
		} finally {
			if (useremail == 'U' || useremail == 'E') {
				//显示
				return true;
			} else {
				// 不显示
				return false;
			}
		}

	}

	function loadUserName() {
		var username = "";
		try {
			username = decodeURIComponent(document.cookie.match(/UN\=(.+)%5E%21%5E/));
		} catch (e) {
			username = decodeURI(document.cookie.match(/UN\=(.+)%5E%21%5E/));
		}
		var _message_num = 0;

		$('#J_login').html(username != "null" ? "<span class='vip_name'><a href='http://my.lvmama.com/myspace/index.do'>" + (username.split(',')[1] ? username.split(',')[1] : '') +
		"</a></span><a href='http://my.lvmama.com/myspace/message.do' class='lv_link lv_link2'><i class='lv_icon icon_xx'></i>\u6D88\u606F</a><a class='lv_link lv_link2' rel='nofollow' href='http://login.lvmama.com/nsso/logout'>[\u9000\u51fa]</a><span class='vip-bar-box'><i class='vip-jf-icon'></i><a href='http://my.lvmama.com/myspace/userinfo.do?requestDestination=PF' target='_blank'>领取1000驴镑</a></span>" : "<a id='top_login' href='javascript:;'>\u8bf7\u767b\u5f55</a><a href='http://login.lvmama.com/nsso/register/registering.do' rel='nofollow'>\u514d\u8d39\u6ce8\u518c</a>");
		//(<b class='c_f60' id='message-num'>"+_message_num +"</b>)
		if (username != "null") {
			var _message_url = "http://www.lvmama.com/message/index.php?r=PrivatePm/GetUnreadCount&callback=?";
			$.getJSON(_message_url, function(json) {
				if (json.code == 200) {
					$("#message-num").html(json.data.unreadCount);
				//_message_num = json.data.unreadCount; 
				}
			});
		}
		if (username != "null" && xhshowtips()) {
			$('#stips').show();

		} else {
			$('#stips').hide();
		}
	}
	;
	loadUserName();
	$('#top_login').live('click', function() {
		loginCas();
	});

	//电话号码
	/*GetTele();
	function GetTele(){
		var tele = top.window.location.search.match(/tele=+[0-9]{3,4}/);
		if(tele!==null){
			var tele = tele[0].replace('tele=','');
			$.ajax({
				url : "http://www.lvmama.com/teleChannel/doTeleChannelShowDifferntHotLine.do?tele="+tele,
				type : 'get',
				async : false,
				dataType : "jsonp",
				jsonp : "jsoncallback",
				jsonpCallback : "success_jsoncallback",
				success : function(json) {
					 $("#onlyOne").find('span').html(json.success);
					 $("#onlyTwo").html(json.success);
				},error : function(){
					$("#onlyOne").find('span').html("1010-6060");
					$("#onlyTwo").html("1010-6060");
				}
		  });
		}else{
			var teleCookie =	$.xcookie.getCookie('tele');
			if(teleCookie){
				$("#onlyOne").find('span').html(teleCookie);
				$("#onlyTwo").html(teleCookie);
			}else{
				$("#onlyOne").find('span').html("1010-6060");
				$("#onlyTwo").html("1010-6060");
			}
		}
	};*/

});



/*cookie插件*/
(function($) {
	$.xcookie = {
		cookie : function(name, value, options) {
			var path = options.path ? '; path=' + (options.path) : '',
				domain = options.domain ? '; domain=' + (options.domain) : '',
				secure = options.secure ? '; secure' : '',
				expires = '';
			if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
				var date;
				if (typeof options.expires == 'number') {
					date = new Date();
					date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
				} else {
					date = options.expires;
				}
				expires = '; expires=' + date.toUTCString();

			}
			document.cookie = [ name, '=', encodeURIComponent(value), expires, path, domain, secure ].join('');
		},
		setCookie : function(name, value, options) {
			var options = options || {};
			this.cookie(name, value, options);
		},
		getCookie : function(name) {
			var cookieValue = null,
				doc = document;
			if (doc.cookie && doc.cookie != '') {
				var cookies = doc.cookie.split(';');
				for (var i = 0; i < cookies.length; i++) {
					var cookie = $.trim(cookies[i]);
					if (cookie.substring(0, name.length + 1) == (name + '=')) {
						cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
						break;
					}
				}
			}
			return cookieValue;
		},
		deleteCookie : function(name, options) {
			var options = options || {},
				value = '';
			options.expires = -1;
			this.cookie(name, value, options);
		}
	}
})(jQuery);



$(function() {
	/*=============图片延迟加载=============*/
	$.expr[":"].loading = function(elt, index) {
		var height = $(window).height() + 200;
		var top = $(elt).offset().top;
		return top > $(window).scrollTop() && top < (height + $(window).scrollTop())
	};
	$.expr[":"].loaded = function(elt, index) {
		var height = $(window).height() + 200;
		var top = $(elt).offset().top;
		return top < height
	};
	var loadImg = function() {
		var This = $(this);
		if (!This.is(':hidden')) { //不检测隐藏元素
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
				}).attr("to");
				This.removeAttr("to");
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
		}
			, 200)
	};
	$(window).bind('scroll', scrollImgLoading);
	$("img[to]:loaded").each(function() {
		loadImg.call(this)
	});
	setTimeout(function() {
		$("img[to]:loaded").each(function() {
			loadImg.call(this)
		})
	}
		, 1000);
		/*============延迟加载结束===========*/

});


$(function() {


	//切换当前城市
	var lv_city = '<dl class="city_down_list">'
		+ '<dt>华北</dt>'
		+ '<dd>'
		+ '<a  cityId="110000" provinceId="110000" pinyin="beijin"  href="#">北京</a> '
		+ '<a  cityId="120000" provinceId="120000" pinyin="tianjin"  href="#">天津</a> '
		+ '<a  cityId="140100" provinceId="140000" pinyin="taiyuan"  href="#">太原</a> '
		+ '<a  cityId="130200" provinceId="130000" pinyin="tangshan"  href="#">唐山</a> '
		+ '<a  cityId="150100" provinceId="150000" pinyin="huhehaote"  href="#">呼和浩特</a> '
		+ '<a  cityId="150200" provinceId="150000" pinyin="baotou"  href="#">包头</a> '
		+ '<a  cityId="130100" provinceId="130000" pinyin="shijiazhuang"  href="#">石家庄</a> '
		+ '<a  cityId="150700" provinceId="150000" pinyin="hulunbeier"  href="#">呼伦贝尔</a> '
		+ '<a  cityId="140200" provinceId="140000" pinyin="datong"  href="#">大同</a> '
		+ '<a  cityId="370100" provinceId="370000" pinyin="jinan"  href="#">济南</a>'
		+ '<a  cityId="370200" provinceId="370000" pinyin="qingdao"  href="#">青岛</a>'
		+ '<a  cityId="371100" provinceId="370000" pinyin="rizhao"  href="#">日照</a> '
		+ '<a  cityid="370600" provinceid="370000" pinyin="yantai"  href="#">烟台</a>'
		+ '</dd></dl>'
		+ '<dl class="city_down_list">'
		+ '<dt>华东</dt>'
		+ '<dd>'
		+ '<a  cityId="310000" provinceId="310000" pinyin="shanghai"  href="#">上海</a> '
		+ '<a  cityId="320100" provinceId="320000" pinyin="nanjing" href="#">南京</a> '
		+ '<a  cityId="330100" provinceId="330000" pinyin="hangzhou" href="#">杭州</a> '
		+ '<a  cityId="340100" provinceId="340000" pinyin="hefei" href="#">合肥</a> '
		+ '<a  cityId="350200" provinceId="350000" pinyin="xiamen" href="#">厦门</a> '
		+ '<a  cityId="360100" provinceId="360000" pinyin="nanchang" href="#">南昌</a> '
		+ '<a  cityId="320500" provinceId="320000" pinyin="suzhou" href="#">苏州</a> '
		+ '<a  cityId="320200" provinceId="320000" pinyin="wuxi" href="#">无锡</a> '
		+ '<a  cityId="330200" provinceId="330000" pinyin="ningbo" href="#">宁波</a> '
		+ '<a  cityId="320400" provinceId="320000" pinyin="changzhou" href="#">常州</a> '
		+ '<a  cityId="330400" provinceId="330000" pinyin="jiaxing" href="#">嘉兴</a> '
		+ '<a  cityId="320600" provinceId="320000" pinyin="nantong" href="#">南通</a> '
		+ '<a  cityId="321000" provinceId="320000" pinyin="yangzhou" href="#">扬州</a> '
		+ '<a  cityId="321100" provinceId="320000" pinyin="zhenjiang" href="#">镇江</a> '
		+ '<a  cityId="330600" provinceId="330000" pinyin="shaoxing" href="#">绍兴</a> '
		+ '<a  cityId="330300" provinceId="330000" pinyin="wenzhou" href="#">温州</a> '
		+ '<a  cityId="330700" provinceId="330000" pinyin="jinhua" href="#">金华</a> '
		+ '<a  cityId="331000" provinceId="330000" pinyin="taizhou" href="#">台州</a> '
		+ '<a  cityId="320900" provinceId="320000" pinyin="yancheng" href="#">盐城</a> '
		+ '<a  cityId="370900" provinceId="370000" pinyin="taian" href="#">泰安</a> '
		+ '<a  cityId="340200" provinceId="340000" pinyin="wuhu" href="#">芜湖</a> '
		+ '<a  cityId="341000" provinceId="340000" pinyin="huangshan" href="#">黄山</a> '
		+ '<a  cityId="341200" provinceId="340000" pinyin="fuyang" href="#">阜阳</a> '
		+ '<a  cityId="350100" provinceId="350000" pinyin="fuzhou" href="#">福州</a> '
		+ '<a  cityId="360700" provinceId="360000" pinyin="ganzhou" href="#">赣州</a> '
		+ '<a  cityId="360900" provinceId="360000" pinyin="yichun" href="#">宜春</a> '
		+ '<a  cityId="361130" provinceId="360000" pinyin="wuyuan" href="#">婺源</a> '
		+ '<a  cityId="321200" provinceId="320000" pinyin="tazhou" href="#">泰州</a> '
		+ '</dd></dl>'
		+ '<dl class="city_down_list">'
		+ '<dt>东北</dt>'
		+ '<dd><a  cityId="210100" provinceId="210000" pinyin="shenyang"  href="#">沈阳</a> '
		+ '<a  cityId="210200" provinceId="210000" pinyin="dalian"  href="#">大连</a> '
		+ '<a  cityId="230100" provinceId="230000" pinyin="haerbin"  href="#">哈尔滨</a> '
		+ '<a  cityId="220100" provinceId="220000" pinyin="changchun"  href="#">长春</a> '
		+ '<a  cityId="230200" provinceId="230000" pinyin="qiqihaer"  href="#">齐齐哈尔</a> '
		+ '<a  cityId="222400" provinceId="220000" pinyin="yanbian"  href="#">延边</a> '
		+ '</dd></dl>'
		+ '<dl class="city_down_list">'
		+ '<dt>华中</dt>'
		+ '<dd>'
		+ '<a  cityId="420100" provinceId="420000" pinyin="wuhan"  href="#">武汉</a> '
		+ '<a  cityId="410300" provinceId="410000" pinyin="luoyang"  href="#">洛阳</a> '
		+ '<a  cityId="430800" provinceId="430000" pinyin="zhangjiajie"  href="#">张家界</a> '
		+ '<a  cityId="430100" provinceId="430000" pinyin="changsha"  href="#">长沙</a> '
		+ '<a  cityId="410100" provinceId="410000" pinyin="zhengzhou"  href="#">郑州</a> '
		+ '<a  cityId="410800" provinceId="410000" pinyin="jiaozuo"  href="#">焦作</a> '
		+ '<a  cityId="420500" provinceId="420000" pinyin="yichang"  href="#">宜昌</a> '
		+ '<a  cityId="429021" provinceId="420000" pinyin="shennongjia"  href="#">神农架</a> '
		+ '<a  cityid="411300" provinceid="410000" pinyin="nanyang"  href="#">南阳</a>'
		+ '</dd></dl>'
		+ '<dl class="city_down_list">'
		+ '<dt>华南</dt>'
		+ '<dd>'
		+ '<a  cityId="440100" provinceId="440000" pinyin="guangzhou" href="#">广州</a> '
		+ '<a  cityId="440300" provinceId="440000" pinyin="shenzhen" href="#">深圳</a> '
		+ '<a  cityId="450100" provinceId="450000" pinyin="nanning" href="#">南宁</a> '
		+ '<a  cityId="450300" provinceId="450000" pinyin="guilin" href="#">桂林</a> '
		+ '<a  cityId="460100" provinceId="460000" pinyin="haikou" href="#">海口</a> '
		+ '<a  cityId="460200" provinceId="460000" pinyin="sanya" href="#">三亚</a> '
		+ '<a  cityId="440400" provinceId="440000" pinyin="zhuhai" href="#">珠海</a> '
		+ '<a  cityId="441800" provinceId="440000" pinyin="qingyuan" href="#">清远</a> '
		+ '<a  cityId="441900" provinceId="440000" pinyin="dongguan" href="#">东莞</a> '
		+ '</dd></dl>'
		+ '<dl class="city_down_list">'
		+ '<dt>西南</dt>'
		+ '<dd>'
		+ '<a  cityId="510100" provinceId="510000" pinyin="chengdu" href="#">成都</a> '
		+ '<a  cityId="500108" provinceId="500000" pinyin="chongqin" href="#">重庆</a> '
		+ '<a  cityId="530100" provinceId="530000" pinyin="kunming" href="#">昆明</a> '
		+ '<a  cityId="530700" provinceId="530000" pinyin="lijiang" href="#">丽江</a> '
		+ '<a  cityId="532900" provinceId="530000" pinyin="dali" href="#">大理</a> '
		+ '<a  cityId="532800" provinceId="530000" pinyin="xishuangbanna" href="#">西双版纳</a> '
		+ '<a  cityId="530001" provinceId="530000" pinyin="xianggelila" href="#">香格里拉</a> '
		+ '<a  cityId="520100" provinceId="520000" pinyin="guiyang" href="#">贵阳</a> '
		+ '<a  cityId="540100" provinceId="540000" pinyin="lasa" href="#">拉萨</a> '
		+ '<a  cityId="513225" provinceId="510000" pinyin="jiuzhaigou" href="#">九寨沟</a> '
		+ '<a  cityId="513401" provinceId="510000" pinyin="xichang" href="#">西昌</a> '
		+ '</dd></dl>'
		+ '<dl class="city_down_list">'
		+ '<dt>西北</dt>'
		+ '<dd>'
		+ '<a  cityId="610100" provinceId="610000" pinyin="xian" href="#">西安</a> '
		+ '<a  cityId="640100" provinceId="640000" pinyin="yinchuan" href="#">银川</a> '
		+ '<a  cityId="630100" provinceId="630000" pinyin="xining" href="#">西宁</a> '
		+ '<a  cityId="650100" provinceId="650000" pinyin="wulumuqi" href="#">乌鲁木齐</a> '
		+ '<a  cityId="620100" provinceId="620000" pinyin="lanzhou" href="#">兰州</a> '
		+ '<a  cityId="620200" provinceId="620000" pinyin="jiayuguan" href="#">嘉峪关</a> '
		+ '<a  cityId="610800" provinceId="610000" pinyin="yulin" href="#">榆林</a> '
		+ '<a  cityId="610600" provinceId="610000" pinyin="yanan" href="#">延安</a> '
		+ '<a  cityId="653100" provinceId="650000" pinyin="kashi" href="#">喀什</a> '
		+ '<a  cityId="654321" provinceId="650000" pinyin="kanasi" href="#">喀纳斯</a> '
		+ '</dd></dl>'
		+ '<dl class="city_down_list">'
		+ '<dt>港澳台</dt>'
		+ '<dd>'
		+ '<a  cityId="F10001" provinceId="F10000"  pinyin="xianggang"  href="#">中国香港</a> '
		+ '<a  cityId="F20001" provinceId="F20000"  pinyin="aomen"  href="#">中国澳门</a> '
		+ '</dd></dl>';

	if (!$('body').hasClass('ticket_city')) {
		$('.Js_LISTFIRST').append(lv_city);
	}
	//出发地，全站；
	var chufa_city = '<div class="search_city_hot cfd_hot" >'
		+ '	<a href="javascript:;" data-code="" data-id="8" data-name="">全国</a>'
		+ '	<a href="javascript:;" data-code="SH" data-id="9" data-name="上海">上海</a>'
		+ '	<a href="javascript:;" data-code="SZ" data-id="60" data-name="苏州">苏州</a>'
		+ '	<a href="javascript:;" data-code="HZ" data-id="69" data-name="杭州">杭州</a>'
		+ '	<a href="javascript:;" data-code="BJ" data-id="13" data-name="北京">北京</a>'
		+ '	<a href="javascript:;" data-code="TY" data-id="100" data-name="太原">太原</a>'
		+ '	<a href="javascript:;" data-code="GZ" data-id="322" data-name="广州">广州</a>'
		+ '	<a href="javascript:;" data-code="CD" data-id="258" data-name="成都">成都</a>'
		+ '	<a href="javascript:;" data-code="ZQ" data-id="31" data-name="重庆">重庆</a>'
		+ '	<a href="javascript:;" data-code="SY" data-id="257" data-name="三亚">三亚</a>'
		+ '	<a href="javascript:;" data-code="CZ" data-id="59" data-name="常州">常州</a>'
		+ '	<a href="javascript:;" data-code="HZ" data-id="73" data-name="湖州">湖州</a>'
		+ '	<a href="javascript:;" data-code="QD" data-id="175" data-name="青岛">青岛</a>'
		+ '	<a href="javascript:;" data-code="TJ" data-id="14" data-name="天津">天津</a>'
		+ '	<a href="javascript:;" data-code="SZ" data-id="324" data-name="深圳">深圳</a>'
		+ '	<a href="javascript:;" data-code="KM" data-id="233" data-name="昆明">昆明</a>'
		+ '	<a href="javascript:;" data-code="HK" data-id="221" data-name="海口">海口</a>'
		+ '	<a href="javascript:;" data-code="NJ" data-id="56" data-name="南京">南京</a>'
		+ '	<a href="javascript:;" data-code="JX" data-id="72" data-name="嘉兴">嘉兴</a>'
		+ '	<a href="javascript:;" data-code="NT" data-id="61" data-name="南通">南通</a>'
		+ '	<a href="javascript:;" data-code="WX" data-id="57" data-name="无锡">无锡</a>'
		+ '	<a href="javascript:;" data-code="XA" data-id="256" data-name="西安">西安</a>'
		+ '</div>'
		+ '<dl class="city_down_list">'
		+ '	<dt>A-G</dt>'
		+ '	<dd>'
		+ '		<a href="javascript:;" data-code="AM" data-id="41" data-name="澳门">澳门</a>'
		+ '		<a href="javascript:;" data-code="ALT" data-id="380" data-name="阿勒泰">阿勒泰</a>'
		+ '		<a href="javascript:;" data-code="AK" data-id="338" data-name="安康">安康</a>'
		+ '		<a href="javascript:;" data-code="BJ" data-id="13" data-name="北京">北京</a>'
		+ '		<a href="javascript:;" data-code="BT" data-id="112" data-name="包头">包头</a>'
		+ '		<a href="javascript:;" data-code="BH" data-id="211" data-name="北海">北海</a>'
		+ '		<a href="javascript:;" data-code="BZ" data-id="189" data-name="滨州">滨州</a>'
		+ '		<a href="javascript:;" data-code="BJ" data-id="332" data-name="宝鸡">宝鸡</a>'
		+ '		<a href="javascript:;" data-code="BB" data-id="82" data-name="蚌埠">蚌埠</a>'
		+ '		<a href="javascript:;" data-code="CS" data-id="308" data-name="长沙">长沙</a>'
		+ '		<a href="javascript:;" data-code="CZ" data-id="59" data-name="常州">常州</a>'
		+ '		<a href="javascript:;" data-code="CC" data-id="137" data-name="长春">长春</a>'
		+ '		<a href="javascript:;" data-code="CD" data-id="258" data-name="成都">成都</a>'
		+ '		<a href="javascript:;" data-code="ZQ" data-id="31" data-name="重庆">重庆</a>'
		+ '		<a href="javascript:;" data-code="CZ" data-id="146" data-name="滁州">滁州</a>'
		+ '		<a href="javascript:;" data-code="CD" data-id="314" data-name="常德">常德</a>'
		+ '		<a href="javascript:;" data-code="DL" data-id="245" data-name="大理">大理</a>'
		+ '		<a href="javascript:;" data-code="DZ" data-id="272" data-name="达州">达州</a>'
		+ '		<a href="javascript:;" data-code="DG" data-id="202" data-name="东莞">东莞</a>'
		+ '		<a href="javascript:;" data-code="DL" data-id="124" data-name="大连">大连</a>'
		+ '		<a href="javascript:;" data-code="DY" data-id="178" data-name="东营">东营</a>'
		+ '		<a href="javascript:;" data-code="DZ" data-id="187" data-name="德州">德州</a>'
		+ '		<a href="javascript:;" data-code="DT" data-id="101" data-name="大同">大同</a>'
		+ '		<a href="javascript:;" data-code="FS" data-id="327" data-name="佛山">佛山</a>'
		+ '		<a href="javascript:;" data-code="FY" data-id="147" data-name="阜阳">阜阳</a>'
		+ '		<a href="javascript:;" data-code="FZ" data-id="154" data-name="福州">福州</a>'
		+ '		<a href="javascript:;" data-code="FZ" data-id="172" data-name="抚州">抚州</a>'
		+ '		<a href="javascript:;" data-code="GZ" data-id="322" data-name="广州">广州</a>'
		+ '		<a href="javascript:;" data-code="GL" data-id="209" data-name="桂林">桂林</a>'
		+ '		<a href="javascript:;" data-code="GY" data-id="264" data-name="广元">广元</a>'
		+ '		<a href="javascript:;" data-code="GY" data-id="224" data-name="贵阳">贵阳</a>'
		+ '		<a href="javascript:;" data-code="GZ" data-id="169" data-name="赣州">赣州</a>'
		+ '	</dd>'
		+ '</dl>'
		+ '<dl class="city_down_list">'
		+ '	<dt>H-N</dt>'
		+ '	<dd>'
		+ '		<a href="javascript:;" data-code="HZ" data-id="69" data-name="杭州">杭州</a>'
		+ '		<a href="javascript:;" data-code="HZ" data-id="73" data-name="湖州">湖州</a>'
		+ '		<a href="javascript:;" data-code="HF" data-id="80" data-name="合肥">合肥</a>'
		+ '		<a href="javascript:;" data-code="HS" data-id="88" data-name="黄山">黄山</a>'
		+ '		<a href="javascript:;" data-code="HEB" data-id="43" data-name="哈尔滨">哈尔滨</a>'
		+ '		<a href="javascript:;" data-code="HHHT" data-id="111" data-name="呼和浩特">呼和浩特</a>'
		+ '		<a href="javascript:;" data-code="HNBE" data-id="117" data-name="呼伦贝尔">呼伦贝尔</a>'
		+ '		<a href="javascript:;" data-code="HK" data-id="221" data-name="海口">海口</a>'
		+ '		<a href="javascript:;" data-code="HZ" data-id="196" data-name="惠州">惠州</a>'
		+ '		<a href="javascript:;" data-code="HA" data-id="63" data-name="淮安">淮安</a>'
		+ '		<a href="javascript:;" data-code="HZ" data-id="190" data-name="菏泽">菏泽</a>'
		+ '		<a href="javascript:;" data-code="HD" data-id="92" data-name="邯郸">邯郸</a>'
		+ '		<a href="javascript:;" data-code="HS" data-id="99" data-name="衡水">衡水</a>'
		+ '		<a href="javascript:;" data-code="HZ" data-id="336" data-name="汉中">汉中</a>'
		+ '		<a href="javascript:;" data-code="HY" data-id="311" data-name="衡阳">衡阳</a>'
		+ '		<a href="javascript:;" data-code="HB" data-id="85" data-name="淮北">淮北</a>'
		+ '		<a href="javascript:;" data-code="HG" data-id="46" data-name="鹤岗">鹤岗</a>'
		+ '		<a href="javascript:;" data-code="JX" data-id="72" data-name="嘉兴">嘉兴</a>'
		+ '		<a href="javascript:;" data-code="JL" data-id="138" data-name="吉林">吉林</a>'
		+ '		<a href="javascript:;" data-code="JN" data-id="174" data-name="济南">济南</a>'
		+ '		<a href="javascript:;" data-code="JZ" data-id="280" data-name="焦作">焦作</a>'
		+ '		<a href="javascript:;" data-code="JA" data-id="170" data-name="吉安">吉安</a>'
		+ '		<a href="javascript:;" data-code="JYG" data-id="341" data-name="嘉峪关">嘉峪关</a>'
		+ '		<a href="javascript:;" data-code="JDZ" data-id="164" data-name="景德镇">景德镇</a>'
		+ '		<a href="javascript:;" data-code="KM" data-id="233" data-name="昆明">昆明</a>'
		+ '		<a href="javascript:;" data-code="LS" data-id="79" data-name="丽水">丽水</a>'
		+ '		<a href="javascript:;" data-code="JH" data-id="75" data-name="金华">金华</a>'
		+ '		<a href="javascript:;" data-code="JJ" data-id="166" data-name="九江">九江</a>'
		+ '		<a href="javascript:;" data-code="JX" data-id="45" data-name="鸡西">鸡西</a>'
		+ '		<a href="javascript:;" data-code="LZ" data-id="261" data-name="泸州">泸州</a>'
		+ '		<a href="javascript:;" data-code="LS" data-id="249" data-name="拉萨">拉萨</a>'
		+ '		<a href="javascript:;" data-code="LJ" data-id="238" data-name="丽江">丽江</a>'
		+ '		<a href="javascript:;" data-code="LY" data-id="186" data-name="临沂">临沂</a>'
		+ '		<a href="javascript:;" data-code="LYG" data-id="62" data-name="连云港">连云港</a>'
		+ '		<a href="javascript:;" data-code="LC" data-id="188" data-name="聊城">聊城</a>'
		+ '		<a href="javascript:;" data-code="LY" data-id="193" data-name="洛阳">洛阳</a>'
		+ '		<a href="javascript:;" data-code="LD" data-id="320" data-name="娄底">娄底</a>'
		+ '		<a href="javascript:;" data-code="LZ" data-id="340" data-name="兰州">兰州</a>'
		+ '		<a href="javascript:;" data-code="LA" data-id="150" data-name="六安">六安</a>'
		+ '		<a href="javascript:;" data-code="MY" data-id="263" data-name="绵阳">绵阳</a>'
		+ '		<a href="javascript:;" data-code="MDJ" data-id="52" data-name="牡丹江">牡丹江</a>'
		+ '		<a href="javascript:;" data-code="NJ" data-id="56" data-name="南京">南京</a>'
		+ '		<a href="javascript:;" data-code="NT" data-id="61" data-name="南通">南通</a>'
		+ '		<a href="javascript:;" data-code="NB" data-id="70" data-name="宁波">宁波</a>'
		+ '		<a href="javascript:;" data-code="NC" data-id="163" data-name="南昌">南昌</a>'
		+ '		<a href="javascript:;" data-code="NN" data-id="207" data-name="南宁">南宁</a>'
		+ '	</dd>'
		+ '</dl>'
		+ '<dl class="city_down_list">'
		+ '	<dt>P-T</dt>'
		+ '	<dd>'
		+ '		<a href="javascript:;" data-code="QZ" data-id="76" data-name="衢州">衢州</a>'
		+ '		<a href="javascript:;" data-code="QD" data-id="175" data-name="青岛">青岛</a>'
		+ '		<a href="javascript:;" data-code="QY" data-id="201" data-name="清远">清远</a>'
		+ '		<a href="javascript:;" data-code="QQHE" data-id="44" data-name="齐齐哈尔">齐齐哈尔</a>'
		+ '		<a href="javascript:;" data-code="QZ" data-id="158" data-name="泉州">泉州</a>'
		+ '		<a href="javascript:;" data-code="RZ" data-id="184" data-name="日照">日照</a>'
		+ '		<a href="javascript:;" data-code="SH" data-id="9" data-name="上海">上海</a>'
		+ '		<a href="javascript:;" data-code="SZ" data-id="60" data-name="苏州">苏州</a>'
		+ '		<a href="javascript:;" data-code="SX" data-id="74" data-name="绍兴">绍兴</a>'
		+ '		<a href="javascript:;" data-code="SJZ" data-id="89" data-name="石家庄">石家庄</a>'
		+ '		<a href="javascript:;" data-code="SZ" data-id="324" data-name="深圳">深圳</a>'
		+ '		<a href="javascript:;" data-code="SY" data-id="257" data-name="三亚">三亚</a>'
		+ '		<a href="javascript:;" data-code="SM" data-id="157" data-name="三明">三明</a>'
		+ '		<a href="javascript:;" data-code="SY" data-id="123" data-name="沈阳">沈阳</a>'
		+ '		<a href="javascript:;" data-code="ST" data-id="326" data-name="汕头">汕头</a>'
		+ '		<a href="javascript:;" data-code="SQ" data-id="68" data-name="宿迁">宿迁</a>'
		+ '		<a href="javascript:;" data-code="SR" data-id="173" data-name="上饶">上饶</a>'
		+ '		<a href="javascript:;" data-code="SYS" data-id="47" data-name="双鸭山">双鸭山</a>'
		+ '		<a href="javascript:;" data-code="TJ" data-id="14" data-name="天津">天津</a>'
		+ '		<a href="javascript:;" data-code="TY" data-id="100" data-name="太原">太原</a>'
		+ '		<a href="javascript:;" data-code="TCX" data-id="2118" data-name="腾冲">腾冲</a>'
		+ '		<a href="javascript:;" data-code="TZ" data-id="78" data-name="台州">台州</a>'
		+ '		<a href="javascript:;" data-code="TS" data-id="90" data-name="唐山">唐山</a>'
		+ '		<a href="javascript:;" data-code="TA" data-id="182" data-name="泰安">泰安</a>'
		+ '		<a href="javascript:;" data-code="TAZ" data-id="67" data-name="泰州">泰州</a>'
		+ '	</dd>'
		+ '</dl>'
		+ '<dl class="city_down_list">'
		+ '	<dt>W-Z</dt>'
		+ '	<dd>'
		+ '		<a href="javascript:;" data-code="WX" data-id="57" data-name="无锡">无锡</a>'
		+ '		<a href="javascript:;" data-code="WF" data-id="180" data-name="潍坊">潍坊</a>'
		+ '		<a href="javascript:;" data-code="WZ" data-id="71" data-name="温州">温州</a>'
		+ '		<a href="javascript:;" data-code="WH" data-id="81" data-name="芜湖">芜湖</a>'
		+ '		<a href="javascript:;" data-code="WLMQ" data-id="367" data-name="乌鲁木齐">乌鲁木齐</a>'
		+ '		<a href="javascript:;" data-code="WH" data-id="291" data-name="武汉">武汉</a>'
		+ '		<a href="javascript:;" data-code="WN" data-id="334" data-name="渭南">渭南</a>'
		+ '		<a href="javascript:;" data-code="XA" data-id="256" data-name="西安">西安</a>'
		+ '		<a href="javascript:;" data-code="XC" data-id="1979" data-name="西昌">西昌</a>'
		+ '		<a href="javascript:;" data-code="XSBN" data-id="244" data-name="西双版纳">西双版纳</a>'
		+ '		<a href="javascript:;" data-code="XGLLX" data-id="2210" data-name="香格里拉">香格里拉</a>'
		+ '		<a href="javascript:;" data-code="XN" data-id="354" data-name="西宁">西宁</a>'
		+ '		<a href="javascript:;" data-code="XG" data-id="40" data-name="香港">香港</a>'
		+ '		<a href="javascript:;" data-code="XM" data-id="155" data-name="厦门">厦门</a>'
		+ '		<a href="javascript:;" data-code="XT" data-id="310" data-name="湘潭">湘潭</a>'
		+ '		<a href="javascript:;" data-code="XT" data-id="93" data-name="邢台">邢台</a>'
		+ '		<a href="javascript:;" data-code="XY" data-id="333" data-name="咸阳">咸阳</a>'
		+ '		<a href="javascript:;" data-code="XZ" data-id="58" data-name="徐州">徐州</a>'
		+ '		<a href="javascript:;" data-code="YA" data-id="335" data-name="延安">延安</a>'
		+ '		<a href="javascript:;" data-code="YY" data-id="313" data-name="岳阳">岳阳</a>'
		+ '		<a href="javascript:;" data-code="YB" data-id="270" data-name="宜宾">宜宾</a>'
		+ '		<a href="javascript:;" data-code="YB" data-id="145" data-name="延边">延边</a>'
		+ '		<a href="javascript:;" data-code="YC" data-id="362" data-name="银川">银川</a>'
		+ '		<a href="javascript:;" data-code="YK" data-id="130" data-name="营口">营口</a>'
		+ '		<a href="javascript:;" data-code="YC" data-id="171" data-name="宜春">宜春</a>'
		+ '		<a href="javascript:;" data-code="YC" data-id="64" data-name="盐城">盐城</a>'
		+ '		<a href="javascript:;" data-code="YC" data-id="294" data-name="宜昌">宜昌</a>'
		+ '		<a href="javascript:;" data-code="YL" data-id="337" data-name="榆林">榆林</a>'
		+ '		<a href="javascript:;" data-code="YT" data-id="168" data-name="鹰潭">鹰潭</a>'
		+ '		<a href="javascript:;" data-code="YZ" data-id="65" data-name="扬州">扬州</a>'
		+ '		<a href="javascript:;" data-code="ZZ" data-id="309" data-name="株洲">株洲</a>'
		+ '		<a href="javascript:;" data-code="ZS" data-id="77" data-name="舟山">舟山</a>'
		+ '		<a href="javascript:;" data-code="ZH" data-id="325" data-name="珠海">珠海</a>'
		+ '		<a href="javascript:;" data-code="ZS" data-id="203" data-name="中山">中山</a>'
		+ '		<a href="javascript:;" data-code="ZJJ" data-id="315" data-name="张家界">张家界</a>'
		+ '		<a href="javascript:;" data-code="ZB" data-id="176" data-name="淄博">淄博</a>'
		+ '		<a href="javascript:;" data-code="ZZ" data-id="191" data-name="郑州">郑州</a>'
		+ '		<a href="javascript:;" data-code="ZZ" data-id="159" data-name="漳州">漳州</a>'
		+ '	</dd>'
		+ '</dl>';

	$('.js_all_city').append(chufa_city);

	//度假酒店分站切换读取
	if (/dujiaseolist/.test($('body').attr('id'))) {
		$('.Js_LISTFIRST').html('<p>热门出发城市</p>' + chufa_city);
		if (isNaN(fromDest) && fromDest) { //fromDest开发输出在页面
			$('.lv_city_box .lv_city').html(fromDest).attr('data-city-name', fromDest);
		}

	}



	//热门搜索
	var hot_city = '<dl class="city_down_list">'
		+ '<dt>国内</dt>'
		+ '<dd>'
		+ ' <a href="javascript:;" hidefocus="false">千岛湖</a>'
		+ ' <a href="javascript:;" hidefocus="false">北京</a>'
		+ ' <a href="javascript:;" hidefocus="false">普陀山</a>'
		+ ' <a href="javascript:;" hidefocus="false">黄山</a>'
		+ ' <a href="javascript:;" hidefocus="false">苏州</a>'
		+ ' <a href="javascript:;" hidefocus="false">杭州</a>'
		+ ' <a href="javascript:;" hidefocus="false">厦门</a>'
		+ ' <a href="javascript:;" hidefocus="false">三亚</a>'
		+ ' <a href="javascript:;" hidefocus="false">张家界</a>'
		+ ' <a href="javascript:;" hidefocus="false">桂林</a>'
		+ ' <a href="javascript:;" hidefocus="false">醉温泉</a>'
		+ ' <a href="javascript:;" hidefocus="false">丽江</a>'
		+ ' <a href="javascript:;" hidefocus="false">天目湖</a>'
		+ ' <a href="javascript:;" hidefocus="false">常州</a>'
		+ ' <a href="javascript:;" hidefocus="false">九寨沟</a>'
		+ ' <a href="javascript:;" hidefocus="false">无锡</a>'
		+ '</dd>'
		+ '</dl>'
		+ '<dl class="city_down_list">'
		+ '<dt>出境</dt>'
		+ '<dd>'
		+ ' <a href="javascript:;" hidefocus="false">邮轮</a>'
		+ ' <a href="javascript:;" hidefocus="false">香港</a>'
		+ ' <a href="javascript:;" hidefocus="false">韩国</a>'
		+ ' <a href="javascript:;" hidefocus="false">日本</a>'
		+ ' <a href="javascript:;" hidefocus="false">泰国</a>'
		+ ' <a href="javascript:;" hidefocus="false">柬埔寨</a>'
		+ ' <a href="javascript:;" hidefocus="false">长滩岛</a>'
		+ ' <a href="javascript:;" hidefocus="false">巴厘岛</a>'
		+ ' <a href="javascript:;" hidefocus="false">塞班岛</a>'
		+ ' <a href="javascript:;" hidefocus="false">马尔代夫</a>'
		+ ' <a href="javascript:;" hidefocus="false">毛里求斯</a>'
		+ ' <a href="javascript:;" hidefocus="false">欧洲</a>'
		+ ' <a href="javascript:;" hidefocus="false">美国</a>'
		+ ' <a href="javascript:;" hidefocus="false">澳大利亚</a>'
		+ ' <a href="javascript:;" hidefocus="false">迪拜</a>'
		+ ' <a href="javascript:;" hidefocus="false">土耳其</a>'
		+ '</dd>'
		+ '</dl>';

	$('.js_hot_city').append(hot_city);



	//酒店目的地
	var hotel_city = '<li style="display: block;">'
		+ '	<!--热门-->'
		+ '	<a href="javascript:;" data-id="9" hidefocus="false">上海</a>'
		+ '	<a href="javascript:;" data-id="56" hidefocus="false">南京</a>'
		+ '	<a href="javascript:;" data-id="57" hidefocus="false">无锡</a>'
		+ '	<a href="javascript:;" data-id="59" hidefocus="false">常州</a>'
		+ '	<a href="javascript:;" data-id="60" hidefocus="false">苏州</a>'
		+ '	<a href="javascript:;" data-id="65" hidefocus="false">扬州</a>'
		+ '	<a href="javascript:;" data-id="66" hidefocus="false">镇江</a>'
		+ '	<a href="javascript:;" data-id="67" hidefocus="false">泰州</a>'
		+ '	<a href="javascript:;" data-id="69" hidefocus="false">杭州</a>'
		+ '	<a href="javascript:;" data-id="70" hidefocus="false">宁波</a>'
		+ '	<a href="javascript:;" data-id="71" hidefocus="false">温州</a>'
		+ '	<a href="javascript:;" data-id="72" hidefocus="false">嘉兴</a>'
		+ '	<a href="javascript:;" data-id="73" hidefocus="false">湖州</a>'
		+ '	<a href="javascript:;" data-id="74" hidefocus="false">绍兴</a>'
		+ '	<a href="javascript:;" data-id="77" hidefocus="false">舟山</a>'
		+ '	<a href="javascript:;" data-id="78" hidefocus="false">台州</a>'
		+ '	<a href="javascript:;" data-id="79" hidefocus="false">丽水</a>'
		+ '	<a href="javascript:;" data-id="81" hidefocus="false">芜湖</a>'
		+ '	<a href="javascript:;" data-id="87" hidefocus="false">安庆</a>'
		+ '	<a href="javascript:;" data-id="149" hidefocus="false">巢湖</a>'
		+ '	<a href="javascript:;" data-id="152" hidefocus="false">池州</a>'
		+ '	<a href="javascript:;" data-id="154" hidefocus="false">福州</a>'
		+ '	<a href="javascript:;" data-id="155" hidefocus="false">厦门</a>'
		+ '	<a href="javascript:;" data-id="160" hidefocus="false">南平</a>'
		+ '	<a href="javascript:;" data-id="168" hidefocus="false">鹰潭</a>'
		+ '	<a href="javascript:;" data-id="173" hidefocus="false">上饶</a>'
		+ '	<a href="javascript:;" data-id="175" hidefocus="false">青岛</a>'
		+ '	<a href="javascript:;" data-id="322" hidefocus="false">广州</a>'
		+ '	<a href="javascript:;" data-id="324" hidefocus="false">深圳</a>'
		+ '	<a href="javascript:;" data-id="328" hidefocus="false">江门</a>'
		+ '	<a href="javascript:;" data-id="196" hidefocus="false">惠州</a>'
		+ '	<a href="javascript:;" data-id="200" hidefocus="false">阳江</a>'
		+ '	<a href="javascript:;" data-id="201" hidefocus="false">清远</a>'
		+ '	<a href="javascript:;" data-id="1820" hidefocus="false">阳西</a>'
		+ '	<a href="javascript:;" data-id="88" hidefocus="false">黄山</a>'
		+ '	<a href="javascript:;" data-id="138" hidefocus="false">吉林</a>'
		+ '</li>'
		+ '<li>'
		+ '	<!--ABCD-->'
		+ '	<a href="javascript:;" data-id="276" hidefocus="false">阿坝藏族羌族自治州</a>'
		+ '	<a href="javascript:;" data-id="87" hidefocus="false">安庆</a>'
		+ '	<a href="javascript:;" data-id="41" hidefocus="false">澳门</a>'
		+ '	<a href="javascript:;" data-id="216" hidefocus="false">百色</a>'
		+ '	<a href="javascript:;" data-id="82" hidefocus="false">蚌埠</a>'
		+ '	<a href="javascript:;" data-id="94" hidefocus="false">保定</a>'
		+ '	<a href="javascript:;" data-id="236" hidefocus="false">保山</a>'
		+ '	<a href="javascript:;" data-id="211" hidefocus="false">北海</a>'
		+ '	<a href="javascript:;" data-id="13" hidefocus="false">北京</a>'
		+ '	<a href="javascript:;" data-id="230" hidefocus="false">毕节地区</a>'
		+ '	<a href="javascript:;" data-id="189" hidefocus="false">滨州</a>'
		+ '	<a href="javascript:;" data-id="97" hidefocus="false">沧州</a>'
		+ '	<a href="javascript:;" data-id="314" hidefocus="false">常德</a>'
		+ '	<a href="javascript:;" data-id="59" hidefocus="false">常州</a>'
		+ '	<a href="javascript:;" data-id="137" hidefocus="false">长春</a>'
		+ '	<a href="javascript:;" data-id="308" hidefocus="false">长沙</a>'
		+ '	<a href="javascript:;" data-id="149" hidefocus="false">巢湖</a>'
		+ '	<a href="javascript:;" data-id="258" hidefocus="false">成都</a>'
		+ '	<a href="javascript:;" data-id="96" hidefocus="false">承德</a>'
		+ '	<a href="javascript:;" data-id="152" hidefocus="false">池州</a>'
		+ '	<a href="javascript:;" data-id="114" hidefocus="false">赤峰</a>'
		+ '	<a href="javascript:;" data-id="146" hidefocus="false">滁州</a>'
		+ '	<a href="javascript:;" data-id="245" hidefocus="false">大理白族自治州</a>'
		+ '	<a href="javascript:;" data-id="124" hidefocus="false">大连</a>'
		+ '	<a href="javascript:;" data-id="48" hidefocus="false">大庆</a>'
		+ '	<a href="javascript:;" data-id="187" hidefocus="false">德州</a>'
		+ '	<a href="javascript:;" data-id="178" hidefocus="false">东营</a>'
		+ '	<a href="javascript:;" data-id="202" hidefocus="false">东莞</a>'
		+ '</li>'
		+ '<li>'
		+ '	<!--EFGH-->'
		+ '	<a href="javascript:;" data-id="303" hidefocus="false">恩施土家族苗族自治州</a>'
		+ '	<a href="javascript:;" data-id="327" hidefocus="false">佛山</a>'
		+ '	<a href="javascript:;" data-id="154" hidefocus="false">福州</a>'
		+ '	<a href="javascript:;" data-id="172" hidefocus="false">抚州</a>'
		+ '	<a href="javascript:;" data-id="169" hidefocus="false">赣州</a>'
		+ '	<a href="javascript:;" data-id="322" hidefocus="false">广州</a>'
		+ '	<a href="javascript:;" data-id="224" hidefocus="false">贵阳</a>'
		+ '	<a href="javascript:;" data-id="209" hidefocus="false">桂林</a>'
		+ '	<a href="javascript:;" data-id="43" hidefocus="false">哈尔滨</a>'
		+ '	<a href="javascript:;" data-id="221" hidefocus="false">海口</a>'
		+ '	<a href="javascript:;" data-id="92" hidefocus="false">邯郸</a>'
		+ '	<a href="javascript:;" data-id="336" hidefocus="false">汉中</a>'
		+ '	<a href="javascript:;" data-id="69" hidefocus="false">杭州</a>'
		+ '	<a href="javascript:;" data-id="80" hidefocus="false">合肥</a>'
		+ '	<a href="javascript:;" data-id="218" hidefocus="false">河池</a>'
		+ '	<a href="javascript:;" data-id="199" hidefocus="false">河源</a>'
		+ '	<a href="javascript:;" data-id="190" hidefocus="false">菏泽</a>'
		+ '	<a href="javascript:;" data-id="311" hidefocus="false">衡阳</a>'
		+ '	<a href="javascript:;" data-id="111" hidefocus="false">呼和浩特</a>'
		+ '	<a href="javascript:;" data-id="117" hidefocus="false">呼伦贝尔</a>'
		+ '	<a href="javascript:;" data-id="73" hidefocus="false">湖州</a>'
		+ '	<a href="javascript:;" data-id="136" hidefocus="false">葫芦岛</a>'
		+ '	<a href="javascript:;" data-id="63" hidefocus="false">淮安</a>'
		+ '	<a href="javascript:;" data-id="300" hidefocus="false">黄冈</a>'
		+ '	<a href="javascript:;" data-id="88" hidefocus="false">黄山</a>'
		+ '	<a href="javascript:;" data-id="292" hidefocus="false">黄石</a>'
		+ '	<a href="javascript:;" data-id="196" hidefocus="false">惠州</a>'
		+ '</li>'
		+ '<li>'
		+ '	<!--JKLM-->'
		+ '	<a href="javascript:;" data-id="170" hidefocus="false">吉安</a>'
		+ '	<a href="javascript:;" data-id="138" hidefocus="false">吉林</a>'
		+ '	<a href="javascript:;" data-id="174" hidefocus="false">济南</a>'
		+ '	<a href="javascript:;" data-id="181" hidefocus="false">济宁</a>'
		+ '	<a href="javascript:;" data-id="72" hidefocus="false">嘉兴</a>'
		+ '	<a href="javascript:;" data-id="328" hidefocus="false">江门</a>'
		+ '	<a href="javascript:;" data-id="75" hidefocus="false">金华</a>'
		+ '	<a href="javascript:;" data-id="106" hidefocus="false">晋中</a>'
		+ '	<a href="javascript:;" data-id="297" hidefocus="false">荆门</a>'
		+ '	<a href="javascript:;" data-id="299" hidefocus="false">荆州</a>'
		+ '	<a href="javascript:;" data-id="166" hidefocus="false">九江</a>'
		+ '	<a href="javascript:;" data-id="192" hidefocus="false">开封</a>'
		+ '	<a href="javascript:;" data-id="233" hidefocus="false">昆明</a>'
		+ '	<a href="javascript:;" data-id="249" hidefocus="false">拉萨</a>'
		+ '	<a href="javascript:;" data-id="340" hidefocus="false">兰州</a>'
		+ '	<a href="javascript:;" data-id="98" hidefocus="false">廊坊</a>'
		+ '	<a href="javascript:;" data-id="267" hidefocus="false">乐山</a>'
		+ '	<a href="javascript:;" data-id="238" hidefocus="false">丽江</a>'
		+ '	<a href="javascript:;" data-id="79" hidefocus="false">丽水</a>'
		+ '	<a href="javascript:;" data-id="62" hidefocus="false">连云港</a>'
		+ '	<a href="javascript:;" data-id="109" hidefocus="false">临汾</a>'
		+ '	<a href="javascript:;" data-id="186" hidefocus="false">临沂</a>'
		+ '	<a href="javascript:;" data-id="208" hidefocus="false">柳州</a>'
		+ '	<a href="javascript:;" data-id="351" hidefocus="false">陇南</a>'
		+ '	<a href="javascript:;" data-id="193" hidefocus="false">洛阳</a>'
		+ '	<a href="javascript:;" data-id="263" hidefocus="false">绵阳</a>'
		+ '	<a href="javascript:;" data-id="52" hidefocus="false">牡丹江</a>'
		+ '</li>'
		+ '<li>'
		+ '	<!--NOPQRS-->'
		+ '	<a href="javascript:;" data-id="163" hidefocus="false">南昌</a>'
		+ '	<a href="javascript:;" data-id="268" hidefocus="false">南充</a>'
		+ '	<a href="javascript:;" data-id="56" hidefocus="false">南京</a>'
		+ '	<a href="javascript:;" data-id="207" hidefocus="false">南宁</a>'
		+ '	<a href="javascript:;" data-id="160" hidefocus="false">南平</a>'
		+ '	<a href="javascript:;" data-id="61" hidefocus="false">南通</a>'
		+ '	<a href="javascript:;" data-id="285" hidefocus="false">南阳</a>'
		+ '	<a href="javascript:;" data-id="70" hidefocus="false">宁波</a>'
		+ '	<a href="javascript:;" data-id="162" hidefocus="false">宁德</a>'
		+ '	<a href="javascript:;" data-id="44" hidefocus="false">齐齐哈尔</a>'
		+ '	<a href="javascript:;" data-id="231" hidefocus="false">黔东南苗族侗族自治州</a>'
		+ '	<a href="javascript:;" data-id="91" hidefocus="false">秦皇岛</a>'
		+ '	<a href="javascript:;" data-id="175" hidefocus="false">青岛</a>'
		+ '	<a href="javascript:;" data-id="201" hidefocus="false">清远</a>'
		+ '	<a href="javascript:;" data-id="76" hidefocus="false">衢州</a>'
		+ '	<a href="javascript:;" data-id="184" hidefocus="false">日照</a>'
		+ '	<a href="javascript:;" data-id="157" hidefocus="false">三明</a>'
		+ '	<a href="javascript:;" data-id="257" hidefocus="false">三亚</a>'
		+ '	<a href="javascript:;" data-id="9" hidefocus="false">上海</a>'
		+ '	<a href="javascript:;" data-id="173" hidefocus="false">上饶</a>'
		+ '	<a href="javascript:;" data-id="323" hidefocus="false">韶关</a>'
		+ '	<a href="javascript:;" data-id="74" hidefocus="false">绍兴</a>'
		+ '	<a href="javascript:;" data-id="324" hidefocus="false">深圳</a>'
		+ '	<a href="javascript:;" data-id="123" hidefocus="false">沈阳</a>'
		+ '	<a href="javascript:;" data-id="89" hidefocus="false">石家庄</a>'
		+ '	<a href="javascript:;" data-id="60" hidefocus="false">苏州</a>'
		+ '	<a href="javascript:;" data-id="54" hidefocus="false">绥化</a>'
		+ '</li>'
		+ '<li>'
		+ '	<!--TUVWX-->'
		+ '	<a href="javascript:;" data-id="78" hidefocus="false">台州</a>'
		+ '	<a href="javascript:;" data-id="100" hidefocus="false">太原</a>'
		+ '	<a href="javascript:;" data-id="182" hidefocus="false">泰安</a>'
		+ '	<a href="javascript:;" data-id="67" hidefocus="false">泰州</a>'
		+ '	<a href="javascript:;" data-id="90" hidefocus="false">唐山</a>'
		+ '	<a href="javascript:;" data-id="42" hidefocus="false">台湾</a>'
		+ '	<a href="javascript:;" data-id="228" hidefocus="false">铜仁地区</a>'
		+ '	<a href="javascript:;" data-id="183" hidefocus="false">威海</a>'
		+ '	<a href="javascript:;" data-id="180" hidefocus="false">潍坊</a>'
		+ '	<a href="javascript:;" data-id="334" hidefocus="false">渭南</a>'
		+ '	<a href="javascript:;" data-id="71" hidefocus="false">温州</a>'
		+ '	<a href="javascript:;" data-id="119" hidefocus="false">乌兰察布</a>'
		+ '	<a href="javascript:;" data-id="367" hidefocus="false">乌鲁木齐</a>'
		+ '	<a href="javascript:;" data-id="57" hidefocus="false">无锡</a>'
		+ '	<a href="javascript:;" data-id="81" hidefocus="false">芜湖</a>'
		+ '	<a href="javascript:;" data-id="291" hidefocus="false">武汉</a>'
		+ '	<a href="javascript:;" data-id="256" hidefocus="false">西安</a>'
		+ '	<a href="javascript:;" data-id="354" hidefocus="false">西宁</a>'
		+ '	<a href="javascript:;" data-id="244" hidefocus="false">西双版纳傣族自治州</a>'
		+ '	<a href="javascript:;" data-id="121" hidefocus="false">锡林郭勒盟</a>'
		+ '	<a href="javascript:;" data-id="155" hidefocus="false">厦门</a>'
		+ '	<a href="javascript:;" data-id="301" hidefocus="false">咸宁</a>'
		+ '	<a href="javascript:;" data-id="321" hidefocus="false">湘西土家族苗族自治州</a>'
		+ '	<a href="javascript:;" data-id="295" hidefocus="false">襄樊</a>'
		+ '	<a href="javascript:;" data-id="298" hidefocus="false">孝感</a>'
		+ '	<a href="javascript:;" data-id="279" hidefocus="false">新乡</a>'
		+ '	<a href="javascript:;" data-id="93" hidefocus="false">邢台</a>'
		+ '	<a href="javascript:;" data-id="58" hidefocus="false">徐州</a>'
		+ '	<a href="javascript:;" data-id="40" hidefocus="false">香港</a>'
		+ '</li>'
		+ '<li>'
		+ '	<!--YZ-->'
		+ '	<a href="javascript:;" data-id="273" hidefocus="false">雅安</a>'
		+ '	<a href="javascript:;" data-id="179" hidefocus="false">烟台</a>'
		+ '	<a href="javascript:;" data-id="335" hidefocus="false">延安</a>'
		+ '	<a href="javascript:;" data-id="145" hidefocus="false">延边朝鲜族自治州</a>'
		+ '	<a href="javascript:;" data-id="64" hidefocus="false">盐城</a>'
		+ '	<a href="javascript:;" data-id="65" hidefocus="false">扬州</a>'
		+ '	<a href="javascript:;" data-id="200" hidefocus="false">阳江</a>'
		+ '	<a href="javascript:;" data-id="1820" hidefocus="false">阳西</a>'
		+ '	<a href="javascript:;" data-id="294" hidefocus="false">宜昌</a>'
		+ '	<a href="javascript:;" data-id="171" hidefocus="false">宜春</a>'
		+ '	<a href="javascript:;" data-id="362" hidefocus="false">银川</a>'
		+ '	<a href="javascript:;" data-id="130" hidefocus="false">营口</a>'
		+ '	<a href="javascript:;" data-id="337" hidefocus="false">榆林</a>'
		+ '	<a href="javascript:;" data-id="313" hidefocus="false">岳阳</a>'
		+ '	<a href="javascript:;" data-id="107" hidefocus="false">运城</a>'
		+ '	<a href="javascript:;" data-id="329" hidefocus="false">湛江</a>'
		+ '	<a href="javascript:;" data-id="315" hidefocus="false">张家界</a>'
		+ '	<a href="javascript:;" data-id="95" hidefocus="false">张家口</a>'
		+ '	<a href="javascript:;" data-id="159" hidefocus="false">漳州</a>'
		+ '	<a href="javascript:;" data-id="195" hidefocus="false">肇庆</a>'
		+ '	<a href="javascript:;" data-id="66" hidefocus="false">镇江</a>'
		+ '	<a href="javascript:;" data-id="191" hidefocus="false">郑州</a>'
		+ '	<a href="javascript:;" data-id="203" hidefocus="false">中山</a>'
		+ '	<a href="javascript:;" data-id="77" hidefocus="false">舟山</a>'
		+ '	<a href="javascript:;" data-id="325" hidefocus="false">珠海</a>'
		+ '	<a href="javascript:;" data-id="176" hidefocus="false">淄博</a>'
		+ '	<a href="javascript:;" data-id="226" hidefocus="false">遵义</a>'
		+ '</li>';

	$('.js_hotel_city').append(hotel_city);



});

try {
	if (window.console && window.console.log) {
		console.log("驴妈妈UED长期招聘资深前端工程师\n 一直都会是尚需一个名额的状态。\n");console.log('请将简历发送至fed@lvmama.com（ 邮件标题请以"姓名-应聘高级前端开发工程师-来自console"命名）');
	}
} catch (e) {}


//频道页首页底通 by dxl 15.7.8
(function() {

	var $body = $('body'),
		$bodyClass = $body.attr('class');

	if ($body.hasClass('home')) {
		//首页app
		// syFootApp();
	} else {

		//去除分销页面弹出
		if (/f.lvmama.com/.test(window.location.href)) return;

		//1000
		if (/ticket|around|destroute|abroad|liner|responsive/.test($bodyClass)) {
			//1200
			FootApp(1);
		}
	}

	// 频道页底通FootApp(); arguments > 0 则为1200px宽
	function FootApp() {
		var footAppCook = 'chanapp_cookie';
		// var $footDom = '<div class="footBar P800">'+
		//    '<div class="footBar-overlay"></div>'+
		//    '<div class="footBar-wrap">'+
		//        '<div class="footBar-lv"><span class="footBar-lv-mob"></span></div>'+
		//        '<em class="footBar-tit toBot">驴妈妈APP 下载送880元大礼包</em>'+
		//        '<p class="footBar-stit toTop">1元景点不限量,酒+景线路5折起,春游赏花3折起</p>'+
		//        '<div class="footBar-opt">'+
		//             '<div class="footBar-opt-overlay"></div>'+
		//            '<div class="footBar-opt-wei">'+
		//                '<em>扫描二维码，下载客户端</em>'+
		//                '<span class="footBar-sao"></span>'+
		//            '</div>'+
		//            '<div class="footBar-opt-app">'+
		//                '<a class="T3D T3dY an5s" href="https://itunes.apple.com/cn/app/id443926246?mt=8" target="_blank">iPhone下载</a>'+
		//                '<a class="T3D T3dY an5s" href="http://m.lvmama.com/rewrite/d.php" target="_blank">Android下载</a>'+
		//                '<a class="T3D T3dY an5s" href="https://itunes.apple.com/cn/app/id443926246?mt=8" target="_blank">iPad下载</a>'+
		//            '</div>'+
		//        '</div>'+
		//       ' <span class="footBar-close"></span>'+
		//    '</div>'+ 
		// '</div>';
		var $footDom = '<div class="footBar P800 w12">' +
			'<div class="syfootBar-overlay"></div>' +
			'<div class="syfootBar-wrap">' +
			'<a class="footBar-gnsyl-lv" href="http://www.lvmama.com/zt/promo/cjyoulun?losc=089761&ict=i" target="_blank"></a>' +
			'<a class="footBar-gnsyl_channel" href="http://www.lvmama.com/zt/promo/cjyoulun?losc=089761&ict=i" target="_blank">买国内送邮轮</a>' +
			'<div class="footBar-opt">' +
			'<div class="footBar-opt-overlay"></div>' +
			'<div class="footBar-opt-wei">' +
			'<em>扫描二维码，下载客户端</em>' +
			'<span class="footBar-sao"></span>' +
			'</div>' +
			'<div class="footBar-opt-app">' +
			'<a class="T3D T3dY an5s" href="https://itunes.apple.com/cn/app/id443926246?mt=8" target="_blank">iPhone下载</a>' +
			'<a class="T3D T3dY an5s" href="http://m.lvmama.com/rewrite/d.php" target="_blank">Android下载</a>' +
			'<a class="T3D T3dY an5s" href="https://itunes.apple.com/cn/app/id443926246?mt=8" target="_blank">iPad下载</a>' +
			'</div>' +
			'</div>' +
			'<span class="footBar-close"></span>' +
			'</div></div>';
		var arguLen = arguments.length;

		if (!$.xcookie.getCookie(footAppCook)) {
			setTimeout(function() {
				var $footBar;
				//先创建结构
				$body.append($footDom);
				$footBar = $('.footBar');
				//判断是否大屏
				arguLen > 0 && $footBar.addClass('w12');

				//500ms加动画
				setTimeout(function() {
					$footBar.addClass('open');
				}, 200);

				$('.footBar-close').click(function() {
					$footBar.fadeOut('fast', function() {
						$footBar.remove();
					});
					$.xcookie.setCookie(footAppCook, footAppCook, {
						path : '/',
						expires : 30,
						domain : 'lvmama.com'
					});
				});
			}, 5000);
		}
	} // end Fn:FootApp


	//首页底通
	function syFootApp() {
		var footAppCook = 'syappfoot_cookie_wy';
		var $footOpenDom = '<div class="syfootBarOpen"></div>';
		var $footDom = '<div class="syfootBar P800 w12">' +
			'<div class="syfootBar-overlay"></div>' +
			'<div class="syfootBar-wrap">' +
			'<a class="footBar-wy" href="javascript:;">五一大放价</a>' +
			'<a class="footBar-wy-lv" href="javascript:;">五一大放价</a>' +
			'<div class="footBar-opt">' +
			'<div class="footBar-opt-overlay"></div>' +
			'<div class="footBar-opt-wei">' +
			'<em>扫描二维码，下载客户端</em>' +
			'<span class="footBar-sao"></span>' +
			'</div>' +
			'<div class="footBar-opt-app">' +
			'<a class="T3D T3dY an5s" href="https://itunes.apple.com/cn/app/id443926246?mt=8" target="_blank">iPhone下载</a>' +
			'<a class="T3D T3dY an5s" href="http://m.lvmama.com/rewrite/d.php" target="_blank">Android下载</a>' +
			'<a class="T3D T3dY an5s" href="https://itunes.apple.com/cn/app/id443926246?mt=8" target="_blank">iPad下载</a>' +
			'</div>' +
			'</div>' +
			'<span class="footBar-close"></span>' +
			'</div></div>';

		// append
		setTimeout(function() {
			var $footBar;
			$body.append($footDom);
			$body.append($footOpenDom);
			$footBar = $('.syfootBar');
			$footBarOpen = $('.syfootBarOpen');

			$('.footBar-close').click(function() {
				$footBar.stop(true, true).animate({
					left : "-100%"
				}, 1000, function() {
					$footBarOpen.stop(true, true).animate({
						left : "0"
					}, 300);
				});
				$.xcookie.setCookie(footAppCook, footAppCook, {
					path : '/',
					expires : 7
				});
			});

			$('.syfootBarOpen').click(function() {
				$footBarOpen.stop(true, true).animate({
					left : "-123px"
				}, 300, function() {
					$footBar.stop(true, true).animate({
						left : "0"
					}, 1000);
				});
				$.xcookie.deleteCookie(footAppCook, footAppCook, {
					path : '/'
				});
			});

			if (!$.xcookie.getCookie(footAppCook)) {
				$footBar.css({
					"left" : 0
				});
			} else {
				$footBarOpen.css({
					"left" : 0
				});
			}

		}, 5000);
	} // end Fn:syFootApp

	// 全站加入大众广告位开始
	//var vwAdvertise  = '<div class="vwAdverBody">'+
	//				   '<a href="http://click.gridsumdissector.com/track.ashx?gsadid=gad_167_A2JFPIM4" target="_blank"><img src="http://pic.lvmama.com/img/v6/public/vwad/vwAdver200.jpg"></a>'+
	//	               '<span class="vwAdverClose">X</span>'+
	//                   '</div>'
	//$body.append(vwAdvertise)
	//$('.vwAdverClose').click(function() {
	//	$('.vwAdverBody').hide();
	//});
	// 全站加入大众广告位结束

})();

//顶通阿里AFP广告
$(function() {

	//$(".lv_topbar").after('<div class="lv_top_promotion"><a href="#" target="_blank"><img src="http://placehold.it/1200x60" alt=""></a><div class="lv_top_promotion_close"></div></div>');

	var $document = $(document);

	var lv_top_promotion_cookie_name = "lv_top_promotion";

	$document.on("click", ".lv_top_promotion_close", function() {
		$.xcookie.setCookie(lv_top_promotion_cookie_name, 'yes', {
			path : '/',
			expires : 7
		});
		$(".lv_top_promotion").remove();
	});

	var lv_top_promotion_cookie = $.xcookie.getCookie(lv_top_promotion_cookie_name);
	if (lv_top_promotion_cookie === 'yes') {
		$(".lv_top_promotion").remove();
	}

});

$(function() {
	// 详情页点评加losc  1.21上线,存活期1个月
	$("[id=xmy]").each(function() {
		var $This = $(this),
			$href = $This.attr('href');
		$This.attr('href', $href + '?losc=073073');
	});

	//导航链接losc跳转
	$('.lv_nav_l').on('click', 'a', function(ev) {
		var This = $(this),
			losc = This.attr('data-losc');
		if (losc) {
			ev.preventDefault();
			var target = This.attr('target');
			if (!target) {
				target = '_self';
			}
			var thisHref = This.attr('href');

			if (losc == '084223') {
				window.open(thisHref, target);
			} else {
				window.open(thisHref + '?losc=' + losc + '&ict=i', target);
			}
		}
	});


	//导航加losc
	/**/
	//菜单 2016国庆点评活动主站露出  下线时间10.25
	// if ($('.navCom_dpj').length <= 0) {
	// 	$('#lvyou>.down_nav p').append('<a href=\"http://www.lvmama.com/zt/promo/dianping10/\" class=\"navCom_dpj\" title=\"精华点评 返奖金\" target=\"_blank\"><img style=\"position:relative; top: 11px; vertical-align: top;\" src=\"http://pic.lvmama.com/img/v6/lv-bonus-icon.gif\"></a>');
	// }

	// //2016国庆点评活动主站露出 下线时间10.25
	//    var commentHD = '<a href=\"http://www.lvmama.com/zt/promo/dianping10/\" title=\"精华点评 返奖金\" target=\"_blank\" class=\"commentHd\"><img src=\"http://pic.lvmama.com/img/v6/lv-bonus-img.gif\" alt=\"精华点评多返20元\" class=\"ml10\"></a>';
	//    //详情页
	//    $('.com-btns').prepend(commentHD);

});


//左侧浮动广告
$(function() {
	var $body = $('body');
	var $bodyClass = $body.attr('class');
	var isNeeded = false;

	if (/abroad|responsive|destroute|around|ticket|hotel|zijia|liner|flight_gnjp|flight_fit|tuangou|custom|search_list|lvyou|dujia|d_list/.test($bodyClass)) {
		isNeeded = true;
	}

	if (/lvyou_lyb/.test($bodyClass)) {
		isNeeded = false;
	}

	if (isNeeded) {
		// channelFloat();
	}

	function channelFloat() {
		var html = '<div class="channel_float_l"><a class="channel_float_b"  target="_blank" href="http://www.lvmama.com/zt/promo/cjyoulun?losc=088604&ict=i"></a><a class="channel_float_s" target="_blank" href="http://www.lvmama.com/zt/promo/cjyoulun?losc=088604&ict=i"></a><span class="channel_float_close" title="关闭"></span></div>';
		$('body').append(html);
		$('.channel_float_close').live('click', function() {
			$(this).parent('.channel_float_l').remove();
		});
		var $channel_float_l = $('.channel_float_l'),
			$channel_float_b = $('.channel_float_b'),
			$channel_float_s = $('.channel_float_s');

		$channel_float_l.hover(function() {
			mousein();
		}, function() {
			mouseout();
		});
		function mouseout() {
			$channel_float_s.stop(true).animate({
				'width' : 0
			}, 400, function() {
				$channel_float_s.hide();
				$channel_float_l.css({
					'width' : 45
				});
			});
		}
		;
		function mousein() {
			$channel_float_l.css({
				'width' : 186
			});
			$channel_float_s.show().stop(true).animate({
				'width' : 167
			}, 400);
		}
		;
	}
});

//右侧浮动广告
// $(function(){
// 	var $body = $('body');
//     var $bodyClass = $body.attr('class');
//     var isNeeded = false;

// 	if(/liner/.test($bodyClass)){
//     	isNeeded = true;
// 	}

// 	if(isNeeded) {
// 		$(".app_right").hide();
// 		channelFloat();
// 	}

// 	function channelFloat(){
// 		var html = '<div class="channel_float_r"><span class="channel_float_rb"></span><span class="channel_float_rs"></span></div>';
// 		$('body').append(html);
// 		var $channel_float_r = $('.channel_float_r'),
// 			$channel_float_rb = $('.channel_float_rb'),
// 			$channel_float_rs = $('.channel_float_rs');

// 		$channel_float_r.hover(function(){
// 			mousein();
// 		},function(){
// 			mouseout();
// 		});
// 		function mouseout(){
// 			$channel_float_rs.stop(true).animate({
// 				'width':0
// 			},400,function(){
// 				$channel_float_rs.hide();
// 				$channel_float_r.css({'width':37});
// 			});
// 		};
// 		function mousein(){
// 			$channel_float_r.css({'width':187});
// 			$channel_float_rs.show().stop(true).animate({
// 				'width':167
// 			},400);
// 		};
// 	}
// });

/*
* lvmama焦点图插件
* 选取接口参数:c页面，p位置，s站点,cbf为callback
*调用方法如 $('#js_allyes_1').focusBanner({banName:"HOMEPAGE",p:"FOCUS",,width:1920,height:400,type:2});
* allapend 焦点图播放方式，默认为1,淡入淡出效果，设置为2时为连续滚动(即复制最后一张放到开头，配合程序实现无缝切换)
*/
(function($) {
	$.fn.extend({
		focusBanner : function(options) {
			var defaults = {
				placecode : "ALL", //分站
				url : ('https:' == document.location.protocol ? 'https://' : 'http://') + "www.lvmama.com/pet_topic/ad/queryAdInfos.do",
				banName : "HOMEPAGE", //页面
				p : "FOCUS", //位置
				width : 760,
				height : 325,
				scroll : false, //是否为滚动播放
				allapend : false, //是否一次性载入 (一次性载入则直接填充至调用对象内)
				tosrc : true, //是否预加载
				haslink : true //是否有链接
			}

			var options = $.extend(defaults, options);

			//遍历匹配元素的集合
			return this.each(function() {
				var o = options,
					$me = $(this),
					yjzfirst = !o.tosrc ? "src" : "to",
					yjz = !o.tosrc ? "src" : "js_to";
				$.ajax({
					url : o.url,
					type : 'GET',
					//dataType: 'json',
					dataType : "jsonp",
					jsonp : "cbf",
					//jsonpCallback: "jsonpCallback",
					data : 'c=' + o.banName + '&p=' + o.p + '&s=' + o.placecode,
					success : function(data) {
						var $oLi = "";
						if (!o.allapend) {
							//逐个li式填充
							$oLi = $me.find('li');

							//是否加链接
							if (!o.haslink) {
								$.each(data.adInfos, function(i) {
									if (i == 0) {
										$oLi.eq(i).append("<img " + "src=\"" + this.imgUrl + "\" width=\"" + o.width + "\" height=\"" + o.height + "\">");
									} else {
										$oLi.eq(i).append("<img " + yjz + "=\"" + this.imgUrl + "\" width=\"" + o.width + "\" height=\"" + o.height + "\">");
									}
								});
							} else {
								$.each(data.adInfos, function(i) {
									if (i == 0) {
										$oLi.eq(i).append("<a href=\"" + this.url + "\" target=\"_blank\"><img src=\"" + this.imgUrl + "\" width=\"" + o.width + "\" height=\"" + o.height + "\"></a>");
									} else {
										$oLi.eq(i).append("<a href=\"" + this.url + "\" target=\"_blank\"><img " + yjz + "=\"" + this.imgUrl + "\" width=\"" + o.width + "\" height=\"" + o.height + "\"></a>");
									}
								});
							}

							//无缝切换时
							o.scroll && $me.prepend("<li>" + $oLi.last().html().replace('js_to', 'src') + "</li>");
						} else {
							//一次性填充
							$.each(data.adInfos, function() {
								$oLi += "<a href=\"" + this.url + "\" target=\"_blank\"><img src=\"" + this.imgUrl + "\" width=\"" + o.width + "\" height=\"" + o.height + "\"></a>";
							});
							$me.append($oLi);
						}
					},
					error : function() {
						console.log("error");
					}
				});

			});
		}
	});
})(jQuery);

function addRightBottomWX(url) {
	$("#goTopBtn").before('<div class="rbtWxPart"><div class="rbtWxCode"><img width="92" height="92" src="' + url + '"></div><a id="rbtWeixin" target="_self" href="javascript:;" title="微信助手"></a></div>')
}