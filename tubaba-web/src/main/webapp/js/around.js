/*
* 周边频道页 @dxl
*/
(function(){

	//导航事件
	navChange();

	//焦点图	
	var $body = $('body');
	var placecode = $body.attr('allyes_city');
	
	
	var channelBanArgu = {
		tabbox : '.banTab',
		picBox : '.banPic',
		btns : '.banBox-btn',
		jdtWidth : 32
	};

	var tryInitPicScroll = setInterval(function(){

		var size = $("#js_allyes_1").children("li").length;
		if(size > 0){
			clearInterval(tryInitPicScroll);
			var channelBan = new picScroll(channelBanArgu);
		}

	}, 100);

	//自驾tab
	var zjyArgu = {
		nav : $('.zjy-tab>li'),
		content : $('.zjy-pro>ul')
	},
	zjyTab = new tabSlider(zjyArgu);
	
	/*
	* Fn picScroll() 频道页焦点图
	* 焦点图 参数以字面量对像传入
	* 使用方法 new一个实例
	*/
	function picScroll(o) {
		var tabbox = $(o.tabbox),
			picBox = $(o.picBox),
			btns = $(o.btns),
			doc = $(document),
	    	index = 0,
		    tabs = tabbox.find("span"),
		    pics = picBox.find("li"),
		    l = pics.length,
		    timer = null,
		    jd = 5000, //进度记录
		    isPlay = false, //判断是否在执行动画
		    jdtWidth = o.jdtWidth, //进度度
		    picWidth = picBox.parent().outerWidth(true); //获取图片宽度


		//复制最后一个节点到开头，并设置盒子宽度
		picBox.css({width:picWidth * (l+1) + "px",left:-picWidth + "px"}).prepend("<li>" + pics.last().html().replace('js_to','src') + "</li>");
		//picBox.css({width:picWidth * (l+1) + "px",left:-picWidth + "px"});
		autoPlay(); //默认播放

	    //状态显示及事件
	    pics.each( function (e) {
	        e == 0 ? tabbox.append('<span class="active"><i></i></span>') : tabbox.append("<span><i></i></span>") ;
	    });
	    tabs = tabbox.find("span");

	    tabs.each(function(e) {
	        var me = $(this);
	        me.hover(function (){
	        	//if (!isPlay) {
	        		clearTimeout(timer);
		            index = e;
		            showPic(e);
	        	//}
	        });
	    });

	    //按钮事件
	    doc.on('click',o.btns,function() {
	    	var me = $(this);
            var type = me.index() == 0 ? -1 : 1;
            clearTimeout(timer);
            if (!isPlay) {
               index = type > 0 ? (index + 1) : (index - 1);
               changeIndex(index);
               showPic(index);
            }
	    });


	    picBox.parent().hover(function(){
	    	clearTimeout(timer);
	    	btns.show();
	    },function() {
	    	btns.hide();
	    	autoPlay();
	    });

	    //处理图片加载
	    function setImg(obj, index) {
	        var indexImg = obj.eq(index).find('img');
	        var js_to = indexImg.attr('js_to');
	        var js_sc = indexImg.attr('js_sc');
	        
	        js_sc && (img = new Image().src = js_sc);
	      	js_to && indexImg.attr('src', js_to).removeAttr('js_to');
	    }

	    //自动播放及延迟加载
	    function autoPlay() {
	    	var img = new Image();
			var imgs = pics.eq(index).find('img');
			var imgSrc = imgs.size() > 0 ? ( imgs.attr('src') || imgs.attr('js_to')) : null;
			
			if(!imgSrc){
		    	clearTimeout(timer);
		    	setTimeout(autoPlay, 1000);
		    	return;
		    }
		    showPic(index);
		    
		    img.onload = function() {
				var tab_this = tabs.eq(index).find('i');
				var W = parseInt(tab_this.width());
				if(parseInt(tab_this.width())==jdtWidth){
					W = 0;
				}
				clearInterval(timer);
				timer = null;
				timer = setInterval(function(){
					W = W > jdtWidth ? W = jdtWidth : W+1;
					tab_this.css('width',W);
					if(W == jdtWidth){
						clearInterval(timer);
						tab_this.css('width',0);
						index +=1;
						changeIndex(index); //执行完毕自动执行下一张；
						autoPlay();
					}
				},jd/jdtWidth);
		    }
		    img.src=imgSrc;
	    }

	    //索引值判断且改变css，使图片连续
	    function changeIndex(i) {
	        index = i;
	        if (index == l) {
	            picBox.css({left : "0px"});
	            index = 0;
	        }
	    }

	    //图片滚动动画
	    function showPic (i) {
	        isPlay = true;
	        setImg(pics, i);
	        tabs.eq(index).addClass("active").siblings().removeClass("active").find('i').removeAttr('style');
	        picBox.stop(true,true).animate({left : -picWidth * (i+1)},500,function() {
	            isPlay = false;
	            if (i == -1) picBox.css({left : -l * picWidth});
	        });
	        index = i == -1 ? l - 1 : index;
	    }
	}//FN-picScroll End


	/*
	* Fn tabSlider()  tab切换方法 @Dxl
	* argument: nav,content,[hover],[fade]
	* 默认click切换显示隐藏,可选项值为true/false
	*/
    function tabSlider(o){
    	var nav = o.nav,
    		content = o.content;
    	if (o.fade) content.eq(0).show();

        nav.each(function(e){
            var me = $(this);
            if (o.hover) {
            	me.hover(function(){
            		play(me,content,e);	
            	});
            }else{
            	me.click(function(){
                   play(me,content,e);
                });
            }
        });

        //切换fn
        function play(b,c,i) {
        	//图片预加载
        		var indexImg = c.eq(i).find('img');
        			indexImg.each(function(){
        				var $me = $(this),
        				$js_to = $me.attr('to');
        				$js_to && $me.attr('src', $js_to).removeAttr('to');
        			});
	      		b.addClass("active").siblings().removeClass("active");
        	if(!o.fade) {
            	c.eq(i).show().siblings().hide();
        	}else{
        		//fadeIn
            	c.eq(i).stop(true,true).fadeIn().siblings().stop(true,true).fadeOut();
        	}
        }

    } //FN-tabSlider End


    /*
	* Fn navChange 导航事件
	* 功能：频道页导航切换事件
	*
	*/
	function navChange() {
		var channelNav = $(".channelNav"),
			hover = false,
			attrX = [],
			timer1 = null,
			timer2 = null,
			timer3 = null;
		
		channelNav.hover(function () {
			timer1 = setTimeout( function(){
				hover = true;
			},300);
		}, function () {
			$(this).find(".channelNav-list").removeClass("active");
			hover = false;
			clearTimeout(timer1);
		});

		$(".channelNav-list").hover(function (e) {
			var me = $(this),
				X = e.pageX,
				l = attrX.length,
				oldX = attrX[l - 5];
			if (hover == true && X <= oldX + 5) {
				hoverNav(me);
		        clearTimeout(timer3);
		        attrX = [];
			} else {
				clearTimeout(timer3);
				var me = $(this);
				timer2 = setTimeout(function (){
					hoverNav(me);
				},500);
			}	
		},function (){
			var me = $(this);
			timer3 = clearTimeout(function () {
				$(this).removeClass("active");
			},300);
			clearTimeout(timer2);
		});

		channelNav.mousemove(function(e) {
		    var X = e.pageX;
		    attrX.push(X);
		});

		function hoverNav(elm) {
			elm.addClass("active").siblings().removeClass("active");
		};
	} //Fn-navChange End

	//手风琴
	var $tourAroundLi = $('.tourAround-li>a');
	$tourAroundLi.hover(function(){
		var $me = $(this);
		$me.addClass('active').siblings().removeClass('active');
	});
	
})();

