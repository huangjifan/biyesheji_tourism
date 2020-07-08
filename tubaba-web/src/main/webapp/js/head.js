//默认城市为上海
var city = "上海";
//上海的城市编号
var cid = "38";

$(function(){
	console.log("加载城市数据ing...");
	$.ajax({
		url: "/address/queryProvincesSubCity",
		dataType: "json",
		data: {
			provs: [
				1,2,6,//华北地区
				3,11,12,14,15,16,//华东地区
				5,8,9,10,//东北地区
				17,18,19,//华中地区
				20,24,28,//华南地区
				22,23,25,29,//西南地区
				21,26,27,30,31,//西北地区
				7,33,34,//港澳台
				]
		},
		success: function(res){
			console.log("加载城市数据成功");
			list = res.list;
			if(list.length == 0){
				console.log("加载的城市数据为0");
				return;
			}
			$(".lv_city_down.Js_LISTFIRST")
			.append("<dl id='northChinaRegion' class='city_down_list'><dt>华北</dt><dd></dd></dl>")
			.append("<dl id='eastChinaRegion' class='city_down_list'><dt>华东</dt><dd></dd></dl>")
			.append("<dl id='northEastRegion' class='city_down_list'><dt>东北</dt><dd></dd></dl>")
			.append("<dl id='centralChinaRegion' class='city_down_list'><dt>华中</dt><dd></dd></dl>")
			.append("<dl id='southernChinaRegion' class='city_down_list'><dt>华南</dt><dd></dd></dl>")
			.append("<dl id='southwestRegion' class='city_down_list'><dt>西南</dt><dd></dd></dl>")
			.append("<dl id='northwestRegion' class='city_down_list'><dt>西北</dt><dd></dd></dl>")
			.append("<dl id='HongKongMacaoTaiwanRegion' class='city_down_list'><dt>港澳台</dt><dd></dd></dl>")
			;
			for(i = 0;i < list.length;i++){
				list[i].area = list[i].area.replace("市","");
				//华北地区
				if($.inArray(list[i].upid,[1,2,6]) != -1){
					//console.log(list[i].area);
					if($("#northChinaRegion dd a").length > 10){
						continue;
					}
					$("#northChinaRegion dd").append("<a onclick='changeCity("+list[i].id+",\""+list[i].area+"\","+list[i].upid+")'>"+list[i].area+"</a>");
				}
				//华东地区
				else if($.inArray(list[i].upid,[3,11,12,14,15,16]) != -1){
					//console.log(list[i].area);
					if($("#eastChinaRegion dd a").length > 10){
						continue;
					}
					$("#eastChinaRegion dd").append("<a onclick='changeCity("+list[i].id+",\""+list[i].area+"\","+list[i].upid+")'>"+list[i].area+"</a>");
				}
				//东北地区
				else if($.inArray(list[i].upid,[5,8,9,10]) != -1){
					//console.log(list[i].area);
					if($("#northEastRegion dd a").length > 10){
						continue;
					}
					$("#northEastRegion dd").append("<a onclick='changeCity("+list[i].id+",\""+list[i].area+"\","+list[i].upid+")'>"+list[i].area+"</a>");
				}
				//华中地区
				else if($.inArray(list[i].upid,[17,18,19]) != -1){
					//console.log(list[i].area);
					if($("#centralChinaRegion dd a").length > 10){
						continue;
					}
					$("#centralChinaRegion dd").append("<a onclick='changeCity("+list[i].id+",\""+list[i].area+"\","+list[i].upid+")'>"+list[i].area+"</a>");
				}
				//华南地区
				else if($.inArray(list[i].upid,[20,24,28]) != -1){
					//console.log(list[i].area);
					if($("#southernChinaRegion dd a").length > 10){
						continue;
					}
					$("#southernChinaRegion dd").append("<a onclick='changeCity("+list[i].id+",\""+list[i].area+"\","+list[i].upid+")'>"+list[i].area+"</a>");
				}
				//西南地区
				else if($.inArray(list[i].upid,[22,23,25,29]) != -1){
					//console.log(list[i].area);
					if($("#southwestRegion dd a").length > 10){
						continue;
					}
					$("#southwestRegion dd").append("<a onclick='changeCity("+list[i].id+",\""+list[i].area+"\","+list[i].upid+")'>"+list[i].area+"</a>");
				}
				//西北地区
				else if($.inArray(list[i].upid,[21,26,27,30,31]) != -1){
					//console.log(list[i].area);
					if($("#northwestRegion dd a").length > 10){
						continue;
					}
					$("#northwestRegion dd").append("<a onclick='changeCity("+list[i].id+",\""+list[i].area+"\","+list[i].upid+")'>"+list[i].area+"</a>");
				}
				//港澳台
				else if($.inArray(list[i].upid,[7,33,34]) != -1){
					//console.log(list[i].area);
					if($("#HongKongMacaoTaiwanRegion dd a").length > 10){
						continue;
					}
					$("#HongKongMacaoTaiwanRegion dd").append("<a onclick='changeCity("+list[i].id+",\""+list[i].area+"\","+list[i].upid+")'>"+list[i].area+"</a>");
				}
			}
		}
	});
});

//显示头部切换城市面板
function showChangeCity(){
	//console.log("显示头部切换城市面板");
	$(".lv_city_box").addClass("lv_city_hover");
	$(".lv_city_down.Js_LISTFIRST").focus();
}
//隐藏头部切换城市面板
function hideChangeCity(){
	//console.log("隐藏头部切换城市面板");
	$(".lv_city_box.lv_city_hover").removeClass("lv_city_hover");
}
//切换城市 id-城市编号,area-城市名称,upid-上级编号
function changeCity(id,area,upid){
	console.log("切换城市 城市编号:"+id+",城市名称:"+area+",上级编号:"+upid);
	$("#currentCity").text(area);
	$("#currentCity").attr({
		cid: id,
		upid: upid
	});
	//city = "北京";
	//cid = "000000";
	//所有搜索框左侧的切换城市
	searchBoxChangeCityCommonalityFunction($(".searchCurrentCity"),id,area);
	//隐藏头部切换城市面板
	hideChangeCity();
}
//显示我的兔爸爸面板
function showMyTubaba(){
	//console.log("显示我的兔爸爸面板");
	$($(".dropdown").get(0)).addClass("dropdown_hover");
}
//隐藏我的兔爸爸面板
function hideMyTubaba(){
	//console.log("隐藏我的兔爸爸面板");
	$($(".dropdown").get(0)).removeClass("dropdown_hover");
}
//显示微信公众号扫码图片
function showWeiXingAccountsImage(){
	//console.log("显示微信公众号扫码图片");
	$("#weiXingAccounts").addClass("dropdown_hover");
}
//隐藏微信公众号扫码图片
function hideWeiXingAccountsImage(){
	//console.log("隐藏微信公众号扫码图片");
	$("#weiXingAccounts").removeClass("dropdown_hover");
}

//显示国内/国外电话面板
function showPhone(){
	//console.log("显示国内/国外电话面板");
	$(".border_l.dropdown.link_call").addClass("dropdown_hover");
}
//隐藏国内/国外电话面板
function hidePhone(){
	//console.log("隐藏国内/国外电话面板");
	$(".border_l.dropdown.link_call").removeClass("dropdown_hover");
}
/**
 * 显示旅游子分类面板
 * @param travel 旅游分类的li元素
 * @returns 无
 */
function showTravelSonClassify(travel){
	//console.log("显示旅游子分类面板");
	$(travel).addClass("hover_this");
}
/**
 * 隐藏旅游子分类面板
 * @param travel 旅游分类的li元素
 * @returns 无
 */
function hideTravelSonClassify(travel){
	//console.log("隐藏旅游子分类面板");
	$(travel).removeClass("hover_this");
}
/**
 * 显示搜索框左侧的切换城市面板
 * @param 无
 * @returns 无
 */
function showSearchBoxChangeCity(){
	//切换搜索框左侧的切换城市的按字母展示面板
	changeSearchBoxByLetterChangeCity($('#searchBoxByLetterChangeCity'),0);
	//console.log("显示搜索框左侧的切换城市面板");
	$(".search_city").addClass("search_city_hover");
	$(".lv_city_down.js_cf_city.js_all_city").focus();
}
/**
 * 隐藏搜索框左侧的切换城市面板
 * @param 无
 * @returns 无
 */
function hideSearchBoxChangeCity(){
	//console.log("隐藏搜索框左侧的切换城市面板");
	$(".search_city").removeClass("search_city_hover");
}

/**
 * 搜索框左侧的切换城市
 * @param id 城市编号
 * @param area 城市名称
 * @returns 无
 */
function searchBoxChangeCity(id,area){
	//console.log("搜索框左侧的切换城市");
	searchBoxChangeCityCommonalityFunction($("#search_all_fromPlaces .searchCurrentCity"),id,area);
	//隐藏搜索框左侧的切换城市面板
	hideSearchBoxChangeCity();
}

/**
 * 搜索框左侧的切换城市公共方法
 * @param root 显示已选择城市元素
 * @param id 城市编号
 * @param area 城市名称
 * @returns 无
 */
function searchBoxChangeCityCommonalityFunction(root,id,area){
	//console.log(root);
	root.text(area);
	root.attr({
		cid: id
	});
}

/**
 * 切换搜索框左侧的切换城市的按字母展示面板
 * @param val 标示值 0-ABCD 1-EFGH 2-JKLM 3-NOPQRS 4-TUVWX 5-YZ
 * @returns 无
 */
function changeSearchBoxByLetterChangeCity(root,val){
	//console.log("显示搜索框左侧的切换城市的按字母展示面板");
	//console.log("val:"+val);
	li = $(root).children("li");
	//console.log(li);
	letter = $(root).next("ul").children(".search-station-cities-pane"); 
	for(i = 0;i < li.length;i++){
		if(val == i){
			//console.log("xxx:"+i);
			$(li.get(i)).addClass("active");
			//隐藏字母开头的城市
			$(letter.get(i)).addClass("active");
		}else{
			//console.log("yyy:"+i);
			$(li.get(i)).removeClass("active");
			//展示字母开头的城市
			$(letter.get(i)).removeClass("active");
		}
	}
}

/**
 * 头部全部搜索框搜索
 * @param 无
 * @returns 无
 */
function headSearchAllBoxSearch(){
	headSearch = $("#headSearch");
	searchVal = headSearch.val();
	scope = 0;
	if(searchVal =="请输入目的地、主题、或景区名" 
		|| searchVal =="请输入目的地、主题、或关键词" 
		|| searchVal == ""){
		headSearch.addClass("empty");
		headSearch.css("color","rgb(51, 51, 51)");
		return;
	}
	city = $("#headSearchCurrentCity").text();
	cid = $("#headSearchCurrentCity").attr("cid");
	console.log("搜索的值是:"+searchVal+",出发城市是:"+city+",出发城市编号是:"+cid);
	searchBoxsearch(searchVal,scope);
}