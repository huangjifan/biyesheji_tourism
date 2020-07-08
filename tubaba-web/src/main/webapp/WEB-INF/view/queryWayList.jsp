<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" style="background-color: rgb(204, 232, 207);">
<head>
<meta charset="UTF-8">
<title>详情页面-兔爸爸</title>
<meta name="keywords" content="详情页面">
<meta name="description" content="详情页面">
<meta name="renderer" content="webkit">


<script
	src="http://pic.lvmama.com/min/index.php?f=js/new_v/jquery-1.7.2.min.js&amp;v=110518"></script>
<!--<script src="http://s.lvmama.com/js/route/ipLocation.js?v=110518"></script>

<script src="http://s.lvmama.com/js/route/redirect2mobile.js?v=110518"></script> -->

<link rel="stylesheet"
	href="http://pic.lvmama.com/min/index.php?f=styles/v6/header_new.css,styles/lv/buttons.css,styles/v5/modules/paging.css,styles/lv/calendar.css,styles/v5/modules/tip.css,styles/lv/dialog.css,styles/search/v1/search-list-fit.css,styles/v6/public/common_box.css,styles/v5/modules/tags.css,styles/search/v3/search-list.css&amp;v=110518">
<link rel="stylesheet"
	href="http://s.lvmama.com/js/route/seoInlink/css/index.css?v=110518">


</head>

<body class="search_list search_list_dujia"
	style="background-color: rgb(204, 232, 207);" onscroll="checkscroll()">

	<!-- 公共头部开始  -->
	<script type="text/javascript"
		src="http://www.lvmama.com/js/2017/jQuerySuperScript.js"></script>
	<jsp:include page="../../head.jsp"></jsp:include>
	<!-- 公共头部结束  -->

	<div class="everything" style="background-color: rgb(204, 232, 207);">
		<!--主体 开始-->
		<div class="main clearfix">
			<!--面包屑导航-->
			<div class="crumbs">
				<p class="crumbs-link">
					<span class="crumbs-info"> 你当前所在的位置： </span> <a rel="nofollow"
						href="http://www.lvmama.com">首页</a> &gt; <a rel="nofollow"
						href="javascript:void(0)" onclick="location.reload()"> 出发地参团 </a>
					&gt; <a rel="nofollow" class="current">北京大学</a>
				</p>
				<div id="lmmurl" style="display: none;"></div>
				<p></p>
			</div>
			<!--面包屑导航-->

			<!--搜索框 开始-->

			<div class="main-search clearfix" id="list">
				<input type="hidden" id="fromPlaceName" value="">
				<div class="lv_search_box">
					<div class="search_type">
						<div class="btn_type js_btn_type">
							<b data-type="GROUP">${scope }</b><i class="icon_arrow"></i>
						</div>
						<ul class="search_type_tab"
							style="background-color: rgb(204, 232, 207);">
							<li data-type="ROUTE" style="display: list-item;">全部旅游</li>
							<li data-type="GROUP" style="display: none;">跟团游</li>
							<li data-type="TICKET">景点门票</li>
							<li data-type="FREETOUR">自由行</li>
							<li data-type="LOCAL">当地游</li>
						</ul>
					</div>
					<div class="search_type_box">
						<!--全部-->
						<div class="search_type_list" id="search_all_fromPlaces"
							style="display: none;">
							<div class="search_city">
								<div class="btn_city js_searchbox"
									style="background-color: rgb(204, 232, 207);">
									<b data-id="9">${path }</b><span>出发</span><i class="icon_arrow"></i>
								</div>

								<!--首页——出发城市 -----开始-->
								<div class="lv_city_down js_cf_city js_all_city"
									style="background-color: rgb(204, 232, 207); width: 460px;">
									<div class="search-station-hot">
										<h4>热门出发城市</h4>
										<div class="list clearfix">
											<a data-code="SH" data-id="9" data-name="上海">上海</a> <a
												data-code="SZ" data-id="60" data-name="苏州">苏州</a> <a
												data-code="HZ" data-id="69" data-name="杭州">杭州</a> <a
												data-code="BJ" data-id="13" data-name="北京">北京</a> <a
												data-code="TY" data-id="100" data-name="太原">太原</a> <a
												data-code="GZ" data-id="322" data-name="广州">广州</a> <a
												data-code="CD" data-id="258" data-name="成都">成都</a> <a
												data-code="ZQ" data-id="31" data-name="重庆">重庆</a> <a
												data-code="SY" data-id="257" data-name="三亚">三亚</a> <a
												data-code="CZ" data-id="59" data-name="常州">常州</a> <a
												data-code="HZ" data-id="73" data-name="湖州">湖州</a> <a
												data-code="QD" data-id="175" data-name="青岛">青岛</a> <a
												data-code="TJ" data-id="14" data-name="天津">天津</a> <a
												data-code="SZ" data-id="324" data-name="深圳">深圳</a> <a
												data-code="KM" data-id="233" data-name="昆明">昆明</a> <a
												data-code="HK" data-id="221" data-name="海口">海口</a> <a
												data-code="NJ" data-id="56" data-name="南京">南京</a> <a
												data-code="JX" data-id="72" data-name="嘉兴">嘉兴</a> <a
												data-code="NT" data-id="61" data-name="南通">南通</a> <a
												data-code="WX" data-id="57" data-name="无锡">无锡</a> <a
												data-code="XA" data-id="256" data-name="西安">西安</a>
										</div>
									</div>
									<div class="search-station-cities">
										<ul class="nav-tabs clearfix">
											<li class="active">ABCD<i></i></li>
											<li>EFGH<i></i></li>
											<li>JKLM<i></i></li>
											<li>NOPQRS<i></i></li>
											<li>TUVWX<i></i></li>
											<li>YZ<i></i></li>
										</ul>
										<ul class="tab-contents">
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>A</dt>
													<dd class="clearfix">
														<a class="city" data-id="380" data-name="阿勒泰"
															data-code="ALT">阿勒泰</a><a class="city" data-id="338"
															data-name="安康" data-code="AK">安康</a><a class="city"
															data-id="41" data-name="中国澳门" data-code="AM">中国澳门</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>B</dt>
													<dd class="clearfix">
														<a class="city" data-id="82" data-name="蚌埠" data-code="BB">蚌埠</a><a
															class="city" data-id="94" data-name="保定" data-code="BD">保定</a><a
															class="city" data-id="332" data-name="宝鸡" data-code="BJ">宝鸡</a><a
															class="city" data-id="112" data-name="包头" data-code="BT">包头</a><a
															class="city" data-id="211" data-name="北海" data-code="BH">北海</a><a
															class="city" data-id="13" data-name="北京" data-code="BJ">北京</a><a
															class="city" data-id="189" data-name="滨州" data-code="BZ">滨州</a><a
															class="city" data-id="3171" data-name="博乐市"
															data-code="BLS">博乐市</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>C</dt>
													<dd class="clearfix">
														<a class="city" data-id="97" data-name="沧州" data-code="CZ">沧州</a><a
															class="city" data-id="137" data-name="长春" data-code="CC">长春</a><a
															class="city" data-id="314" data-name="常德" data-code="CD">常德</a><a
															class="city" data-id="308" data-name="长沙" data-code="CS">长沙</a><a
															class="city" data-id="59" data-name="常州" data-code="CZ">常州</a><a
															class="city" data-id="258" data-name="成都" data-code="CD">成都</a><a
															class="city" data-id="31" data-name="重庆" data-code="CQ">重庆</a><a
															class="city" data-id="146" data-name="滁州" data-code="CZ">滁州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>D</dt>
													<dd class="clearfix">
														<a class="city" data-id="245" data-name="大理"
															data-code="DL">大理</a><a class="city" data-id="124"
															data-name="大连" data-code="DL">大连</a><a class="city"
															data-id="101" data-name="大同" data-code="DT">大同</a><a
															class="city" data-id="272" data-name="达州" data-code="DZ">达州</a><a
															class="city" data-id="187" data-name="德州" data-code="DZ">德州</a><a
															class="city" data-id="202" data-name="东莞" data-code="DG">东莞</a><a
															class="city" data-id="178" data-name="东营" data-code="DY">东营</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>F</dt>
													<dd class="clearfix">
														<a class="city" data-id="327" data-name="佛山"
															data-code="FS">佛山</a><a class="city" data-id="147"
															data-name="阜阳" data-code="FY">阜阳</a><a class="city"
															data-id="172" data-name="抚州" data-code="FZ">抚州</a><a
															class="city" data-id="154" data-name="福州" data-code="FZ">福州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>G</dt>
													<dd class="clearfix">
														<a class="city" data-id="169" data-name="赣州"
															data-code="GZ">赣州</a><a class="city" data-id="264"
															data-name="广元" data-code="GY">广元</a><a class="city"
															data-id="322" data-name="广州" data-code="GZ">广州</a><a
															class="city" data-id="209" data-name="桂林" data-code="GL">桂林</a><a
															class="city" data-id="224" data-name="贵阳" data-code="GY">贵阳</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>H</dt>
													<dd class="clearfix">
														<a class="city" data-id="43" data-name="哈尔滨"
															data-code="HEB">哈尔滨</a><a class="city" data-id="221"
															data-name="海口" data-code="HK">海口</a><a class="city"
															data-id="92" data-name="邯郸" data-code="HD">邯郸</a><a
															class="city" data-id="69" data-name="杭州" data-code="HZ">杭州</a><a
															class="city" data-id="336" data-name="汉中" data-code="HZ">汉中</a><a
															class="city" data-id="80" data-name="合肥" data-code="HF">合肥</a><a
															class="city" data-id="46" data-name="鹤岗" data-code="HG">鹤岗</a><a
															class="city" data-id="99" data-name="衡水" data-code="HS">衡水</a><a
															class="city" data-id="311" data-name="衡阳" data-code="HY">衡阳</a><a
															class="city" data-id="190" data-name="菏泽" data-code="HZ">菏泽</a><a
															class="city" data-id="63" data-name="淮安" data-code="HA">淮安</a><a
															class="city" data-id="85" data-name="淮北" data-code="HB">淮北</a><a
															class="city" data-id="88" data-name="黄山市" data-code="HSS">黄山市</a><a
															class="city" data-id="111" data-name="呼和浩特"
															data-code="HHHT">呼和浩特</a><a class="city" data-id="196"
															data-name="惠州" data-code="HZ">惠州</a><a class="city"
															data-id="117" data-name="呼伦贝尔" data-code="HLBE">呼伦贝尔</a><a
															class="city" data-id="73" data-name="湖州" data-code="HZ">湖州</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>J</dt>
													<dd class="clearfix">
														<a class="city" data-id="170" data-name="吉安"
															data-code="JA">吉安</a><a class="city" data-id="280"
															data-name="焦作" data-code="JZ">焦作</a><a class="city"
															data-id="72" data-name="嘉兴" data-code="JX">嘉兴</a><a
															class="city" data-id="341" data-name="嘉峪关"
															data-code="JYG">嘉峪关</a><a class="city" data-id="19"
															data-name="吉林" data-code="JL">吉林</a><a class="city"
															data-id="174" data-name="济南" data-code="JN">济南</a><a
															class="city" data-id="164" data-name="景德镇"
															data-code="JDZ">景德镇</a><a class="city" data-id="75"
															data-name="金华" data-code="JH">金华</a><a class="city"
															data-id="166" data-name="九江" data-code="JJ">九江</a><a
															class="city" data-id="45" data-name="鸡西" data-code="JX">鸡西</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>K</dt>
													<dd class="clearfix">
														<a class="city" data-id="233" data-name="昆明"
															data-code="KM">昆明</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>L</dt>
													<dd class="clearfix">
														<a class="city" data-id="340" data-name="兰州"
															data-code="LZ">兰州</a><a class="city" data-id="249"
															data-name="拉萨" data-code="LS">拉萨</a><a class="city"
															data-id="62" data-name="连云港" data-code="LYG">连云港</a><a
															class="city" data-id="188" data-name="聊城" data-code="LC">聊城</a><a
															class="city" data-id="238" data-name="丽江" data-code="LJ">丽江</a><a
															class="city" data-id="186" data-name="临沂" data-code="LY">临沂</a><a
															class="city" data-id="79" data-name="丽水" data-code="LS">丽水</a><a
															class="city" data-id="150" data-name="六安" data-code="LA">六安</a><a
															class="city" data-id="320" data-name="娄底" data-code="LD">娄底</a><a
															class="city" data-id="193" data-name="洛阳" data-code="LY">洛阳</a><a
															class="city" data-id="261" data-name="泸州" data-code="LZ">泸州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>M</dt>
													<dd class="clearfix">
														<a class="city" data-id="263" data-name="绵阳"
															data-code="MY">绵阳</a><a class="city" data-id="52"
															data-name="牡丹江" data-code="MDJ">牡丹江</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>N</dt>
													<dd class="clearfix">
														<a class="city" data-id="163" data-name="南昌"
															data-code="NC">南昌</a><a class="city" data-id="56"
															data-name="南京" data-code="NJ">南京</a><a class="city"
															data-id="207" data-name="南宁" data-code="NN">南宁</a><a
															class="city" data-id="61" data-name="南通" data-code="NT">南通</a><a
															class="city" data-id="285" data-name="南阳" data-code="NY">南阳</a><a
															class="city" data-id="70" data-name="宁波" data-code="NB">宁波</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>Q</dt>
													<dd class="clearfix">
														<a class="city" data-id="175" data-name="青岛"
															data-code="QD">青岛</a><a class="city" data-id="201"
															data-name="清远" data-code="QY">清远</a><a class="city"
															data-id="91" data-name="秦皇岛" data-code="QHD">秦皇岛</a><a
															class="city" data-id="44" data-name="齐齐哈尔"
															data-code="QQHE">齐齐哈尔</a><a class="city" data-id="158"
															data-name="泉州" data-code="QZ">泉州</a><a class="city"
															data-id="76" data-name="衢州" data-code="QZ">衢州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>R</dt>
													<dd class="clearfix">
														<a class="city" data-id="184" data-name="日照"
															data-code="RZ">日照</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>S</dt>
													<dd class="clearfix">
														<a class="city" data-id="157" data-name="三明"
															data-code="SM">三明</a><a class="city" data-id="257"
															data-name="三亚" data-code="SY">三亚</a><a class="city"
															data-id="9" data-name="上海" data-code="SH">上海</a><a
															class="city" data-id="173" data-name="上饶" data-code="SR">上饶</a><a
															class="city" data-id="326" data-name="汕头" data-code="ST">汕头</a><a
															class="city" data-id="74" data-name="绍兴" data-code="SX">绍兴</a><a
															class="city" data-id="123" data-name="沈阳" data-code="SY">沈阳</a><a
															class="city" data-id="324" data-name="深圳" data-code="SZ">深圳</a><a
															class="city" data-id="89" data-name="石家庄" data-code="SJZ">石家庄</a><a
															class="city" data-id="47" data-name="双鸭山" data-code="SYS">双鸭山</a><a
															class="city" data-id="68" data-name="宿迁" data-code="SQ">宿迁</a><a
															class="city" data-id="60" data-name="苏州" data-code="SZ">苏州</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>T</dt>
													<dd class="clearfix">
														<a class="city" data-id="182" data-name="泰安"
															data-code="TA">泰安</a><a class="city" data-id="100"
															data-name="太原" data-code="TY">太原</a><a class="city"
															data-id="67" data-name="泰州" data-code="TZ">泰州</a><a
															class="city" data-id="78" data-name="台州" data-code="TZ">台州</a><a
															class="city" data-id="90" data-name="唐山" data-code="TS">唐山</a><a
															class="city" data-id="14" data-name="天津" data-code="TJ">天津</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>W</dt>
													<dd class="clearfix">
														<a class="city" data-id="180" data-name="潍坊"
															data-code="WF">潍坊</a><a class="city" data-id="71"
															data-name="温州" data-code="WZ">温州</a><a class="city"
															data-id="291" data-name="武汉" data-code="WH">武汉</a><a
															class="city" data-id="81" data-name="芜湖" data-code="WH">芜湖</a><a
															class="city" data-id="367" data-name="乌鲁木齐"
															data-code="WLMQ">乌鲁木齐</a><a class="city" data-id="57"
															data-name="无锡" data-code="WX">无锡</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>X</dt>
													<dd class="clearfix">
														<a class="city" data-id="155" data-name="厦门"
															data-code="XM">厦门</a><a class="city" data-id="256"
															data-name="西安" data-code="XA">西安</a><a class="city"
															data-id="40" data-name="中国香港" data-code="XG">中国香港</a><a
															class="city" data-id="310" data-name="湘潭" data-code="XT">湘潭</a><a
															class="city" data-id="333" data-name="咸阳" data-code="XY">咸阳</a><a
															class="city" data-id="93" data-name="邢台" data-code="XT">邢台</a><a
															class="city" data-id="354" data-name="西宁" data-code="XN">西宁</a><a
															class="city" data-id="244" data-name="西双版纳"
															data-code="XSBN">西双版纳</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>Y</dt>
													<dd class="clearfix">
														<a class="city" data-id="335" data-name="延安"
															data-code="YA">延安</a><a class="city" data-id="145"
															data-name="延边" data-code="YB">延边</a><a class="city"
															data-id="64" data-name="盐城" data-code="YC">盐城</a><a
															class="city" data-id="65" data-name="扬州" data-code="YZ">扬州</a><a
															class="city" data-id="179" data-name="烟台" data-code="YT">烟台</a><a
															class="city" data-id="270" data-name="宜宾" data-code="YB">宜宾</a><a
															class="city" data-id="294" data-name="宜昌" data-code="YC">宜昌</a><a
															class="city" data-id="171" data-name="宜春" data-code="YC">宜春</a><a
															class="city" data-id="362" data-name="银川" data-code="YC">银川</a><a
															class="city" data-id="130" data-name="营口" data-code="YK">营口</a><a
															class="city" data-id="168" data-name="鹰潭" data-code="YT">鹰潭</a><a
															class="city" data-id="313" data-name="岳阳" data-code="YY">岳阳</a><a
															class="city" data-id="337" data-name="榆林" data-code="YL">榆林</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>Z</dt>
													<dd class="clearfix">
														<a class="city" data-id="315" data-name="张家界"
															data-code="ZJJ">张家界</a><a class="city" data-id="159"
															data-name="漳州" data-code="ZZ">漳州</a><a class="city"
															data-id="191" data-name="郑州" data-code="ZZ">郑州</a><a
															class="city" data-id="203" data-name="中山" data-code="ZS">中山</a><a
															class="city" data-id="77" data-name="舟山" data-code="ZS">舟山</a><a
															class="city" data-id="325" data-name="珠海" data-code="ZH">珠海</a><a
															class="city" data-id="309" data-name="株洲" data-code="ZZ">株洲</a><a
															class="city" data-id="176" data-name="淄博" data-code="ZB">淄博</a>
													</dd>
												</dl></li>
										</ul>
									</div>
								</div>
								<!--首页——出发城市 -----结束-->

							</div>
							<form class="form_search">
								<input class="lv_search w_260" value="${key }" type="text"
									num="0" style="background-color: rgb(204, 232, 207);">

								<!--热门搜索-->
								<div class="search_all_mdd" style="display: none;"></div>
							</form>
						</div>

						<!--跟团游-->
						<div class="search_type_list" id="group_fromPlaces"
							style="display: block;">
							<div class="search_city">
								<div class="btn_city js_searchbox"
									style="background-color: rgb(204, 232, 207);">
									<b data-id="9">${path}</b><span>出发</span><i class="icon_arrow"></i>
								</div>

								<!--首页——出发城市 -----开始-->
								<div class="lv_city_down js_cf_city js_all_city"
									style="background-color: rgb(204, 232, 207); width: 460px;">
									<div class="search-station-hot">
										<h4>热门出发城市</h4>
										<div class="list clearfix">
											<a data-code="SH" data-id="9" data-name="上海">上海</a> <a
												data-code="SZ" data-id="60" data-name="苏州">苏州</a> <a
												data-code="HZ" data-id="69" data-name="杭州">杭州</a> <a
												data-code="BJ" data-id="13" data-name="北京">北京</a> <a
												data-code="TY" data-id="100" data-name="太原">太原</a> <a
												data-code="GZ" data-id="322" data-name="广州">广州</a> <a
												data-code="CD" data-id="258" data-name="成都">成都</a> <a
												data-code="ZQ" data-id="31" data-name="重庆">重庆</a> <a
												data-code="SY" data-id="257" data-name="三亚">三亚</a> <a
												data-code="CZ" data-id="59" data-name="常州">常州</a> <a
												data-code="HZ" data-id="73" data-name="湖州">湖州</a> <a
												data-code="QD" data-id="175" data-name="青岛">青岛</a> <a
												data-code="TJ" data-id="14" data-name="天津">天津</a> <a
												data-code="SZ" data-id="324" data-name="深圳">深圳</a> <a
												data-code="KM" data-id="233" data-name="昆明">昆明</a> <a
												data-code="HK" data-id="221" data-name="海口">海口</a> <a
												data-code="NJ" data-id="56" data-name="南京">南京</a> <a
												data-code="JX" data-id="72" data-name="嘉兴">嘉兴</a> <a
												data-code="NT" data-id="61" data-name="南通">南通</a> <a
												data-code="WX" data-id="57" data-name="无锡">无锡</a> <a
												data-code="XA" data-id="256" data-name="西安">西安</a>
										</div>
									</div>
									<div class="search-station-cities">
										<ul class="nav-tabs clearfix">
											<li class="active">ABCD<i></i></li>
											<li>EFGH<i></i></li>
											<li>JKLM<i></i></li>
											<li>NOPQRS<i></i></li>
											<li>TUVWX<i></i></li>
											<li>YZ<i></i></li>
										</ul>
										<ul class="tab-contents">
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>A</dt>
													<dd class="clearfix">
														<a class="city" data-id="380" data-name="阿勒泰"
															data-code="ALT">阿勒泰</a><a class="city" data-id="338"
															data-name="安康" data-code="AK">安康</a><a class="city"
															data-id="41" data-name="中国澳门" data-code="AM">中国澳门</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>B</dt>
													<dd class="clearfix">
														<a class="city" data-id="82" data-name="蚌埠" data-code="BB">蚌埠</a><a
															class="city" data-id="94" data-name="保定" data-code="BD">保定</a><a
															class="city" data-id="332" data-name="宝鸡" data-code="BJ">宝鸡</a><a
															class="city" data-id="112" data-name="包头" data-code="BT">包头</a><a
															class="city" data-id="211" data-name="北海" data-code="BH">北海</a><a
															class="city" data-id="13" data-name="北京" data-code="BJ">北京</a><a
															class="city" data-id="189" data-name="滨州" data-code="BZ">滨州</a><a
															class="city" data-id="3171" data-name="博乐市"
															data-code="BLS">博乐市</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>C</dt>
													<dd class="clearfix">
														<a class="city" data-id="97" data-name="沧州" data-code="CZ">沧州</a><a
															class="city" data-id="137" data-name="长春" data-code="CC">长春</a><a
															class="city" data-id="314" data-name="常德" data-code="CD">常德</a><a
															class="city" data-id="308" data-name="长沙" data-code="CS">长沙</a><a
															class="city" data-id="59" data-name="常州" data-code="CZ">常州</a><a
															class="city" data-id="258" data-name="成都" data-code="CD">成都</a><a
															class="city" data-id="31" data-name="重庆" data-code="CQ">重庆</a><a
															class="city" data-id="146" data-name="滁州" data-code="CZ">滁州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>D</dt>
													<dd class="clearfix">
														<a class="city" data-id="245" data-name="大理"
															data-code="DL">大理</a><a class="city" data-id="124"
															data-name="大连" data-code="DL">大连</a><a class="city"
															data-id="101" data-name="大同" data-code="DT">大同</a><a
															class="city" data-id="272" data-name="达州" data-code="DZ">达州</a><a
															class="city" data-id="187" data-name="德州" data-code="DZ">德州</a><a
															class="city" data-id="202" data-name="东莞" data-code="DG">东莞</a><a
															class="city" data-id="178" data-name="东营" data-code="DY">东营</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>F</dt>
													<dd class="clearfix">
														<a class="city" data-id="327" data-name="佛山"
															data-code="FS">佛山</a><a class="city" data-id="147"
															data-name="阜阳" data-code="FY">阜阳</a><a class="city"
															data-id="172" data-name="抚州" data-code="FZ">抚州</a><a
															class="city" data-id="154" data-name="福州" data-code="FZ">福州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>G</dt>
													<dd class="clearfix">
														<a class="city" data-id="169" data-name="赣州"
															data-code="GZ">赣州</a><a class="city" data-id="264"
															data-name="广元" data-code="GY">广元</a><a class="city"
															data-id="322" data-name="广州" data-code="GZ">广州</a><a
															class="city" data-id="209" data-name="桂林" data-code="GL">桂林</a><a
															class="city" data-id="224" data-name="贵阳" data-code="GY">贵阳</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>H</dt>
													<dd class="clearfix">
														<a class="city" data-id="43" data-name="哈尔滨"
															data-code="HEB">哈尔滨</a><a class="city" data-id="221"
															data-name="海口" data-code="HK">海口</a><a class="city"
															data-id="92" data-name="邯郸" data-code="HD">邯郸</a><a
															class="city" data-id="69" data-name="杭州" data-code="HZ">杭州</a><a
															class="city" data-id="336" data-name="汉中" data-code="HZ">汉中</a><a
															class="city" data-id="80" data-name="合肥" data-code="HF">合肥</a><a
															class="city" data-id="46" data-name="鹤岗" data-code="HG">鹤岗</a><a
															class="city" data-id="99" data-name="衡水" data-code="HS">衡水</a><a
															class="city" data-id="311" data-name="衡阳" data-code="HY">衡阳</a><a
															class="city" data-id="190" data-name="菏泽" data-code="HZ">菏泽</a><a
															class="city" data-id="63" data-name="淮安" data-code="HA">淮安</a><a
															class="city" data-id="85" data-name="淮北" data-code="HB">淮北</a><a
															class="city" data-id="88" data-name="黄山市" data-code="HSS">黄山市</a><a
															class="city" data-id="111" data-name="呼和浩特"
															data-code="HHHT">呼和浩特</a><a class="city" data-id="196"
															data-name="惠州" data-code="HZ">惠州</a><a class="city"
															data-id="117" data-name="呼伦贝尔" data-code="HLBE">呼伦贝尔</a><a
															class="city" data-id="73" data-name="湖州" data-code="HZ">湖州</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>J</dt>
													<dd class="clearfix">
														<a class="city" data-id="170" data-name="吉安"
															data-code="JA">吉安</a><a class="city" data-id="280"
															data-name="焦作" data-code="JZ">焦作</a><a class="city"
															data-id="72" data-name="嘉兴" data-code="JX">嘉兴</a><a
															class="city" data-id="341" data-name="嘉峪关"
															data-code="JYG">嘉峪关</a><a class="city" data-id="19"
															data-name="吉林" data-code="JL">吉林</a><a class="city"
															data-id="174" data-name="济南" data-code="JN">济南</a><a
															class="city" data-id="164" data-name="景德镇"
															data-code="JDZ">景德镇</a><a class="city" data-id="75"
															data-name="金华" data-code="JH">金华</a><a class="city"
															data-id="166" data-name="九江" data-code="JJ">九江</a><a
															class="city" data-id="45" data-name="鸡西" data-code="JX">鸡西</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>K</dt>
													<dd class="clearfix">
														<a class="city" data-id="233" data-name="昆明"
															data-code="KM">昆明</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>L</dt>
													<dd class="clearfix">
														<a class="city" data-id="340" data-name="兰州"
															data-code="LZ">兰州</a><a class="city" data-id="249"
															data-name="拉萨" data-code="LS">拉萨</a><a class="city"
															data-id="62" data-name="连云港" data-code="LYG">连云港</a><a
															class="city" data-id="188" data-name="聊城" data-code="LC">聊城</a><a
															class="city" data-id="238" data-name="丽江" data-code="LJ">丽江</a><a
															class="city" data-id="186" data-name="临沂" data-code="LY">临沂</a><a
															class="city" data-id="79" data-name="丽水" data-code="LS">丽水</a><a
															class="city" data-id="150" data-name="六安" data-code="LA">六安</a><a
															class="city" data-id="320" data-name="娄底" data-code="LD">娄底</a><a
															class="city" data-id="193" data-name="洛阳" data-code="LY">洛阳</a><a
															class="city" data-id="261" data-name="泸州" data-code="LZ">泸州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>M</dt>
													<dd class="clearfix">
														<a class="city" data-id="263" data-name="绵阳"
															data-code="MY">绵阳</a><a class="city" data-id="52"
															data-name="牡丹江" data-code="MDJ">牡丹江</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>N</dt>
													<dd class="clearfix">
														<a class="city" data-id="163" data-name="南昌"
															data-code="NC">南昌</a><a class="city" data-id="56"
															data-name="南京" data-code="NJ">南京</a><a class="city"
															data-id="207" data-name="南宁" data-code="NN">南宁</a><a
															class="city" data-id="61" data-name="南通" data-code="NT">南通</a><a
															class="city" data-id="285" data-name="南阳" data-code="NY">南阳</a><a
															class="city" data-id="70" data-name="宁波" data-code="NB">宁波</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>Q</dt>
													<dd class="clearfix">
														<a class="city" data-id="175" data-name="青岛"
															data-code="QD">青岛</a><a class="city" data-id="201"
															data-name="清远" data-code="QY">清远</a><a class="city"
															data-id="91" data-name="秦皇岛" data-code="QHD">秦皇岛</a><a
															class="city" data-id="44" data-name="齐齐哈尔"
															data-code="QQHE">齐齐哈尔</a><a class="city" data-id="158"
															data-name="泉州" data-code="QZ">泉州</a><a class="city"
															data-id="76" data-name="衢州" data-code="QZ">衢州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>R</dt>
													<dd class="clearfix">
														<a class="city" data-id="184" data-name="日照"
															data-code="RZ">日照</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>S</dt>
													<dd class="clearfix">
														<a class="city" data-id="157" data-name="三明"
															data-code="SM">三明</a><a class="city" data-id="257"
															data-name="三亚" data-code="SY">三亚</a><a class="city"
															data-id="9" data-name="上海" data-code="SH">上海</a><a
															class="city" data-id="173" data-name="上饶" data-code="SR">上饶</a><a
															class="city" data-id="326" data-name="汕头" data-code="ST">汕头</a><a
															class="city" data-id="74" data-name="绍兴" data-code="SX">绍兴</a><a
															class="city" data-id="123" data-name="沈阳" data-code="SY">沈阳</a><a
															class="city" data-id="324" data-name="深圳" data-code="SZ">深圳</a><a
															class="city" data-id="89" data-name="石家庄" data-code="SJZ">石家庄</a><a
															class="city" data-id="47" data-name="双鸭山" data-code="SYS">双鸭山</a><a
															class="city" data-id="68" data-name="宿迁" data-code="SQ">宿迁</a><a
															class="city" data-id="60" data-name="苏州" data-code="SZ">苏州</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>T</dt>
													<dd class="clearfix">
														<a class="city" data-id="182" data-name="泰安"
															data-code="TA">泰安</a><a class="city" data-id="100"
															data-name="太原" data-code="TY">太原</a><a class="city"
															data-id="67" data-name="泰州" data-code="TZ">泰州</a><a
															class="city" data-id="78" data-name="台州" data-code="TZ">台州</a><a
															class="city" data-id="90" data-name="唐山" data-code="TS">唐山</a><a
															class="city" data-id="14" data-name="天津" data-code="TJ">天津</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>W</dt>
													<dd class="clearfix">
														<a class="city" data-id="180" data-name="潍坊"
															data-code="WF">潍坊</a><a class="city" data-id="71"
															data-name="温州" data-code="WZ">温州</a><a class="city"
															data-id="291" data-name="武汉" data-code="WH">武汉</a><a
															class="city" data-id="81" data-name="芜湖" data-code="WH">芜湖</a><a
															class="city" data-id="367" data-name="乌鲁木齐"
															data-code="WLMQ">乌鲁木齐</a><a class="city" data-id="57"
															data-name="无锡" data-code="WX">无锡</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>X</dt>
													<dd class="clearfix">
														<a class="city" data-id="155" data-name="厦门"
															data-code="XM">厦门</a><a class="city" data-id="256"
															data-name="西安" data-code="XA">西安</a><a class="city"
															data-id="40" data-name="中国香港" data-code="XG">中国香港</a><a
															class="city" data-id="310" data-name="湘潭" data-code="XT">湘潭</a><a
															class="city" data-id="333" data-name="咸阳" data-code="XY">咸阳</a><a
															class="city" data-id="93" data-name="邢台" data-code="XT">邢台</a><a
															class="city" data-id="354" data-name="西宁" data-code="XN">西宁</a><a
															class="city" data-id="244" data-name="西双版纳"
															data-code="XSBN">西双版纳</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>Y</dt>
													<dd class="clearfix">
														<a class="city" data-id="335" data-name="延安"
															data-code="YA">延安</a><a class="city" data-id="145"
															data-name="延边" data-code="YB">延边</a><a class="city"
															data-id="64" data-name="盐城" data-code="YC">盐城</a><a
															class="city" data-id="65" data-name="扬州" data-code="YZ">扬州</a><a
															class="city" data-id="179" data-name="烟台" data-code="YT">烟台</a><a
															class="city" data-id="270" data-name="宜宾" data-code="YB">宜宾</a><a
															class="city" data-id="294" data-name="宜昌" data-code="YC">宜昌</a><a
															class="city" data-id="171" data-name="宜春" data-code="YC">宜春</a><a
															class="city" data-id="362" data-name="银川" data-code="YC">银川</a><a
															class="city" data-id="130" data-name="营口" data-code="YK">营口</a><a
															class="city" data-id="168" data-name="鹰潭" data-code="YT">鹰潭</a><a
															class="city" data-id="313" data-name="岳阳" data-code="YY">岳阳</a><a
															class="city" data-id="337" data-name="榆林" data-code="YL">榆林</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>Z</dt>
													<dd class="clearfix">
														<a class="city" data-id="315" data-name="张家界"
															data-code="ZJJ">张家界</a><a class="city" data-id="159"
															data-name="漳州" data-code="ZZ">漳州</a><a class="city"
															data-id="191" data-name="郑州" data-code="ZZ">郑州</a><a
															class="city" data-id="203" data-name="中山" data-code="ZS">中山</a><a
															class="city" data-id="77" data-name="舟山" data-code="ZS">舟山</a><a
															class="city" data-id="325" data-name="珠海" data-code="ZH">珠海</a><a
															class="city" data-id="309" data-name="株洲" data-code="ZZ">株洲</a><a
															class="city" data-id="176" data-name="淄博" data-code="ZB">淄博</a>
													</dd>
												</dl></li>
										</ul>
									</div>
								</div>
								<!--首页——出发城市 -----结束-->

							</div>
							<form class="form_search">
								<input class="lv_search w_260" value="${key }" type="text"
									num="1" style="background-color: rgb(204, 232, 207);">
							</form>
						</div>

						<!--景点门票-->
						<div class="search_type_list" style="display: none;"
							id="freetour_destroute_fromPlaces_1">
							<form class="form_search">
								<input class="lv_search w_380" value="${key }" type="text"
									num="2" style="background-color: rgb(204, 232, 207);">
							</form>
						</div>

						<!--自由行-->
						<div class="search_type_list" id="freetour_destroute_fromPlaces"
							style="display: none;">
							<div class="search_city">
								<div class="btn_city js_searchbox"
									style="background-color: rgb(204, 232, 207);">
									<b data-id="9">${path }</b><span>出发</span><i class="icon_arrow"></i>
								</div>

								<!--首页——出发城市（所有产品、自由行、旅游线路） -----开始-->
								<div class="lv_city_down js_cf_city js_all_city"
									style="background-color: rgb(204, 232, 207); width: 460px;">
									<div class="search-station-hot">
										<h4>热门出发城市</h4>
										<div class="list clearfix">
											<a data-code="SH" data-id="9" data-name="上海">上海</a> <a
												data-code="SZ" data-id="60" data-name="苏州">苏州</a> <a
												data-code="HZ" data-id="69" data-name="杭州">杭州</a> <a
												data-code="BJ" data-id="13" data-name="北京">北京</a> <a
												data-code="TY" data-id="100" data-name="太原">太原</a> <a
												data-code="GZ" data-id="322" data-name="广州">广州</a> <a
												data-code="CD" data-id="258" data-name="成都">成都</a> <a
												data-code="ZQ" data-id="31" data-name="重庆">重庆</a> <a
												data-code="SY" data-id="257" data-name="三亚">三亚</a> <a
												data-code="CZ" data-id="59" data-name="常州">常州</a> <a
												data-code="HZ" data-id="73" data-name="湖州">湖州</a> <a
												data-code="QD" data-id="175" data-name="青岛">青岛</a> <a
												data-code="TJ" data-id="14" data-name="天津">天津</a> <a
												data-code="SZ" data-id="324" data-name="深圳">深圳</a> <a
												data-code="KM" data-id="233" data-name="昆明">昆明</a> <a
												data-code="HK" data-id="221" data-name="海口">海口</a> <a
												data-code="NJ" data-id="56" data-name="南京">南京</a> <a
												data-code="JX" data-id="72" data-name="嘉兴">嘉兴</a> <a
												data-code="NT" data-id="61" data-name="南通">南通</a> <a
												data-code="WX" data-id="57" data-name="无锡">无锡</a> <a
												data-code="XA" data-id="256" data-name="西安">西安</a>
										</div>
									</div>
									<div class="search-station-cities">
										<ul class="nav-tabs clearfix">
											<li class="active">ABCD<i></i></li>
											<li>EFGH<i></i></li>
											<li>JKLM<i></i></li>
											<li>NOPQRS<i></i></li>
											<li>TUVWX<i></i></li>
											<li>YZ<i></i></li>
										</ul>
										<ul class="tab-contents">
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>A</dt>
													<dd class="clearfix">
														<a class="city" data-id="380" data-name="阿勒泰"
															data-code="ALT">阿勒泰</a><a class="city" data-id="338"
															data-name="安康" data-code="AK">安康</a><a class="city"
															data-id="41" data-name="中国澳门" data-code="AM">中国澳门</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>B</dt>
													<dd class="clearfix">
														<a class="city" data-id="82" data-name="蚌埠" data-code="BB">蚌埠</a><a
															class="city" data-id="94" data-name="保定" data-code="BD">保定</a><a
															class="city" data-id="332" data-name="宝鸡" data-code="BJ">宝鸡</a><a
															class="city" data-id="112" data-name="包头" data-code="BT">包头</a><a
															class="city" data-id="211" data-name="北海" data-code="BH">北海</a><a
															class="city" data-id="13" data-name="北京" data-code="BJ">北京</a><a
															class="city" data-id="189" data-name="滨州" data-code="BZ">滨州</a><a
															class="city" data-id="3171" data-name="博乐市"
															data-code="BLS">博乐市</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>C</dt>
													<dd class="clearfix">
														<a class="city" data-id="97" data-name="沧州" data-code="CZ">沧州</a><a
															class="city" data-id="137" data-name="长春" data-code="CC">长春</a><a
															class="city" data-id="314" data-name="常德" data-code="CD">常德</a><a
															class="city" data-id="308" data-name="长沙" data-code="CS">长沙</a><a
															class="city" data-id="59" data-name="常州" data-code="CZ">常州</a><a
															class="city" data-id="258" data-name="成都" data-code="CD">成都</a><a
															class="city" data-id="31" data-name="重庆" data-code="CQ">重庆</a><a
															class="city" data-id="146" data-name="滁州" data-code="CZ">滁州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>D</dt>
													<dd class="clearfix">
														<a class="city" data-id="245" data-name="大理"
															data-code="DL">大理</a><a class="city" data-id="124"
															data-name="大连" data-code="DL">大连</a><a class="city"
															data-id="101" data-name="大同" data-code="DT">大同</a><a
															class="city" data-id="272" data-name="达州" data-code="DZ">达州</a><a
															class="city" data-id="187" data-name="德州" data-code="DZ">德州</a><a
															class="city" data-id="202" data-name="东莞" data-code="DG">东莞</a><a
															class="city" data-id="178" data-name="东营" data-code="DY">东营</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>F</dt>
													<dd class="clearfix">
														<a class="city" data-id="327" data-name="佛山"
															data-code="FS">佛山</a><a class="city" data-id="147"
															data-name="阜阳" data-code="FY">阜阳</a><a class="city"
															data-id="172" data-name="抚州" data-code="FZ">抚州</a><a
															class="city" data-id="154" data-name="福州" data-code="FZ">福州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>G</dt>
													<dd class="clearfix">
														<a class="city" data-id="169" data-name="赣州"
															data-code="GZ">赣州</a><a class="city" data-id="264"
															data-name="广元" data-code="GY">广元</a><a class="city"
															data-id="322" data-name="广州" data-code="GZ">广州</a><a
															class="city" data-id="209" data-name="桂林" data-code="GL">桂林</a><a
															class="city" data-id="224" data-name="贵阳" data-code="GY">贵阳</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>H</dt>
													<dd class="clearfix">
														<a class="city" data-id="43" data-name="哈尔滨"
															data-code="HEB">哈尔滨</a><a class="city" data-id="221"
															data-name="海口" data-code="HK">海口</a><a class="city"
															data-id="92" data-name="邯郸" data-code="HD">邯郸</a><a
															class="city" data-id="69" data-name="杭州" data-code="HZ">杭州</a><a
															class="city" data-id="336" data-name="汉中" data-code="HZ">汉中</a><a
															class="city" data-id="80" data-name="合肥" data-code="HF">合肥</a><a
															class="city" data-id="46" data-name="鹤岗" data-code="HG">鹤岗</a><a
															class="city" data-id="99" data-name="衡水" data-code="HS">衡水</a><a
															class="city" data-id="311" data-name="衡阳" data-code="HY">衡阳</a><a
															class="city" data-id="190" data-name="菏泽" data-code="HZ">菏泽</a><a
															class="city" data-id="63" data-name="淮安" data-code="HA">淮安</a><a
															class="city" data-id="85" data-name="淮北" data-code="HB">淮北</a><a
															class="city" data-id="88" data-name="黄山市" data-code="HSS">黄山市</a><a
															class="city" data-id="111" data-name="呼和浩特"
															data-code="HHHT">呼和浩特</a><a class="city" data-id="196"
															data-name="惠州" data-code="HZ">惠州</a><a class="city"
															data-id="117" data-name="呼伦贝尔" data-code="HLBE">呼伦贝尔</a><a
															class="city" data-id="73" data-name="湖州" data-code="HZ">湖州</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>J</dt>
													<dd class="clearfix">
														<a class="city" data-id="170" data-name="吉安"
															data-code="JA">吉安</a><a class="city" data-id="280"
															data-name="焦作" data-code="JZ">焦作</a><a class="city"
															data-id="72" data-name="嘉兴" data-code="JX">嘉兴</a><a
															class="city" data-id="341" data-name="嘉峪关"
															data-code="JYG">嘉峪关</a><a class="city" data-id="19"
															data-name="吉林" data-code="JL">吉林</a><a class="city"
															data-id="174" data-name="济南" data-code="JN">济南</a><a
															class="city" data-id="164" data-name="景德镇"
															data-code="JDZ">景德镇</a><a class="city" data-id="75"
															data-name="金华" data-code="JH">金华</a><a class="city"
															data-id="166" data-name="九江" data-code="JJ">九江</a><a
															class="city" data-id="45" data-name="鸡西" data-code="JX">鸡西</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>K</dt>
													<dd class="clearfix">
														<a class="city" data-id="233" data-name="昆明"
															data-code="KM">昆明</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>L</dt>
													<dd class="clearfix">
														<a class="city" data-id="340" data-name="兰州"
															data-code="LZ">兰州</a><a class="city" data-id="249"
															data-name="拉萨" data-code="LS">拉萨</a><a class="city"
															data-id="62" data-name="连云港" data-code="LYG">连云港</a><a
															class="city" data-id="188" data-name="聊城" data-code="LC">聊城</a><a
															class="city" data-id="238" data-name="丽江" data-code="LJ">丽江</a><a
															class="city" data-id="186" data-name="临沂" data-code="LY">临沂</a><a
															class="city" data-id="79" data-name="丽水" data-code="LS">丽水</a><a
															class="city" data-id="150" data-name="六安" data-code="LA">六安</a><a
															class="city" data-id="320" data-name="娄底" data-code="LD">娄底</a><a
															class="city" data-id="193" data-name="洛阳" data-code="LY">洛阳</a><a
															class="city" data-id="261" data-name="泸州" data-code="LZ">泸州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>M</dt>
													<dd class="clearfix">
														<a class="city" data-id="263" data-name="绵阳"
															data-code="MY">绵阳</a><a class="city" data-id="52"
															data-name="牡丹江" data-code="MDJ">牡丹江</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>N</dt>
													<dd class="clearfix">
														<a class="city" data-id="163" data-name="南昌"
															data-code="NC">南昌</a><a class="city" data-id="56"
															data-name="南京" data-code="NJ">南京</a><a class="city"
															data-id="207" data-name="南宁" data-code="NN">南宁</a><a
															class="city" data-id="61" data-name="南通" data-code="NT">南通</a><a
															class="city" data-id="285" data-name="南阳" data-code="NY">南阳</a><a
															class="city" data-id="70" data-name="宁波" data-code="NB">宁波</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>Q</dt>
													<dd class="clearfix">
														<a class="city" data-id="175" data-name="青岛"
															data-code="QD">青岛</a><a class="city" data-id="201"
															data-name="清远" data-code="QY">清远</a><a class="city"
															data-id="91" data-name="秦皇岛" data-code="QHD">秦皇岛</a><a
															class="city" data-id="44" data-name="齐齐哈尔"
															data-code="QQHE">齐齐哈尔</a><a class="city" data-id="158"
															data-name="泉州" data-code="QZ">泉州</a><a class="city"
															data-id="76" data-name="衢州" data-code="QZ">衢州</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>R</dt>
													<dd class="clearfix">
														<a class="city" data-id="184" data-name="日照"
															data-code="RZ">日照</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>S</dt>
													<dd class="clearfix">
														<a class="city" data-id="157" data-name="三明"
															data-code="SM">三明</a><a class="city" data-id="257"
															data-name="三亚" data-code="SY">三亚</a><a class="city"
															data-id="9" data-name="上海" data-code="SH">上海</a><a
															class="city" data-id="173" data-name="上饶" data-code="SR">上饶</a><a
															class="city" data-id="326" data-name="汕头" data-code="ST">汕头</a><a
															class="city" data-id="74" data-name="绍兴" data-code="SX">绍兴</a><a
															class="city" data-id="123" data-name="沈阳" data-code="SY">沈阳</a><a
															class="city" data-id="324" data-name="深圳" data-code="SZ">深圳</a><a
															class="city" data-id="89" data-name="石家庄" data-code="SJZ">石家庄</a><a
															class="city" data-id="47" data-name="双鸭山" data-code="SYS">双鸭山</a><a
															class="city" data-id="68" data-name="宿迁" data-code="SQ">宿迁</a><a
															class="city" data-id="60" data-name="苏州" data-code="SZ">苏州</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>T</dt>
													<dd class="clearfix">
														<a class="city" data-id="182" data-name="泰安"
															data-code="TA">泰安</a><a class="city" data-id="100"
															data-name="太原" data-code="TY">太原</a><a class="city"
															data-id="67" data-name="泰州" data-code="TZ">泰州</a><a
															class="city" data-id="78" data-name="台州" data-code="TZ">台州</a><a
															class="city" data-id="90" data-name="唐山" data-code="TS">唐山</a><a
															class="city" data-id="14" data-name="天津" data-code="TJ">天津</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>W</dt>
													<dd class="clearfix">
														<a class="city" data-id="180" data-name="潍坊"
															data-code="WF">潍坊</a><a class="city" data-id="71"
															data-name="温州" data-code="WZ">温州</a><a class="city"
															data-id="291" data-name="武汉" data-code="WH">武汉</a><a
															class="city" data-id="81" data-name="芜湖" data-code="WH">芜湖</a><a
															class="city" data-id="367" data-name="乌鲁木齐"
															data-code="WLMQ">乌鲁木齐</a><a class="city" data-id="57"
															data-name="无锡" data-code="WX">无锡</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>X</dt>
													<dd class="clearfix">
														<a class="city" data-id="155" data-name="厦门"
															data-code="XM">厦门</a><a class="city" data-id="256"
															data-name="西安" data-code="XA">西安</a><a class="city"
															data-id="40" data-name="中国香港" data-code="XG">中国香港</a><a
															class="city" data-id="310" data-name="湘潭" data-code="XT">湘潭</a><a
															class="city" data-id="333" data-name="咸阳" data-code="XY">咸阳</a><a
															class="city" data-id="93" data-name="邢台" data-code="XT">邢台</a><a
															class="city" data-id="354" data-name="西宁" data-code="XN">西宁</a><a
															class="city" data-id="244" data-name="西双版纳"
															data-code="XSBN">西双版纳</a>
													</dd>
												</dl></li>
											<li class="search-station-cities-pane"><dl
													class="clearfix">
													<dt>Y</dt>
													<dd class="clearfix">
														<a class="city" data-id="335" data-name="延安"
															data-code="YA">延安</a><a class="city" data-id="145"
															data-name="延边" data-code="YB">延边</a><a class="city"
															data-id="64" data-name="盐城" data-code="YC">盐城</a><a
															class="city" data-id="65" data-name="扬州" data-code="YZ">扬州</a><a
															class="city" data-id="179" data-name="烟台" data-code="YT">烟台</a><a
															class="city" data-id="270" data-name="宜宾" data-code="YB">宜宾</a><a
															class="city" data-id="294" data-name="宜昌" data-code="YC">宜昌</a><a
															class="city" data-id="171" data-name="宜春" data-code="YC">宜春</a><a
															class="city" data-id="362" data-name="银川" data-code="YC">银川</a><a
															class="city" data-id="130" data-name="营口" data-code="YK">营口</a><a
															class="city" data-id="168" data-name="鹰潭" data-code="YT">鹰潭</a><a
															class="city" data-id="313" data-name="岳阳" data-code="YY">岳阳</a><a
															class="city" data-id="337" data-name="榆林" data-code="YL">榆林</a>
													</dd>
												</dl>
												<dl class="clearfix">
													<dt>Z</dt>
													<dd class="clearfix">
														<a class="city" data-id="315" data-name="张家界"
															data-code="ZJJ">张家界</a><a class="city" data-id="159"
															data-name="漳州" data-code="ZZ">漳州</a><a class="city"
															data-id="191" data-name="郑州" data-code="ZZ">郑州</a><a
															class="city" data-id="203" data-name="中山" data-code="ZS">中山</a><a
															class="city" data-id="77" data-name="舟山" data-code="ZS">舟山</a><a
															class="city" data-id="325" data-name="珠海" data-code="ZH">珠海</a><a
															class="city" data-id="309" data-name="株洲" data-code="ZZ">株洲</a><a
															class="city" data-id="176" data-name="淄博" data-code="ZB">淄博</a>
													</dd>
												</dl></li>
										</ul>
									</div>
								</div>
								<!--首页——出发城市（所有产品、自由行、旅游线路） -----结束-->

							</div>
							<form class="form_search">
								<input class="lv_search w_260" value="${key }" type="text"
									num="3" style="background-color: rgb(204, 232, 207);">
							</form>
						</div>

						<!--当地游-->
						<div class="search_type_list" id="localyou" style="display: none;">
							<form class="form_search">
								<input class="lv_search w_380" value="${key }" type="text"
									num="4" style="background-color: rgb(204, 232, 207);">
							</form>
						</div>


					</div>
					<span class="btn_lv_search" onclick="searchFour(this);"> <i></i>搜索
					</span>
				</div>
				<div class="search-hot clearfix"></div>
			</div>
			<!--搜索框  结束-->

			<!--内容 开始-->
			<div class="search-ajax-box" id="search-ajax-box">

				<!--搜索过滤 开始-->
				<div class="search-filter" id="search-params" type="group" type2=""
					filterstr="H9K310000" params="H9K310000"
					suffix="?keyword=%E5%8C%97%E4%BA%AC%E5%A4%A7%E5%AD%A6&amp;tabType=group">

					<!--页签开始-->

					<div class="search-nav-box clearfix">
						<p class="search-nav clearfix"
							style="background-color: rgb(204, 232, 207);">
							<a href="scprit:void(0)" onclick="searchTwo(this,1)"> 全部旅游<b>${ALL }</b><span
								class="search-nav-line"></span>
							</a> <a href="scprit:void(0)" onclick="searchTwo(this,101)">
								出发地参团<b>${GROUP }</b><span class="search-nav-line"></span>
							</a> <a href="scprit:void(0)" onclick="searchTwo(this,3)"> 景点门票<b>${TICKET }</b><span
								class="search-nav-line"></span>
							</a><a href="scprit:void(0)" onclick="searchTwo(this,102)"> 自由行<b>${FREETOUR }</b><span
								class="search-nav-line"></span>
							</a> <a href="javascript:void(0)" onclick="searchTwo(this,103)">
								目的地参团<b>${LOCAL }</b>
							</a>
						</p>

						<div class="search-more"></div>
					</div>




					<!--页签 结束-->

					<div class="search-body">
						<!--筛选开始-->
						<div class="search-lists" id="search-lists">
							<c:if test="${sign==null }">
								<div class="search-list clearfix"
									style="background-color: rgb(204, 232, 207);">
									<div class="search-theme">游玩天数</div>
									<div class="search-all active" onclick="routeSelectAjax(this)">不限
									</div>
									<ul class="search-content clearfix js_addmore">
										<li><label class="search-label"
											onclick="routeSelectAjax(this)"> <span><i></i>1天</span>
										</label></li>
										<li><label class="search-label"
											onclick="routeSelectAjax(this)"> <span><i></i>2天</span>
										</label></li>
										<li><label class="search-label"
											onclick="routeSelectAjax(this)"> <span><i></i>3天</span>
										</label></li>
										<li><label class="search-label"
											onclick="routeSelectAjax(this)"> <span><i></i>4天</span>
										</label></li>
										<li><label class="search-label"
											onclick="routeSelectAjax(this)"> <span><i></i>5天</span>
										</label></li>
										<li><label class="search-label"
											onclick="routeSelectAjax(this)"> <span><i></i>6天</span>
										</label></li>
										<li><label class="search-label"
											onclick="routeSelectAjax(this)"> <span><i></i>7天</span>
										</label></li>
									</ul>
								</div>
							</c:if>
							<c:if test="${city!=null }">
								<div class="search-list clearfix"
									style="background-color: rgb(204, 232, 207);">
									<div class="search-theme">出发城市</div>
									<div class="search-all active" onclick="routeSelectAjax(this)">不限
									</div>
									<ul class="search-content clearfix js_addmore">

										<c:forEach var="city" items="${city }">
											<li><label class="search-label"
												onclick="routeSelectAjax(this)"> <span>${city.startpath }</span>
											</label></li>
										</c:forEach>

									</ul>
								</div>
							</c:if>


							<c:if test="${scenic!=null }">
								<div class="search-list clearfix"
									style="background-color: rgb(204, 232, 207);">
									<div class="search-theme">游玩景点</div>
									<div class="search-all active" onclick="routeSelectAjax(this)">不限
									</div>
									<ul class="search-content clearfix js_addmore" style="">

										<c:forEach var="s" items="${ scenic}">
											<li><label class="search-label"
												onclick="routeSelectAjax(this)"> <span><i></i>${s.scenicname }</span>
											</label></li>
										</c:forEach>

									</ul>
								</div>
							</c:if>

							<div class="search-list clearfix"
								style="background-color: rgb(204, 232, 207);">
								<div class="search-theme">主题</div>
								<div class="search-all active" onclick="routeSelectAjax(this)">不限
								</div>
								<ul class="search-content clearfix js_addmore" style="">
									<c:forEach var="t" items="${title }">
										<li><label class="search-label"
											onclick="routeSelectAjax(this)"> <span>${t.type }</span>
										</label></li>
									</c:forEach>
								</ul>
							</div>

						</div>
						<!--筛选 结束-->


						<!--排序、价格筛选、促销、翻页 开始-->
						<div class="search-control clearfix"
							style="background-color: rgb(204, 232, 207);">
							<div class="search-sort clearfix">
								<!--排序 开始-->
								<div class="search-sort-item active">
									<a class="loading" rel="nofollow"
										onclick="routeSelectAjax(this)">综合</a>
								</div>
								<div class="search-sort-item  up">
									<a class="loading" rel="nofollow"
										onclick="routeSelectAjax(this)">价格<i></i></a>
								</div>
								<div class="search-sort-item  down">
									<a class="loading" rel="nofollow"
										onclick="routeSelectAjax(this)">好评率<i></i></a>
								</div>
								<!--排序 结束-->

								<!--价格筛选 开始-->

								<div class="search-filter-price-new">
									<div class="search-filter-price-new-dropdown"
										id="search-filter-price-new-dropdown"
										style="background-color: rgb(204, 232, 207);">
										<div class="clearfix">
											<label> <input type="text" class="price-low-input"
												id="price1" placeholder="最低价"
												style="background-color: rgb(204, 232, 207);">
											</label> <em></em> <label> <input type="text"
												class="price-high-input" id="price2" placeholder="最高价"
												style="background-color: rgb(204, 232, 207);">
											</label>
										</div>
										<p class="price-tip">
											本次价格区间<span class="price-low">0</span>至<span
												class="price-high">9999</span>
										</p>
										<p class="control">
											<span class="btn btn-sm JS_btn_cls" id="clearbtn"
												style="background-color: rgb(204, 232, 207);">清除</span><span
												class="btn JS_btn_ok btn-sm btn-orange btn-disabled"
												id="priceBtn" onclick="routeSelectAjax(this)">确定</span>
										</p>
									</div>
								</div>


								<!--价格筛选  结束-->

								<!--促销 开始-->

								<div class="search-sale">

									<label class="loading" onclick="routeSelectAjax(this)"><i></i>促销活动</label>
								</div>

								<!--促销 结束-->
							</div>

							<!--翻页 开始-->
							<div class="search-page">
								<span class="search-page-num">页码：<em>${pageNum }</em>/${pageCount }
								</span> <span class="prev disabled"><i></i></span> <span
									class="next loading" onclick=""><i></i></span>
							</div>


							<!--翻页 结束-->
						</div>
						<!--排序、价格筛选、促销、翻页 结束-->
					</div>
				</div>
				<!--搜索过滤 结束-->

				<div class="main-content clearfix">
					<!--左侧 开始-->
					<div class="product-list">
						<div class="loading_box" style="display: none;">
							<i class="icon_loading"></i><span>请稍候，正在为您查询...</span>
						</div>

						<!--特推 开始-->
						<!--特推 结束-->




						<c:if test="${data!=null && data[0].id!=null }">
							<c:forEach var="sorsw" items="${data }">
								<!--产品模块 开始-->
								<div class="product-item clearfix"
									style="background-color: rgb(204, 232, 207);">

									<!--产品图片 开始-->
									<div class="product-left" onclick="filterData();">
										<a href="scenicway/tourRouteProductShow/${sorsw.id }"
											target="_blank" title="" class="product-picture"> <img
											rel="nofollow" src="${sorsw.scenicwayImage }" alt=""
											width="150" height="100"> <span
											class="product-label product-label-alpha">${sorsw.attractions.atrtitle }
										</span>
											<div class="contrastAdd">
												<!-- 隐藏的产品信息，供产品对比使用 -->
												<input type="hidden" class="contrastInput-img"
													value="${sorsw.scenicwayImage }"> <input
													type="hidden" class="contrastInput-tit"
													value="${sorsw.way }"> <input type="hidden"
													class="contrastInput-href"
													value="http://dujia.lvmama.com/group/1166468-D9"> <input
													type="hidden" class="contrastInput-price"
													value="${sorsw.floor_price }"> <input type="hidden"
													class="contrastInput-proId" value="${sorsw.id }"> <span
													class="contrastBg"></span>
												<div class="contrastText">
													<span class="contrastIcon contrastIcon-add"></span> <b>加入收藏</b>
													<b class="contrastTextAdded">已加入</b> <b
														class="contrastTextExitAdd">取消加入</b>
												</div>
											</div>
										</a>
										<!-- <div class="product-city">北京+十三陵定陵</div> -->
									</div>
									<!--产品图片 结束-->


									<!--产品区域 开始-->
									<div class="product-section">
										<h3 class="product-title">
											<a href="scenicway/tourRouteProductShow/${sorsw.id }"
												style="cursor: pointer" target="_blank"
												class="product-title-a"> <span title=""> <em>${sorsw.way}</em>${sorsw.description}
											</span>
											</a> <a target="_blank"
												href="http://www.lvmama.com/zt/promo/levelluodi"> <span
												class="icon-drill icon-drill-five"
												tip-content="酒店精品且舒适，高端品质"></span>
											</a>
										</h3>
										<c:if test="${sorsw.discounts.size()>0 }">
											<div class="product-details product-details-sale clearfix">
												<div class="product-dropdown">
													<div class="product-ticket-dropdown"
														style="background-color: rgb(204, 232, 207);">
														<b class="hotTips hotTips-cx">促销</b> <span
															class="grayArrow"></span>
														<c:forEach var="d" items="${ sorsw.discounts}">

															<p>${d.activity.way }</p>
														</c:forEach>
													</div>
												</div>
											</div>
										</c:if>
										<div class="product-address">
											<em> <span class="icon-point"></span> ${sorsw.startpath }
											</em>

										</div>

										<!-- 游玩景点-->


									</div>
									<!--产品区域 结束-->

									<!--产品简介 开始-->
									<div class="product-info" id="1166468">
										<div class="product-price">
											<b>¥</b> <em> ${sorsw.floor_price } </em> <i id="p1166468">起/人</i>
										</div>

										<a href="scenicway/tourRouteProductShow/${sorsw.id }"
											target="_blank" class="btn btn-orange btn-lg product-view">
											查看详情 </a>
										<ul class="product-number">
											<li><b>${sorsw.feedback }%</b>好评率</li>


										</ul>
									</div>
									<!--产品简介 结束-->

								</div>
							</c:forEach>
						</c:if>
						<c:if test="${data[0].id==null}">
							<div class="tipbox tip-warning tip_style"
								style="background-color: rgb(204, 232, 207);">
								<span class="tip-icon-big tip-icon-nobg-big-warning"></span>
								<div class="tip-content">
									<h3 class="tip-title">非常抱歉，没有找到符合“${key }”的产品</h3>
									<p class="tip-explain">建议您: 变更出发地,关键字或筛选条件重新搜索</p>
									<p class="tip-proposal">或者马上来定制属于自己的行程吧</p>
									<a href="company.jsp" class="tip-proposal-btn">立即定制</a>
								</div>
							</div>
						</c:if>
						<!--产品模块 结束-->



						<!--列表结束-->
						<div class="product-recommend-departure-end"></div>

						<!--分页 开始-->
						<div class="paging orangestyle">
							<!-- <span class="gopage">到第 <input type="text"
								id="pageNoInput" totalpagenum="4" class="input-text js_goPage"
								style="background-color: rgb(204, 232, 207);"> 页
								<button class="bt开始n btn-gray btn-sm" type="button" id="pageBtn"
									onclick="goPage()"
									style="background-color: rgb(204, 232, 207);">确定</button>
							</span> -->
							<div class="pagebox">
								<c:choose>
									<c:when test="${pageNum==1}">
										<a href="javascript:;" class="prevpage" rel="nofollow"
											onclick="searchThree(this)" style="display: none"> <i
											class="larr"></i>上一页
										</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:;" class="prevpage" rel="nofollow"
											onclick="searchThree(this)" style="display: block"> <i
											class="larr"></i>上一页
										</a>
									</c:otherwise>
								</c:choose>
								<c:forEach begin="1" end="${pageCount }" varStatus="indexs">
									<c:choose>
										<c:when test="${indexs.count==pageNum }">
											<span class="pagesel">${pageNum }</span>
										</c:when>
										<c:when test="${indexs.count!=pageNum }">
											<a href="javascript:;" rel="nofollow"
												onclick="searchThree(this)"
												style="background-color: rgb(204, 232, 207);">${indexs.count }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${pageCount==pageNum }">
										<a href="javascript:;" rel="nofollow" class="nextpage"
											onclick="searchThree(this)"
											style="background-color: rgb(204, 232, 207);display:none;">
											<i class="rarr"></i>下一页
										</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:;" rel="nofollow" class="nextpage"
											onclick="searchThree(this)"
											style="background-color: rgb(204, 232, 207);display:block;">
											<i class="rarr"></i>下一页
										</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>


						<!--分页 结束-->



						<script type="text/javascript">
							//获取产品的单位js
							$(function() {
								var productIds = $(".product-info").map(function() {
									return $(this).prop("id");
								}).get().join(',');
								$.ajax({
									url : "http://s.lvmama.com/ajax/showLineProduct.do?productIds=" + productIds + "&type=1",
									dataType : "jsonp",
									beforeSend : function(XHR) {
										if (!productIds) {
											return false;
										}
									},
									success : function(data) {
										if (data) {
											$.each(data,
												function(productId, product) {
													var productStr = product.unit;
													if (productStr.indexOf("<br>") > 0) {
														var str_before = productStr.split("<br>")[0];
														var str_after = productStr.split("<br>")[1];
														$("#p" + productId).html(str_before);
														$("#m" + productId).html(str_after);
													} else {
														var mProductId = $("#m" + productId);
														$("#p" + productId).html(productStr);
														mProductId.remove();
													}
												})
										}
									},
									error : function() {
										var result = productIds.split(",");
										for (i = 0; i < result.length; i++) {
											var mProductId = $("#m" + result[i]);
											mProductId.remove();
										}
									}
								});
							});
						</script>



					</div>
					<!--左侧 结束-->

					<!--右侧 开始-->
					<div class="main-beside">
						<!--服务保障 开始 -->
						<div class="assurance_new"
							style="background-color: rgb(204, 232, 207);">
							<h4>服务保障</h4>
							<ul class="assurance_new_list">
								<li><i class="icon_jiage"></i>
									<p>
										<b>价格保证</b> <span>同类产品，保证低价</span>
									</p></li>
								<li><i class="icon_tuihuo"></i>
									<p>
										<b>退订保障</b> <span>因特殊情况影响出行，保证退订</span>
									</p></li>
								<li><i class="icon_jiuyuan"></i>
									<p>
										<b>救援保障</b> <span>旅途中遇意外情况，保证救援</span>
									</p></li>
								<li><i class="icon_fuwu"></i>
									<p>
										<b>7×24小时服务</b> <span>快速响应，全年无休</span>
									</p></li>
							</ul>
						</div>
						<!--服务保障 结束 -->

						<!--宣传 开始-->
						<div class="beside-box beside-promo"
							style="background-color: rgb(204, 232, 207);">
							<ol class="beside-tab-content"
								style="width: 690px; left: -230px;">
								<li><a
									href="http://zt.lvmama.com/subject/cjzy-2109?losc=105800&amp;ict=i"
									target="_blank"><img
										src="http://s1.lvjs.com.cn/opi/dujia/chujingziying.jpg"
										width="230" height="150"></a></li>
								<li><a
									href="http://zt.lvmama.com/subject/jingjiuzhongqiumeimanshuangjiehuanan-2118?losc=105800&amp;ict=i"
									target="_blank"><img width="230" height="150"
										src="http://s2.lvjs.com.cn/opi/dujia/guoneiqiuji.jpg"></a></li>
							</ol>
							<p class="beside-tab">
								<a class="active"><i></i></a><a class=""><i></i></a>
							</p>
							<div class="prev">
								<i></i>
							</div>
							<div class="next">
								<i></i>
							</div>
						</div>
						<!--宣传 结束-->

						<!--特卖产品 开始-->
						<div class="beside-box beside-sale"
							style="background-color: rgb(204, 232, 207);">
							<div class="beside-title"
								style="background-color: rgb(204, 232, 207);">
								<h3>特卖产品</h3>
							</div>
							<div class="beside-content">
								<ol class="beside-tab-content" style="width: 594px; left: 0px;">
									<!--单个特卖产品 开始-->
									<li><a class="sale-link"
										href="http://www.lvmama.com/tuangou/deal-1011237?losc=120261&amp;ict=I"
										target="_blank"> <img rel="nofollow" alt="" width="198"
											height="132"
											src="http://pic.lvmama.com/uploads/pc/place2/2018-09-03/29abd1c1-131e-4c46-acee-cc1a3790f178_180_120.jpg">
											<h4>
												<i class="pro-tag">跟团游<span class="pro-tag-line">|</span></i>【身临奇京】北京双高5日跟团游(连住国内高档酒店特卖，享正宗全聚德，游恭王府，逛烟袋斜街，古香古色流连忘返)
											</h4>
											<div class="info clearfix">
												<span class="price"> ¥<em> 2722 </em>
												</span> <span class="sale-link-btn">立即抢购</span>
											</div>
									</a></li>
									<li><a class="sale-link"
										href="http://www.lvmama.com/tuangou/deal-991708?losc=120261&amp;ict=I"
										target="_blank"> <img rel="nofollow" alt="" width="198"
											height="132"
											src="http://pic.lvmama.com/uploads/pc/place2/2018-07-12/567184e2-2a68-49f1-bfef-67e6c1c9439d_180_120.jpg">
											<h4>
												<i class="pro-tag">跟团游<span class="pro-tag-line">|</span></i>【谈京论古】北京双高5日跟团游(抽奖送价值680元苏绣福字，高端商务酒店特卖，赠价值280元金面王朝表演，三顿高标正餐不含糊，游恭王府体会半部清代史)
											</h4>
											<div class="info clearfix">
												<span class="price"> ¥<em> 2172 </em>
												</span> <span class="sale-link-btn">立即抢购</span>
											</div>
									</a></li>
									<!--单个特卖产品 结束-->
								</ol>
								<p class="beside-tab">
									<a class="active"><i></i></a> <a><i></i></a>
								</p>
							</div>
							<div class="prev">
								<i></i>
							</div>
							<div class="next">
								<i></i>
							</div>
						</div>
						<!--特卖产品 结束-->


						<!--产品经理推荐 开始 -->
						<!--产品经理推荐  结束 -->



					</div>
					<!--右侧 结束-->
				</div>

				<!--快捷导航 开始-->
				<div style="height:20px"></div>
				<div class="main-wrap">


					<p class="title">
						亲爱的游客，除您挑选的旅游体验外，驴妈妈精心为您提供包括<span>北京大学</span>多个旅游热门景点和国内城市<span>上海</span>出发的多路线，同时旅行资讯一应俱全，包括<span>北京大学</span>旅行景点图片、<span>北京大学</span>旅行特惠价格、<span>北京大学</span>旅行的相关游记，为您打造完美的<span>北京大学</span><span></span>出游体验。
					</p>

					<ul>
						<li class="clearfix">
							<p class="content-title">热门城市推荐</p>
							<div class="content clearfix expand">
								<div class="content-details clearfix ">
									<a target="_blank"
										href="http://dujia.lvmama.com/tour/qingdao161"> <span>青岛旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/taiguo3542"> <span>泰国旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/shanghai79"> <span>上海旅游</span>
									</a> <a target="_blank" href="http://dujia.lvmama.com/tour/xian340">
										<span>西安旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/dalian43"> <span>大连旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/zhangjiajie221"> <span>张家界旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/riben3543"> <span>日本旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/guilin254"> <span>桂林旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/moluoge3650"> <span>摩洛哥旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/rizhao172"> <span>日照旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/chengdu279"> <span>成都旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1"> <span>北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/weihai171"> <span>威海旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/chongqing277"> <span>重庆旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/zhoushan114"> <span>舟山旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/qinhuangdao6"> <span>秦皇岛旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/yuenan3624"> <span>越南旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/eluosi3638"> <span>俄罗斯旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/yantai165"> <span>烟台旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/hangzhou100"> <span>杭州旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/taiwan401"> <span>台湾旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/jinan160"> <span>济南旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/lianyungang89"> <span>连云港旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/xiamen137"> <span>厦门旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/zhuhai232"> <span>珠海旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/changbaishan3577"> <span>长白山旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/guiyang301"> <span>贵阳旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/jianpuzhai3623"> <span>柬埔寨旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/tuerqi3574"> <span>土耳其旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/shaoxing111"> <span>绍兴旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/nanjing82"> <span>南京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/lushan102880"> <span>庐山旅游</span>
									</a>
								</div>
								<div class="content-arrow"></div>
							</div>
						</li>


						<li class="clearfix">
							<p class="content-title">旅游行程推荐</p>
							<div class="content clearfix">
								<div class="content-details clearfix">
									<a target="_blank"
										href="http://s.lvmama.com/group/N1?keyword=北京大学&amp;tabType=group#list">
										<span>北京大学1日游</span>
									</a> <a target="_blank"
										href="http://s.lvmama.com/group/N2?keyword=北京大学&amp;tabType=group#list">
										<span>北京大学2日游</span>
									</a> <a target="_blank"
										href="http://s.lvmama.com/group/N3?keyword=北京大学&amp;tabType=group#list">
										<span>北京大学3日游</span>
									</a> <a target="_blank"
										href="http://s.lvmama.com/group/N4?keyword=北京大学&amp;tabType=group#list">
										<span>北京大学4日游</span>
									</a> <a target="_blank"
										href="http://s.lvmama.com/group/N5?keyword=北京大学&amp;tabType=group#list">
										<span>北京大学5日游</span>
									</a> <a target="_blank"
										href="http://s.lvmama.com/group/N6?keyword=北京大学&amp;tabType=group#list">
										<span>北京大学6日游</span>
									</a> <a target="_blank"
										href="http://s.lvmama.com/group/N7?keyword=北京大学&amp;tabType=group#list">
										<span>北京大学7日游</span>
									</a>
								</div>
								<div class="content-arrow" style="display: none;"></div>
							</div>
						</li>


						<li class="clearfix">
							<p class="content-title">到北京大学旅游路线</p>
							<div class="content clearfix">
								<div class="content-details clearfix">
									<a target="_blank"
										href="http://dujia.lvmama.com/tour/beijingdaxue104734/route-D56">
										<span>南京到北京大学旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijingdaxue104734/route-D13">
										<span>北京到北京大学旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijingdaxue104734/route-D9">
										<span>上海到北京大学旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijingdaxue104734/route-D69">
										<span>杭州到北京大学旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1"> <span>北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D14"> <span>天津到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D43"> <span>哈尔滨到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D174"> <span>济南到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D191"> <span>郑州到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D256"> <span>西安到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D31"> <span>重庆到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D57"> <span>无锡到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D9"> <span>上海到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D60"> <span>苏州到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D69"> <span>杭州到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D89"> <span>石家庄到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D258"> <span>成都到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D322"> <span>广州到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D233"> <span>昆明到北京旅游</span>
									</a> <a target="_blank"
										href="http://dujia.lvmama.com/tour/beijing1/route-D324"> <span>深圳到北京旅游</span>
									</a>
								</div>
								<div class="content-arrow"></div>
							</div>
						</li>

					</ul>
				</div>

				<script
					src="http://s.lvmama.com/js/route/seoInlink/js/index.js?v=110518"></script>
				<!--快捷导航 结束-->
			</div>


			<!--内容 结束-->
		</div>
		<!--主体 结束-->
	</div>

	<!--机票下拉 开始-->
	<!--机票下拉 结束-->


	<!--尾部-->
	<!--公共底部-->
	<script src="http://pic.lvmama.com/js/v6/public/footer.js?v=110518"></script>
	<!-- 公共底部  -->
	<!-- footer\ -->
	<div class="wrap" style="clear: both;">
		<a class="public_ft" href="http://www.lvmama.com/public/user_security"
			target="_blank"><ul class="public_ft_list"
				style="background-color: rgb(204, 232, 207);">
				<li><i class="ft_ioc1"></i><strong>价格保证</strong>同类产品，保证低价</li>
				<li><i class="ft_ioc2"></i><strong>退订保障</strong>因特殊情况影响出行，保证退订</li>
				<li><i class="ft_ioc3"></i><strong>救援保障</strong>旅途中遇意外情况，保证援助</li>
				<li><i class="ft_ioc4"></i><strong>7x24小时服务</strong>快速响应，全年无休</li>
			</ul></a>
	</div>
	<!-- copyright\ -->
	<div class="lv-footer clearfix wrap" style="margin:0 auto;">
		<p class="footer-link">
			<a href="http://www.lvmama.com/public/about_lvmama" rel="nofollow">关于我们</a>
			| <a href="http://www.lvmama.com/public/lianxi_us" rel="nofollow">联系我们</a>
			| <a href="http://www.lvmama.com/public/site_map">网站地图</a> | <a
				href="http://hotels.lvmama.com/brand/">酒店品牌</a> | <a
				href="http://hotels.lvmama.com/area/">酒店查询</a> | <a
				href="http://www.lvmama.com/public/help" rel="nofollow">帮助中心</a> | <a
				href="http://www.lvmama.com/public/links">友情链接</a> | <a
				href="http://www.lvmama.com/public/jobs" rel="nofollow">诚聘英才</a> | <a
				href="http://www.lvmama.com/public/zizhi_lvmama" rel="nofollow">旅游度假资质</a>
			| <a href="http://www.lvmama.com/userCenter/user/transItfeedBack.do"
				rel="nofollow">意见反馈</a> | <a rel="nofollow"
				href="http://www.lvmama.com/public/adwy">广告业务</a>
		</p>
		<p class="lv-copyright">
			Copyright © 2018 www.lvmama.com. 上海景域文化传播股份有限公司版权所有 <a
				href="http://www.miitbeian.gov.cn" target="_blank" rel="nofollow">沪ICP备13011172号-3</a>
			增值电信业务经营许可证编号：<a rel="nofollow"
				href="http://pic.lvmama.com/img/ICP.jpg" target="_blank">沪B2-20100030</a>
		</p>
		<div class="lv-safety">
			<a class="safety2" target="_blank" rel="nofollow" title="经营性网站备案信息"
				href="http://www.miibeian.gov.cn/"></a> <a class="safety3"
				target="_blank" rel="nofollow" title="网络110报警服务"
				href="http://www.cyberpolice.cn"></a> <a class="safety4"
				target="_blank" rel="nofollow" title="支付宝特约商家"></a> <a
				class="safety5" target="_blank" rel="nofollow" title="AAA级信用企业"
				href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1664396140"></a> <a
				class="safety6" target="_blank" rel="nofollow" title="上海工商"
				href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110930103539539"></a>
			<a class="safety7" target="_blank" rel="nofollow" title="可信网站"
				href="https://ss.knet.cn/verifyseal.dll?sn=2010101800100002662&amp;comefrom=trust&amp;trustKey=dn&amp;trustValue=www.lvmama.com"></a>
			<a class="safety8" target="_blank" rel="nofollow" title="诚信认证示范企业"
				href="https://credit.szfw.org/CX20160614015657160455.html"
				id="___szfw_logo___" hidefocus="false"></a> <a class="safety9"
				target="_blank" rel="nofollow" title="网络社会征信网"
				href="http://www.zx110.org"></a> <a class="safety10" target="_blank"
				rel="nofollow" title="360网站安全检测" href="http://webscan.360.cn"></a> <a
				class="safety11" target="_blank" rel="nofollow" title="网监安全"
				href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010702001030"></a>
			<a class="safety13" target="_blank" rel="nofollow" title="举报中心"
				href="http://www.shjbzx.cn/"></a>
		</div>
	</div>
	<!-- //footer -->
	<!-- 公共底部结束  -->
	<div class="hh_cooperate"></div>
	<!--公共底部-->



	<!-- 酒店地图信息弹出层 -->
	<div class="hotel_map_all">
		<div class="hotel_map" id="hotel_map"></div>
		<div class="hotel_map_r"></div>
	</div>

	<!--TODO 前端维护-->
	<script type="text/javascript" src="../../js/header_new2.js"></script>
	<script type="text/javascript" src="../../js/queryWayList.js"></script>
	<script
		src="http://pic.lvmama.com/min/index.php?
		f=
		js/v5/modules/pandora-poptip.js,js/lv/dialog.js,
		js/search/v1/pro_pk.js,js/v6/public/common_box.js"></script>

	<!-- 百度地图API -->
	<!-- <script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&amp;ak=i2ccGvMLyR86WI0YcodIe7Lu"></script>
	<script type="text/javascript"
		src="http://api.map.baidu.com/getscript?
		v=2.0&amp;ak=i2ccGvMLyR86WI0YcodIe7Lu&amp;services=&amp;t=20181029172410"></script> -->


	<!--TODO 开发维护-->

	<!-- <script type="text/javascript">
		var isExpanded = $(".search-filter-more").hasClass('expanded');
	</script>

	<script src="http://s.lvmama.com/js/route/routeAjax.js?v=110518"></script>
	<script src="http://s.lvmama.com/js/route/startDate.js?v=110518"></script>
	<script src="http://s.lvmama.com/js/route/queryByPrice.js?v=110518"></script>
	<script
		src="http://s.lvmama.com/js/route/recent_viewed_comm.js?v=110518"></script>
	<script src="http://s.lvmama.com/js/route/goPage.js?v=110518"></script>
	<script src="http://s.lvmama.com/js/route/showSchedule.js?v=110518"></script>
	<script src="http://s.lvmama.com/js/route/viewMap.js?v=110518"></script>
	<script src="http://s.lvmama.com/js/route/ad.js?v=110518"></script>
	<script src="http://s.lvmama.com/js/route/loading.js?v=110518"></script> -->



	<!-- <script type="text/javascript">
		$(function() {
			$(".lv_search").val("北京大学");
		});
	</script>

	<script type="text/javascript">
		$(function() {
			$("b", ".btn_city.js_searchbox").attr("data-id", 9).text("上海");
	
		});
	</script> -->

	<!-- <script src="http://s2.lvjs.com.cn/js/v5/ibm/eluminate.js?v=110518"></script>
	<script
		src="http://s3.lvjs.com.cn/js/v5/ibm/coremetrics-initalize.js?v=110518"></script> -->

	<div class="complete_box"
		style="display: none; background-color: rgb(204, 232, 207);">
		<ul class="complete_list"
			style="background-color: rgb(204, 232, 207);"></ul>
	</div>
	<div class="complete_box_hotel hotelDestBox"
		style="display: none; background-color: rgb(204, 232, 207);"></div>
	<div class="complete_box_hotel hotelKeywordBox"
		style="display: none; background-color: rgb(204, 232, 207);"></div>
	<div class="complete_error_tips"
		style="display: none; background-color: rgb(204, 232, 207);">
		<span>找不到目的地：</span><span class="word"></span><i>×</i>
	</div>
	<div id="right-bottom-tools">
		<a id="sideInve" target="_blank"
			href="https://wj.qq.com/s/1293296/f5ae" title="有奖问卷"></a><a
			id="goTopBtn" target="_self" href="javascript:;" title="返回顶部"
			class="" style="visibility: hidden;"></a><a
			href="http://www.lvmama.com/userCenter/user/transItfeedBack.do"
			target="_blank" id="Feedback" title="意见反馈" class=""
			style="visibility: hidden;"></a>
	</div>
	<div class="contrastBox">
		<div class="contrastOverlay"></div>
		<div class="contrastTop">
			<span class="contrastIcon contrastIcon-left"></span> <span
				class="contrastIcon contrastIcon-right"></span> <b
				class="contrast-shadow"></b>
		</div>
		<!-- <ul class="contrastProBox clearfix">
			<li><p class="contrastNone">
					<span class="fArial">1</span>您还可以继续添加第一条产品
				</p></li>
			<li><p class="contrastNone">
					<span class="fArial">2</span>您还可以继续添加第二条产品
				</p></li>
			<li><p class="contrastNone">
					<span class="fArial">3</span>您还可以继续添加第三条产品
				</p></li>
		</ul> -->
		<div class="contrastBtn">
			<a href="javascript:;"
				class="btn btn-lg btn-forbidden JS_contrastTip">开始对比</a> <a
				href="javascript:;" class="contrastBtn-clear">全部清空</a>
		</div>
	</div>
	<span class="contrastIcon contrastIcon-vs"></span>
	<div class="poptip tip-light poptip-warning" style="display: none;"
		id="poptip1">
		<div class="tip-arrow tip-arrow-6">
			<em>◆</em> <i>◆</i>
		</div>
		<div class="tip-content">
			<h5 class="tip-title"></h5>
			<p></p>
		</div>
	</div>
	<div class="complete-wrap"
		style="display: none; background-color: rgb(204, 232, 207);"></div>
	<div class="des_error_tips"
		style="display: none; background-color: rgb(204, 232, 207);">
		<span>没有找到含“</span><span class="word"></span><span>”的城市</span><i>×</i>
	</div>
</body>
</html>