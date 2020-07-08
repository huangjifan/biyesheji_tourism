<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="background-color: rgb(204, 232, 207);">
<meta charset="utf-8">
<link rel="stylesheet"
	href="http://s1.lvjs.com.cn/min/index.php?f=/styles/v6/header_new.css,/styles/v6/public/base.css,/styles/v6/channel/around/around.css">
<link rel="stylesheet" type="text/css"
	href="http://s2.lvjs.com.cn/styles/v6/channel/around/around_new.css">
<title>周边游</title>
<link rel="stylesheet"
	href="http://s3.lvjs.com.cn/min/index.php?f=/styles/v6/header_new.css,/styles/v6/public/base.css,/styles/v6/channel/around/around.css,/styles/v6/public/channelSearch.css,/styles/v4/modules/calendar.css,/styles/public/side/lvSide.css">
<style type="text/css">
a.hot {
	color: #EE3388
}

a.hot:hover {
	color: #FF6600
}

.channelNav-main dd a.hot {
	color: #EE3388
}

.channelNav-main dd a.hot:hover {
	color: #FF6600
}
</style>
<link rel="stylesheet"
	href="http://static.geetest.com/static/golden/style.3.2.0.css">
</head>

<body class="around" allyes_city="SH"
	style="background-color: rgb(204, 232, 207);">

	<!-- 公共头部  -->

	<!-- 首屏banner -->
	<div class="banWrap">
		<div class="lv_s_box">
			<div class="lv_s_l">
				<div class="s_zb_mtl"></div>
				<div class="l_s_zbimg"></div>
				<div class="s_zb_car"></div>
			</div>
			<div class="lv_s_all">
				<ul class="lv_s_tab">
					<li data-type="GROUP" class="active">跟团游<i class="s_tab_jt">◆</i></li>
					<li data-type="TICKET">景点门票<i class="s_tab_jt">◆</i></li>
					<a href="http://www.lvmama.com/company"
						style="color: #6C6C6C;text-decoration: none;"><li>定制游<i
							class="s_tab_jt">◆</i></li></a>
				</ul>

				<!--搜索列表--开始-->
				<div class="lv_s_r" style="background-color: rgb(204, 232, 207);">
					<!--酒店+景点-->
					<div class="lv_s_list" style="display:block;">
						<input class="lv_s_input js_s_input w_770" value="请输入目的地、主题、或关键词"
							type="text" autocomplete="off" num="0"
							style="color: rgb(187, 187, 187); background-color: rgb(204, 232, 207);">
						<input type="hidden" id="iszby" value="">
						<!--输入框上面覆盖的关键字--开始-->
						<div class="lv_s_input_hot js_s_input_hot" style="display: block;">
						</div>
						<!--关键字--结束-->
					</div>

					<!--跟团游板块-->
					<div class="lv_s_list">
						<!--出发地和搜索框-->
						<div class="lv_s_td" id="lv_s_td">
							<div class="lv_s_city_all">
								<div class="lv_s_city_btn js_s_city_btn" id="lv_s_city_btn"
									style="background-color: rgb(204, 232, 207);">
									<i class="lv_s_mark"></i> <b data-id="9"
										class="around-data-search-from-place">上海</b><i
										class="lv_s_arrow"></i> <span>出发</span>
								</div>
								<div class="lv_s_city js_all_city" id="lv_s_city"
									style="background-color: rgb(204, 232, 207);">
									<p>热门出发城市</p>

								</div>
							</div>
						</div>
						<input class="lv_s_input js_s_input w_611" value="请输入目的地、主题、或关键词"
							type="text" autocomplete="off" num="1"
							style="color: rgb(187, 187, 187); background-color: rgb(204, 232, 207);">

						<!--输入框上面覆盖的关键字--开始-->
						<div class="lv_s_input_hot js_s_input_hot"></div>
						<!--关键字--结束-->
					</div>

					<!--景点门票板块-->
					<div class="lv_s_list">
						<input class="lv_s_input js_s_input w_770" value="请输入目的地、主题或景区名"
							type="text" autocomplete="off" num="2"
							style="color: rgb(187, 187, 187); background-color: rgb(204, 232, 207);">

						<!--输入框上面覆盖的关键字--开始-->
						<div class="lv_s_input_hot js_s_input_hot"></div>
						<!--关键字--结束-->
					</div>

					<!--酒店板块-->
					<div class="lv_s_list">
						<!--酒店搜索框-->
						<div class="lv_s_table clearfix">
							<div class="lv_s_td" style="z-index: 2;">
								<input class="lv_s_input js_s_hotel js_searchDest w_128"
									value="城市/地区/区域" type="text" num="3" data-id="9"
									style="color: rgb(187, 187, 187); background-color: rgb(204, 232, 207);">
								<!--热门搜索-->
								<div class="search_hotel_mdd"
									style="display: none; top: 40px; background-color: rgb(204, 232, 207);">
									<p>支持中文/拼音/简拼输入</p>
									<ul class="mdd_tab">
										<li class="active">热门<i class="hotel_icon"></i></li>
										<li>ABCD<i class="hotel_icon"></i></li>
										<li>EFGH<i class="hotel_icon"></i></li>
										<li>JKLM<i class="hotel_icon"></i></li>
										<li>NOPQRS<i class="hotel_icon"></i></li>
										<li>TUVWX<i class="hotel_icon"></i></li>
										<li>YZ<i class="hotel_icon"></i></li>
									</ul>
									<ul class="mdd_list js_hotel_city">

										<li style="display: block;">
											<!--热门--> <a href="javascript:;" data-id="9"
											hidefocus="false">上海</a> <a href="javascript:;" data-id="56"
											hidefocus="false">南京</a> <a href="javascript:;" data-id="57"
											hidefocus="false">无锡</a> <a href="javascript:;" data-id="59"
											hidefocus="false">常州</a> <a href="javascript:;" data-id="60"
											hidefocus="false">苏州</a> <a href="javascript:;" data-id="65"
											hidefocus="false">扬州</a> <a href="javascript:;" data-id="66"
											hidefocus="false">镇江</a> <a href="javascript:;" data-id="67"
											hidefocus="false">泰州</a> <a href="javascript:;" data-id="69"
											hidefocus="false">杭州</a> <a href="javascript:;" data-id="70"
											hidefocus="false">宁波</a> <a href="javascript:;" data-id="71"
											hidefocus="false">温州</a> <a href="javascript:;" data-id="72"
											hidefocus="false">嘉兴</a> <a href="javascript:;" data-id="73"
											hidefocus="false">湖州</a> <a href="javascript:;" data-id="74"
											hidefocus="false">绍兴</a> <a href="javascript:;" data-id="77"
											hidefocus="false">舟山</a> <a href="javascript:;" data-id="78"
											hidefocus="false">台州</a> <a href="javascript:;" data-id="79"
											hidefocus="false">丽水</a> <a href="javascript:;" data-id="81"
											hidefocus="false">芜湖</a> <a href="javascript:;" data-id="87"
											hidefocus="false">安庆</a> <a href="javascript:;" data-id="149"
											hidefocus="false">巢湖</a> <a href="javascript:;" data-id="152"
											hidefocus="false">池州</a> <a href="javascript:;" data-id="154"
											hidefocus="false">福州</a> <a href="javascript:;" data-id="155"
											hidefocus="false">厦门</a> <a href="javascript:;" data-id="160"
											hidefocus="false">南平</a> <a href="javascript:;" data-id="168"
											hidefocus="false">鹰潭</a> <a href="javascript:;" data-id="173"
											hidefocus="false">上饶</a> <a href="javascript:;" data-id="175"
											hidefocus="false">青岛</a> <a href="javascript:;" data-id="322"
											hidefocus="false">广州</a> <a href="javascript:;" data-id="324"
											hidefocus="false">深圳</a> <a href="javascript:;" data-id="328"
											hidefocus="false">江门</a> <a href="javascript:;" data-id="196"
											hidefocus="false">惠州</a> <a href="javascript:;" data-id="200"
											hidefocus="false">阳江</a> <a href="javascript:;" data-id="201"
											hidefocus="false">清远</a> <a href="javascript:;"
											data-id="1820" hidefocus="false">阳西</a> <a
											href="javascript:;" data-id="88" hidefocus="false">黄山</a> <a
											href="javascript:;" data-id="138" hidefocus="false">吉林</a>
										</li>
										<li>
											<!--ABCD--> <a href="javascript:;" data-id="276"
											hidefocus="false">阿坝藏族羌族自治州</a> <a href="javascript:;"
											data-id="87" hidefocus="false">安庆</a> <a href="javascript:;"
											data-id="41" hidefocus="false">澳门</a> <a href="javascript:;"
											data-id="216" hidefocus="false">百色</a> <a href="javascript:;"
											data-id="82" hidefocus="false">蚌埠</a> <a href="javascript:;"
											data-id="94" hidefocus="false">保定</a> <a href="javascript:;"
											data-id="236" hidefocus="false">保山</a> <a href="javascript:;"
											data-id="211" hidefocus="false">北海</a> <a href="javascript:;"
											data-id="13" hidefocus="false">北京</a> <a href="javascript:;"
											data-id="230" hidefocus="false">毕节地区</a> <a
											href="javascript:;" data-id="189" hidefocus="false">滨州</a> <a
											href="javascript:;" data-id="97" hidefocus="false">沧州</a> <a
											href="javascript:;" data-id="314" hidefocus="false">常德</a> <a
											href="javascript:;" data-id="59" hidefocus="false">常州</a> <a
											href="javascript:;" data-id="137" hidefocus="false">长春</a> <a
											href="javascript:;" data-id="308" hidefocus="false">长沙</a> <a
											href="javascript:;" data-id="149" hidefocus="false">巢湖</a> <a
											href="javascript:;" data-id="258" hidefocus="false">成都</a> <a
											href="javascript:;" data-id="96" hidefocus="false">承德</a> <a
											href="javascript:;" data-id="152" hidefocus="false">池州</a> <a
											href="javascript:;" data-id="114" hidefocus="false">赤峰</a> <a
											href="javascript:;" data-id="146" hidefocus="false">滁州</a> <a
											href="javascript:;" data-id="245" hidefocus="false">大理白族自治州</a>
											<a href="javascript:;" data-id="124" hidefocus="false">大连</a>
											<a href="javascript:;" data-id="48" hidefocus="false">大庆</a>
											<a href="javascript:;" data-id="187" hidefocus="false">德州</a>
											<a href="javascript:;" data-id="178" hidefocus="false">东营</a>
											<a href="javascript:;" data-id="202" hidefocus="false">东莞</a>
										</li>
										<li>
											<!--EFGH--> <a href="javascript:;" data-id="303"
											hidefocus="false">恩施土家族苗族自治州</a> <a href="javascript:;"
											data-id="327" hidefocus="false">佛山</a> <a href="javascript:;"
											data-id="154" hidefocus="false">福州</a> <a href="javascript:;"
											data-id="172" hidefocus="false">抚州</a> <a href="javascript:;"
											data-id="169" hidefocus="false">赣州</a> <a href="javascript:;"
											data-id="322" hidefocus="false">广州</a> <a href="javascript:;"
											data-id="224" hidefocus="false">贵阳</a> <a href="javascript:;"
											data-id="209" hidefocus="false">桂林</a> <a href="javascript:;"
											data-id="43" hidefocus="false">哈尔滨</a> <a href="javascript:;"
											data-id="221" hidefocus="false">海口</a> <a href="javascript:;"
											data-id="92" hidefocus="false">邯郸</a> <a href="javascript:;"
											data-id="336" hidefocus="false">汉中</a> <a href="javascript:;"
											data-id="69" hidefocus="false">杭州</a> <a href="javascript:;"
											data-id="80" hidefocus="false">合肥</a> <a href="javascript:;"
											data-id="218" hidefocus="false">河池</a> <a href="javascript:;"
											data-id="199" hidefocus="false">河源</a> <a href="javascript:;"
											data-id="190" hidefocus="false">菏泽</a> <a href="javascript:;"
											data-id="311" hidefocus="false">衡阳</a> <a href="javascript:;"
											data-id="111" hidefocus="false">呼和浩特</a> <a
											href="javascript:;" data-id="117" hidefocus="false">呼伦贝尔</a>
											<a href="javascript:;" data-id="73" hidefocus="false">湖州</a>
											<a href="javascript:;" data-id="136" hidefocus="false">葫芦岛</a>
											<a href="javascript:;" data-id="63" hidefocus="false">淮安</a>
											<a href="javascript:;" data-id="300" hidefocus="false">黄冈</a>
											<a href="javascript:;" data-id="88" hidefocus="false">黄山</a>
											<a href="javascript:;" data-id="292" hidefocus="false">黄石</a>
											<a href="javascript:;" data-id="196" hidefocus="false">惠州</a>
										</li>
										<li>
											<!--JKLM--> <a href="javascript:;" data-id="170"
											hidefocus="false">吉安</a> <a href="javascript:;" data-id="138"
											hidefocus="false">吉林</a> <a href="javascript:;" data-id="174"
											hidefocus="false">济南</a> <a href="javascript:;" data-id="181"
											hidefocus="false">济宁</a> <a href="javascript:;" data-id="72"
											hidefocus="false">嘉兴</a> <a href="javascript:;" data-id="328"
											hidefocus="false">江门</a> <a href="javascript:;" data-id="75"
											hidefocus="false">金华</a> <a href="javascript:;" data-id="106"
											hidefocus="false">晋中</a> <a href="javascript:;" data-id="297"
											hidefocus="false">荆门</a> <a href="javascript:;" data-id="299"
											hidefocus="false">荆州</a> <a href="javascript:;" data-id="166"
											hidefocus="false">九江</a> <a href="javascript:;" data-id="192"
											hidefocus="false">开封</a> <a href="javascript:;" data-id="233"
											hidefocus="false">昆明</a> <a href="javascript:;" data-id="249"
											hidefocus="false">拉萨</a> <a href="javascript:;" data-id="340"
											hidefocus="false">兰州</a> <a href="javascript:;" data-id="98"
											hidefocus="false">廊坊</a> <a href="javascript:;" data-id="267"
											hidefocus="false">乐山</a> <a href="javascript:;" data-id="238"
											hidefocus="false">丽江</a> <a href="javascript:;" data-id="79"
											hidefocus="false">丽水</a> <a href="javascript:;" data-id="62"
											hidefocus="false">连云港</a> <a href="javascript:;"
											data-id="109" hidefocus="false">临汾</a> <a href="javascript:;"
											data-id="186" hidefocus="false">临沂</a> <a href="javascript:;"
											data-id="208" hidefocus="false">柳州</a> <a href="javascript:;"
											data-id="351" hidefocus="false">陇南</a> <a href="javascript:;"
											data-id="193" hidefocus="false">洛阳</a> <a href="javascript:;"
											data-id="263" hidefocus="false">绵阳</a> <a href="javascript:;"
											data-id="52" hidefocus="false">牡丹江</a>
										</li>
										<li>
											<!--NOPQRS--> <a href="javascript:;" data-id="163"
											hidefocus="false">南昌</a> <a href="javascript:;" data-id="268"
											hidefocus="false">南充</a> <a href="javascript:;" data-id="56"
											hidefocus="false">南京</a> <a href="javascript:;" data-id="207"
											hidefocus="false">南宁</a> <a href="javascript:;" data-id="160"
											hidefocus="false">南平</a> <a href="javascript:;" data-id="61"
											hidefocus="false">南通</a> <a href="javascript:;" data-id="285"
											hidefocus="false">南阳</a> <a href="javascript:;" data-id="70"
											hidefocus="false">宁波</a> <a href="javascript:;" data-id="162"
											hidefocus="false">宁德</a> <a href="javascript:;" data-id="44"
											hidefocus="false">齐齐哈尔</a> <a href="javascript:;"
											data-id="231" hidefocus="false">黔东南苗族侗族自治州</a> <a
											href="javascript:;" data-id="91" hidefocus="false">秦皇岛</a> <a
											href="javascript:;" data-id="175" hidefocus="false">青岛</a> <a
											href="javascript:;" data-id="201" hidefocus="false">清远</a> <a
											href="javascript:;" data-id="76" hidefocus="false">衢州</a> <a
											href="javascript:;" data-id="184" hidefocus="false">日照</a> <a
											href="javascript:;" data-id="157" hidefocus="false">三明</a> <a
											href="javascript:;" data-id="257" hidefocus="false">三亚</a> <a
											href="javascript:;" data-id="9" hidefocus="false">上海</a> <a
											href="javascript:;" data-id="173" hidefocus="false">上饶</a> <a
											href="javascript:;" data-id="323" hidefocus="false">韶关</a> <a
											href="javascript:;" data-id="74" hidefocus="false">绍兴</a> <a
											href="javascript:;" data-id="324" hidefocus="false">深圳</a> <a
											href="javascript:;" data-id="123" hidefocus="false">沈阳</a> <a
											href="javascript:;" data-id="89" hidefocus="false">石家庄</a> <a
											href="javascript:;" data-id="60" hidefocus="false">苏州</a> <a
											href="javascript:;" data-id="54" hidefocus="false">绥化</a>
										</li>
										<li>
											<!--TUVWX--> <a href="javascript:;" data-id="78"
											hidefocus="false">台州</a> <a href="javascript:;" data-id="100"
											hidefocus="false">太原</a> <a href="javascript:;" data-id="182"
											hidefocus="false">泰安</a> <a href="javascript:;" data-id="67"
											hidefocus="false">泰州</a> <a href="javascript:;" data-id="90"
											hidefocus="false">唐山</a> <a href="javascript:;" data-id="42"
											hidefocus="false">台湾</a> <a href="javascript:;" data-id="228"
											hidefocus="false">铜仁地区</a> <a href="javascript:;"
											data-id="183" hidefocus="false">威海</a> <a href="javascript:;"
											data-id="180" hidefocus="false">潍坊</a> <a href="javascript:;"
											data-id="334" hidefocus="false">渭南</a> <a href="javascript:;"
											data-id="71" hidefocus="false">温州</a> <a href="javascript:;"
											data-id="119" hidefocus="false">乌兰察布</a> <a
											href="javascript:;" data-id="367" hidefocus="false">乌鲁木齐</a>
											<a href="javascript:;" data-id="57" hidefocus="false">无锡</a>
											<a href="javascript:;" data-id="81" hidefocus="false">芜湖</a>
											<a href="javascript:;" data-id="291" hidefocus="false">武汉</a>
											<a href="javascript:;" data-id="256" hidefocus="false">西安</a>
											<a href="javascript:;" data-id="354" hidefocus="false">西宁</a>
											<a href="javascript:;" data-id="244" hidefocus="false">西双版纳傣族自治州</a>
											<a href="javascript:;" data-id="121" hidefocus="false">锡林郭勒盟</a>
											<a href="javascript:;" data-id="155" hidefocus="false">厦门</a>
											<a href="javascript:;" data-id="301" hidefocus="false">咸宁</a>
											<a href="javascript:;" data-id="321" hidefocus="false">湘西土家族苗族自治州</a>
											<a href="javascript:;" data-id="295" hidefocus="false">襄樊</a>
											<a href="javascript:;" data-id="298" hidefocus="false">孝感</a>
											<a href="javascript:;" data-id="279" hidefocus="false">新乡</a>
											<a href="javascript:;" data-id="93" hidefocus="false">邢台</a>
											<a href="javascript:;" data-id="58" hidefocus="false">徐州</a>
											<a href="javascript:;" data-id="40" hidefocus="false">香港</a>
										</li>
										<li>
											<!--YZ--> <a href="javascript:;" data-id="273"
											hidefocus="false">雅安</a> <a href="javascript:;" data-id="179"
											hidefocus="false">烟台</a> <a href="javascript:;" data-id="335"
											hidefocus="false">延安</a> <a href="javascript:;" data-id="145"
											hidefocus="false">延边朝鲜族自治州</a> <a href="javascript:;"
											data-id="64" hidefocus="false">盐城</a> <a href="javascript:;"
											data-id="65" hidefocus="false">扬州</a> <a href="javascript:;"
											data-id="200" hidefocus="false">阳江</a> <a href="javascript:;"
											data-id="1820" hidefocus="false">阳西</a> <a
											href="javascript:;" data-id="294" hidefocus="false">宜昌</a> <a
											href="javascript:;" data-id="171" hidefocus="false">宜春</a> <a
											href="javascript:;" data-id="362" hidefocus="false">银川</a> <a
											href="javascript:;" data-id="130" hidefocus="false">营口</a> <a
											href="javascript:;" data-id="337" hidefocus="false">榆林</a> <a
											href="javascript:;" data-id="313" hidefocus="false">岳阳</a> <a
											href="javascript:;" data-id="107" hidefocus="false">运城</a> <a
											href="javascript:;" data-id="329" hidefocus="false">湛江</a> <a
											href="javascript:;" data-id="315" hidefocus="false">张家界</a> <a
											href="javascript:;" data-id="95" hidefocus="false">张家口</a> <a
											href="javascript:;" data-id="159" hidefocus="false">漳州</a> <a
											href="javascript:;" data-id="195" hidefocus="false">肇庆</a> <a
											href="javascript:;" data-id="66" hidefocus="false">镇江</a> <a
											href="javascript:;" data-id="191" hidefocus="false">郑州</a> <a
											href="javascript:;" data-id="203" hidefocus="false">中山</a> <a
											href="javascript:;" data-id="77" hidefocus="false">舟山</a> <a
											href="javascript:;" data-id="325" hidefocus="false">珠海</a> <a
											href="javascript:;" data-id="176" hidefocus="false">淄博</a> <a
											href="javascript:;" data-id="226" hidefocus="false">遵义</a>
										</li>
									</ul>
									<span class="hotel_icon mdd_close"></span>
								</div>
								<div class="search_hotel_keyword"
									style="display: none; top: 40px; left: 160px; background-color: rgb(204, 232, 207);"></div>
								<div class="lv_search_tips"
									style="background-color: rgb(204, 232, 207); display: none;">
									<p>请输入酒店所在目的地</p>
									<div class="lv_tips_arrow">
										<span>◆</span><i>◆</i>
									</div>
								</div>
							</div>

							<div class="lv_s_td">
								<input class="lv_s_time w_154 J_calendar" data-check="checkIn"
									name="beginBookTime" type="text" readonly="readonly"
									value="2018-11-06" autocomplete="off">
								<div class="lv_s_time_info">
									<i class="lv_s_time_icon"></i> <span>明天</span>
								</div>
								<div class="lv_s_time_tips"
									style="background-color: rgb(204, 232, 207);">
									如您需入住20天以上，请致电客服热线 <b>1010-6060</b>。
								</div>
							</div>
							<div class="lv_s_td">
								<input class="lv_s_time w_154 J_calendar" data-check="checkIn"
									name="endBookTime" type="text" readonly="readonly"
									value="2018-11-07" autocomplete="off">
								<div class="lv_s_time_info">
									<i class="lv_s_time_icon"></i> <span>后天</span>
								</div>
							</div>
							<div class="lv_s_td">
								<input class="lv_s_input js_s_hotel js_searchKeyword w_271"
									data-required="false" value="(选填)酒店名/商圈/地标" type="text" num="4"
									style="color: rgb(187, 187, 187); background-color: rgb(204, 232, 207);">
							</div>
						</div>
						<!--出发地和搜索框--结束-->

					</div>
				</div>
				<!--搜索列表--结束-->

				<!--搜索按钮--开始-->
				<span class="lv_s_search_btn"><i></i>搜索</span>
				<!--搜索按钮--结束-->
			</div>
		</div>


		<div class="w1200 bc clearfix">

			<div class="channelNav fl">
				<div class="channelNav-list">

					<div class="channelNav-tit" style="background-color: rgb(204, 232, 207);">
								<h4>节后错峰</h4>
					<p class="channelNav-hot">
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-1-北京','PC国内游频道页导航');" href="http://s.lvmama.com/group/H9K310000?keyword=北京&amp;k=0#list" class="hot" target="_blank" hidefocus="false">北京</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-2-长白山','PC国内游频道页导航');" href="http://s.lvmama.com/scenictour/K310000?keyword=%E9%95%BF%E7%99%BD%E5%B1%B1&amp;k=0#list" class="hot" target="_blank" hidefocus="false">长白山</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-3-云南','PC国内游频道页导航');" href="http://s.lvmama.com/group/H9K310000?keyword=%E4%BA%91%E5%8D%97&amp;k=0#list" target="_blank" hidefocus="false">云南</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-4-三亚','PC国内游频道页导航');" href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B8%89%E4%BA%9A&amp;tabType=freetour#list" target="_blank" hidefocus="false">三亚</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-5-厦门','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9K310000?keyword=%E5%8E%A6%E9%97%A8&amp;k=0#list" target="_blank" hidefocus="false">厦门</a>
					</p>
					</div>
					<!-- //channelNav-tit -->
					<div class="channelNav-main" style="background-color: rgb(204, 232, 207);">
					<div class="channelNav-main-column">
         			<dl>
         				<dt>当季精选</dt>
         			<dd>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-6-巴适成都','PC国内游频道页导航');" href="http://s.lvmama.com/group/H9K310000?keyword=成都&amp;k=0#list" target="_blank" hidefocus="false">巴适成都</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-7-魅力青岛','PC国内游频道页导航');" href="http://s.lvmama.com/group/H9K310000?keyword=青岛&amp;k=0#list" target="_blank" hidefocus="false">魅力青岛</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-8-清新厦门','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9?keyword=%E5%8E%A6%E9%97%A8&amp;k=0#list" target="_blank" hidefocus="false">清新厦门</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-9-多彩版纳','PC国内游频道页导航');" href="http://s.lvmama.com/group/H9K310000?keyword=%E8%A5%BF%E5%8F%8C%E7%89%88%E7%BA%B3&amp;k=0#list" class="hot" target="_blank" hidefocus="false">多彩版纳</a>
         			</dd>
         			</dl>
         			<dl>
         				<dt>清肺山水</dt>
         			<dd>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-10-长白山','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9?keyword=%E9%95%BF%E7%99%BD%E5%B1%B1&amp;k=0#list" target="_blank" hidefocus="false">长白山</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-11-丽江','PC国内游频道页导航');" href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B8%BD%E6%B1%9F&amp;k=0#list" target="_blank" hidefocus="false">丽江</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-12-桂林','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9?keyword=%E6%A1%82%E6%9E%97&amp;k=0#list" class="hot" target="_blank" hidefocus="false">桂林</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-13-贵州','PC国内游频道页导航');" href="http://s.lvmama.com/group/H9K310000?keyword=%E8%B4%B5%E5%B7%9E&amp;k=0#list" target="_blank" hidefocus="false">贵州</a>
         			</dd>
         			</dl>
         			<dl>
         				<dt>热门推荐</dt>
         			<dd>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-14-风月大理','PC国内游频道页导航');" href="http://dujia.lvmama.com/tour/dali327/route-D9#list" class="hot" target="_blank" hidefocus="false">风月大理</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-15-古都西安','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9?keyword=%E8%A5%BF%E5%AE%89&amp;k=0#list" target="_blank" hidefocus="false">古都西安</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-16-豪气东北','PC国内游频道页导航');" href="http://dujia.lvmama.com/tour/dongbei10554816/route-D9#list" target="_blank" hidefocus="false">豪气东北</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-17-艳遇丽江','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9?keyword=%E4%B8%BD%E6%B1%9F&amp;k=0#list" target="_blank" hidefocus="false">艳遇丽江</a>
         			</dd>
         			</dl>
         			<dl>
         				<dt>踏浪赶海</dt>
         			<dd>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-18-浪漫三亚','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9?keyword=%E4%B8%89%E4%BA%9A&amp;k=0#list" target="_blank" hidefocus="false">浪漫三亚</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-19-畅爽青岛','PC国内游频道页导航');" href="http://dujia.lvmama.com/tour/qingdao161/route-D9#list" target="_blank" hidefocus="false">畅爽青岛</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-20-清新厦门','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9?keyword=%E5%8E%A6%E9%97%A8&amp;k=0#list" class="hot" target="_blank" hidefocus="false">清新厦门</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-21-休闲北海','PC国内游频道页导航');" href="http://dujia.lvmama.com/tour/beihai257/route-D9#list" target="_blank" hidefocus="false">休闲北海</a>
         			</dd>
         			</dl>
         			<dl>
         				<dt>舌尖中国</dt>
         			<dd>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-22-质朴西安','PC国内游频道页导航');" href="http://dujia.lvmama.com/tour/xian340/route-D9#list" target="_blank" hidefocus="false">质朴西安</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-23-麻辣成都','PC国内游频道页导航');" href="http://s.lvmama.com/group/H9K310000?keyword=成都&amp;k=0#list" target="_blank" hidefocus="false">麻辣成都</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-24-多彩贵州','PC国内游频道页导航');" href="http://dujia.lvmama.com/tour/guizhou300/route-D9#list" class="hot" target="_blank" hidefocus="false">多彩贵州</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-25-海味大连','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9?keyword=%E5%A4%A7%E8%BF%9E&amp;k=0#list" target="_blank" hidefocus="false">海味大连</a>
         			</dd>
         			</dl>
         			<dl>
         				<dt>行摄之旅</dt>
         			<dd>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-26-神圣西藏','PC国内游频道页导航');" href="http://dujia.lvmama.com/tour/xizang331/route-D9#list" target="_blank" hidefocus="false">神圣西藏</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-27-野趣重庆','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9?keyword=%E9%87%8D%E5%BA%86&amp;k=0#list" target="_blank" hidefocus="false">野趣重庆</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-28-丝绸之路','PC国内游频道页导航');" href="http://dujia.lvmama.com/tour/gansu350/route-D9#list" class="hot" target="_blank" hidefocus="false">丝绸之路</a>
							<a onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-29-韵味北京','PC国内游频道页导航');" href="http://s.lvmama.com/freetour/H9?keyword=%E5%8C%97%E4%BA%AC&amp;k=0#list" target="_blank" hidefocus="false">韵味北京</a>
         			</dd>
         			</dl>
         			</div>
         			
         			<div class="channelNav-main-column">
         			</div>
					</div>
					<!-- //channelNav-main -->
				</div>

				<div class="channelNav-list">

					<div class="channelNav-tit"
						style="background-color: rgb(204, 232, 207);">
						<h4>特色主题</h4>
						<p class="channelNav-hot">
							<!--左下-->

							<a class="specialSubject"
								href="http://dujia.lvmama.com/tour/s-4e3b98984e5056ed/scenictour"
								target="_blank">主题乐园</a> <a class="specialSubject"
								href="http://s.lvmama.com/scenictour/K310000?keyword=%E5%8F%A4%E9%95%87&amp;k=0#list"
								target="_blank">特色古镇</a> <a class="specialSubject"
								href="http://s.lvmama.com/scenictour/K310000?keyword=%E6%88%BF%E8%BD%A6&amp;k=0#list"
								target="_blank">特色房车</a> <a class="specialSubject"
								href="http://s.lvmama.com/scenictour/K310000?keyword=%E6%BB%91%E9%9B%AA&amp;k=0#list"
								target="_blank">滑雪度假</a>
						</p>
					</div>
					<!-- //channelNav-tit -->
					<div class="channelNav-main"
						style="background-color: rgb(204, 232, 207);">
						<dl>
							<dt>热门精选</dt>
							<dd>

								<a class="specialSubjectChild hot"
									href="http://dujia.lvmama.com/tour/s-00204e0a6d77/scenictour"
									target="_blank"> 上海</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/wuhan199/scenictour"
									target="_blank">武汉</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/hangzhou100/scenictour"
									target="_blank">杭州</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/changzhou86/scenictour"
									target="_blank">常州</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/huzhou109/scenictour"
									target="_blank">湖州</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/huangshan127/scenictour"
									target="_blank">黄山</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/xiamen137/scenictour"
									target="_blank">厦门</a> <a class="specialSubjectChild"
									href="http://www.lvmama.com/zt/promo/wuyuan/" target="_blank">婺源</a>
							</dd>
						</dl>
						<dl>
							<dt>舒适冷泉</dt>
							<dd>

								<a class="specialSubjectChild hot"
									href="http://dujia.lvmama.com/tour/tianmuhu3915/scenictour"
									target="_blank">天目湖</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/linan103/scenictour"
									target="_blank">临安</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/tangshan3961/scenictour"
									target="_blank">汤山</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/anji110/scenictour"
									target="_blank">安吉</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/lushan102880/scenictour"
									target="_blank">庐山</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/shennongjia3668/scenictour"
									target="_blank">神农架</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/suzhou87/scenictour"
									target="_blank">苏州</a>
							</dd>
						</dl>
						<dl>
							<dt>主题乐园</dt>
							<dd>

								<a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/s-6a2a5e97/scenictour"
									target="_blank">横店</a> <a class="specialSubjectChild hot"
									href="http://dujia.lvmama.com/tour/s-4e0a6d778fea58eb5c3c4e5056ed/scenictour"
									target="_blank">上海迪士尼</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/s-4e2d534e60509f9956ed/scenictour"
									target="_blank">恐龙园</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/s-51ef8482732b/scenictour"
									target="_blank">凯蒂猫</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/wuhanhuanlegu160939/scenictour"
									target="_blank">武汉欢乐谷</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/suzhouleyuan100866/scenictour"
									target="_blank">苏州乐园</a>
							</dd>
						</dl>
						<dl>
							<dt>山水景观</dt>
							<dd>

								<a class="specialSubjectChild hot"
									href="http://dujia.lvmama.com/tour/shouxihu100995/scenictour"
									target="_blank">瘦西湖</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/qiandaohu102/scenictour"
									target="_blank">千岛湖</a> <a class="specialSubjectChild"
									href="http://s.lvmama.com/scenictour/K310000?keyword=%E4%B8%89%E6%B8%85%E5%B1%B1&amp;k=0#list"
									target="_blank">三清山</a> <a class="specialSubjectChild hot"
									href="http://dujia.lvmama.com/tour/moganshan3936/scenictour"
									target="_blank">莫干山</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/yuantouzhu101114/scenictour"
									target="_blank">鼋头渚</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/s-8fbe84ec5c71/scenictour"
									target="_blank">达蓬山</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/huangshan127/scenictour"
									target="_blank">黄山</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/tonglu101/scenictour"
									target="_blank">桐庐</a>
							</dd>
						</dl>
						<dl>
							<dt>古镇村落</dt>
							<dd>

								<a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/s-67315bb689d2/scenictour"
									target="_blank">朱家角</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/wuzhen97/scenictour"
									target="_blank">乌镇</a> <a class="specialSubjectChild hot"
									href="http://dujia.lvmama.com/tour/xitang3933/scenictour"
									target="_blank">西塘</a> <a class="specialSubjectChild hot"
									href="http://dujia.lvmama.com/tour/tongli109916/scenictour"
									target="_blank">同里</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/s-4e2d534e60509f9956ed/scenictour"
									target="_blank">周庄</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/nanxun3948/scenictour"
									target="_blank">南浔</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/wuyuan157/scenictour"
									target="_blank">婺源</a>
							</dd>
						</dl>
						<dl>
							<dt>祈福拜佛</dt>
							<dd>

								<a class="specialSubjectChild hot"
									href="http://dujia.lvmama.com/tour/s-83055c71/scenictour"
									target="_blank">茅山</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/s-72fc5c7198ce666f540d80dc533a0020/scenictour"
									target="_blank">南通狼山</a> <a class="specialSubjectChild hot"
									href="http://dujia.lvmama.com/tour/s-65e0952170755c71666f533a/scenictour"
									target="_blank">灵山大佛</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/putuoshan3934/scenictour"
									target="_blank">普陀山</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/jiuhuashan3695/scenictour"
									target="_blank">九华山</a>
							</dd>
						</dl>
						<dl>
							<dt>南方避寒</dt>
							<dd>

								<a class="specialSubjectChild hot"
									href="http://dujia.lvmama.com/tour/sanya272/scenictour"
									target="_blank">三亚</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/guangzhou229/scenictour"
									target="_blank">广州</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/haikou271/scenictour"
									target="_blank">海口</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/chengdu279/scenictour"
									target="_blank">成都</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/chongqing277/scenictour"
									target="_blank">重庆</a> <a class="specialSubjectChild"
									href="http://dujia.lvmama.com/tour/shenzhen231/scenictour"
									target="_blank">深圳</a>
							</dd>
						</dl>
					</div>
					<!-- //channelNav-main -->
				</div>

				<div class="channelNav-list">

					<div class="channelNav-tit"
						style="background-color: rgb(204, 232, 207);">
						<h4>当季推荐</h4>
						<p class="channelNav-hot">
							<!--左下-->

							<a class="seasonalRecommendation"
								href="http://dujia.lvmama.com/tour/s-4e0a6d778fea58eb5c3c4e5056ed/scenictour"
								target="_blank">上海迪士尼</a> <a class="seasonalRecommendation"
								href="http://s.lvmama.com/scenictour/K310000?keyword=%E8%BF%9E%E4%BA%91%E6%B8%AF&amp;k=0#list"
								target="_blank">连云港</a> <a class="seasonalRecommendation"
								href="http://s.lvmama.com/scenictour/K310000?keyword=%E6%A1%90%E5%BA%90&amp;k=0#list"
								target="_blank">桐庐</a> <a class="seasonalRecommendation hot"
								href="http://s.lvmama.com/scenictour/K310000?keyword=%E5%A4%A9%E7%9B%AE%E6%B9%96&amp;k=0#list"
								target="_blank">天目湖</a>
						</p>
					</div>
					<!-- //channelNav-tit -->
					<div class="channelNav-main"
						style="background-color: rgb(204, 232, 207);">
						<dl>
							<dt>江苏</dt>
							<dd>

								<a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/s-70755c715c0f954700b762c882b16e7e/scenictour"
									target="_blank">灵山小镇·拈花湾</a> <a
									class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/changzhoukonglongyuan107554/scenictour"
									target="_blank">常州恐龙园</a> <a
									class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/shouxihu100995/scenictour"
									target="_blank">扬州瘦西湖</a> <a
									class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/s-6eb16e566e7f5730/scenictour"
									target="_blank">溱湖湿地</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/s-5b9c51747af96d77/scenictour"
									target="_blank">宜兴竹海</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/tianmuhu3915/scenictour"
									target="_blank">天目湖</a> <a class="seasonalRecommendationChild"
									href="http://s.lvmama.com/scenictour/K310000?keyword=%E6%8B%99%E6%94%BF%E5%9B%AD&amp;k=0#list"
									target="_blank">拙政园</a>
							</dd>
						</dl>
						<dl>
							<dt>浙江</dt>
							<dd>

								<a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/s-6a2a5e975f7189c657ce/scenictour"
									target="_blank">横店</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/moganshan3936/scenictour#list"
									target="_blank">莫干山</a> <a
									class="seasonalRecommendationChild hot"
									href="http://s.lvmama.com/scenictour/K310000?keyword=%E4%B8%B4%E5%AE%89&amp;k=0#list"
									target="_blank">临安湍口</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/xiangshan105/scenictour#list"
									target="_blank">象山</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/s-5b8b57ce/scenictour"
									target="_blank">宋城</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/qiandaohu102/scenictour#list"
									target="_blank">千岛湖</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/shaoxing111/scenictour#list"
									target="_blank">绍兴</a> <a class="seasonalRecommendationChild"
									href="http://s.lvmama.com/scenictour/K310000?keyword=%E5%AE%89%E5%90%89&amp;k=0#list"
									target="_blank">安吉</a> <a class="seasonalRecommendationChild"
									href="http://s.lvmama.com/scenictour/K310000?keyword=%E6%AD%A6%E4%B9%89&amp;k=0#list"
									target="_blank">武义</a> <a class="seasonalRecommendationChild"
									href="http://s.lvmama.com/scenictour/K310000?keyword=%E5%AE%81%E6%B3%A2&amp;k=0#list"
									target="_blank">宁波</a>
							</dd>
						</dl>
						<dl>
							<dt>上海</dt>
							<dd>

								<a class="seasonalRecommendationChild"
									href="http://s.lvmama.com/scenictour/K310000?keyword=%E4%B8%8A%E6%B5%B7%E7%8E%9B%E9%9B%85%E6%B5%B7%E6%BB%A9%E6%B0%B4%E5%85%AC%E5%9B%AD&amp;k=0#list"
									target="_blank">上海玛雅海滩水公园</a> <a
									class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/chongming200533/scenictour"
									target="_blank">崇明</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/shanghaiyeshengdongwuyuan102843/scenictour"
									target="_blank">野生动物园</a> <a
									class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/s-957f98ce6d776d0b4e16754c/scenictour"
									target="_blank">长风海洋世界</a> <a
									class="seasonalRecommendationChild hot"
									href="http://dujia.lvmama.com/tour/shanghaihuanlegu120044/scenictour"
									target="_blank">欢乐谷</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/dongfangmingzhu100792/scenictour"
									target="_blank">东方明珠</a>
							</dd>
						</dl>
						<dl>
							<dt>安徽</dt>
							<dd>

								<a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/wuhu120/scenictour"
									target="_blank">芜湖</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/jiuhuashan3695/scenictour"
									target="_blank">九华山</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/s-5b8f6751/scenictour"
									target="_blank">宏村</a> <a
									class="seasonalRecommendationChild hot"
									href="http://dujia.lvmama.com/tour/s-9ec45c716e296cc9/scenictour"
									target="_blank">黄山温泉</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/huangshanzuiwenquan120100/scenictour"
									target="_blank">黄山醉温泉</a> <a
									class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/huangshan127/scenictour"
									target="_blank">黄山</a>
							</dd>
						</dl>
						<dl>
							<dt>福建</dt>
							<dd>

								<a class="seasonalRecommendationChild hot"
									href="http://dujia.lvmama.com/tour/xiamen137/scenictour-D0#list"
									target="_blank">厦门</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/s-65e567088c376e296cc9/scenictour"
									target="_blank">厦门日月谷温泉</a> <a
									class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/wuyishan457/scenictour"
									target="_blank">武夷山</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/fuzhou136/scenictour"
									target="_blank">福州</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/zhangzhou141/scenictour"
									target="_blank">漳州</a>
							</dd>
						</dl>
						<dl>
							<dt>江西</dt>
							<dd>

								<a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/s-9f99864e5c71/scenictour"
									target="_blank">龙虎山</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/nanchang146/scenictour"
									target="_blank">南昌</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/jingdezhen147/scenictour"
									target="_blank">景德镇</a> <a
									class="seasonalRecommendationChild hot"
									href="http://dujia.lvmama.com/tour/wuyuan157/scenictour"
									target="_blank">婺源</a> <a class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/s-5b9c6625660e67085c71/scenictour"
									target="_blank">宜春明月山</a> <a
									class="seasonalRecommendationChild"
									href="http://dujia.lvmama.com/tour/sanqingshan158/scenictour"
									target="_blank">三清山</a>
							</dd>
						</dl>
					</div>
					<!-- //channelNav-main -->
				</div>

				<div class="channelNav-list">
					<div class="channelNav-tit"
						style="background-color: rgb(204, 232, 207);">
						<h4>热门景点</h4>
						<p class="channelNav-hot">
							<!--左下-->

							<a class="hotSpots"
								href="http://s.lvmama.com/scenictour/K330700?keyword=%E6%A8%AA%E5%BA%97%E5%BD%B1%E8%A7%86%E5%9F%8E&amp;k=1#list"
								target="_blank">横店影视城</a> <a class="hotSpots"
								href="http://s.lvmama.com/scenictour/K310000?keyword=%E6%89%AC%E5%B7%9E&amp;k=0#list"
								target="_blank">瘦西湖</a> <a class="hotSpots"
								href="http://dujia.lvmama.com/tour/wuzhen97/scenictour"
								target="_blank">乌镇</a> <a class="hotSpots hot"
								href="http://dujia.lvmama.com/tour/zhouzhuang81/scenictour"
								target="_blank">灵山</a> <a class="hotSpots"
								href="http://dujia.lvmama.com/tour/s-5e385dde60509f9956ed/scenictour "
								target="_blank">常州恐龙园</a>
						</p>
					</div>
					<!-- //channelNav-tit -->
					<div class="channelNav-main"
						style="background-color: rgb(204, 232, 207);">
						<dl>
							<dt>好摄之徒</dt>
							<dd>

								<a class="hotSpotsChild hot"
									href="http://dujia.lvmama.com/tour/s-5fb76e0583ab5e725c71/scenictour"
									target="_blank">莫干山</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/xiamen137/scenictour-D0#list"
									target="_blank">厦门</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/sanqingshan158/scenictour-D0#list"
									target="_blank">三清山</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/tianmuhu3915/scenictour"
									target="_blank">天目湖</a> <a class="hotSpotsChild"
									href="http://ticket.lvmama.com/scenic-103984" target="_blank">临安大明山</a>

								<a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/qiandaohu102/scenictour"
									target="_blank">千岛湖</a>
							</dd>
						</dl>
						<dl>
							<dt>登高望远</dt>
							<dd>

								<a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/moganshan3936/scenictour"
									target="_blank">莫干山</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/putuoshan3934/scenictour"
									target="_blank">普陀山</a> <a class="hotSpotsChild"
									href="http://s.lvmama.com/scenictour/K310000?keyword=%E8%8C%85%E5%B1%B1&amp;k=1#list"
									target="_blank">茅山</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/wuyishan457/scenictour"
									target="_blank">武夷山</a> <a class="hotSpotsChild hot"
									href="http://dujia.lvmama.com/tour/huangshan127/scenictour"
									target="_blank">黄山</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-9f99864e5c71/scenictour"
									target="_blank">龙虎山</a>
							</dd>
						</dl>
						<dl>
							<dt>主题乐园</dt>
							<dd>

								<a class="hotSpotsChild hot"
									href="http://www.lvmama.com/zt/promo/shdsn/" target="_blank">上海迪士尼乐园</a>

								<a class="hotSpotsChild"
									href="http://s.lvmama.com/scenictour/K310000?keyword=%E5%B8%B8%E5%B7%9E%E4%B8%AD%E5%8D%8E%E6%81%90%E9%BE%99%E5%9B%AD&amp;k=0#list"
									target="_blank">常州恐龙园</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-6a2a5e975f7189c657ce/scenictour-H9?#list"
									target="_blank">横店</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-51ef8482732b5bb656ed/scenictour"
									target="_blank">凯蒂猫</a> <a class="hotSpotsChild"
									href="http://ticket.lvmama.com/scenic-102859" target="_blank">杭州宋城</a>

								<a class="hotSpotsChild"
									href="http://s.lvmama.com/scenictour/Z7H9K310000?keyword=%E8%8B%8F%E5%B7%9E%E4%B9%90%E5%9B%AD#list"
									target="_blank">苏州乐园</a>
							</dd>
						</dl>
						<dl>
							<dt>古镇村落</dt>
							<dd>

								<a class="hotSpotsChild"
									href="http://s.lvmama.com/scenictour/K310000?keyword=%E5%A9%BA%E6%BA%90&amp;k=0#list"
									target="_blank">婺源</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-67315bb689d2/scenictour"
									target="_blank">朱家角</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-5b8f6751/scenictour"
									target="_blank">宏村</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/tongli109916/scenictour"
									target="_blank">同里</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/zhouzhuang81/scenictour"
									target="_blank">周庄</a> <a class="hotSpotsChild hot"
									href="http://dujia.lvmama.com/tour/wuzhen97/scenictour-I97#list#list"
									target="_blank">乌镇</a> <a class="hotSpotsChild"
									href="http://s.lvmama.com/scenictour/I3933K330100?keyword=%E8%A5%BF%E5%A1%98#list#list"
									target="_blank">西塘</a>
							</dd>
						</dl>
						<dl>
							<dt>浙里最热</dt>
							<dd>

								<a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/qiandaohu102/scenictour"
									target="_blank">千岛湖</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/anji110/scenictour"
									target="_blank">安吉</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-6a2a5e975f7189c657ce/scenictour"
									target="_blank">横店</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/moganshan3936/scenictour"
									target="_blank">莫干山</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-676d5dde5b8b57ce/scenictour"
									target="_blank">宋城</a> <a class="hotSpotsChild hot"
									href="http://dujia.lvmama.com/tour/xiangshan105/scenictour"
									target="_blank">象山</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-4e546ce2/scenictour"
									target="_blank">乔波冰雪世界</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/lishuimaoxiandaoshuishijie158165/scenictour"
									target="_blank">冒险岛水世界</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/wuzhen97/scenictour"
									target="_blank">乌镇</a>
							</dd>
						</dl>
						<dl>
							<dt>温泉养生</dt>
							<dd>

								<a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/huangshan127/scenictour"
									target="_blank">黄山泡汤</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-6e4d53e34f175b896c216e296cc9/scenictour"
									target="_blank">湍口温泉</a> <a class="hotSpotsChild hot"
									href="http://dujia.lvmama.com/tour/s-96ea6d6a6e56/scenictour"
									target="_blank">上海之根雪浪湖温泉</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-65e567088c376e296cc9/scenictour"
									target="_blank">厦门日月谷温泉</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-5fa16c346e296cc9/scenictour-I3554#list#list"
									target="_blank">御水温泉</a> <a class="hotSpotsChild"
									href="http://dujia.lvmama.com/tour/s-91d151e451f06e296cc9/scenictour-I3875#list#list"
									target="_blank">金凤凰温泉</a>
							</dd>
						</dl>
					</div>
					<!-- //channelNav-main -->
				</div>


				<div class="channelNav-list channelNav-last">

					<div class="channelNav-tit"
						style="background-color: rgb(204, 232, 207);">
						<h4>精品线路</h4>
						<p class="channelNav-hot">
							<!--左下-->
							<a class="boutiqueLine"
								href="http://s.lvmama.com/group/D9H9K310000?keyword=%E6%99%AE%E9%99%80%E5%B1%B1#list"
								target="_blank">普陀山</a> <a class="boutiqueLine hot"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E6%A8%AA%E5%BA%97%E5%BD%B1%E8%A7%86%E5%9F%8E&amp;k=1#list"
								target="_blank">横店</a> <a class="boutiqueLine"
								href="http://s.lvmama.com/group/H9?keyword=%E4%B9%8C%E9%95%87&amp;k=0#list"
								target="_blank">乌镇</a> <a class="boutiqueLine"
								href="http://dujia.lvmama.com/freetour/1672721" target="_blank">小木屋</a>

							<a class="boutiqueLine"
								href="http://dujia.lvmama.com/tour/qiandaohu102/group#list"
								target="_blank">千岛湖</a>

						</p>
					</div>
					<!-- //channelNav-tit -->
					<div class="channelNav-main"
						style="background-color: rgb(204, 232, 207);">
						<dl>
							<dt>当季热门</dt>
							<dd>
								<a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E9%BB%84%E5%B1%B1&amp;tabType=route350#list"
									title="" target="_blank">黄山</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E6%9D%AD%E5%B7%9E&amp;k=0#list"
									title="" target="_blank">杭州</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E8%8E%AB%E5%B9%B2%E5%B1%B1&amp;k=1#list"
									title="" target="_blank">莫干山</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E6%97%A0%E9%94%A1&amp;k=0#list"
									title="" target="_blank">无锡</a>

							</dd>
						</dl>
						<dl>
							<dt>亲子周末</dt>
							<dd>
								<a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E5%8D%83%E5%B2%9B%E6%B9%96&amp;k=1#list"
									title="" target="_blank">千岛湖</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E6%A8%AA%E5%BA%97&amp;k=0#list"
									title="" target="_blank">横店影视城</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B9%9D%E5%8D%8E%E5%B1%B1&amp;k=1#list"
									title="" target="_blank">九华山</a> <a class="boutiqueLineChild"
									href="http://dujia.lvmama.com/tour/s-4e0a6d778fea58eb5c3c4e5056ed/group#list"
									title="" target="_blank">上海迪士尼乐园</a>

							</dd>
						</dl>
						<dl>
							<dt>江南水乡</dt>
							<dd>
								<a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/D9H9K310000?keyword=%E5%91%A8%E5%BA%84#list"
									title="" target="_blank">周庄</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E7%BB%8D%E5%85%B4&amp;k=0#list"
									title="" target="_blank">绍兴</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E6%89%AC%E5%B7%9E&amp;k=1#list"
									title="" target="_blank">扬州</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E5%AE%89%E5%90%89&amp;k=0#list"
									title="" target="_blank">安吉</a>

							</dd>
						</dl>
						<dl>
							<dt>亲近自然</dt>
							<dd>
								<a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E5%A4%A9%E7%9B%AE%E6%B9%96&amp;k=0#list"
									title="" target="_blank">天目湖</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B8%89%E6%B8%85%E5%B1%B1&amp;k=0#list"
									title="" target="_blank">三清山</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E5%8D%97%E4%BA%AC&amp;k=1#list"
									title="" target="_blank">南京</a> <a class="boutiqueLineChild"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E8%A5%BF%E5%A1%98&amp;k=1#list"
									title="" target="_blank">西塘</a>

							</dd>
						</dl>
					</div>
					<!-- //channelNav-main -->
				</div>

			</div>
			<!--//channelNav banner中的导航 End -->

			<!-- banBox banner盒子 -->
			<div class="banBox fr pr">
				<div class="banBox-btn banBox-btnL pa" style="display: none;">
					<i class="channelIcon channelIcon-banL"></i>
				</div>
				<div class="banBox-btn banBox-btnR pa" style="display: none;">
					<i class="channelIcon channelIcon-banR"></i>
				</div>
				<div class="banTab pa">
					<!-- <span class="">
					<i></i></span>
					<span class=""><i></i></span>
					<span
						class=""><i></i></span>
						<span class="active"><i
						style="width: 18px;"></i></span>
						<span class=""><i></i></span>
						<span
						class=""><i></i></span> -->
				</div>

				<ul style="width: 6405px; left: -3660px;" class="banPic pa"
					id="js_allyes_1">
					<li><a
						href="http://s.lvmama.com/scenictour/K310000?keyword=%E6%9D%AD%E5%B7%9E%E5%AE%8B%E5%9F%8E%E6%99%AF%E5%8C%BA&amp;k=1#list"
						target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','7_9_79_1246')"><img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-11-01/304cdc32-5837-4e6f-97df-6e1086a1bc79.jpg"
							height="325" width="915"></a></li>
					<li><a
						href="http://zt.lvmama.com/subject/jingjiuzhongqiumeimanshuangjiehuanan-2118"
						target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','7_9_79_1409')"><img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-11-02/5b61d8d4-ad9c-477f-9e50-f0417fcccb54.jpg"
							height="325" width="915"></a></li>
					<li><a href="http://www.lvmama.com/tuangou/sale-1672993"
						target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','7_9_79_1739')"><img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-11-02/0532fbe7-00d7-4aa9-99ac-290fd52a866a.jpg"
							height="325" width="915"></a></li>
					<li><a
						href="http://zt.lvmama.com/subject/xiangshanhaixianmeishijie-2268"
						target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','7_9_79_1705')"><img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-10-30/9b7d5eff-ac14-4dcc-992d-78094fd44f8e.jpg"
							height="325" width="915"></a></li>
					<li><a href="http://www.lvmama.com/tuangou/sale-359600"
						target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','7_9_79_1747')"><img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-11-05/55bf53b0-fd02-4855-afad-8dc7c2738007.jpg"
							height="325" width="915"></a></li>
					<li><a href="http://www.lvmama.com/tuangou/sale-1795789"
						target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','7_9_79_1656')"><img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-11-05/cb777729-e136-4db0-bea2-fba8ebe2420b.jpg"
							height="325" width="915"></a></li>
					<li><a
						href="http://s.lvmama.com/scenictour/K310000?keyword=%E6%9D%AD%E5%B7%9E%E5%AE%8B%E5%9F%8E%E6%99%AF%E5%8C%BA&amp;k=1#list"
						target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','7_9_79_1246')"><img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-11-01/304cdc32-5837-4e6f-97df-6e1086a1bc79.jpg"
							height="325" width="915"></a></li>
				</ul>
			</div>
		</div>
		<!-- //w1200 -->
	</div>
	<!--//banWrap 首屏banner End -->

	<div class="w1200 bc mt35">

		<!-- 楼层名-->
		<!-- tab标题-->

		<!-- 周边跟团游 -->
		<div class="channelFree clearfix mt35 JS_nav">
			<div class="modTit">
				<h3>周边跟团游</h3>
			</div>
			<!-- 侧边导航 -->
			<div class="channelFree-nav channelSiderNav tc p30 mt10 yh fl pr"
				style="background-color: rgb(204, 232, 207);">
				<div class="channelSiderNav-tit">
					<h4 class="f16 fn" style="background-color: rgb(204, 232, 207);">热门目的地</h4>
				</div>
				<ul class="mt20 clearfix" id="mt20clearfix">
					<li><a
						href="http://s.lvmama.com/group/D9H9K310000Z7?keyword=%E5%A4%A9%E7%9B%AE%E6%B9%96#list"
						title="天目湖" target="_blank">天目湖</a></li>

				</ul>
			</div>
			<!-- //channelFree-nav -->

			<!-- 自由行产品 -->
			<div class="channelFree-pro channelPro fr mt10" >
				<ul class="proList clearfix" id="zhoubiangentuan">
					<li><a class="proList-img"
						title="普陀山2日纯玩无购物祈福跟团游([年终钜惠]含酒店早餐（景区VIP酒店），宿普陀山天竺山庄或瑞景大酒店A房)"
						href="http://dujia.lvmama.com/group/275533" target="_blank"><img
							width="285" height="190" alt=""
							src="http://s3.lvjs.com.cn/pics//uploads/pc/place2/2016-09-01/dfca2232-c82d-4b9e-bc34-a512fc45da18.jpg"></a>
						<a class="proList-tit"
						title="普陀山2日纯玩无购物祈福跟团游([年终钜惠]含酒店早餐（景区VIP酒店），宿普陀山天竺山庄或瑞景大酒店A房)"
						href="http://dujia.lvmama.com/group/275533" target="_blank">
							普陀山2日纯玩无购物祈福跟团游([年终钜惠]含酒店早餐（景区VIP酒店），宿普陀山天竺山庄或瑞景大酒店A房) </a>
						<p class="proList-info">
							<span class="proList-info-price fr"> <dfn>
									<i>¥</i> 529
								</dfn>起
							</span> <em class="proList-info-tag">96.6%好评！</em>
						</p></li>
				</ul>
			</div>
			<!-- //channelFree-pro -->
		</div>
		<!-- //channelFree 周边跟团游-->
		<!-- 特价不打烊 -->
		<!-- 特价楼层名-->
		<!--楼层下的产品-->

		<div class="channelSpr mt35 JS_nav">
			<div class="modTit">
				<h3>特价不打烊</h3>
			</div>
			<ul class="proList clearfix mt10 specialPriceFor" id="huodonglist">
				<li><a class="proList-img"
					title="天目湖2天1晚【499元特卖来袭】天目湖轻奢酒店（7选1）+天目湖山水园/天目湖南山竹海/天目湖御水温泉景区（3选1）+特色砂锅鱼头1份，数量有限售完即止！"
					href="http://www.lvmama.com/tuangou/deal-1672993" target="_blank">
						<img width="285" height="190" alt=""
						src="http://s3.lvjs.com.cn/pics//uploads/pc/place2/2018-10-19/a62ec9ec-dead-4580-b9c8-2c83634178f0.jpg">
				</a> <a class="proList-tit"
					title="天目湖2天1晚【499元特卖来袭】天目湖轻奢酒店（7选1）+天目湖山水园/天目湖南山竹海/天目湖御水温泉景区（3选1）+特色砂锅鱼头1份，数量有限售完即止！"
					href="http://www.lvmama.com/tuangou/deal-1672993" target="_blank">天目湖2天1晚【499元特卖来袭】天目湖轻奢酒店（7选1）+天目湖山水园/天目湖南山竹海/天目湖御水温泉景区（3选1）+特色砂锅鱼头1份，数量有限售完即止！</a>

					<p class="proList-info">
						<span class="proList-info-price fr"><dfn>
								<i>¥</i> 499
							</dfn>/起</span>
					</p></li>
			</ul>
		</div>


		<!-- 活动玩不停 -->
		<!-- 楼层名-->
		<!--楼层下的左侧产品-->
		<!--楼层下的右侧产品-->

		<div class="prom mt35 JS_nav">
			<div class="modTit">
				<h3>活动玩不停</h3>
			</div>
			<ul class="mt10 activityFor">
				<li class="mr20"><a
					href="http://dujia.lvmama.com/freetour/1491702" class="proList-img"
					title="" target="_blank"><img width="590" height="250" alt=""
						src="http://s1.lvjs.com.cn/uploads/pc/place2/2018-10-23/b38de889-0231-4a49-9a68-abc7c4493f28.jpg"></a></li>
				<li class="mr20"><a
					href="http://zt.lvmama.com/subject/jingjiuzhongqiumeimanshuangjie-2112"
					class="proList-img" title="" target="_blank"><img width="285"
						height="250" alt=""
						src="http://s2.lvjs.com.cn/uploads/pc/place2/2018-10-08/137498a5-2f31-455e-b4a2-bf9336631726.jpg"></a></li>
				<li class="pr"><a target="_blank"
					href="http://s.lvmama.com/scenictour/K310000?keyword=%E4%B8%B4%E5%AE%89%E6%B9%8D%E5%8F%A3&amp;k=0#list">
						<span class="channelIcon trailer pa tc"> <strong
							class="fn yh mt35">临安湍口温泉</strong>

							<p class="f16 yh">2晚连住特惠</p>
							<p class="trailer-more mt10">查看更多&gt;&gt;</p>
					</span> <img width="285" height="250" alt=""
						src="http://s1.lvjs.com.cn/uploads/pc/place2/2018-09-17/dc0e031a-cda9-4ea5-a541-c80a1516d2c9.jpg">
				</a></li>
			</ul>
		</div>
		<!-- //prom -->

		<!-- 楼层名-->
		<!--楼层下的左侧推荐主题-->
		<!--楼层下的右侧产品-->

		<!--楼层下的左侧推荐主题-->
		<!--楼层下的右侧产品-->


		<!-- //week -->
		<!-- 看风景  -->
		<!-- 陪她看风景楼层名-->
		<!--楼层下的左侧推荐主题-->
		<!--楼层下的右侧产品-->


		<div class="scenery mt35 JS_nav">
			<div class="modTit">
				<h3>陪她看风景</h3>
			</div>
			<div class="promPro-wrap clearfix mt10 lookScenery">
				<div class="promPro-proList fr">
					<ul class="proList" id="promPro-proListlist">
						<li><a class="proList-img"
							title="【秀山丽水·缙云仙都3天2晚自由行】住丽水华侨开元名都大酒店(挂牌5星)2晚＋游古堰画乡＋仙都景点选1（花千骨／道士下山拍摄地）"
							href="http://dujia.lvmama.com/freetour/812111" target="_blank">
								<img width="285" height="190" alt=""
								src="http://s2.lvjs.com.cn/pics//uploads/pc/place2/2016-06-08/4d8f5cd6-9334-480d-b26c-827f7c865bb2.jpg">
						</a> <a class="proList-tit"
							title="【秀山丽水·缙云仙都3天2晚自由行】住丽水华侨开元名都大酒店(挂牌5星)2晚＋游古堰画乡＋仙都景点选1（花千骨／道士下山拍摄地）"
							href="http://dujia.lvmama.com/freetour/812111" target="_blank">【秀山丽水·缙云仙都3天2晚自由行】住丽水华侨开元名都大酒店(挂牌5星)2晚＋游古堰画乡＋仙都景点选1（花千骨／道士下山拍摄地）</a>

							<p class="proList-info">
								<span class="proList-info-price fr"><dfn>
										<i>¥</i> 976
									</dfn>/起</span> <em class="proList-info-hotel">丽水华侨开元名都大酒店</em>
							</p></li>
					</ul>
				</div>
				<!-- //hotel-proList -->
				<a class="proShow tc pr"
					href="http://dujia.lvmama.com/tour/s-60c54fa3/scenictour"
					target="_blank"> <img width="285" height="268" alt=""
					src="http://s2.lvjs.com.cn/uploads/pc/place2/95763/1438784626876.jpg">

					<p class="proShow-info pa yh">
						<span> <strong>陪她看风景</strong> <em>甜蜜的旅程</em>
						</span> <i class="proShow-info-more">查看更多&gt;</i>
					</p>
				</a>
				<!-- //proShow -->
			</div>
		</div>

		<!-- 周边去哪玩 -->
		<!-- 周边游楼层名-->
		<!--楼层下的左侧推荐主题-->


		<div class="tourAround mt35 JS_nav">
			<div class="modTit">
				<h3>周边去哪玩</h3>
			</div>
			<div class="tourAround-li mt10 yh f14">
				<a class="active"
					href="http://s.lvmama.com/scenictour/K310000?keyword=%E4%B8%8A%E6%B5%B7&amp;k=0#list"
					target="_blank">
					<p class="tourAroundInfo pa">上海</p> <img class="tourAround-li-img"
					alt="" width="690" height="262"
					src="http://s1.lvjs.com.cn/uploads/pc/place2/2015-08-17/ee1f1cee-60d7-4e7f-b86f-1493ad01ecea.jpg">
					<span class="tourAround-opcity"></span>
				</a> <a href="http://dujia.lvmama.com/tour/suzhou87/scenictour"
					target="_blank">
					<p class="tourAroundInfo pa">苏州</p> <img class="tourAround-li-img"
					alt="" width="690" height="262"
					src="http://s2.lvjs.com.cn/uploads/pc/place2/2016-05-13/39dcfa7a-26ce-4e71-b7bf-28e31eca49be.jpg">
					<span class="tourAround-opcity"></span>
				</a> <a href="http://dujia.lvmama.com/tour/hangzhou100/scenictour"
					target="_blank">
					<p class="tourAroundInfo pa">杭州</p> <img class="tourAround-li-img"
					alt="" width="690" height="262"
					src="http://s3.lvjs.com.cn/uploads/pc/place2/2016-07-04/3c967fcb-4b51-4946-9b9a-53bc1b4f5a39.jpg">
					<span class="tourAround-opcity"></span>
				</a> <a href="http://dujia.lvmama.com/tour/xiamen137/scenictour-D0#list"
					target="_blank">
					<p class="tourAroundInfo pa">厦门</p> <img class="tourAround-li-img"
					alt="" width="690" height="262"
					src="http://s1.lvjs.com.cn/uploads/pc/place2/2016-07-04/6d13f3ca-ea1e-42a9-a128-3a6666340f91.jpg">
					<span class="tourAround-opcity"></span>
				</a> <a href="http://dujia.lvmama.com/tour/changzhou86/scenictour"
					target="_blank">
					<p class="tourAroundInfo pa">常州</p> <img class="tourAround-li-img"
					alt="" width="690" height="262"
					src="http://s2.lvjs.com.cn/uploads/pc/place2/2015-08-14/6bf8ce5f-f2ec-42a2-919d-0c08f33b9e2e.jpg">
					<span class="tourAround-opcity"></span>
				</a> <a href="http://dujia.lvmama.com/tour/ningbo104/scenictour"
					target="_blank">
					<p class="tourAroundInfo pa">宁波</p> <img class="tourAround-li-img"
					alt="" width="690" height="262"
					src="http://s3.lvjs.com.cn/uploads/pc/place2/2016-07-04/bbfc0531-e764-4dac-80b8-ddc6d2df479c.jpg">
					<span class="tourAround-opcity"></span>
				</a> <a href="http://dujia.lvmama.com/tour/huangshan127/scenictour"
					target="_blank">
					<p class="tourAroundInfo pa">黄山</p> <img class="tourAround-li-img"
					alt="" width="690" height="262"
					src="http://s1.lvjs.com.cn/uploads/pc/place2/97272/1438841146570.jpg">
					<span class="tourAround-opcity"></span>
				</a>
			</div>
		</div>
		<!-- //tourAround周边 -->


		<div class="aroundFootAd mt20">
		</div>

		<!--// floatNav -->
	</div>
	<!-- //1200 bc -->

	<!-- 底部-->
	<script src="http://s3.lvjs.com.cn/js/v6/public/footer.js"></script>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="js/around.js"></script>
	<script type="text/javascript" src="js/destroute.js"></script>
	<script type="text/javascript" src="js/lvSide.js"></script>
	<script type="text/javascript" src="js/header_new.js"></script>
	<div class="hh_cooperate">

		<p>
			<b>友情链接：</b><span> <a href="http://shiyi.lvmama.com"
				target="_blank" hidefocus="false">十一旅游</a> <a
				href="http://dujia.lvmama.com" target="_blank" hidefocus="false">旅游线路</a>
				<a href="http://ticket.lvmama.com" target="_blank" hidefocus="false">门票预订</a>
				<a href="http://www.hifangjia.com/" target="_blank"
				hidefocus="false">周边旅游</a> <a
				href="http://www.lvmama.com/lvyou/guide/2015-1208-199837.html"
				rel="nofollow" target="_blank" hidefocus="false">查看更多</a>
			</span>
		</p>


	</div>

	<script>
		//热门度假区特效
		$(function() {
			$('.js-tab').each(function() {
				var This = $(this),
					$span = This.find('.js-tab-nav>span'),
					$tabcon = This.find('.js-tab-con>ul');
				$span.eq(0).addClass('active');
				$tabcon.eq(0).show();
				$span.on("click", function() {
					var index = $(this).index() - 1;
					$span.removeClass('active').eq(index).addClass('active');
					$tabcon.hide().eq(index).show();
					var $tab = $tabcon.eq(index);
					showUnloadedImg($tab);
				});
			});
			function showUnloadedImg($showBox) {
				var imgs = $showBox.find('img');
				imgs.each(function() {
					var $me = $(this);
					var imgSrc = $me.attr('to');
					if (imgSrc) {
						$me.attr('src', imgSrc).removeAttr('to');
					}
				});
			}
	
		})
	//热门主题
	hotTitle('周边游');
	function hotTitle(value){
		$.ajax({
			url:'title',
			type:'POST',
			data:'attractions='+value,
			success:function(data){
				var str="";
				for(var i=0;i<data.length&&i<4;i++){
					str+='<a onclick="" target="_blank" href="">'+data[i].type+'</a>';
				}
				$("#mt20clearfix").html(str);
			}
		});
	}
	//查询热门路线
	hotWay('周边游');
	function hotWay(value){
		$.ajax({
			url:'scenicway',
			type:'POST',
			data:'attractions='+value,
			success:function(data){
				var str="";
				for(var i=0;i<data.length;i++){
					str+='<li><a class="proList-img" '
						+'title="'+subAndFilt(data[i].way+data[i].description)+'"'
						+'href="scenicway/tourRouteProductShow/'+data.id+'" target="_blank"><img '
						+'width="285" height="190" alt="" '
						+'src="'+data[i].scenicwayImage+'"></a>'
						+'<a class="proList-tit" '
						+'title="'+subAndFilt(data[i].way+data[i].description)+'" '
						+'href="scenicway/tourRouteProductShow/'+data.id+'" target="_blank">'
						+subAndFilt(data[i].way+data[i].description)+'</a>'
						+'<p class="proList-info">'
						+'<span class="proList-info-price fr"> <dfn>'
						+'<i>¥</i>'+data[i].floor_price
						+'</dfn>起'
						+'</span> <em class="proList-info-tag">'+data[i].feedback+'%好评！</em>'
						+'</p></li>';
				}
				$("#zhoubiangentuan").html(str);
			}
		});
	};
	//特价不打烊
	huodong();
	function huodong(){
		$.ajax({
			url:'activity',
			type:'POST',
			success:function(data){
				var str="";
				for(var i=0;i<data.length;i++){
					str+='<li><a class="proList-img" '
						+'title="'+subAndFilt(data[i].way+data[i].description)+'"'
						+'href="scenicway/tourRouteProductShow/'+data.id+'" target="_blank">'
						+'<img width="285" height="190" alt="" '
						+'src="'+data[i].scenicwayImage+'">'
						+'</a> <a class="proList-tit"'
						+'title="'+subAndFilt(data[i].way+data[i].description)+'"'
							+'href="scenicway/tourRouteProductShow/'+data.id+'" target="_blank">'+subAndFilt(data[i].way+data[i].description)+'</a>'
							+'<p class="proList-info">'
							+'<span class="proList-info-price fr"><dfn>'
							+'<i>¥</i>'+data[i].floor_price
										+'</dfn>/起</span>'
										+'</p></li>';
				}
				$("#huodonglist").html(str);
			}
		});
	}
	zhutiByql('情侣');
	function zhutiByql(value){
		$.ajax({
			url:'title/scenicway',
			type:'POST',
			data:"title="+value,
			success:function(data){
				var str="";
				for(var i=0;i<data.length;i++){
					str+='<li><a class="proList-img" '
						+'title="'+subAndFilt(data[i].way+data[i].description)+'"'
						+'href="scenicway/tourRouteProductShow/'+data.id+'" target="_blank">'
						+'<img width="285" height="190" alt="" '
						+'src="'+data[i].scenicwayImage+'">'
						+'</a> <a class="proList-tit"'
						+'title="'+subAndFilt(data[i].way+data[i].description)+'"'
							+'href="scenicway/tourRouteProductShow/'+data.id+'" target="_blank">'+subAndFilt(data[i].way+data[i].description)+'</a>'
							+'<p class="proList-info">'
							+'<span class="proList-info-price fr"><dfn>'
							+'<i>¥</i>'+data[i].floor_price
										+'</dfn>/起</span>'
										+'</p></li>';
				}
				$("#promPro-proListlist").html(str);
			}
		});
	};
	function subAndFilt(str) {
		var dd = str.replace(/<[^>]+>/g, ""); //截取html标签
		var dds = dd.replace(/&nbsp;/ig, ""); //截取空格等特殊标签
		return dds.substring(0, 200) + "...";
	}
	</script>
</body>
</html>