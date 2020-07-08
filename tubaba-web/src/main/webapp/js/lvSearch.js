/**
 * 布点统计出境国内数据
 */
function countData(text,callback) {

    var channel = null;
    var home = null;
    var homeName = "首页搜索框";
    var homeTitle = "首页搜索";
    var bodyClass = $("body").attr("class");
    if(bodyClass.indexOf("channelBody")!==-1){
        if(bodyClass.indexOf("abroad")!==-1){
            //出境
            channel = "abroad";
        }else if(bodyClass.indexOf("destroute")!==-1) {
            //国内
            channel = "destroute"
        }
    }
    if(bodyClass.indexOf("home")!==-1){
        home = "home";
    }

    //品类切换tab名称
    var $tab = $(".lv_s_tab li.active");
    var tabName = $tab.text().replace("◆","");

    if(home){
        //首页

        //类型
        var tabType = $tab.attr("data-type");
        var homeType = {
            FREETOUR: "自由行",
            GROUP: "跟团游",
            LOCAL: "当地游",
            TICKET: "景点门票",
            HOTEL: "度假国内",
            FLIGHT: "机票",
            TRAIN: "火车票",
            SHIP: "邮轮"
        };
        var homeTypeName = homeType[tabType];

        //模块
        var $main = $(".lv_s_list:visible");

        //出发地
        var $homeDeparture = $main.find(".lv_s_ipt>li:visible .lv_s_city_btn");
        var homeDepartureName = "全国出发";
        var homeDeparture = $homeDeparture.find("b").text();
        if(homeDeparture !== "") {
            homeDepartureName = homeDeparture;
        }

        switch (tabType) {
            case "FREETOUR":
                //自由行
                var $freeTourTab = $main.find(".lv_s_ipt_tab li.active");
                var freeTourTabName = $freeTourTab.text();
                if (freeTourTabName == "酒店+景点") {
                    freeTourTabName = "景酒";
                    cmCreateElementTag(homeTitle + "_" + homeTypeName + freeTourTabName + "_" +  text, homeName);
                }
                if (freeTourTabName == "机票+酒店") {
                    freeTourTabName = "机酒";
                    cmCreateElementTag(homeTitle + "_" + homeTypeName + freeTourTabName + "_" + homeDepartureName + "_" + text, homeName);
                }
                break;
            case "GROUP":
                //跟团游
                cmCreateElementTag(homeTitle + "_" + homeTypeName + "_" + homeDepartureName + "_" + text, homeName);
                break;
            case "LOCAL":
                //当地游
                cmCreateElementTag(homeTitle + "_" + homeTypeName + "_" + text, homeName);
                break;
            case "TICKET":
                //景点门票
                cmCreateElementTag(homeTitle + "_" + homeTypeName + "_" + text, homeName);
                break;
            case "HOTEL":

                //目的地
                var $searchDest = $(".js_searchDest");
                var searchDest =$searchDest.val();

                //关键字
                var $searchKeyword = $(".js_searchKeyword");
                var searchKeywordName = "空";
                var searchKeyword=$searchKeyword.val();
                if(searchKeyword!=="酒店名/商圈/地标" && searchKeyword!==""){
                    searchKeywordName =searchKeyword;
                }
                cmCreateElementTag(homeTitle + "_" + homeTypeName + "_" + searchDest+"_"+searchKeywordName, homeName);
                break;
            case"SHIP":
                //游轮
                cmCreateElementTag(homeTitle + "_" + homeTypeName + "_" + text, homeName);
                break;
        }

        setTimeout(function(){
            callback();
        },0);
    }else if(channel){
        //国内或出境
        //统计

        //出发地
        var departure = "全国出发";

        var $departure = $(".lv_s_list:visible .lv_s_city_btn b");
        if($departure.length>0){
            var departureText = $departure.text();
            if(departureText != "") {
                departure = departureText
            }
        }

        //搜索词text

        var channelName = "";
        if(channel === "abroad"){
            channelName = "出境频道页搜索框";
        }else if(channel === "destroute") {
            channelName = "国内频道页搜索框";
        }

        //统计代码
        cmCreateElementTag(tabName+"_"+departure+"_"+text, channelName);

        setTimeout(function(){
            callback();
        },0);
    }else{
        //暂不统计
        callback();
    }

}

var oldValue = ['请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题或景区名','城市/地区/区域','酒店名/商圈/地标','请输入邮轮公司、邮轮航线或出发港口','请输入你需要签证的国家、地区'],
	bodyClass = document.getElementsByTagName('body')[0].className,
    $completeInput = null;

	if(/abroad/.test(bodyClass)){//出境游
		 oldValue = ['请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入邮轮公司、邮轮航线或出发港口','请输入你需要签证的国家、地区','请输入目的地、主题或景区名'];
	}else if(/destroute/.test(bodyClass)){//国内游
		oldValue = ['请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题、或关键词'];
	}else if(/around/.test(bodyClass)){ //周边游
		oldValue = ['请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题或景区名','城市/地区/区域','(选填)酒店名/商圈/地标'];
	}else if(/sanya-index/.test(bodyClass)){//三亚频道
        oldValue = ['请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题或景区名'];
    }else if(/domestic-local-index/.test(bodyClass)){//当地游频道
        oldValue = ['请输入目的地、主题、或关键词','请输入目的地、主题、或关键词','请输入目的地、主题、或关键词'];
    }





(function ($) {
    var keys = { ESC: 27, TAB: 9, RETURN: 13, LEFT: 37, UP: 38, RIGHT: 39, DOWN: 40 };
    //搜索类型         全部   景点门票  自由行    跟团游    线路     游轮    酒店
    var searchType = ["ALL", "TICKET", "FREETOUR", "GROUP","LOCAL", "ROUTE", "SHIP", "HOTEL", "VISA"];
    var recommentListModel = "<li class=\"js_recom\"><a href='$href'><p>查看<b>$searchValue</b>$typeName</p></a></li>",
        matchListModel = "<li class=\"js_match\"><a href='$href' data-place='$searchPlace' title='$searchTitle'>$searchValue</a></li>",
        nodataModel = "<li class=\"complete_no\">找不到结果:<b>$searchKey</b></li>";
    var $elements,$activedElement,timeoutId;
    var querySelecter = { searchType: ".lv_s_tab", completeBox: ".complete_box", completeUl: ".complete_list", hotTips: ".search_hot_tips", fromPlace: ".lv_s_list" };
	
	var s_input = $('.lv_s_input');
	for(var i=0;i<s_input.length;i++){
		s_input.eq(i).attr('num',i);
		if(s_input.eq(i).val()==oldValue[i]){
			s_input.eq(i).val(oldValue[i]).css('color','#bbb');
		}
	}
	
	//鼠标失去焦点，恢复默认文字；
	s_input.bind("blur", function (e) {
		var $This = $(this);
		var num =$This.attr('num');
		if($This.val()==oldValue[num] || $(this).val()==''){
			$This.val(oldValue[num]).css('color','#bbb');
		}else{
			$This.css('color','#333');
		}
		$This.siblings('.js_s_input_hot').show();
		$This.parents('.lv_s_all').removeClass('search_light');
		//$(this).parents('.lv_s_td').removeAttr('style');
	}).bind("focus", function (e) {
		var $This = $(this);
		//鼠标获取焦点清除默认文字
		$This.removeClass('lv_s_error');
		for(var i=0;i<oldValue.length;i++){
			if($This.val()==oldValue[i]){
				$This.val('').css('color','#333');
			}
		}
		$This.siblings('.js_s_input_hot').hide();
		$This.parents('.lv_s_all').addClass('search_light');
		$('.ui-calendar').hide();
	});
	

    function Factory() {
        $elements = this;
        return new searchCompletenew();
    }

    //搜索按钮及回车事件公用跳转方法
    Factory.searchAndJump = function (datatype, cityid, place, triggerType) {
        datatype = (datatype == null || datatype == "undefined") ? $(querySelecter.searchType).find(".active").attr("data-type").toLowerCase() : datatype;
        //搜索参数
        var parameter = ($(querySelecter.searchType).find(".active").attr("data-parameter") || "").toUpperCase();
        //alert($(querySelecter.fromPlace).filter(":visible").find(".js_s_city_btn>b").attr("data-id"))
        //datatype = datatype.toLowerCase() == "all" ? "route" : datatype;//全部产品转换为线路
        cityid = (cityid == null || cityid == "undefined") ? $(querySelecter.fromPlace).filter(":visible").find(".js_s_city_btn>b").attr("data-id") : cityid;
		
		if(cityid == null || cityid == "undefined" ){
			
		}
		
        var $input = ($activedElement != null && $activedElement != "undefined") ? $activedElement : $(".search_type_box").find("input:visible");

        if($.trim($input.val())==''){
            $input.val('').focus();
            return;
        }
        
        place = (place == null || place == "undefined") ? encodeURIComponent($input.val()) : place;
        //分站ID
        var placeID = window.location.href.match(/K\d+/) ? window.location.href.match(/K\d+/)[0].replace("K", "") : $.xcookie.getCookie("_ip_city_place_id");
        //var placeID = $.xcookie.getCookie("_ip_city_place_id") ? $.xcookie.getCookie("_ip_city_place_id") : (window.location.href.match(/K\d+/) ? window.location.href.match(/K\d+/)[0].replace("K", "") : null);
        var url = "";
        //帐篷客特殊跳转
        if (place == "帐篷客" || place == "安吉帐篷客" || place == "zhangpengke") {
            if (datatype.toLowerCase() == "all" || datatype.toLowerCase() == "route") {
                var d = new Date();
                d.setDate(d.getDate() + 1);
                var d1month = d.getMonth() + 1;
                var d1 = d.getFullYear() + (d1month >= 10 ? d1month : ("0" + d1month)) + (d.getDate() >= 10 ? d.getDate() : ("0" + d.getDate()));
                d.setDate(d.getDate() + 1);
                var d2month = (d.getMonth() + 1);
                var d2 = d.getFullYear() + (d2month >= 10 ? d2month : ("0" + d2month)) + (d.getDate() >= 10 ? d.getDate() : ("0" + d.getDate()));
                url = "http://s.lvmama.com/hotel/U686C" + d1 + "O" + d2 + "?keyword=帐篷客&mdd=安吉,湖州,浙江";
                window.location.href = url;
                return;
            }
        }
        //帐篷客特殊跳转 end
		
        if (datatype.toLowerCase() != "ship" && datatype.toLowerCase() != "freetour") {
            if (cityid == null || cityid == "undefined" || datatype.toLowerCase() === "ticket" || $(querySelecter.fromPlace).filter(":visible").find('.js_s_city_btn').is(':hidden')){//门票不加出发地
                url = "http://s.lvmama.com/" + datatype + "/" + (placeID ? "K" + placeID : "") + "?keyword=" + place + (triggerType ? (triggerType == "button" ? "&k=0" : "&k=2") : "") + "#list";
			}else{
				url = "http://s.lvmama.com/" + datatype + "/H" + cityid + (placeID ? "K" + placeID : "") + parameter + "?keyword=" + place + (triggerType ? (triggerType == "button" ? "&k=0" : "&k=2") : "") + "#list";
			}
                
        }else if(datatype.toLowerCase() == "freetour"){
			var num = $(querySelecter.searchType).find(".active").index();
			if($(querySelecter.fromPlace).eq(num).find('.lv_s_city_all').is(':hidden') || cityid == null || cityid == "undefined"){
				url = "http://s.lvmama.com/scenictour/" + (placeID ? "K" + placeID : "") + "?keyword=" + place + "&k=1#list";	
			}else{
				url = "http://s.lvmama.com/freetour/H" + cityid + (placeID ? "K" + placeID : "") + "?keyword=" + place + "&k=1#list";
			}
		} else if(datatype.toLowerCase() == "visa"){  //签证暂时不走这里
			url = "http://s.lvmama.com/visa/?keyword=" + place;
		} else{
			url = "http://www.lvmama.com/youlun/line-" + place + ".html";
		}

		//跳转布点
		var text =$input.val();
        countData(text, function () {
            if (url != window.location.href) {
                window.location.href = url;
            }
            else {
                window.location.reload();//两次请求地址相同则强制刷新页面
            }
        })
    };

    //多次请求流规避
    function timeoutFn() {
        var fn = new searchCompletenew("none");
        fn.requestData();
    }

    function searchCompletenew(option) {
        if (option)
            return;
        this.initialize();
        return $elements;
    }

    searchCompletenew.prototype = {
        initialize: function () {
            var that = this;
            that.createContainer();
            that.bindEvent();
        },
        createContainer: function () {
            var html = "<div class=\"complete_box\" style=\"display:none\"><ul class=\"complete_list\"></ul></div>";
            if ($(querySelecter.completeBox).size() <= 0)
                $("body").append(html);
        },
        bindEvent: function () {
            var that = this;
            that.bindKeyupEvent();
            that.bindFoucsEvent();
            that.bindBlurEvent();
        },
        bindKeyupEvent: function () {
            var that = this;
            //$elements.unbind("keydown");
            $elements.bind("keydown", function (e) {//取消form的自动submit事件
                switch (e.which) {
                    case keys.RETURN:
                        e = e || window.event;
                        if (!e.preventDefault())
                            e.returnValue = false;
                        break;
                }
            });
            //$elements.unbind("keyup");
            $elements.bind("keyup", function (e) {
                switch (e.which) {
                    case keys.UP:
                        that.moveUp();
                        break;
                    case keys.DOWN:
                        that.moveDown();
                        break;
                    case keys.ESC:
                        $(querySelecter.completeBox).hide();
                        $(querySelecter.hotTips).hide();
                        break;
                    case keys.RETURN:
                        that.select(e); break;
                    default:
                        $(querySelecter.hotTips).hide();
                        clearTimeout(timeoutId);
                        timeoutId = setTimeout(timeoutFn, 300);
                        break;
                }
            });

        },
        bindFoucsEvent: function () {
            var that = this;

            $elements.bind("focus", function (e) {

				$('.s_city_show').removeClass('s_city_show');
                var target = e.target || window.event.srcElement;
                $activedElement = $(target);
                //设置自动完成列表层定位
                var UlPosition = { left: $activedElement.offset().left, top: $activedElement.offset().top + $activedElement.outerHeight() };
                var UlWidth = $activedElement.outerWidth();
				//邮轮补全宽度增加
                /*if ($(querySelecter.searchType).find(".active").attr("data-type").toUpperCase() === "SHIP") {
					UlWidth +=98;
				}*/
                $(querySelecter.completeBox).css({
                    width: UlWidth,
                    left: UlPosition.left,
                    top: UlPosition.top
                });
                //全部产品状态下显示热门搜索
                if (!that.hasValue() && $(querySelecter.searchType).find(".active").attr("data-type").toUpperCase() === "ALL")
                    $(querySelecter.hotTips).show();
                else {
                    $(querySelecter.hotTips).hide();
                    that.requestData();
                }

                //当前补全的对象，用于改变窗口计算补全位置
                $completeInput = $(this);
            });
			
			
			
            //$elements.unbind("click");
            $elements.bind("click", function (e) {
                that.cancelBubble(e);
            });
        },
        bindBlurEvent: function () { },
        bindMouseEvent: function () { },
        moveDown: function () {
            var that = this;
            if (!that.hasValue()) {
                return;
            }
            var $libox = $(querySelecter.completeUl);
            var $activeLi = $libox.find("li.active");
            $activeLi.size() > 0 ? ($activeLi.next().size() > 0 ? $activeLi.removeClass("active").next().addClass("active") : $activeLi.removeClass("active").siblings(":first").addClass("active")) : $libox.find("li:first").addClass("active");
            var $actived = $libox.find("li.active");
            if ($actived.hasClass("js_match"))
                $activedElement.val($actived.find("a").attr("data-place"));
        },
        moveUp: function () {
            var that = this;
            if (!that.hasValue()) {
                return;
            }
            var $libox = $(querySelecter.completeUl);
            var $activeLi = $libox.find("li.active");
            $activeLi.size() > 0 ? ($activeLi.prev().size() > 0 ? $activeLi.removeClass("active").prev().addClass("active") : $activeLi.removeClass("active").siblings(":last").addClass("active")) : $libox.find("li:last").addClass("active");
            var $actived = $libox.find("li.active");
            if ($actived.hasClass("js_match"))
                $activedElement.val($actived.find("a").attr("data-place"));
        },
        select: function (e) {
            var $activedLink = $(querySelecter.completeUl).find("li.active>a");
            if ($activedLink.size() > 0) {
                //回车布点
                var text = $activedLink.attr("title");

                //酒店+景点 搜索历史
                if($(".complete_box").is(".complete_box_scenictour")){
                    window.setSearchScenictourHistory(text);
                }

                countData(text, function() {
                    window.location.href = $activedLink.attr("href");
                });
            } else {
                //酒店+景点 搜索历史
                if($(".complete_box").is(".complete_box_scenictour")){
                    var inputText = $("#scenictour_from_places .lv_s_input").val();
                    window.setSearchScenictourHistory(inputText);
                }

                Factory.searchAndJump(null, null, null, "button");
            }
        },
        hasValue: function () {
            if ($.trim($activedElement.val()) === "")
                return false;
            else
                return true;
        },
        cancelBubble: function (e) {
            e = e || window.event;
            if (!e.stopPropagation())
                e.cancelBubble = true;
        },
        requestData: function () {//开始请求数据
            var that = this;
            var searchType = $(querySelecter.searchType).find(".active").attr("data-type").toLowerCase();
            if (!that.hasValue()) {
                $(querySelecter.completeBox).hide();
                if (!that.hasValue() && searchType === "all")
                    $(querySelecter.hotTips).show();
                return;
            }
            var ajaxurl = "http://s.lvmama.com/autocomplete/autoCompleteNew.do";
            if (searchType === "ship"){
                ajaxurl = "http://s.lvmama.com/autocomplete/lineShipAutocomplete.do";
			}else if (searchType === "visa"){
                ajaxurl = "http://s.lvmama.com/autocomplete/autoCompleteVisa.do";
			}
			
			var sType = searchType.toUpperCase();
			
			//处理首页自由行,展开为2个分类
			var num = $(querySelecter.searchType).find(".active").index();
			if(sType=='FREETOUR' && $(querySelecter.fromPlace).eq(num).find('.lv_s_city_all').is(':hidden')){ 
				sType = 'SCENICTOUR';
			}
			
			//补全数据请求
			$.ajax({
					url: ajaxurl,
					type: "post",
					dataType: "jsonp",
					jsonpCallback: "recive",
					data: "type=" + sType + "&keyword=" + $activedElement.val(),
					success: function (response) {
						that.dataBind(response);
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
						console.log("jsonpError:" + errorThrown);
					}
				});
				function recive(response) {
					
				}
			
        },
        dataBind: function (data) {//数据可视化
            if (!(typeof data === "object"))
                return;
            var html = "", url;
            var datatype = $(querySelecter.searchType).find(".active").attr("data-type").toLowerCase();
            var cityid = $(querySelecter.fromPlace).filter(":visible").find(".js_s_city_btn>b").attr("data-id");
            //搜索特殊参数
            var dataParameter = ($(querySelecter.searchType).find(".active").attr("data-parameter") || "").toUpperCase();
            console.log(dataParameter)
            //分站ID
            var placeID = window.location.href.match(/K\d+/) ? window.location.href.match(/K\d+/)[0].replace("K", "") : $.xcookie.getCookie("_ip_city_place_id");
            //拼接推荐位
            if (datatype === "all") {
                var recommendHtml = [];
                if (data.recommendList) {
                    $.each(data.recommendList, function (index, items) {
                        if (cityid == null || cityid == "undefined" || items.type.toLowerCase() === "ticket" || $(querySelecter.fromPlace).find('.js_s_city_btn').is(':hidden'))//门票不加出发地
                            url = "http://s.lvmama.com/" + items.type.toLowerCase() + "/" + (placeID ? "K" + placeID : "") + "?keyword=" + encodeURI(items.searchValue);
                        else
                            url = "http://s.lvmama.com/" + items.type.toLowerCase() + "/H" + cityid + (placeID ? "K" + placeID : "") + "?keyword=" + encodeURI(items.searchValue);
                        recommendHtml.push(recommentListModel.replace("$href", url).replace("$searchValue", items.searchValue).replace("$typeName", items.typeName));
                    });
                    html += recommendHtml.join('');
                }
            }
            //拼接补全位
            var matchHtml = [];
            if (data.matchList && datatype != "ship" && datatype != "visa" && datatype != "freetour") {
                $.each(data.matchList, function (index, items) {
                    if (cityid == null || cityid == "undefined" || items.type.toLowerCase() === "ticket"){//门票不加出发地
                        url = "http://s.lvmama.com/" + items.type.toLowerCase() + "/" + (placeID ? "K" + placeID : "") + "?keyword=" + encodeURI(items.searchValue) + "&k=1#list";
					}else{
                        //帐篷客特殊跳转
                        if (items.searchValue == "帐篷客" || items.searchValue == "安吉帐篷客" || items.searchValue == "zhangpengke") {
                            if (items.type.toLowerCase() == "all" || items.type.toLowerCase() == "route") {
                                var d = new Date();
                                d.setDate(d.getDate() + 1);
                                var d1 = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
                                d.setDate(d.getDate() + 1);
                                var d2 = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
                                url = "http://hotels.lvmama.com/list/%E5%B8%90%E7%AF%B7%E5%AE%A2%20%E5%AE%89%E5%90%89%E6%BA%AA%E9%BE%99%E8%8C%B6%E8%B0%B7%E5%BA%A6%E5%81%87%E9%85%92%E5%BA%97,%E5%AE%89%E5%90%89%E5%8E%BF.html?longitude=119.780578&latitude=30.746796&beginBookTime=" + d1 + "&endBookTime=" + d2 + "&parentId=686&searchId=169939";
                            }
                        }else{
                            //帐篷客特殊跳转 end

                            //普通跳转
                            url = "http://s.lvmama.com/" + items.type.toLowerCase() + "/H" + cityid + (placeID ? "K" + placeID : "") + dataParameter + "?keyword=" + encodeURI(items.searchValue) + "&k=1#list";
                            console.log(decodeURI(url))
						}
                    };
                    matchHtml.push(matchListModel.replace("$href", url).replace("$searchValue", items.searchValue.replace(new RegExp('(' + $activedElement.val() + ")", "g"), "<span>$1</span>")).replace("$searchPlace", items.searchValue).replace("$searchTitle", items.searchValue));
                });
                
            }else if(datatype === "freetour"){
				var num = $(querySelecter.searchType).find(".active").index();
				 $.each(data.matchList, function (index, items) {
						if($(querySelecter.fromPlace).eq(num).find('.lv_s_city_all').is(':hidden') || cityid == null || cityid == "undefined"){
							url = "http://s.lvmama.com/scenictour/" + (placeID ? "K" + placeID : "") + "?keyword=" + encodeURI(items.searchValue) + "&k=1#list";
							
						}else{
							url = "http://s.lvmama.com/" + items.type.toLowerCase() + "/H" + cityid + (placeID ? "K" + placeID : "") + "?keyword=" + encodeURI(items.searchValue) + "&k=1#list";
						}
						matchHtml.push(matchListModel.replace("$href", url).replace("$searchValue", items.searchValue.replace(new RegExp('(' + $activedElement.val() + ")", "g"), "<span>$1</span>")).replace("$searchPlace", items.searchValue).replace("$searchTitle", items.searchValue));
				 });
			}else if(datatype == "visa"){ //签证数据连接
				for(var i=0;i<data.length;i++){
					url = "http://s.lvmama.com/visa/?keyword=" + data[i]; 
					matchHtml.push(matchListModel.replace("$href", url).replace("$searchValue",data[i].replace(new RegExp('(' + $activedElement.val() + ")", "g"), "<span>$1</span>")).replace("$searchPlace", data[i]).replace("$searchTitle", data[i]));
				}
			}else{//邮轮数据连接
				for(var i=0;i<data.length;i++){
					url = "http://www.lvmama.com/youlun/line-" + data[i] + ".html"; 
					matchHtml.push(matchListModel.replace("$href", url).replace("$searchValue",data[i].replace(new RegExp('(' + $activedElement.val() + ")", "g"), "<span>$1</span>")).replace("$searchPlace", data[i]).replace("$searchTitle", data[i]));
				}
			}
			html += matchHtml.join('');
            if (html === "") {
                //html = nodataModel.replace("$searchKey", $activedElement.val());
                $(querySelecter.completeBox).hide();
                return;
            }

            $(querySelecter.completeBox).show().find(querySelecter.completeUl).html(html);
        }
    };
    $.fn.searchCompletenew = $.searchCompletenew = Factory;
}(jQuery));




/*$(function(){ 
	
	切换搜索分类
	$('.lv_s_tab li').click(function(){ 
		var num = $(this).index();
		$(this).addClass('active').siblings().removeClass('active');
		$(this).parent('.lv_s_tab').siblings('.lv_s_r').find('.lv_s_list').eq(num).show().siblings().hide();
		$('.s_city_show').removeClass('s_city_show');
	});
});*/


