/**
 * 
 */
(function() {
	function picScroll(o) {
		var tabbox = $(o.tabbox), picBox = $(o.picBox), btns = $(o.btns), doc = $(document), index = 0, tabs = tabbox
				.find("span"), pics = picBox.find("li"), l = pics.length, timer = null, jd = 5000, isPlay = false, jdtWidth = o.jdtWidth, picWidth = picBox
				.parent().outerWidth(true);
		picBox.css({
			width : picWidth * (l + 1) + "px",
			left : -picWidth + "px"
		}).prepend(
				"<li>" + pics.last().html().replace('js_to', 'src') + "</li>");
		picBox.css({
			width : picWidth * (l + 1) + "px",
			left : -picWidth + "px"
		});
		autoPlay();
		pics.each(function(e) {
			e == 0 ? tabbox.append('<span class="active"><i></i></span>')
					: tabbox.append("<span><i></i></span>");
		});
		tabs = tabbox.find("span");
		tabs.each(function(e) {
			var me = $(this);
			me.hover(function() {
				clearTimeout(timer);
				index = e;
				showPic(e);
			});
		});
		doc.on('click', o.btns, function() {
			var me = $(this);
			var type = me.index() == 0 ? -1 : 1;
			clearTimeout(timer);
			if (!isPlay) {
				index = type > 0 ? (index + 1) : (index - 1);
				changeIndex(index);
				showPic(index);
			}
		});
		picBox.parent().hover(function() {
			clearTimeout(timer);
			btns.show();
		}, function() {
			btns.hide();
			autoPlay();
		});
		function setImg(obj, index) {
			var indexImg = obj.eq(index).find('img');
			var js_to = indexImg.attr('js_to');
			var js_sc = indexImg.attr('js_sc');
			var to = indexImg.attr('to');
			var to_sc = indexImg.attr('to_sc');
			if (js_to) {
				indexImg.attr('src', js_to).removeAttr('js_to');
			}
			if (js_sc) {
				var img = new Image().src = js_sc;
				indexImg.removeAttr('js_sc');
			}
			if (to) {
				indexImg.attr('src', to).removeAttr('to');
			}
			if (to_sc) {
				var img = new Image().src = to_sc;
				indexImg.removeAttr('to_sc');
			}
		}
		function autoPlay() {
			var img = new Image();
			var imgs = pics.eq(index).find('img');
			var imgSrc = imgs.size() > 0 ? (imgs.attr('src') || imgs
					.attr('js_to')) : null;
			if (!imgSrc) {
				clearTimeout(timer);
				setTimeout(autoPlay, 1000);
				return;
			}
			showPic(index);
			img.onload = function() {
				var tab_this = tabs.eq(index).find('i');
				var W = parseInt(tab_this.width());
				if (parseInt(tab_this.width()) == jdtWidth) {
					W = 0;
				}
				clearInterval(timer);
				timer = null;
				timer = setInterval(function() {
					W = W > jdtWidth ? W = jdtWidth : W + 1;
					tab_this.css('width', W);
					if (W == jdtWidth) {
						clearInterval(timer);
						tab_this.css('width', 0);
						index += 1;
						changeIndex(index);
						autoPlay();
					}
				}, jd / jdtWidth);
			}
			img.src = imgSrc;
		}
		function changeIndex(i) {
			index = i;
			if (index == l) {
				picBox.css({
					left : "0px"
				});
				index = 0;
			}
		}
		function showPic(i) {
			isPlay = true;
			setImg(pics, i);
			tabs.eq(index).addClass("active").siblings().removeClass("active")
					.find('i').removeAttr('style');
			picBox.stop(true, true).animate({
				left : -picWidth * (i + 1)
			}, 500, function() {
				isPlay = false;
				if (i == -1)
					picBox.css({
						left : -l * picWidth
					});
			});
			index = i == -1 ? l - 1 : index;
		}
	}
	var channelBanArgu = {
		tabbox : '.banTab',
		picBox : '.banPic',
		btns : '.banBox-btn',
		jdtWidth : 32
	};
	var tryInitPicScroll = setInterval(function() {
		var size = $(".banPic").children("li").length;
		if (size > 0) {
			clearInterval(tryInitPicScroll);
			var channelBan = new picScroll(channelBanArgu);
		}
	}, 100);
})();
(function() {
	hotCity();
	navChange();
	var specialArgu = {
		nav : $('.specialOffer .JS_tab span'),
		content : $('.specialOffer .JS_content > div')
	}, specialTab = new tabSlider(specialArgu);
	var bigDestArgu = {
		nav : $('.bigDest-tab li'),
		content : $('.bigDest-content li'),
		hover : true,
		fade : true
	}, bigDestTab = new tabSlider(bigDestArgu);
	function tabSlider(o) {
		var nav = o.nav, content = o.content;
		if (o.fade)
			content.eq(0).show();
		nav.each(function(e) {
			var me = $(this);
			if (o.hover) {
				me.hover(function() {
					play(me, content, e);
				});
			} else {
				me.click(function() {
					play(me, content, e);
				});
			}
		});
		function play(b, c, i) {
			var indexImg = c.eq(i).find('img');
			indexImg.each(function() {
				var $me = $(this), $js_to = $me.attr('to');
				$js_to && $me.attr('src', $js_to).removeAttr('to');
			});
			b.addClass("active").siblings().removeClass("active");
			if (!o.fade) {
				c.eq(i).show().siblings().hide();
			} else {
				c.eq(i).stop(true, true).fadeIn().siblings().stop(true, true)
						.fadeOut();
			}
		}
	}
	function navChange() {
		var channelNav = $(".channelNav"), hover = false, attrX = [], timer1 = null, timer2 = null, timer3 = null;
		channelNav.hover(function() {
			timer1 = setTimeout(function() {
				hover = true;
			}, 300);
		}, function() {
			$(this).find(".channelNav-list").removeClass("active");
			hover = false;
			clearTimeout(timer1);
		});
		$(".channelNav-list")
				.hover(
						function(e) {
							var me = $(this), X = e.pageX, l = attrX.length, oldX = attrX[l - 5];
							if (hover == true && X <= oldX + 5) {
								hoverNav(me);
								clearTimeout(timer3);
								attrX = [];
							} else {
								clearTimeout(timer3);
								var me = $(this);
								timer2 = setTimeout(function() {
									hoverNav(me);
								}, 500);
							}
						}, function() {
							var me = $(this);
							timer3 = clearTimeout(function() {
								$(this).removeClass("active");
							}, 300);
							clearTimeout(timer2);
						});
		channelNav.mousemove(function(e) {
			var X = e.pageX;
			attrX.push(X);
		});
		function hoverNav(elm) {
			elm.addClass("active").siblings().removeClass("active");
		}
		;
	};
//	热门目的地与热门路线
	function hotCity() {
		$.ajax({
			url : "hotCity",
			type : "post",
			success : function(data) {
				console.log(data);
				var str = "";
				for (var i = 0; i < data.length; i++) {
					str += '<li onclick="">' + data[i].endpath + '</li>';
				}
				$("#patcyh").append(str);
				var bigDestArgu = {
						nav : $('.bigDest-tab li'),
						content : $('.bigDest-content li'),
						hover : true,
						fade : true
					}, bigDestTab = new tabSlider(bigDestArgu);
				str = "";
				//热款爆买
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
				$("#proList2").append(str);
			}
		});
	}
	;
	function subAndFilt(str) {
		var dd = str.replace(/<[^>]+>/g, ""); //截取html标签
		var dds = dd.replace(/&nbsp;/ig, ""); //截取空格等特殊标签
		return dds.substring(0, 150) + "...";
	}

})();
(function() {
	$(document).on('click', '.dujiaBody .proTab>li', function() {
		var This = $(this);
		if (This.hasClass('active'))
			return;
		var content = This.parents('.proTab').next('.JS_content').find('ul');
		This.addClass('active').siblings().removeClass('active');
		content.eq(This.index()).show().siblings().hide();
	});
})();