//封推图片坐标
var imageIndex = 0;
//浏览器跟旅游计划相差距离
var distance = 100;
$(function(){
	pullDown();
	loadIndexAdvertising();
	loadHotBotScenic();
	//loadHotBotHotelScenic();
	loadDomesticTourismProduct();
	loadGettingAroundPlanProduct();
	advertisingImageCarousel();
});
/**
 * 浏览器下拉执行的操作
 * @param 无
 * @returns 无
 */
function pullDown(){
	var wh,ph,mh,upMh;
	wh = $(window).height();    //浏览器窗口高度
	upMh = 0;
	//mh = $(".public.clearfix").css("height");
	var LeftFloatingNavigation = $(".nav-left");
	var travelPlan = $(".public.clearfix");
	var i = 0;
	//浏览器下拉事件
	$(window).scroll(function(){
		ph = $(this).scrollTop();   //页面滚动的高度
		//console.log("页面滚动的高度:"+ph);
		//浏览器下拉400px 才显示左侧导航
		if(ph >= 400){
			LeftFloatingNavigation.show();
			//旅游计划已下拉完毕
			if(i >= $(travelPlan).length){
				//console.log("旅游计划已下拉完毕。。。");
				i--;
				return;
			}
			//第i个旅游计划至顶部的高度
			mh = $($(travelPlan).get(i)).offset().top;
			//console.log("第"+i+"个旅游计划至顶部的高度:"+mh);
			//浏览器下拉ph-distance个px 左侧漂浮导航的第i个计划 增加active类
			if(ph >= mh -distance){
				//第1个不删除active类
				if(i > 0){
					$($("#leftFloatingNavigationClassify li").get(i-1)).removeClass("active");
				}
				$($("#leftFloatingNavigationClassify li").get(i)).addClass("active");
				upMh = mh;
				i++;
			}else{
				//console.log("upMh:"+upMh);
				//旅游计划已上拉完毕。。。
				if(i < 0){
					//console.log("旅游计划已上拉完毕。。。");
					i = 0;
					return;
				}
				if(ph < upMh -distance){
					//不给第0个增加active类
					if(i > 1){
						$($("#leftFloatingNavigationClassify li").get(i-1)).addClass("active");
						upMh = $($(travelPlan).get(i-1)).offset().top;
					}
					$($("#leftFloatingNavigationClassify li").get(i)).removeClass("active");
					i--;
				}
			}
		}else{
			LeftFloatingNavigation.hide();
		}
	});
}

//切换左侧漂浮导航
function changeLeftFloatingNavigationClassify(val){
	//console.log("切换左侧漂浮导航");
	h = $($(".public.clearfix").get(val)).offset().top - distance;
	console.log("val:"+val+",h:"+h);
	$("html,body").animate({scrollTop:h},'slow');
}
/**
 * 搜索框获取焦点 如果有要搜索的值 执行自动搜索方法
 * @param root 搜索框元素
 * @param defaultValue 默认值
 * @param scope 查询范围(0:所有 |1:景点门票 |2:酒店+景点 |3:跟团游 |4:自由行)
 * @returns 无
 */
function searchBoxOnFocus(root,defaultValue,scope){
	//console.log("搜索框获取焦点");
	//头部全部搜索的错误提示
	$(root).removeClass("empty");
	//景点门票搜索的错误提示
	$(root).removeClass("lv_s_error");
	//获取焦点时,并值为请输入目的地、主题、或关键词
	val = $(root).val();
	if(val == defaultValue){
		$(root).val("");
		$(root).css("color","rgb(51, 51, 51)");
		//console.log("val:"+val);
		return;
	}
	//console.log("val:"+val);
	findTravelPlanBySearchVal(scope,root);
}
//
/**
 * 搜索框失去焦点 如果鼠标不在搜索结果面板中就隐藏
 * @param root 搜索框元素
 * @param defaultValue 默认值
 * @param scope 查询范围(0:所有 |1:景点门票 |2:酒店+景点 |3:跟团游 |4:自由行)
 * @returns 无
 */
function searchBoxOnBlur(root,defaultValue,scope){
	//console.log("搜索框获取焦点");
	//console.log("val:"+$(root).val());
	val = $(root).val();
	if(val == ""){
		$(root).css("color","rgb(187, 187, 187)");
		$(root).val(defaultValue);
	}
	//隐藏按搜索框的值查找旅游计划结果面板
	hideFindTravelPlanBySearchValResult();
}
/**
 * 按搜索框的值查找旅游计划
 * @param scope 查询范围(0:所有 |1:景点门票 |2:酒店+景点 |3:跟团游 |4:自由行)
 * @param root 搜索框元素
 * @returns 无
 */
function findTravelPlanBySearchVal(scope,root){
	//console.log("按搜索框的值查找旅游计划");
	val = $(root).val();
	if(val==""){
		//隐藏按搜索框的值查找旅游计划结果面板
		hideFindTravelPlanBySearchValResult();
		return;
	}
	//city,cid 是 head.js中定义的
	//console.log("搜索的值是:"+val+",出发城市是:"+city+",出发城市编号是:"+cid+"要搜索的范围是:<"+scope+"> scope-查询范围(0:所有 |1:景点门票 |2:酒店+景点 |3:跟团游 |4:自由行)");
	showFindTravelPlanBySearchValResult(root,scope);
}
/**
 * 搜索框搜索
 * @param searchVal 要搜索的值
 * @param scope 查询范围(0:所有 |1:景点门票 |2:酒店+景点 |3:跟团游 |4:自由行)
 * @returns 无
 */
function searchBoxsearch(searchVal,scope){
	//city,cid 是 head.js中定义的
	console.log("搜索的值是:"+searchVal+",出发城市是:"+city+",出发城市编号是:"+cid+"要搜索的范围是:<"+scope+"> scope-查询范围(0:所有 |1:景点门票 |2:酒店+景点 |3:跟团游 |4:自由行)");
	location.href = "search?key="+searchVal+"&fromPath="+city+"&scope="+scope;
}
/**
 * 景点门票的搜索框搜索
 * @param 无
 * @returns 无
 */
function entranceTicketsSearchBoxSearch(){
	entranceTicketsSearchBox = $('#entranceTicketsPlate .lv_s_ipt.mt20 :visible :input');
	searchVal = entranceTicketsSearchBox.val();
	scope = entranceTicketsSearchBox.prev(".searchScope").text();
	if(searchVal =="请输入目的地、主题、或景区名" 
		|| searchVal =="请输入目的地、主题、或关键词" 
		|| searchVal == ""){
		entranceTicketsSearchBox.addClass("lv_s_error");
		entranceTicketsSearchBox.css("color","rgb(51, 51, 51)");
		return;
	}
	city = $("#currentCity").text();
	cid = $("#currentCity").attr("cid");
	searchBoxsearch(searchVal,3);
}
/**
 * 跟团游的搜索框搜索
 * @param 无
 * @returns 无
 */
function packageTourPlateSearchBoxSearch(){
	entranceTicketsSearchBox = $('#packageTourPlate .lv_s_input.js_s_input.w_310');
	searchVal = entranceTicketsSearchBox.val();
	scope = entranceTicketsSearchBox.prev(".searchScope").text();
	if(searchVal =="请输入目的地、主题、或景区名" 
		|| searchVal =="请输入目的地、主题、或关键词" 
		|| searchVal == ""){
		entranceTicketsSearchBox.addClass("lv_s_error");
		entranceTicketsSearchBox.css("color","rgb(51, 51, 51)");
		return;
	}
	city = $("#currentCity").text();
	cid = $("#currentCity").attr("cid");
	searchBoxsearch(searchVal,101);
}
/**
 * 当地有的搜索框搜索
 * @param 无
 * @returns 无
 */
function wxclubPlatePlateSearchBoxSearch(){
	entranceTicketsSearchBox = $('#wxclubPlate .lv_s_input.js_s_input.w_419');
	searchVal = entranceTicketsSearchBox.val();
	scope = entranceTicketsSearchBox.prev(".searchScope").text();
	if(searchVal =="请输入目的地、主题、或景区名" 
		|| searchVal =="请输入目的地、主题、或关键词" 
		|| searchVal == ""){
		entranceTicketsSearchBox.addClass("lv_s_error");
		entranceTicketsSearchBox.css("color","rgb(51, 51, 51)");
		return;
	}
	city = $("#currentCity").text();
	cid = $("#currentCity").attr("cid");
	searchBoxsearch(searchVal,103);
}
/**
 * 显示跟团游选择城市面板
 */
function showPackageTourPlateChangeCity(){
	//console.log("显示跟团游选择城市面板");
	$("#packageTourPlate .lv_s_city_all").addClass("s_city_show");
	$("#packageTourPlate .search-station-cities").focus();
	changeSearchBoxByLetterChangeCity($('#packageTourPlanLetter'),0);
}
/**
 * 隐藏跟团游选择城市面板
 */
function hidePackageTourPlateChangeCity(){
	//console.log("隐藏跟团游选择城市面板");
	$("#packageTourPlate .lv_s_city_all").removeClass("s_city_show");
}
/**
 * 跟团游的搜索框左侧的切换城市
 */
function packageTourPlatesearchBoxChangeCity(id,area){
	//console.log("跟团游的搜索框左侧的切换城市");
	searchBoxChangeCityCommonalityFunction($("#packageTourPlate .searchCurrentCity"),id,area);
	//隐藏跟团游的搜索框左侧的切换城市面板
	hidePackageTourPlateChangeCity();
}
/**
 * 显示按搜索框的值查找旅游计划结果面板
 * @param root 搜索框元素
 * @param scope 查询范围(0:所有 |1:景点门票 |2:酒店+景点 |3:跟团游 |4:自由行)
 * @returns 无
 */
function showFindTravelPlanBySearchValResult(root,scope){
	//清空上次搜索结果
	$("#searchResult .complete_list").html("");
	//console.log("显示按搜索框的值查找旅游计划结果面板");
	searchVal = $(root).val();
	//搜索全部
	if(scope == 0){
		$("#searchResult").addClass("complete_box_all");
		$("#searchResult").css({width: "462px", left: "614.5px", top: "88px"});
		$("#searchResult").show();
	}
	//搜索景点门票
	//else if(scope == 1){
	else{
		//console.log($(root).position().top+","+$(root).position().left);
		let atid = 1;
		if(scope == 1){
			$("#searchResult").css({width: "441px", left: "215.5px", top: "274px"});
			atid = 3;
		}else if(scope == 2){
			atid = 1;
			$("#searchResult").css({width: "441px", left: "215.5px", top: "274px"});
		}else if(scope == 3){
			atid = 1;
			$("#searchResult").css({width: "332px", left: "323.5px", top: "258px"});
		}else if(scope == 4){
			atid = 1;
			$("#searchResult").css({width: "441px", left: "215.5px", top: "274px"});
		}else if(scope == 6){
			atid = 1;
			$("#searchResult").css({width: "441px", left: "215.5px", top: "240px"});
		}
		$.ajax({
			url: "/scenic/searchBoxSelfMotion",
			data: {
				searchVal: searchVal,
			},
			dataType: "json",
			success: function(res){
				console.log("搜索框搜索返回结果:"+res);
				stratIndex = 0;
				addressList = res.addressList;
				for(i = 0;i < addressList.length & stratIndex < 10;i++){
					$("#searchResult .complete_list").append("<li class='js_match' onclick='selectFindTravelPlanBySearchValResult(\""+addressList[i].area+"\","+atid+")'><a><span>"+addressList[i].area+"<span></a></li>");
					stratIndex++;
				}
				scenicList = res.scenicList;
				for(i = 0;i < scenicList.length & stratIndex < 10;i++){
					$("#searchResult .complete_list").append("<li class='js_match' onclick='selectFindTravelPlanBySearchValResult(\""+scenicList[i].scenicname+"\","+atid+","+scenicList[i].id+")'><a><span>"+scenicList[i].scenicname+"<span></a></li>");
					stratIndex++;
				}
				titleList = res.titleList;
				for(i = 0;i < titleList.length & stratIndex < 10;i++){
					$("#searchResult .complete_list").append("<li class='js_match' onclick='selectFindTravelPlanBySearchValResult(\""+titleList[i].type+"\","+atid+")'><a><span>"+titleList[i].type+"<span></a></li>");
					stratIndex++;
				}
				//console.log(stratIndex);
				if(stratIndex == 0){
					hideFindTravelPlanBySearchValResult();
					return;
				}
				$("#searchResult").show();
			}	
		});
	}
}
/**
 * 隐藏按搜索框的值查找旅游计划结果面板
 * @param 无
 * @returns 无
 */
function hideFindTravelPlanBySearchValResult(){
	//console.log("隐藏按搜索框的值查找旅游计划结果面板");
	$("#searchResult").removeClass("complete_box_all");
	flag = $('#searchResultFlag').text();
	//console.log($('#searchResultFlag').text());
	//如果flag = true 说明 鼠标在结果面板中 就不隐藏结果面板
	if(flag == "false"){
		$("#searchResult").hide();
	}
}
/**
 * 选择按搜索框的值查找旅游计划结果的结果
 * @param scenicname 产品名称
 * @param scope 查询范围(0:所有 |1:景点门票 |2:酒店+景点 |3:跟团游 |4:自由行)
 * @returns 无
 */
function selectFindTravelPlanBySearchValResult(scenicname,scope,scenicId){
	console.log(scenicname);
	//$(root).val(scenicname);
	$('#searchResultFlag').text("false");
	hideFindTravelPlanBySearchValResult();
	console.log(scope);
	if(scope == 3 && scenicId != null){
		location.href="scenic?id="+scenicId+"&pageIndex=0";
		return;
	}
	searchBoxsearch(scenicname,scope);
}
/**
 * 加载热搜景点信息
 * @param 无
 * @return 无
 */
function loadHotBotScenic(){
	$.ajax({
		url: "/scenic/queryHotBotScenic",
		data:{
			rows: 1,
			size: 10
		},
		dataType: "json",
		success: function(res){
			list = res.data;
			console.log("查询热搜景点信息 "+list.length);
			if(res.total == 0){
				return;
			}
			temp = $($("#entranceTicketsPlate .lv_s_hot .lv_s_hot_list.hasRecom dd").get(0));
			//console.log(temp);
			//temp.append("<a>"+list[0].scenicname+"</a>");
			for(i = 0;i < list.length;i++){
				if(i < 2){
					temp.append("<a class='hot' href='scenic?id="+list[i].id+"&pageIndex=0' target='_blank'>"+list[i].scenicname+"</a>");
				}else{
					temp.append("<a href='scenic?id="+list[i].id+"&pageIndex=0' target='_blank'>"+list[i].scenicname+"</a>");
				}
			}
		}
	});
}
/**
 * 加载热搜酒店+景点
 */
function loadHotBotHotelScenic(){
	$.ajax({
		url: "/hotelScenic/queryHotBotHotelScenic",
		data:{
			rows: 1,
			size: 10
		},
		dataType: "json",
		success: function(res){
			list = res.data;
			console.log("查询热搜酒店+景点信息 "+list.length);
			if(res.total == 0){
				return;
			}
			temp = $($("#entranceTicketsPlate .lv_s_hot .lv_s_hot_list.hasRecom dd").get(1));
			for(i = 0;i < list.length;i++){
				if(i < 2){
					temp.append("<a class='hot' href='"+list[i].id+"' target='_blank'>"+list[i].introduce+"</a>");
				}else{
					temp.append("<a href='"+list[i].id+"' target='_blank'>"+list[i].introduce+"</a>");
				}
			}
		}
	});
}
/**
 * 广告图像轮播
 * @param 无
 * @returns 无
 */
function advertisingImageCarousel(){
	setInterval(() => {
		changePushSealingAdvertisingImage(imageIndex);
		imageIndex++;
		if(imageIndex > 1){
			imageIndex = 0;
		}
	}, 10000);
}
/**
 * 加载首页广告
 */
function loadIndexAdvertising(){
	$.ajax({
		url: "/advertising/queryAdvertisingByAdverclasId",
		dataType: "json",
		data: {
			adverclasId: 1,
		},
		success: function(res){
			console.log("加载首页广告成功");
			if(res.total == 0){
				return;
			}
			list = res.data;
			//顶部推荐
			advertisingOne = $("#pushSealingAdvertising .lv-ban-imgs");
			//景点门票下的景点门票
			entranceTicketsPlateOne = $($("#entranceTicketsPlate .lv_s_hot").get(0));
			//景点门票下的酒店+景点
			entranceTicketsPlateTwo = $($("#entranceTicketsPlate .lv_s_hot").get(1));
			//自由行下的酒店+景点
			freeWalkerPlateOne = $($("#freeWalkerPlate .lv_s_hot").get(0));
			//当地游
			wxclubPlateOne = $($("#wxclubPlate .lv_s_hot").get(0));
			//大促
			bigPromotionPlan = $("#bigPromotionPlan .tehuiBox.clearfix");
			//国内游
			domesticTourismPlan = $("#domesticTourismPlan .public-aside.fl");
			//周边游
			gettingAroundPlan = $("#gettingAroundPlan .public-aside.fl");
			//旅游攻略
			travelStrategyPlan = $("#travelStrategyPlan .gonlue-list.js_proList");
			//旅游攻略子分类坐标
			index = 0;
			//
			for(i = 0;i < list.length;i++){
				//console.log(list[i].adverclasId.id);
				//顶部推荐
				if(list[i].adverclasId.id == 101){
					advertisingOne.append("<li><a href='' target='_blank'><img src='"+list[i].img+"' height='400' width='1920'></img></a></li>");
				}
				//景点门票下的景点门票
				else if(list[i].adverclasId.id == 1201){
					entranceTicketsPlateOne.append("<a href='' target='_blank' class='lv_s_pic'><img src='"+list[i].img+"' height='65' width='440'></img></a>");
				}
				//景点门票下的酒店+景点
				else if(list[i].adverclasId.id == 1202){
					entranceTicketsPlateTwo.append("<a href='' target='_blank' class='lv_s_pic'><img src='"+list[i].img+"' height='65' width='440'></img></a>");
				}
				//自由行下的酒店+景点
				else if(list[i].adverclasId.id == 1401){
					freeWalkerPlateOne.append("<a href='' target='_blank' class='lv_s_pic'><img src='"+list[i].img+"' height='65' width='440'></img></a>");
				}
				//当地游
				else if(list[i].adverclasId.id == 105){
					wxclubPlateOne.append("<a href='' target='_blank' class='lv_s_pic'><img src='"+list[i].img+"' height='65' width='440'></img></a>");
				}
				//大促
				else if(list[i].adverclasId.id == 107){
					bigPromotionPlan.css("background","url("+list[i].img+") no-repeat");
				}
				//国内游
				else if(list[i].adverclasId.id == 108){
					domesticTourismPlan.append("<a href='' target='_blank' class='asideLink'><img src='"+list[i].img+"' height='265' width='222'></img></a>");
				}
				//周边游
				else if(list[i].adverclasId.id == 109){
					gettingAroundPlan.append("<a href='' target='_blank' class='asideLink'><img src='"+list[i].img+"' height='265' width='222'></img></a>");
				}
				//旅游攻略
				else if(list[i].adverclasId.upid == 110){
					//console.log(travelStrategyPlan);
					//console.log(list[i].adverclasId.id);
					if(list[i].index == 0){
						trli = $(travelStrategyPlan.get(index++));
						trli.find(".gonlue-pic.fl").append("<a href='' target='_blank' class='asideLink'><img src='"+list[i].img+"' height='322' width='464'></img></a>");
					}else{
						trli = $(travelStrategyPlan.get(index-1));
						trli.find(".gonlue-other.css3_liy-5.css3_run.fr").append("<li><a href='' target='_blank'><img src='"+list[i].img+"' width='222' height='94'></img><span class='gonlue-other-opa'></span></a></li>");
					}
				}
			}
			$(advertisingOne.children("li").get(0)).addClass("active");
			$(entranceTicketsPlateOne.children(".lv_s_pic").get(0)).show();
			$(entranceTicketsPlateTwo.children(".lv_s_pic").get(0)).show();
			$(freeWalkerPlateOne.children(".lv_s_pic").get(0)).show();
			$(wxclubPlateOne.children(".lv_s_pic").get(0)).show();
		}
	});
}
/**
 * 切换封推广告图片
 * @param num 第几个广告
 * @return 无
 */
function changePushSealingAdvertisingImage(num){
	imageIndex = num;
	//console.log("切换封推广告图片 "+num);
	li = $("#pushSealingAdvertising .lv-ban-imgs li");
	li2 = $("#pushSealingAdvertising .lv-ban-tab li");
	for(i = 0;i < li.length;i++){
		if(i == num){
			$(li.get(i)).addClass("active");
			$(li2.get(i)).addClass("active");
		}else{
			$(li.get(i)).removeClass("active");
			$(li2.get(i)).removeClass("active");
		}
	}
}

/**
 * 切换旅游分类
 * @param root 旅游分类元素
 * @param particulars 详情
 * @returns 无
 */
function changeTravelClassify(root,particulars){
	//console.log("切换旅游分类");
	ul = $(root).parent("ul");
	//console.log(ul);
	for(i = 0;i < ul.children("li").length;i++){
		//console.log(ul.children("li").get(i));
		if(ul.children("li").get(i) == root){
			//console.log(i);
			$(root).addClass("active");
			$(particulars.get(i)).show();
		}else{
			$(ul.children("li").get(i)).removeClass("active");
			$(particulars.get(i)).hide();
		}
	}
}
/**
 * 景点门票的切换子分类
 * @param num 第几个子分类
 * @returns 无
 */
function changeEntranceTicketsSubClassify(num){
	//console.log("景点门票的切换子分类");
	particulars = $('#entranceTicketsPlate .lv_s_hot');
	ul = $($("#entranceTicketsPlate ul").get(0));
	//console.log(ul);
	for(i = 0;i < ul.children("li").length;i++){
		if(i == num){
			//console.log(i);
			$(ul.children("li").get(i)).addClass("active");
			$(particulars.get(i)).show();
			$($(".lv_s_ipt.mt20 li").get(i)).show();
		}else{
			$(ul.children("li").get(i)).removeClass("active");
			$(particulars.get(i)).hide();
			//$($("#entranceTicketsPlate .lv_s_ipt.mt20").get(i)).show();
			$($(".lv_s_ipt.mt20 li").get(i)).hide();
		}
	}
}
/**
 * 自由行的切换子分类
 * @param num 第几个子分类
 * @returns 无
 */
function changeFreeWalkerSubClassify(num){
	//console.log("自由行的切换子分类 root-自由行的子分类元素");
	particulars = $('#freeWalkerPlate .lv_s_hot');
	ul = $($("#freeWalkerPlate ul").get(0));
	//console.log(ul);
	for(i = 0;i < ul.children("li").length;i++){
		//console.log(ul.children("li").get(i));
		if(i == num){
			//console.log(i);
			$(ul.children("li").get(i)).addClass("active");
			$(particulars.get(i)).show();
			if(i == 0){
				$(".clearfix.search-contents-combo").hide();
				$("#freeWalkerPlate .lv_s_search_btn").show();
				$($("#freeWalkerPlate .lv_s_ipt li").get(0)).show();
			}else if(i == 1){
				$(".clearfix.search-contents-combo").css("display", "list-item");
				$("#freeWalkerPlate .lv_s_search_btn").hide();
				$($("#freeWalkerPlate .lv_s_ipt li").get(0)).hide();
			}
		}else{
			$(ul.children("li").get(i)).removeClass("active");
			$(particulars.get(i)).hide();
		}
	}
}
/**
 * 切换特卖会模块子分类
 * @param num 第几个子分类
 * @return 无
 */
function changeSpecialOfferSubClassify(num){
	//console.log("切换特卖会模块子分类");
	li = $("#specialOfferPlan .JS_publicTab.public-sub li");
	//console.log(li);
	resultShow = $("#specialOfferPlan .css3_liy-5.css3_run.js_proList");
	changeSubClassifyCommonalityFunction(li,resultShow,num,false);
}
/**
 * 切换大促模块子分类
 * @param num 第几个子分类
 * @return 无
 */
function changeBigPromotionSubClassify(num){
	//console.log("切换大促模块子分类");
	li = $("#bigPromotionPlan .JS_publicTab.public-sub li");
	//console.log(li);
	resultShow = $("#bigPromotionPlan .css3_liy-5.css3_run.js_proList");
	changeSubClassifyCommonalityFunction(li,resultShow,num,false);
}
/**
 * 切换国内游模块子分类
 * @param num 第几个子分类
 * @param attractionsId 产品分类编号
 * @param startpath 出发城市
 * @return 无
 */
function changeDomesticTourismSubClassify(num,attractionsId,startpath){
	//console.log("切换国内游模块子分类 "+attractionsId+","+startpath);
	li = $("#domesticTourismPlan .JS_publicTab.public-sub li");
	//console.log(li);
	resultShow = $($("#domesticTourismPlan .css3_liy-5.css3_run.js_proList").get(num));
	//console.log(resultShow.children("li").size());
	//已经加载过了
	if(resultShow.children("li").size() != 0){
		changeSubClassifyCommonalityFunction(li,$("#domesticTourismPlan .css3_liy-5.css3_run.js_proList"),num,true);
		return;
	}
	$.ajax({
		url: "/scenicway/findScenicwayByAttractionsIdAndStartpathOrderByFeedback",
		dataType: "json",
		data: {
			attractionsId: attractionsId,
			startpath: startpath,
			rows: 1,
			size: 8
		},
		success: function(res){
			console.log("加载具体热门城市的路线");
			if(res.total == 0){
				return;
			}
			list = res.data;
			//$("#domesticTourismPlan .pro.fl.js_pro").append("<ul class='css3_liy-5 css3_run js_proList'></ul>");
			//resultShow =  $("#domesticTourismPlan .css3_liy-5.css3_run.js_proList");
			//console.log(resultShow);
			for(i = 0;i < list.length;i++){
				resultShow.append("<li><a target='_blank'>" +
					"<div class='pro-img'>" +
						"<img width='222' height='150' src='"+list[i].scenicimages[0].path+"'>" +
					"</div>" +
					"<div class='pro-info'>" +
						"<p class='pro-tit'>" +
							"<i class='pro-tag'>"+list[i].attractions.atrtitle+"</i>" +
							"<span class='pro-tag-line'>|</span>"+
							list[i].way +
						"</p>" +
						"<p class='pro-price'>" +
							"<span class='fr'>"+list[i].feedback.toFixed(2)+"%好评率</span>" +
							"<dfn><i>¥</i>"+list[i].floor_price+"</dfn>起"+
						"</p>"+
					"</div>"+
				"</a></li>");
			}
			changeSubClassifyCommonalityFunction(li,$("#domesticTourismPlan .css3_liy-5.css3_run.js_proList"),num,true);
		}
	});
}
/**
 * 切换周边游模块子分类
 * @param num 第几个子分类
 * @return 无
 */
function changeGettingAroundSubClassify(num){
	//console.log("切换周边游模块子分类");
	li = $("#gettingAroundPlan .JS_publicTab.public-sub li");
	//console.log(li);
	resultShow = $("#gettingAroundPlan .css3_liy-5.css3_run.js_proList");
	changeSubClassifyCommonalityFunction(li,resultShow,num,true);
}
/**
 * 切换旅游攻略模块子分类
 * @param num 第几个子分类
 * @return 无
 */
function changeTravelStrategySubClassify(num){
	//console.log("切换旅游攻略模块子分类");
	li = $("#travelStrategyPlan .JS_publicTab.public-sub li");
	//console.log(li);
	resultShow = $("#travelStrategyPlan .gonlue-list.js_proList");
	changeSubClassifyCommonalityFunction(li,resultShow,num,true);
}
/**
 * 切换特卖会,大促,国内游,周边游,旅游攻略模块子分类公共方法
 * @param param1 要切换的元素1
 * @param param2 要切换的元素2
 * @param num 第几个子分类
 * @param flag 是否拥有更多按钮
 * @return 无
 */
function changeSubClassifyCommonalityFunction(param1,param2,num,flag){
	for(i = 0;i < param1.length;i++){
		if(i == num){
			$(param1.get(i)).addClass("active");
			$(param2.get(i)).show();
			//console.log(param1.parent("ul").next(".public-tit-more.fr").children("a").length);
			//更多xxx
			if(flag){
				$(param1.parent("ul").next(".public-tit-more.fr").children("a").get(i)).css("display","inline");
			}
		}else{
			$(param1.get(i)).removeClass("active");
			$(param2.get(i)).hide();
			//更多xxx
			if(flag){
				$(param1.parent("ul").next(".public-tit-more.fr").children("a").get(i)).hide();
			}
		}
	}
}
/**
 * 加载国内游产品数据
 * @param 无
 * @return 无
 */
function loadDomesticTourismProduct(){
	console.log("加载国内游产品数据");
	loadProduct(1,"#domesticTourismPlan");
}
/**
 * 加载周边游产品数据
 */
function loadGettingAroundPlanProduct(){
	console.log("加载周边游产品数据");
	loadProduct(2,"#gettingAroundPlan");
}
/**
 * 加载产品分类对应的产品信息
 * @param attractionsId 产品分类编号
 */
function loadProduct(attractionsId,root){
	$.ajax({
		//加载热门城市
		url: "/address/findScenicwayHotCityByAttractionsId",
		async: false,
		dataType: "json",
		data: {
			attractionsId: attractionsId,
			rows: 1,
			size: 5
		},
		success: function(res){
			if(res.total == 0){
				return;
			}
			list = res.data;
			ul = $(root).find(".JS_publicTab.public-sub");
			more = $(root).find(".public-tit-more.fr");
			//console.log(ul);
			for(i = 0;i < list.length;i++){
				area = list[i].area.replace("市","");
				ul.append("<li onmouseover='changeProductSubClassify("+i+","+attractionsId+",\""+area+"\",\""+root+"\")'>"+area+"<span class='syicon syicon-arrow'></span></li>");
				more.append("<a target='_blank' href='search?key="+area+"&fromPath="+city+"&scope="+attractionsId+"'>更多"+area+"</a>");
				$(root).find(".pro.fl.js_pro").append("<ul class='css3_liy-5 css3_run js_proList'></ul>");
			}
			
			changeProductSubClassify(0,attractionsId,list[0].area.replace("市",""),root);
		}
	});
	$.ajax({
		//加载热门主题
		url: "/title/queryHotTitleByAttractionsId",
		dataType: "json",
		data: {
			attractionsId: attractionsId,
			rows: 1,
			size: 10
		},
		success: function(res){
			console.log("加载热门主题");
			if(res.total == 0){
				return;
			}
			list = res.data;
			div = $(root).find(".asideNav-list");
			for(i = 0;i < list.length;i++){
				type = list[i].type;
				div.append("<a target='_blank' title='"+type+"'>"+type+"</a>");
			}
		}
	});
}
/**
 * 切换产品分类对应模块的子分类
 * @param num 第几个子分类
 * @param attractionsId 产品分类编号
 * @param startpath 出发城市
 * @param root 分类模块元素
 * @return 无
 */
function changeProductSubClassify(num,attractionsId,startpath,root){
	//console.log("切换分类模块子分类 "+attractionsId+","+startpath);
	li = $(root).find(".JS_publicTab.public-sub li");
	//console.log(li);
	resultShow = $($(root).find(".css3_liy-5.css3_run.js_proList").get(num));
	//console.log(resultShow.children("li").size());
	//已经加载过了
	if(resultShow.children("li").size() != 0){
		changeSubClassifyCommonalityFunction(li,$(root).find(".css3_liy-5.css3_run.js_proList"),num,true);
		return;
	}
	$.ajax({
		//加载按好评率排序的景点路线
		///scenicway/fwayByAttractionsIdAndStartpathOrderByFeedback
		url: "/scenicway/fwayByAttractionsIdAndStartpathOrderByFeedback",
		async: false,
		dataType: "json",
		data: {
			attractionsId: attractionsId,
			startpath: startpath,
			rows: 1,
			size: 8
		},
		success: function(res){
			//console.log("加载具体热门城市的路线");
			if(res.total == 0){
				return;
			}
			list = res.data;
			for(i = 0;i < list.length;i++){
				resultShow.append("<li><a  href='scenicway/tourRouteProductShow/"+list[i].id+"' target='_blank'>" +
					"<div class='pro-img'>" +
						"<img width='222' height='150' src='"+list[i].scenicwayImage+"'>" +
					"</div>" +
					"<div class='pro-info'>" +
						"<p class='pro-tit'>" +
							"<i class='pro-tag'>"+list[i].attractions.atrtitle+"</i>" +
							"<span class='pro-tag-line'>|</span>"+
							list[i].way +
						"</p>" +
						"<p class='pro-price'>" +
							"<span class='fr'>"+list[i].feedback.toFixed(2)+"%好评率</span>" +
							"<dfn><i>¥</i>"+list[i].floor_price+"</dfn>起"+
						"</p>"+
					"</div>"+
				"</a></li>");
			}
			changeSubClassifyCommonalityFunction(li,$(root).find(".css3_liy-5.css3_run.js_proList"),num,true);
		}
	});
}