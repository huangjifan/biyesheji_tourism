/**
 * 
 */
$(function() {
	city('周边游');city('自由行');
	activity(null);
	scenicway("跟团游");
	scenicway("自由行");
	title("跟团游");
	title("自由行");
	hotCityActivity();

	/*
	 *根据分类查询的函数中的value参数是分类名称
	 * */
	//根据周边游等分类查询热门城市
	function city(value) {
		$.ajax({
			url : "city",
			type : "post",
			data : {
				attractions : value
			},
			success : function(data) {
				var str = "";
				for (var i = 0; i < data.length && i <= 9; i++) {
					str += '<li><a '
						+ 'onclick="" '
						+ 'href="" '
						+ 'title="' + data[i].endpath + '" target="_blank">' + data[i].endpath + '</a></li>';
				}
				if (value = '跟团游')
					$("#mtclearfix").append(str);
				else if (value = "自由行")
					$("#ztclearfix").append(str);
			}
		});
	}
	;
	//	促销活动查询热门城市
	function hotCityActivity() {
		$.ajax({
			url : "hotCityActivity",
			type : "post",
			success : function(data) {
				var str = "";
				for (var i = 0; i < data.length; i++) {
					str += '<a onclick="changeClass(this)">' + data[i].endpath + '</a> '
				}
				$("#promotions-tab").append(str);
			}
		});
	}
	;

	//	促销活动中查询路线
	function activity(value) {
		if (value == '节后错峰')
			value = null;
		$.ajax({
			url : "activity",
			type : "post",
			data : {
				frompath : value,
			},
			success : function(data) {
				var str = "";
				for (var i = 0; i < data.length && i <= 6; i++) {
					str += '<li><a '
						+ 'class="proList-img" title=""'
						+ 'href="scenicway/tourRouteProductShow/'+data.id+'" target="_blank"><img '
						+ 'width="285" height="190"'
						+ 'src="' + data[i].scenicwayImage + '"></a>'
						+ '<a class="proList-tit"'
						+ 'title="' + data[i].way + data[i].description + '"'
						+ 'href="scenicway/tourRouteProductShow/'+data.id+'" target="_blank">'
						+ '<em class="proList-info-tag">' + data[i].attractions.atrtitle + '<span class="pro-tag-line">|</span>'
						+ '</em>' + subAndFilt(data[i].way + data[i].description)
						+ '</a>'
						+ '<p class="proList-info">'
						+ '<span class="proList-info-price"><dfn>'
						+ '<i>&yen;</i>' + data[i].floor_price
						+ '</dfn>起</span>'
						+ '</p></li>';
				}
				$("#proList").html(str);
			}
		});
	}
	;

	//	根据周边游等分类查询热门线路
	function scenicway(value) {
		$.ajax({
			url : "scenicway",
			type : "post",
			data : {
				attractions : value
			},
			success : function(data) {
				var str = "";
				for (var i = 0; i < data.length && i <= 6; i++) {
					str += '<li><a '
						+ 'class="proList-img" title="" '
						+ 'href="scenicway/tourRouteProductShow/'+data.id+'" target="_blank"><img '
						+ 'width="285" height="190"'
						+ 'src="' + data[i].scenicwayImage + '"></a>'
						+ '<p class="proList-info">'
						+ '<span class="proList-info-price fr"><dfn>'
						+ '<i>&yen;</i>' + data[i].floor_price
						+ '</dfn>起</span> <a '
						+ 'class="proList-tit" '
						+ 'title="' + data[i].way + data[i].description + '"'
						+ 'href="scenicway/tourRouteProductShow/'+data.id+'" target="_blank">' + subAndFilt(data[i].way + data[i].description)
						+ '</a>'
						+ '</p></li>';
				}
				if (value == '跟团游') {
					$("#proList3").html(str);
				} else if (value = "自由行") {
					$("#proList4").html(str);
				}

			}
		});
	}
	;
	//	根据周边游等分类查询热门主题
	function title(value) {
		$.ajax({
			url : "title",
			type : "post",
			data : {
				attractions : value
			},
			success : function(data) {
				var str = "";
				for (var i = 0; i < data.length; i++) {
					str += '<li><a '
						+ 'onclick="" '
						+ 'href="" '
						+ 'title="' + data[i].type + '" target="_blank">' + data[i].type + '</a></li>';
				}
				if (value == '跟团游') {
					$("#mtclearfix2").html(str);
				} else if (value = "自由行") {
					$("#ztclearfix2").html(str);
				}
			}
		});
	}
	;
	//切换搜索分类
	$('.lv_s_tab li').click(function() {
		var num = $(this).index();
		$(this).addClass('active').siblings().removeClass('active');
		$(this).parent('.lv_s_tab').siblings('.lv_s_r').find('.lv_s_list').eq(num).show().siblings().hide();
		$('.s_city_show').removeClass('s_city_show');
	});

	var oldValue = [ '请输入目的地、主题、或关键词', '请输入目的地、主题、或关键词', '请输入目的地、主题、或关键词', '请输入目的地、主题、或关键词', '请输入目的地、主题或景区名', '城市/地区/区域', '酒店名/商圈/地标', '请输入邮轮公司、邮轮航线或出发港口', '请输入你需要签证的国家、地区' ],
		bodyClass = document.getElementsByTagName('body')[0].className,
		$completeInput = null;

	if (/destroute/.test(bodyClass)) { //国内游
		oldValue = [ '请输入目的地、主题、或关键词', '请输入目的地、主题、或关键词', '请输入目的地、主题、或关键词' ];
	} else if (/around/.test(bodyClass)) { //周边游
		oldValue = [ '请输入目的地、主题、或关键词', '请输入目的地、主题、或关键词', '请输入目的地、主题或景区名', '城市/地区/区域', '(选填)酒店名/商圈/地标' ];
	} else if (/domestic-local-index/.test(bodyClass)) { //当地游频道
		oldValue = [ '请输入目的地、主题、或关键词', '请输入目的地、主题、或关键词', '请输入目的地、主题、或关键词' ];
	}
	var s_input = $('.lv_s_input');
	for (var i = 0; i < s_input.length; i++) {
		s_input.eq(i).attr('num', i);
		if (s_input.eq(i).val() == oldValue[i]) {
			s_input.eq(i).val(oldValue[i]).css('color', '#bbb');
		}
	}

	//鼠标失去焦点，恢复默认文字；
	s_input.bind("blur", function(e) {
		var $This = $(this);
		var num = $This.attr('num');
		if ($This.val() == oldValue[num] || $(this).val() == '') {
			$This.val(oldValue[num]).css('color', '#bbb');
		} else {
			$This.css('color', '#333');
		}
		$This.siblings('.js_s_input_hot').show();
		$This.parents('.lv_s_all').removeClass('search_light');
	//$(this).parents('.lv_s_td').removeAttr('style');
	}).bind("focus", function(e) {
		var $This = $(this);
		//鼠标获取焦点清除默认文字
		$This.removeClass('lv_s_error');
		for (var i = 0; i < oldValue.length; i++) {
			if ($This.val() == oldValue[i]) {
				$This.val('').css('color', '#333');
			}
		}
		$This.siblings('.js_s_input_hot').hide();
		$This.parents('.lv_s_all').addClass('search_light');
		$('.ui-calendar').hide();
	});


	//	搜索框定位
	$("#lv_s_city_btn").click(function() {
		if ($('#lv_s_city').css('display') === 'none') {
			$("#lv_s_city").show();
			$("#lv_s_city_btn").parent().addClass("s_city_show");
			$("#lv_s_city").focus();
		} else {

			$("#lv_s_city").hide();
		}
	});
	$("#lv_s_city").blur(function() {
		$("#lv_s_city_btn").parent().removeClass("s_city_show");
		$("#lv_s_city").hide();
	})
	//城市点击定位
	createTag = function(doc) {
		$("#lv_s_city_btn").children()[1].innerHTML = doc.innerHTML;
		$("#lv_s_city").hide();
	}
	$(".lv_s_tab li").click(function() {
		if (this.innerText.indexOf('当地游') >= 0) {
			$("#lv_s_td").hide();
		} else {
			$("#lv_s_td").show();
		}
	});

	//	改变节点点击之后的样式
	changeClass = function(doc) {
		$(doc).attr("class", "active");
		for (var i = 0; i < $(doc).siblings().length; i++) {
			$($(doc).siblings()[i]).removeAttr("class");
		}
		activity(doc.innerHTML);
	}

	//	过滤html标签，截取字符串
	function subAndFilt(str) {
		var dd = str.replace(/<[^>]+>/g, ""); //截取html标签
		var dds = dd.replace(/&nbsp;/ig, ""); //截取空格等特殊标签
		return dds.substring(0, 200) + "...";
	}
	//输入框回车事件
	$("#js_s_inputw_611").keydown(function() {
		var e = event || window.event || arguments.callee.caller.arguments[0];
		if (e && e.keyCode == 13) {
			if($("#js_s_inputw_611").val().trim()!=''){
				alert(3123123);
			}else{
				$("#js_s_inputw_611").val('');
			}
		}
	});
	
	//搜索点击事件
	$("#lv_s_search_btn").click(function() {
		var scope='';
		$(".lv_s_tab li").each(function(i, element) {
			if($(this).hasClass("active")){
				scope=$(this).children("span").html();
			}
		})
		if($("#js_s_inputw_611").val().trim()!='请输入目的地、主题、或关键词'){
			var key=$("#js_s_inputw_611").val().trim(),
			frompath=$("#lv_s_city_btn b").text();
			location.href='search?key='+key+'&fromPath='+frompath+'&scope='+scope;
		}else{
			$("#js_s_inputw_611").val('请输入目的地、主题、或关键词');
			$("#js_s_inputw_611").css('color', '#333');
		}
	});
});