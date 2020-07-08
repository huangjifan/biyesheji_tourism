//自动补全
(function($) {

	var nowChangeInput = null;

	function complete(options) {
		this.init(options);
	}
	complete.prototype = {
		init : function(options) {
			this.options = options;


			//创建自动补全div
			if ($(options.completeBox).length == 0) {
				$('body').append('<div class="' + options.completeBox.substring(1) + '"></div>');
			}


			//绑定事件
			this.events();

		},
		events : function() {
			var This = this,
				options = this.options,
				optajax = options.ajax,
				$input = options.self,
				sBtn = '#' + $input.attr('data-searchBtn');
			//document默认事件
			$(document).on('click', function() {
				for (var i = 0; i < options.autoHide.length; i++) {
					$('.' + options.autoHide[i]).hide();
				}
				;
			});

			var oldValue = options.oldValue;

			var s_input = $(options.oldInput);
			for (var i = 0; i < s_input.length; i++) {
				s_input.eq(i).attr('num', i);
				if (s_input.eq(i).val() == oldValue[i]) {
					s_input.eq(i).val(oldValue[i]);
				}
			}

			//键盘keydown
			var s_timer = null;
			//输入框focus
			$input.on('focus', function(e) {
				var $this = $(this),
					L = $this.offset().left + options.position.x,
					T = $this.offset().top + $this.outerHeight() + 1 + options.position.y;


				//鼠标获取焦点清除默认文字
				$this.removeClass('lv_s_error');
				for (var i = 0; i < oldValue.length; i++) {
					if ($this.val() == oldValue[i]) {
						$this.val('').css('color', '#333');
					}
				}
				$this.siblings('.js_s_input_hot').hide();
				$this.parents('.lv_s_all').addClass('search_light');


				//获取焦点设置补全位置
				$(options.completeBox).css({
					'left' : L,
					'top' : T,
					'width' : options.width
				});
				//设置当前input状态
				nowChangeInput = $this;

				//点击输入框自动补全
				var submitData = [],
					val = $.trim($this.val());

				//输入为空是回调
				if (typeof options.focusCall === 'function') {
					options.focusCall({
						'$this' : $this,
						'value' : val,
						'xy' : {
							'x' : L,
							'y' : T
						}
					});
				}

				//输入为空是回调
				if (typeof options.valueNullCall === 'function' && val == '') {
					options.valueNullCall({
						'$this' : $this,
						'value' : val,
						'xy' : {
							'x' : L,
							'y' : T
						}
					});
				}

				if (!val) {
					$(options.completeBox).hide();
					return;
				}

				//
				for (var i = 0; i < optajax.urldata.length - 1; i++) {
					var dataText = $this.attr('data-' + optajax.urldata[i]);
					submitData.push(dataText);
				}
				;
				//
				submitData.push(val);

			}).on('keyup', function(e) {

				var thisCode = e.keyCode,
					$this = $(this);

				if (thisCode == options.keyCode.up) {
					This.completeActive(-1, e);
				} else if (thisCode == options.keyCode.down) {
					This.completeActive(1, e);
				} else if (thisCode == options.keyCode.enter) { //回车搜索
					alert(123);
					console.log(options.keyCode);
				} else if (thisCode == options.keyCode.esc) { //退出之后选中输入框
					$(document).click();
				} else {
					clearTimeout(s_timer);
					//输入删除错误提示
					$this.removeClass(options.errorClassName);

				}
				;

			}).on('blur', function(e) {
				e.stopPropagation();
				var $This = $(this);
				var num = $This.attr('num');
				if ($This.val() == oldValue[num] || $(this).val() == '') {
					$This.val(oldValue[num]).css('color', '#bbb');
				} else {
					$This.css('color', '#333');
				}
				$This.siblings('.js_s_input_hot').show();
				$This.parents('.lv_s_all').removeClass('search_light');
			}).on('click', function(e) {
				e.stopPropagation();
			});
		},
	},

	$.fn.sComplete = function(options) {
		var defaults = {
			self : $(this),
			completeBox : '.s_complete_box', //自动补全盒子
			activeClassName : 'active', //补全选中名称
			errorClassName : 's_side_error', //错误提示class
			hotBox : '.ticket_search_hot',
			position : {
				x : 0,
				y : 0
			}, //自动补全偏移
			width : 646, //自动补全宽度
			delayTime : 100,
			oldInput : '.lv_s_input', //所有补全框的统一class，带点的哦
			oldValue : [ '请输入目的地、主题或景区名' ], //所有补全框的提示文字,个数和oldInput个数对应
			autoHide : [ 's_complete_box' ],
			keyCode : {
				'up' : 38,
				'down' : 40,
				'enter' : 13,
				'esc' : 27,
				'left' : 37,
				'right' : 39
			},
			ajax : {
				url : '#',
				callback : 'recive', //回调函数名
				urldata : [ 'type', 'keyword' ] //请求的url的参数
			},
			template : null, //自定义模板
			ajaxCall : null, //数据请求回调，可以获取请求的数据
			activeCall : null, //补全选中回调，可以获取选中的数据
			enterCall : null,
			focusCall : null,
			valueNullCall : null //输入框为空的回调
		};
		var newoptions = $.extend(true, defaults, options || {});
		new complete(newoptions);
	};
})(jQuery);

//搜索模块
$(function() {

	$(document).on('click', function(e) {
		$('.lv_s_city_all').removeClass('lv_city_list_show');
	});


	/*搜索城市展开*/
	$('.js_s_city_btn').bind('click', function(e) {
		e.stopPropagation();
		var $cityBox = $(this).siblings('.lv_s_city');
		if ($cityBox.is(':hidden')) {
			$(this).parent().addClass('s_city_show');
		} else {
			$(this).parent().removeClass('s_city_show');
		}
		;
	});



	//调用自动补全
	$('.js_ticket_input').sComplete({
		autoHide : [ 's_complete_box', 'ticket_search_hot' ],
		focusCall : function() {
			$('.lv_s_city_all').removeClass('lv_city_list_show');
		},
		valueNullCall : function(data) {
			var xy = data.xy;
			$('.ticket_search_hot').show().css({
				'left' : xy.x,
				'top' : xy.y
			});
		}
	});


	//点击热门文字
	$(document).on('click', '#ticket_search_history a', function(e) {
		var hotText = $(this).text(),
			thisInput = $('.js_ticket_input');
		thisInput.attr('value', hotText);
		$('#js_ticket_search').click();
	});

	$(document).on('click', '.lv_city_list_box', function(e) {
		e.preventDefault();
		e.stopPropagation();
	});

	//分站切换,字母切换
	$(document).on('click', '.lv_city_list_tab li', function(e) {
		e.preventDefault();
		e.stopPropagation();
		var num = $(this).index();
		$(this).addClass('active').siblings().removeClass('active');
		$(this).parent().siblings('.lv_city_list').find('li').eq(num).show().siblings().hide();
	});


	//点击分站切换
	$(document).on('click', '.js_station_city_btn', function(e) {
		e.preventDefault();
		e.stopPropagation();
		var $parent = $(this).parent();
		if ($parent.hasClass('lv_city_list_show')) {
			$parent.removeClass('lv_city_list_show');
		} else {
			$parent.addClass('lv_city_list_show');
		}
		;
		$('.ticket_search_hot').hide();
	});


	//分站选择城市
	$(document).on('click', '.lv_city_list a', function(e) {
		var cityName = $(this).text();
		$('.js_station_city_btn b').text(cityName);
		$('.lv_s_city_all').removeClass('lv_city_list_show');
		location.href="ticket?city="+cityName;
	});




	/*   //分站数据填充
	   $.ajax({
	       url: 'http://www.lvmama.com/lvyou/ajax/getDestNav',
	       type: 'GET',
	       dataType: 'jsonp',
	       success:function(data){
	           var error = data.error,
	               result = data.result;
	           //出错返回
	           if (error!=0) {
	               console.log('服务器错误，请求路径：http://www.lvmama.com/lvyou/ajax/getDestNav');
	               return;
	           };


	           var abc_arr = [
	               ['A','B','C','D'],
	               ['E','F','G','H'],
	               ['J','K','L','M'],
	               ['N','O','P','Q','R','S'],
	               ['T','U','V','W','X'],
	               ['Y','Z']
	           ];
	           var $station_city_box = $('.js_ticket_station_city'),
	               $station_city_tab = $station_city_box.find('.lv_city_list_tab'),
	               $station_city_list = $station_city_box.find('.lv_city_list'),
	               tabHtml = '',
	               listHtml = '';

	           //动态添加切换字母
	           for (var i = 0; i < abc_arr.length; i++) {
	               //tab内容
	               tabHtml += '<li>'+abc_arr[i].join('')+'<i class="ticket_icon"></i></li>';

	               var listLi = '<li>';

	               //遍历某一个tab的字母
	               for (var j = 0; j < abc_arr[i].length; j++) {
	                   
	                   var ddHtml = '';

	                   //遍历某一个tab的字母里的城市
	                   for (var k = 0; k < result.length; k++) {
	                       var thisResult = result[k];
	                       if (thisResult.pinyin.substring(0,1)==abc_arr[i][j].toLowerCase()) {
	                           ddHtml += '<a href="javascript:;" destId="'+thisResult.dest_id+'" parentDestId="'+thisResult.parent_id+'">'+thisResult.dest_name+'</a>';
	                       };
	                       
	                   };

	                   //如果某个字母没有数据，则不添加
	                   if (ddHtml) {
	                       listLi += '<dl class="lv_city_list_dl"><dt>'+abc_arr[i][j]+'</dt><dd>'+ddHtml+'</dd></dl>';
	                   };
	                   
	               };
	               
	               listHtml += listLi+'</li>';

	           };
	           //添加dom结构
	           $station_city_tab.append(tabHtml);
	           $station_city_list.append(listHtml);
	           //
	           
	           
	       }
	   });*/






});




///焦点图切换
(function(window, $, lv) {
	"use strict";

	function bannerRun(options) {
		this.init(options);
	}
	;

	bannerRun.prototype = {
		init : function(options) {
			//参数
			this.options = options;
			//索引值
			this.nowIndex = options.nowIndex;

			//定时器
			this.autotime = null;

			//是否自动播放
			if (options.autoPlay) {
				this.auto();
			}
			;

			//事件
			this.event();
		},
		event : function() {
			var self = this,
				options = self.options;

			//hover切换
			var tab = options.bannerBox + ' ' + options.bannerTab + ' ' + options.tabFindTag;
			$(document).on('mouseover', tab, function(e) {
				var $this = $(this),
					num = $this.index();
				//hover暂停
				clearInterval(self.autotime);

				if (options.runType == 1) {
					self.fade(num);
				}
				;

			}).on('mouseout', tab, function(e) {
				//离开启动定时器
				if (options.autoPlay) {
					self.auto();
				}
				;

			});


			//左右点击切换
			var btnl = options.bannerBox + ' ' + options.btnL;
			$(document).on('click', btnl, function(e) {
				self.nowIndex--;
				if (self.nowIndex < 0) {
					self.nowIndex = $(options.bannerBox).find(options.bannerList).find('li').length - 1;
				}
				;
				if (options.runType == 1) {
					self.fade(self.nowIndex);
				}
				;
			}).on('mouseover', btnl, function(e) {
				//hover暂停
				clearInterval(self.autotime);
			}).on('mouseout', btnl, function(e) {
				//离开启动定时器
				if (options.autoPlay) {
					self.auto();
				}
				;
			});

			//左右点击切换
			var btnr = options.bannerBox + ' ' + options.btnR;
			$(document).on('click', btnr, function(e) {
				self.nowIndex++;
				if (self.nowIndex >= $(options.bannerBox).find(options.bannerList).find('li').length) {
					self.nowIndex = 0;
				}
				;
				if (options.runType == 1) {
					self.fade(self.nowIndex);
				}
				;
			}).on('mouseover', btnr, function(e) {
				//hover暂停
				clearInterval(self.autotime);
			}).on('mouseout', btnr, function(e) {
				//离开启动定时器
				if (options.autoPlay) {
					self.auto();
				}
				;
			});


		},
		fade : function(num) {
			var self = this,
				options = self.options;
			this.nowIndex = num;
			$(options.bannerTab).find(options.tabFindTag).eq(num).addClass(options.tabActive).siblings().removeClass(options.tabActive);
			$(options.bannerBox).find(options.bannerList).find('li').eq(num).fadeIn().siblings().fadeOut();
		},
		auto : function() {
			var self = this,
				options = self.options;
			if (options.runType == 1) {
				self.autotime = setInterval(function() {
					self.nowIndex++;
					if (self.nowIndex >= $(options.bannerBox).find(options.bannerList).find('li').length) {
						self.nowIndex = 0;
					}
					;
					self.fade(self.nowIndex);
				}, options.autoTime);
			}
			;
		}
	}


	var defaults = {
		bannerBox : '.js_banner', //焦点外层
		bannerList : '.banner_list', //焦点图大图列表
		bannerTab : '.banner_list_tab', //切换tab列表
		tabFindTag : 'span', //tab列表子元素标签名
		tabActive : 'active', //选中的class
		btnL : '.btnL', //左边按钮
		btnR : '.btnR', //右边按钮
		nowIndex : 0, //初始化索引
		runType : 1, //切换类型，1渐变，2未开放
		autoPlay : true, //是否自动播放
		autoTime : 4000 //自动播放时间间隔
	};

	function banner(options) {
		var options = $.extend({}, defaults, options);
		return new bannerRun(options);
	}
	;

	lv.banner = banner;
	window.lv = lv;

})(window, jQuery, window.lv || {});




$(function() {

	//热搜景点显示两行
	$('.ticket_search_hot dd').eq(0).height(58);
	//焦点图切换
	lv.banner();
	//首屏左侧展开
	$(document).on('mouseover', '.main_top_type', function(e) {
		var num = $(this).index();
		if (num < 3) {
			$(this).addClass('active').siblings().removeClass('active');
			$('.top_type_show').find('.top_type_list').eq(num).show().siblings().hide();
		} else {
			e.preventDefault();
			e.stopPropagation();
			$(this).siblings().removeClass('active');
			$('.top_type_show').hide();
		}
		;
	});


	$(document).on('mouseover', '.main_top_l_all', function(e) {
		$('.top_type_show').show();
	});

	$(document).on('mouseleave', '.main_top_l_all', function(e) {
		$('.top_type_show').hide();
		$(this).find('.main_top_type').removeClass('active');
	});
	//返回顶部
	var $document = $(document);
		$document.on('click', '#goTopBtn', function(e) {
			$('body,html').animate({
				'scrollTop' : 0
			}, 300);
		});

});