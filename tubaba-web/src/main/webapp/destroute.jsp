<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>国内游</title>
<link rel="stylesheet" href="css/destroute.css">
<link rel="stylesheet" href="css/lvSide.css">

</head>

<body class="destroute channelBody" allyes_city="SH">

	<!--没有头部  -->


	<!-- 无搜索版，公共头部结束 -->
	<!--副导航-->
	<!-- 首屏banner -->
	<div class="banWrap">
		<!-- 头部搜索框的div -->
		<div class="lv_s_box">
			<!-- 搜索框左边的图片 -->
			<div class="lv_s_l">
				<div class="s_gn_hc">
					<div class="s_gn_hill"></div>
					<div class="s_gn_yun"></div>
					<p></p>
				</div>
				<div class="l_s_gnimg"></div>
			</div>
			<!--搜索框  -->
			<div class="lv_s_all">
				<!--搜索框上面的列表 -->
				<ul class="lv_s_tab">
					<li class="active"><span style="display: none">101</span>跟团游<i class="s_tab_jt">◆</i></li>
					<li><span style="display: none">102</span>自由行<i class="s_tab_jt">◆</i></li>
					<li><span style="display: none">103</span>当地游<i class="s_tab_jt">◆</i></li>
					<a href="#" style="color: #6C6C6C; text-decoration: none;">
						<li>定制游<i class="s_tab_jt">◆</i></li>
					</a>
				</ul>
				<!--搜索列表--开始-->
				<div class="lv_s_r">
					<!--跟团游板块-->
					<div class="lv_s_list" style="display: block;">
						<!--出发地和搜索框-->
						<!--点击当地游时这个div要隐藏  -->
						<div class="lv_s_td" id="lv_s_td">
							<div class="lv_s_city_all">
								<div class="lv_s_city_btn js_s_city_btn" id="lv_s_city_btn">
									<i class="lv_s_mark"></i> <b>上海</b><i class="lv_s_arrow"></i> <span>出发</span>
								</div>
								<div class="lv_s_city js_all_city" id="lv_s_city" tabindex="0"
									style="background-color: rgb(204, 232, 207);">
									<p>热门出发城市</p>
									<div class="search_city_hot cfd_hot">
										<a onclick="createTag(this)">全国</a> <a
											onclick="createTag(this)" data-code="SH" data-id="9"
											data-name="上海">上海</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="SZ" data-id="60"
											data-name="苏州">苏州</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="HZ" data-id="69"
											data-name="杭州">杭州</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="BJ" data-id="13"
											data-name="北京">北京</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="TY" data-id="100"
											data-name="太原">太原</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="GZ" data-id="322"
											data-name="广州">广州</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="CD" data-id="258"
											data-name="成都">成都</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="ZQ" data-id="31"
											data-name="重庆">重庆</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="SY" data-id="257"
											data-name="三亚">三亚</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="CZ" data-id="59"
											data-name="常州">常州</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="HZ" data-id="73"
											data-name="湖州">湖州</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="QD" data-id="175"
											data-name="青岛">青岛</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="TJ" data-id="14"
											data-name="天津">天津</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="SZ" data-id="324"
											data-name="深圳">深圳</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="KM" data-id="233"
											data-name="昆明">昆明</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="HK" data-id="221"
											data-name="海口">海口</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="NJ" data-id="56"
											data-name="南京">南京</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="JX" data-id="72"
											data-name="嘉兴">嘉兴</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="NT" data-id="61"
											data-name="南通">南通</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="WX" data-id="57"
											data-name="无锡">无锡</a> <a onclick="createTag(this)"
											onclick="createTag(this)" data-code="XA" data-id="256"
											data-name="西安">西安</a>
									</div>
									<dl class="city_down_list">
										<dt>A-G</dt>
										<dd>
											<a onclick="createTag(this)" onclick="createTag(this)"
												data-code="AM" data-id="41" data-name="澳门">澳门</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="ALT" data-id="380" data-name="阿勒泰">阿勒泰</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="AK" data-id="338" data-name="安康">安康</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="BJ" data-id="13" data-name="北京">北京</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="BT" data-id="112" data-name="包头">包头</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="BH" data-id="211" data-name="北海">北海</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="BZ" data-id="189" data-name="滨州">滨州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="BJ" data-id="332" data-name="宝鸡">宝鸡</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="BB" data-id="82" data-name="蚌埠">蚌埠</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="CS" data-id="308" data-name="长沙">长沙</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="CZ" data-id="59" data-name="常州">常州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="CC" data-id="137" data-name="长春">长春</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="CD" data-id="258" data-name="成都">成都</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="ZQ" data-id="31" data-name="重庆">重庆</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="CZ" data-id="146" data-name="滁州">滁州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="CD" data-id="314" data-name="常德">常德</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="DL" data-id="245" data-name="大理">大理</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="DZ" data-id="272" data-name="达州">达州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="DG" data-id="202" data-name="东莞">东莞</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="DL" data-id="124" data-name="大连">大连</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="DY" data-id="178" data-name="东营">东营</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="DZ" data-id="187" data-name="德州">德州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="DT" data-id="101" data-name="大同">大同</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="FS" data-id="327" data-name="佛山">佛山</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="FY" data-id="147" data-name="阜阳">阜阳</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="FZ" data-id="154" data-name="福州">福州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="FZ" data-id="172" data-name="抚州">抚州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="GZ" data-id="322" data-name="广州">广州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="GL" data-id="209" data-name="桂林">桂林</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="GY" data-id="264" data-name="广元">广元</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="GY" data-id="224" data-name="贵阳">贵阳</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="GZ" data-id="169" data-name="赣州">赣州</a>
										</dd>
									</dl>
									<dl class="city_down_list">
										<dt>H-N</dt>
										<dd>
											<a onclick="createTag(this)" onclick="createTag(this)"
												data-code="HZ" data-id="69" data-name="杭州">杭州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HZ" data-id="73" data-name="湖州">湖州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HF" data-id="80" data-name="合肥">合肥</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HS" data-id="88" data-name="黄山">黄山</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HEB" data-id="43" data-name="哈尔滨">哈尔滨</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HHHT" data-id="111" data-name="呼和浩特">呼和浩特</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HNBE" data-id="117" data-name="呼伦贝尔">呼伦贝尔</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HK" data-id="221" data-name="海口">海口</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HZ" data-id="196" data-name="惠州">惠州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HA" data-id="63" data-name="淮安">淮安</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HZ" data-id="190" data-name="菏泽">菏泽</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HD" data-id="92" data-name="邯郸">邯郸</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HS" data-id="99" data-name="衡水">衡水</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HZ" data-id="336" data-name="汉中">汉中</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HY" data-id="311" data-name="衡阳">衡阳</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HB" data-id="85" data-name="淮北">淮北</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="HG" data-id="46" data-name="鹤岗">鹤岗</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="JX" data-id="72" data-name="嘉兴">嘉兴</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="JL" data-id="138" data-name="吉林">吉林</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="JN" data-id="174" data-name="济南">济南</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="JZ" data-id="280" data-name="焦作">焦作</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="JA" data-id="170" data-name="吉安">吉安</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="JYG" data-id="341" data-name="嘉峪关">嘉峪关</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="JDZ" data-id="164" data-name="景德镇">景德镇</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="KM" data-id="233" data-name="昆明">昆明</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LS" data-id="79" data-name="丽水">丽水</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="JH" data-id="75" data-name="金华">金华</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="JJ" data-id="166" data-name="九江">九江</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="JX" data-id="45" data-name="鸡西">鸡西</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LZ" data-id="261" data-name="泸州">泸州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LS" data-id="249" data-name="拉萨">拉萨</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LJ" data-id="238" data-name="丽江">丽江</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LY" data-id="186" data-name="临沂">临沂</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LYG" data-id="62" data-name="连云港">连云港</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LC" data-id="188" data-name="聊城">聊城</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LY" data-id="193" data-name="洛阳">洛阳</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LD" data-id="320" data-name="娄底">娄底</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LZ" data-id="340" data-name="兰州">兰州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="LA" data-id="150" data-name="六安">六安</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="MY" data-id="263" data-name="绵阳">绵阳</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="MDJ" data-id="52" data-name="牡丹江">牡丹江</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="NJ" data-id="56" data-name="南京">南京</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="NT" data-id="61" data-name="南通">南通</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="NB" data-id="70" data-name="宁波">宁波</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="NC" data-id="163" data-name="南昌">南昌</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="NN" data-id="207" data-name="南宁">南宁</a>
										</dd>
									</dl>
									<dl class="city_down_list">
										<dt>P-T</dt>
										<dd>
											<a onclick="createTag(this)" onclick="createTag(this)"
												data-code="QZ" data-id="76" data-name="衢州">衢州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="QD" data-id="175" data-name="青岛">青岛</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="QY" data-id="201" data-name="清远">清远</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="QQHE" data-id="44" data-name="齐齐哈尔">齐齐哈尔</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="QZ" data-id="158" data-name="泉州">泉州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="RZ" data-id="184" data-name="日照">日照</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SH" data-id="9" data-name="上海">上海</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SZ" data-id="60" data-name="苏州">苏州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SX" data-id="74" data-name="绍兴">绍兴</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SJZ" data-id="89" data-name="石家庄">石家庄</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SZ" data-id="324" data-name="深圳">深圳</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SY" data-id="257" data-name="三亚">三亚</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SM" data-id="157" data-name="三明">三明</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SY" data-id="123" data-name="沈阳">沈阳</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="ST" data-id="326" data-name="汕头">汕头</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SQ" data-id="68" data-name="宿迁">宿迁</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SR" data-id="173" data-name="上饶">上饶</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="SYS" data-id="47" data-name="双鸭山">双鸭山</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="TJ" data-id="14" data-name="天津">天津</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="TY" data-id="100" data-name="太原">太原</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="TCX" data-id="2118" data-name="腾冲">腾冲</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="TZ" data-id="78" data-name="台州">台州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="TS" data-id="90" data-name="唐山">唐山</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="TA" data-id="182" data-name="泰安">泰安</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="TAZ" data-id="67" data-name="泰州">泰州</a>
										</dd>
									</dl>
									<dl class="city_down_list">
										<dt>W-Z</dt>
										<dd>
											<a onclick="createTag(this)" onclick="createTag(this)"
												data-code="WX" data-id="57" data-name="无锡">无锡</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="WF" data-id="180" data-name="潍坊">潍坊</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="WZ" data-id="71" data-name="温州">温州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="WH" data-id="81" data-name="芜湖">芜湖</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="WLMQ" data-id="367" data-name="乌鲁木齐">乌鲁木齐</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="WH" data-id="291" data-name="武汉">武汉</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="WN" data-id="334" data-name="渭南">渭南</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XA" data-id="256" data-name="西安">西安</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XC" data-id="1979" data-name="西昌">西昌</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XSBN" data-id="244" data-name="西双版纳">西双版纳</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XGLLX" data-id="2210" data-name="香格里拉">香格里拉</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XN" data-id="354" data-name="西宁">西宁</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XG" data-id="40" data-name="香港">香港</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XM" data-id="155" data-name="厦门">厦门</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XT" data-id="310" data-name="湘潭">湘潭</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XT" data-id="93" data-name="邢台">邢台</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XY" data-id="333" data-name="咸阳">咸阳</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="XZ" data-id="58" data-name="徐州">徐州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YA" data-id="335" data-name="延安">延安</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YY" data-id="313" data-name="岳阳">岳阳</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YB" data-id="270" data-name="宜宾">宜宾</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YB" data-id="145" data-name="延边">延边</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YC" data-id="362" data-name="银川">银川</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YK" data-id="130" data-name="营口">营口</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YC" data-id="171" data-name="宜春">宜春</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YC" data-id="64" data-name="盐城">盐城</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YC" data-id="294" data-name="宜昌">宜昌</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YL" data-id="337" data-name="榆林">榆林</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YT" data-id="168" data-name="鹰潭">鹰潭</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="YZ" data-id="65" data-name="扬州">扬州</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="ZZ" data-id="309" data-name="株洲">株洲</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="ZS" data-id="77" data-name="舟山">舟山</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="ZH" data-id="325" data-name="珠海">珠海</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="ZS" data-id="203" data-name="中山">中山</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="ZJJ" data-id="315" data-name="张家界">张家界</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="ZB" data-id="176" data-name="淄博">淄博</a> <a
												onclick="createTag(this)" onclick="createTag(this)"
												data-code="ZZ" data-id="191" data-name="郑州">郑州</a> <a
												onclick="createTag(this)">漳州</a>
										</dd>
									</dl>
								</div>
							</div>
						</div>
						<input class="lv_s_input js_s_input w_611" id="js_s_inputw_611"
							value="请输入目的地、主题、或关键词" type="text">
						<!--输入框上面覆盖的关键字--开始-->
						<div class="lv_s_input_hot js_s_input_hot" id="seachtop">
							<span onclick="">西藏</span> <span onclick="">三亚</span> <span
								onclick="">云南</span>
						</div>
						<!--关键字--结束-->
					</div>
				</div>
				<!--搜索列表--结束-->

				<!--搜索按钮--开始-->
				<span class="lv_s_search_btn" id="lv_s_search_btn"><i></i>搜索</span>
				<!--搜索按钮--结束-->
			</div>
		</div>

		<div class="w1200 bc clearfix">
			<!-- banner中的导航 (左上角的菜单)-->
			<div class="channelNav fl">
				<div class="channelNav-list">
					<div class="channelNav-tit"
						style="background-color: rgb(204, 232, 207);">
						<h4>节后错峰</h4>
						<p class="channelNav-hot">
							<a
								onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-1-北京','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=北京&amp;k=0#list"
								class="hot" target="_blank" hidefocus="false">北京</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-2-长白山','PC国内游频道页导航');"
								href="http://s.lvmama.com/scenictour/K310000?keyword=%E9%95%BF%E7%99%BD%E5%B1%B1&amp;k=0#list"
								class="hot" target="_blank" hidefocus="false">长白山</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-3-云南','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E4%BA%91%E5%8D%97&amp;k=0#list"
								target="_blank" hidefocus="false">云南</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-4-三亚','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B8%89%E4%BA%9A&amp;tabType=freetour#list"
								target="_blank" hidefocus="false">三亚</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-5-厦门','PC国内游频道页导航');"
								href="http://s.lvmama.com/freetour/H9K310000?keyword=%E5%8E%A6%E9%97%A8&amp;k=0#list"
								target="_blank" hidefocus="false">厦门</a>
						</p>
					</div>
					<!-- //channelNav-tit -->
					<!-- 展开页 -->
					<div class="channelNav-main"
						style="background-color: rgb(204, 232, 207);">
						<div class="channelNav-main-column">
							<dl>
								<dt>当季精选</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-6-巴适成都','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=成都&amp;k=0#list"
										target="_blank" hidefocus="false">巴适成都</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-7-魅力青岛','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=青岛&amp;k=0#list"
										target="_blank" hidefocus="false">魅力青岛</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-8-清新厦门','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9?keyword=%E5%8E%A6%E9%97%A8&amp;k=0#list"
										target="_blank" hidefocus="false">清新厦门</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-9-多彩版纳','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E8%A5%BF%E5%8F%8C%E7%89%88%E7%BA%B3&amp;k=0#list"
										class="hot" target="_blank" hidefocus="false">多彩版纳</a>
								</dd>
							</dl>
							<dl>
								<dt>清肺山水</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-10-长白山','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9?keyword=%E9%95%BF%E7%99%BD%E5%B1%B1&amp;k=0#list"
										target="_blank" hidefocus="false">长白山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-11-丽江','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B8%BD%E6%B1%9F&amp;k=0#list"
										target="_blank" hidefocus="false">丽江</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-12-桂林','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9?keyword=%E6%A1%82%E6%9E%97&amp;k=0#list"
										class="hot" target="_blank" hidefocus="false">桂林</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-13-贵州','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E8%B4%B5%E5%B7%9E&amp;k=0#list"
										target="_blank" hidefocus="false">贵州</a>
								</dd>
							</dl>
							<dl>
								<dt>热门推荐</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-14-风月大理','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/dali327/route-D9#list"
										class="hot" target="_blank" hidefocus="false">风月大理</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-15-古都西安','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9?keyword=%E8%A5%BF%E5%AE%89&amp;k=0#list"
										target="_blank" hidefocus="false">古都西安</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-16-豪气东北','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/dongbei10554816/route-D9#list"
										target="_blank" hidefocus="false">豪气东北</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-17-艳遇丽江','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9?keyword=%E4%B8%BD%E6%B1%9F&amp;k=0#list"
										target="_blank" hidefocus="false">艳遇丽江</a>
								</dd>
							</dl>
							<dl>
								<dt>踏浪赶海</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-18-浪漫三亚','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9?keyword=%E4%B8%89%E4%BA%9A&amp;k=0#list"
										target="_blank" hidefocus="false">浪漫三亚</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-19-畅爽青岛','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/qingdao161/route-D9#list"
										target="_blank" hidefocus="false">畅爽青岛</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-20-清新厦门','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9?keyword=%E5%8E%A6%E9%97%A8&amp;k=0#list"
										class="hot" target="_blank" hidefocus="false">清新厦门</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-21-休闲北海','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/beihai257/route-D9#list"
										target="_blank" hidefocus="false">休闲北海</a>
								</dd>
							</dl>
							<dl>
								<dt>舌尖中国</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-22-质朴西安','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/xian340/route-D9#list"
										target="_blank" hidefocus="false">质朴西安</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-23-麻辣成都','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=成都&amp;k=0#list"
										target="_blank" hidefocus="false">麻辣成都</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-24-多彩贵州','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/guizhou300/route-D9#list"
										class="hot" target="_blank" hidefocus="false">多彩贵州</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-25-海味大连','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9?keyword=%E5%A4%A7%E8%BF%9E&amp;k=0#list"
										target="_blank" hidefocus="false">海味大连</a>
								</dd>
							</dl>
							<dl>
								<dt>行摄之旅</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-26-神圣西藏','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/xizang331/route-D9#list"
										target="_blank" hidefocus="false">神圣西藏</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-27-野趣重庆','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9?keyword=%E9%87%8D%E5%BA%86&amp;k=0#list"
										target="_blank" hidefocus="false">野趣重庆</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-28-丝绸之路','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/gansu350/route-D9#list"
										class="hot" target="_blank" hidefocus="false">丝绸之路</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-01-节后错峰-29-韵味北京','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9?keyword=%E5%8C%97%E4%BA%AC&amp;k=0#list"
										target="_blank" hidefocus="false">韵味北京</a>
								</dd>
							</dl>
						</div>

						<div class="channelNav-main-column"></div>
					</div>
					<!-- //channelNav-main -->
				</div>


				<!--华南开始-->
				<div class="channelNav-list">
					<div class="channelNav-tit"
						style="background-color: rgb(204, 232, 207);">
						<h4>华南华中</h4>
						<p class="channelNav-hot">
							<a
								onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-1-长隆','PC国内游频道页导航');"
								href="http://s.lvmama.com/freetour/H9K310000?keyword=%E9%95%BF%E9%9A%86&amp;k=1#list"
								target="_blank" hidefocus="false">长隆</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-2-桂林','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9?keyword=%E6%A1%82%E6%9E%97&amp;k=0#list"
								target="_blank" hidefocus="false">桂林</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-3-厦门','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9?keyword=%E5%8E%A6%E9%97%A8&amp;k=1#list"
								class="hot" target="_blank" hidefocus="false">厦门</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-4-张家界','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E5%BC%A0%E5%AE%B6%E7%95%8C&amp;k=0#list"
								target="_blank" hidefocus="false">张家界</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-5-三峡','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9?keyword=%E9%95%BF%E6%B1%9F%E4%B8%89%E5%B3%A1&amp;k=1#list"
								target="_blank" hidefocus="false">三峡</a>
						</p>
					</div>
					<!-- //channelNav-tit -->
					<!-- 展开页 -->
					<div class="channelNav-main"
						style="background-color: rgb(204, 232, 207);">
						<div class="channelNav-main-column">
							<dl>
								<dt>浪漫三亚</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-6-蜈支洲岛','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E8%9C%88%E6%94%AF%E6%B4%B2%E5%B2%9B&amp;k=1#list"
										target="_blank" hidefocus="false">蜈支洲岛</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-7-三亚湾','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E4%B8%89%E4%BA%9A%E6%B9%BE#list"
										target="_blank" hidefocus="false">三亚湾</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-8-亚龙湾','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E4%BA%9A%E9%BE%99%E6%B9%BE&amp;k=0#list"
										target="_blank" hidefocus="false">亚龙湾</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-9-大东海','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E5%A4%A7%E4%B8%9C%E6%B5%B7&amp;k=0#list"
										target="_blank" hidefocus="false">大东海</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-10-海棠湾','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E6%B5%B7%E6%A3%A0%E6%B9%BE&amp;k=0#list"
										target="_blank" hidefocus="false">海棠湾</a>
								</dd>
							</dl>
							<dl>
								<dt>清新福建</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-11-厦门','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E5%8E%A6%E9%97%A8&amp;k=0#list"
										class="hot" target="_blank" hidefocus="false">厦门</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-12-武夷山','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E6%AD%A6%E5%A4%B7%E5%B1%B1&amp;k=0#list"
										target="_blank" hidefocus="false">武夷山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-13-鼓浪屿','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-9f136d6a5c7f/route-D9#list"
										class="hot" target="_blank" hidefocus="false">鼓浪屿</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-14-云水谣','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E4%BA%91%E6%B0%B4%E8%B0%A3&amp;k=0#list"
										target="_blank" hidefocus="false">云水谣</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-15-永定土楼','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-6c385b9a571f697c/route-D9#list"
										target="_blank" hidefocus="false">永定土楼</a>
								</dd>
							</dl>
							<dl>
								<dt>魅力广西</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-16-山水桂林','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E6%A1%82%E6%9E%97#list"
										target="_blank" hidefocus="false">山水桂林</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-17-绝色南宁','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%8D%97%E5%AE%81&amp;k=0#list"
										target="_blank" hidefocus="false">绝色南宁</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-18-小资阳朔','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E9%98%B3%E6%9C%94&amp;k=0#list"
										target="_blank" hidefocus="false">小资阳朔</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-19-风情北海','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%8C%97%E6%B5%B7&amp;k=0#list"
										target="_blank" hidefocus="false">风情北海</a>
								</dd>
							</dl>
							<dl>
								<dt>时尚广东</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-20-广州','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%B9%BF%E5%B7%9E&amp;k=0#list"
										target="_blank" hidefocus="false">广州</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-21-长隆','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%95%BF%E9%9A%86&amp;k=0#list"
										target="_blank" hidefocus="false">长隆</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-22-珠海','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E7%8F%A0%E6%B5%B7&amp;k=0#list"
										target="_blank" hidefocus="false">珠海</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-23-深圳','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E6%B7%B1%E5%9C%B3&amp;k=0#list"
										target="_blank" hidefocus="false">深圳</a>
								</dd>
							</dl>
							<dl>
								<dt>山水湖南</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-24-张家界','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E5%BC%A0%E5%AE%B6%E7%95%8C&amp;k=0#list"
										target="_blank" hidefocus="false">张家界</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-25-长沙','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9?keyword=%E9%95%BF%E6%B2%99&amp;k=0#list"
										target="_blank" hidefocus="false">长沙</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-26-凤凰古城','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%87%A4%E5%87%B0%E5%8F%A4%E5%9F%8E&amp;k=0#list"
										target="_blank" hidefocus="false">凤凰古城</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-27-天门山','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%A4%A9%E9%97%A8%E5%B1%B1&amp;k=0#list"
										target="_blank" hidefocus="false">天门山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-28-黄龙洞','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%BB%84%E9%BE%99%E6%B4%9E&amp;k=0#list"
										target="_blank" hidefocus="false">黄龙洞</a>
								</dd>
							</dl>
							<dl>
								<dt>畅游湖北</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-29-长江三峡','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%95%BF%E6%B1%9F%E4%B8%89%E5%B3%A1&amp;k=1#list"
										class="hot" target="_blank" hidefocus="false">长江三峡</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-30-恩施','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E6%81%A9%E6%96%BD&amp;k=0#list"
										target="_blank" hidefocus="false">恩施</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-31-宜昌','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9?keyword=%E5%AE%9C%E6%98%8C&amp;k=1#list"
										target="_blank" hidefocus="false">宜昌</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-32-神农架','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E7%A5%9E%E5%86%9C%E6%9E%B6&amp;k=0#list"
										target="_blank" hidefocus="false">神农架</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-33-武汉','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E6%AD%A6%E6%B1%89&amp;k=0#list"
										target="_blank" hidefocus="false">武汉</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-02-华南华中-34-武当山','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9?keyword=%E6%AD%A6%E5%BD%93%E5%B1%B1&amp;k=1#list"
										target="_blank" hidefocus="false">武当山</a>
								</dd>
							</dl>
						</div>

						<div class="channelNav-main-column"></div>
					</div>
					<!-- //channelNav-main -->
				</div>
				<!--华南结束-->

				<!--西南开始-->
				<div class="channelNav-list">
					<div class="channelNav-tit"
						style="background-color: rgb(204, 232, 207);">
						<h4>多彩西南</h4>
						<p class="channelNav-hot">
							<a
								onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-1-成都','PC国内游频道页导航');"
								href="http://s.lvmama.com/route/H9K310000?keyword=%E6%88%90%E9%83%BD&amp;k=0#list"
								target="_blank" hidefocus="false">成都</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-2-香格里拉','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E9%A6%99%E6%A0%BC%E9%87%8C%E6%8B%89&amp;k=0#list"
								class="hot" target="_blank" hidefocus="false">香格里拉</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-3-昆大丽','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E4%BA%91%E5%8D%97&amp;k=0#list"
								target="_blank" hidefocus="false">昆大丽</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-4-云南','PC国内游频道页导航');"
								href="http://s.lvmama.com/freetour/H9K310000a18182?keyword=%E4%BA%91%E5%8D%97&amp;tabType=route350#list"
								target="_blank" hidefocus="false">云南</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-5-丽江','PC国内游频道页导航');"
								href="http://s.lvmama.com/freetour/H9K310000a18182?keyword=%E4%B8%BD%E6%B1%9F&amp;tabType=freetour#list"
								target="_blank" hidefocus="false">丽江</a>
						</p>
					</div>
					<!-- //channelNav-tit -->
					<!-- 展开页 -->
					<div class="channelNav-main"
						style="background-color: rgb(204, 232, 207);">
						<div class="channelNav-main-column">
							<dl>
								<dt>七彩云南</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-6-丽江','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E4%B8%BD%E6%B1%9F&amp;k=0#list"
										target="_blank" hidefocus="false">丽江</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-7-西双版纳','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E8%A5%BF%E5%8F%8C%E7%89%88%E7%BA%B3&amp;k=0#list"
										target="_blank" hidefocus="false">西双版纳</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-8-大理','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E5%A4%A7%E7%90%86&amp;k=0#list"
										target="_blank" hidefocus="false">大理</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-9-香格里拉','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%A6%99%E6%A0%BC%E9%87%8C%E6%8B%89&amp;k=0#list"
										target="_blank" hidefocus="false">香格里拉</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-10-腾冲','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E8%85%BE%E5%86%B2&amp;k=0#list"
										target="_blank" hidefocus="false">腾冲</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-11-探秘三江并源','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E6%9D%BE%E8%B5%9E&amp;tabType=route#list"
										target="_blank" hidefocus="false">探秘三江并源</a>
								</dd>
							</dl>
							<dl>
								<dt>劲爽四川</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-12-重庆','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=重庆&amp;k=0#list"
										target="_blank" hidefocus="false">重庆</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-13-成都','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=成都&amp;k=0#list"
										target="_blank" hidefocus="false">成都</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-14-黄龙','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%BB%84%E9%BE%99&amp;k=0#list"
										target="_blank" hidefocus="false">黄龙</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-15-峨眉山','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%B3%A8%E7%9C%89%E5%B1%B1&amp;k=0#list"
										target="_blank" hidefocus="false">峨眉山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-16-乐山','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B9%90%E5%B1%B1&amp;k=0#list"
										target="_blank" hidefocus="false">乐山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-17-都江堰','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%BB%84%E9%BE%99&amp;k=0#list"
										target="_blank" hidefocus="false">都江堰</a>
								</dd>
							</dl>
							<dl>
								<dt>山城重庆</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-18-武隆','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E6%AD%A6%E9%9A%86&amp;k=0#list"
										target="_blank" hidefocus="false">武隆</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-19-重庆','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E9%87%8D%E5%BA%86&amp;k=0#list"
										target="_blank" hidefocus="false">重庆</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-20-大足石刻','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%A4%A7%E8%B6%B3%E7%9F%B3%E5%88%BB&amp;k=1#list"
										target="_blank" hidefocus="false">大足石刻</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-21-仙女山','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E4%BB%99%E5%A5%B3%E5%B1%B1&amp;k=0#list"
										target="_blank" hidefocus="false">仙女山</a>
								</dd>
							</dl>
							<dl>
								<dt>多彩贵州</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-22-贵阳','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E8%B4%B5%E9%98%B3&amp;k=0#list"
										target="_blank" hidefocus="false">贵阳</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-23-黄果树','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%BB%84%E6%9E%9C%E6%A0%91&amp;k=0#list"
										target="_blank" hidefocus="false">黄果树</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-24-西江苗寨','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E8%A5%BF%E6%B1%9F%E5%8D%83%E6%88%B7%E8%8B%97%E5%AF%A8&amp;k=1#list"
										target="_blank" hidefocus="false">西江苗寨</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-25-荔波','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E8%8D%94%E6%B3%A2&amp;k=0#list"
										target="_blank" hidefocus="false">荔波</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-26-大小七孔','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B8%83%E5%AD%94&amp;k=0#list"
										target="_blank" hidefocus="false">大小七孔</a>
								</dd>
							</dl>
							<dl>
								<dt>神圣西藏</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-27-拉萨','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E6%8B%89%E8%90%A8&amp;k=0#list"
										target="_blank" hidefocus="false">拉萨</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-28-布达拉宫','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%B8%83%E8%BE%BE%E6%8B%89%E5%AE%AB&amp;k=1#list"
										target="_blank" hidefocus="false">布达拉宫</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-29-纳木错','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E7%BA%B3%E6%9C%A8%E9%94%99&amp;k=0#list"
										target="_blank" hidefocus="false">纳木错</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-30-林芝','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/linzhi338/route-D9#list"
										target="_blank" hidefocus="false">林芝</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-31-雅鲁藏布江大峡谷','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-96c59c8185cf5e036c5f59275ce18c37/route-D9#list"
										target="_blank" hidefocus="false">雅鲁藏布江大峡谷</a>
								</dd>
							</dl>
							<dl>
								<dt>特别推荐</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-32-民俗风情','PC国内游频道页导航');"
										href="http://www.lvmama.com/zt/promo/danzhai/" target="_blank"
										hidefocus="false">民俗风情</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-33-云南映象','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/yunnan312/route-D9#list"
										target="_blank" hidefocus="false">云南映象</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-34-朝圣之路','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/xizang331/route-D9#list"
										target="_blank" hidefocus="false">朝圣之路</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-03-多彩西南-35-秀美山水','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-4e5d5be86c9f/route-D9#list"
										target="_blank" hidefocus="false">秀美山水</a>
								</dd>
							</dl>
						</div>

						<div class="channelNav-main-column"></div>
					</div>
					<!-- //channelNav-main -->
				</div>
				<!--西南结束-->

				<!--华北东北开始-->
				<div class="channelNav-list">
					<div class="channelNav-tit"
						style="background-color: rgb(204, 232, 207);">
						<h4>华北东北</h4>
						<p class="channelNav-hot">
							<a
								onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-1-内蒙古','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=内蒙古&amp;k=0#list"
								class="hot" target="_blank" hidefocus="false">内蒙古</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-2-北京','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=北京&amp;k=0#list"
								target="_blank" hidefocus="false">北京</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-3-山东','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=山东&amp;k=0#list"
								target="_blank" hidefocus="false">山东</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-4-长白山','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E9%95%BF%E7%99%BD%E5%B1%B1&amp;k=0#list"
								target="_blank" hidefocus="false">长白山</a>
						</p>
					</div>
					<!-- //channelNav-tit -->
					<!-- 展开页 -->
					<div class="channelNav-main"
						style="background-color: rgb(204, 232, 207);">
						<div class="channelNav-main-column">
							<dl>
								<dt>文化北京</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-5-北京','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E5%8C%97%E4%BA%AC&amp;k=0#list"
										target="_blank" hidefocus="false">北京</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-6-万里长城','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-516b8fbe5cad957f57ce/route-D9#list"
										target="_blank" hidefocus="false">万里长城</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-7-古韵故宫','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-65455bab/route-D9#list"
										target="_blank" hidefocus="false">古韵故宫</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-8-颐和园','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-9890548c56ed/route-D9#list"
										target="_blank" hidefocus="false">颐和园</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-9-鸟巢','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%B8%9F%E5%B7%A2&amp;k=0#list"
										target="_blank" hidefocus="false">鸟巢</a>
								</dd>
							</dl>
							<dl>
								<dt>好客山东</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-10-青岛','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E9%9D%92%E5%B2%9B&amp;k=0#list"
										target="_blank" hidefocus="false">青岛</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-11-曲阜','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/qufu169/route-D9#list"
										target="_blank" hidefocus="false">曲阜</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-12-泰山','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-6cf05c71/route-D9#list"
										target="_blank" hidefocus="false">泰山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-13-日照','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/rizhao172/route-D9#list"
										target="_blank" hidefocus="false">日照</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-14-济南','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E6%B5%8E%E5%8D%97&amp;k=0#list"
										target="_blank" hidefocus="false">济南</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-15-蓬莱','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E8%93%AC%E8%8E%B1&amp;k=0#list"
										target="_blank" hidefocus="false">蓬莱</a>
								</dd>
							</dl>
							<dl>
								<dt>豪爽东北</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-16-长白山','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=长白山&amp;k=0#list"
										target="_blank" hidefocus="false">长白山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-17-哈尔滨','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=哈尔滨&amp;k=0#list"
										target="_blank" hidefocus="false">哈尔滨</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-18-雪乡','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%9B%AA%E4%B9%A1&amp;k=0#list"
										target="_blank" hidefocus="false">雪乡</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-19-沈阳','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=沈阳&amp;k=0#list"
										target="_blank" hidefocus="false">沈阳</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-20-雾凇岛','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%9B%BE%E5%87%87%E5%B2%9B&amp;k=0#list"
										target="_blank" hidefocus="false">雾凇岛</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-21-亚布力','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E4%BA%9A%E5%B8%83%E5%8A%9B&amp;k=0#list"
										target="_blank" hidefocus="false">亚布力</a>
								</dd>
							</dl>
							<dl>
								<dt>晋美山西</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-22-云冈石窟','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-4e91518877f37a9f/route-D9#list"
										target="_blank" hidefocus="false">云冈石窟</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-23-五台山','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-4e9453f05c71/route-D9#list"
										target="_blank" hidefocus="false">五台山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-24-平遥古城','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-5e73906553e457ce/route-D9#list"
										target="_blank" hidefocus="false">平遥古城</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-25-乔家大院','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-4e545bb659279662/route-D9#list"
										target="_blank" hidefocus="false">乔家大院</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-26-壶口瀑布','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%A3%B6%E5%8F%A3%E7%80%91%E5%B8%83&amp;k=0#list"
										target="_blank" hidefocus="false">壶口瀑布</a>
								</dd>
							</dl>
							<dl>
								<dt>河北天津</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-27-天津','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E5%A4%A9%E6%B4%A5&amp;k=1#list"
										target="_blank" hidefocus="false">天津</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-28-张家口','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K310000?keyword=%E5%BC%A0%E5%AE%B6%E5%8F%A3&amp;k=0#list"
										target="_blank" hidefocus="false">张家口</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-04-华北东北-29-承德','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E6%89%BF%E5%BE%B7&amp;k=0#list"
										target="_blank" hidefocus="false">承德</a>
								</dd>
							</dl>
						</div>

						<div class="channelNav-main-column"></div>
					</div>
					<!-- //channelNav-main -->
				</div>
				<!--华北东北结束-->

				<!--西北开始-->
				<div class="channelNav-list">
					<div class="channelNav-tit"
						style="background-color: rgb(204, 232, 207);">
						<h4>中原西北</h4>
						<p class="channelNav-hot">
							<a
								onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-1-西安','PC国内游频道页导航'); "
								href="http://s.lvmama.com/freetour/H9K320100?keyword=%E8%A5%BF%E5%AE%89&amp;k=0#list"
								target="_blank" hidefocus="false">西安</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-2-甘肃','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K320100?keyword=%E7%94%98%E8%82%83&amp;k=0#list"
								class="hot" target="_blank" hidefocus="false">甘肃</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-3-青海','PC国内游频道页导航'); "
								href="http://s.lvmama.com/group/H9K320100?keyword=%E9%9D%92%E6%B5%B7&amp;k=0#list"
								target="_blank" hidefocus="false">青海</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-4-新疆','PC国内游频道页导航'); "
								href="http://s.lvmama.com/group/H9K310000?keyword=%E6%96%B0%E7%96%86&amp;k=0#list"
								target="_blank" hidefocus="false">新疆</a>
						</p>
					</div>
					<!-- //channelNav-tit -->
					<!-- 展开页 -->
					<div class="channelNav-main"
						style="background-color: rgb(204, 232, 207);">
						<div class="channelNav-main-column">
							<dl>

								<dt>美味陕西</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-5-西安','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E8%A5%BF%E5%AE%89&amp;k=0#list"
										target="_blank" hidefocus="false">西安</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-6-兵马俑','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%85%B5%E9%A9%AC%E4%BF%91&amp;k=0#list"
										target="_blank" hidefocus="false">兵马俑</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-7-华山','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%8D%8E%E5%B1%B1&amp;k=0#list"
										target="_blank" hidefocus="false">华山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-8-法门寺','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E6%B3%95%E9%97%A8%E5%AF%BA&amp;k=0#list"
										target="_blank" hidefocus="false">法门寺</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-9-华清池','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%8D%8E%E6%B8%85%E6%B1%A0&amp;k=0#list"
										target="_blank" hidefocus="false">华清池</a>
								</dd>
							</dl>
							<dl>

								<dt>老家河南</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-10-少林寺','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%B0%91%E6%9E%97%E5%AF%BA&amp;k=0#list"
										target="_blank" hidefocus="false">少林寺</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-11-云台山','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E4%BA%91%E5%8F%B0%E5%B1%B1&amp;k=0#list"
										target="_blank" hidefocus="false">云台山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-12-龙门石窟','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E9%BE%99%E9%97%A8%E7%9F%B3%E7%AA%9F&amp;k=0#list"
										target="_blank" hidefocus="false">龙门石窟</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-13-洛阳','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E6%B4%9B%E9%98%B3&amp;k=0#list"
										target="_blank" hidefocus="false">洛阳</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-14-开封','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%BC%80%E5%B0%81&amp;k=0#list"
										target="_blank" hidefocus="false">开封</a>
								</dd>
							</dl>
							<dl>

								<dt>魅力甘肃</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-15-鸣沙山','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E9%B8%A3%E6%B2%99%E5%B1%B1&amp;k=0#list"
										target="_blank" hidefocus="false">鸣沙山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-16-月牙泉','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E6%9C%88%E7%89%99%E6%B3%89&amp;k=0#list"
										target="_blank" hidefocus="false">月牙泉</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-17-多彩张掖','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/zhangye357/route-D9#list"
										target="_blank" hidefocus="false">多彩张掖</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-18-质朴兰州','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/lanzhou351/route-D9#list"
										target="_blank" hidefocus="false">质朴兰州</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-19-满洲里','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/manzhoulishi1921/route-D9#list"
										target="_blank" hidefocus="false">满洲里</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-20-嘉峪关','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/jiayuguan352/route-D9#list"
										target="_blank" hidefocus="false">嘉峪关</a>
								</dd>
							</dl>
							<dl>

								<dt>壮美青海</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-21-青海湖','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-97526d776e56/route-D9#list"
										target="_blank" hidefocus="false">青海湖</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-22-塔尔寺','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-58545c145bfa/route-D9#list"
										target="_blank" hidefocus="false">塔尔寺</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-23-茶卡盐湖','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/s-8336536176d06e56/route-D9#list"
										target="_blank" hidefocus="false">茶卡盐湖</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-24-西宁','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E8%A5%BF%E5%AE%81&amp;k=0#list"
										target="_blank" hidefocus="false">西宁</a>
								</dd>
							</dl>
							<dl>

								<dt>内蒙古</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-25-呼伦贝尔','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/hulunbeier34/route-D9#list"
										target="_blank" hidefocus="false">呼伦贝尔</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-26-满洲里','PC国内游频道页导航');"
										href="http://dujia.lvmama.com/tour/manzhoulishi1921/route-D9#list"
										target="_blank" hidefocus="false">满洲里</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-27-响沙湾','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%93%8D%E6%B2%99%E6%B9%BE&amp;k=0#list"
										target="_blank" hidefocus="false">响沙湾</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-28-希拉穆仁','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E5%B8%8C%E6%8B%89%E7%A9%86%E4%BB%81&amp;k=0#list"
										target="_blank" hidefocus="false">希拉穆仁</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-05-中原西北-29-鄂尔多斯','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K310000?keyword=%E9%84%82%E5%B0%94%E5%A4%9A%E6%96%AF&amp;k=0#list"
										target="_blank" hidefocus="false">鄂尔多斯</a>
								</dd>
							</dl>
						</div>

						<div class="channelNav-main-column"></div>
					</div>
					<!-- //channelNav-main -->
				</div>
				<!--西北结束-->


				<!--华中开始-->
				<div class="channelNav-list channelNav-last">
					<div class="channelNav-tit"
						style="background-color: rgb(204, 232, 207);">
						<h4>精品特惠</h4>
						<p class="channelNav-hot">
							<a
								onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-1-驴妈妈严选','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E9%A9%B4%E5%A6%88%E5%A6%88%E4%B8%A5%E9%80%89&amp;k=0#list"
								class="hot" target="_blank" hidefocus="false">驴妈妈严选</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-2-驴妈妈自营','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E9%A9%B4%E5%A6%88%E5%A6%88%E8%87%AA%E8%90%A5&amp;k=1#list"
								target="_blank" hidefocus="false">驴妈妈自营</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-3-自由行大促','PC国内游频道页导航');"
								href="http://zt.lvmama.com/subject/sznjj-1739" target="_blank"
								hidefocus="false">自由行大促</a> <a
								onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-4-尾单','PC国内游频道页导航');"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E5%B0%BE%E5%8D%95&amp;k=0#list"
								target="_blank" hidefocus="false">尾单</a>
						</p>
					</div>
					<!-- //channelNav-tit -->
					<!-- 展开页 -->
					<div class="channelNav-main"
						style="background-color: rgb(204, 232, 207);">
						<div class="channelNav-main-column">
							<dl>

								<dt>欢乐亲子</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-5-长隆','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E9%95%BF%E9%9A%86&amp;k=0#list"
										target="_blank" hidefocus="false">长隆</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-6-厦门','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%8E%A6%E9%97%A8&amp;k=0#list"
										target="_blank" hidefocus="false">厦门</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-7-三亚','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E4%B8%89%E4%BA%9A&amp;k=0#list"
										target="_blank" hidefocus="false">三亚</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-8-北京','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%8C%97%E4%BA%AC&amp;k=0#list"
										target="_blank" hidefocus="false">北京</a>
								</dd>
							</dl>
							<dl>

								<dt>激情滑雪</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-9-长白山','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E9%95%BF%E7%99%BD%E5%B1%B1&amp;k=0#list"
										target="_blank" hidefocus="false">长白山</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-10-亚布力','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E4%BA%9A%E5%B8%83%E5%8A%9B&amp;k=0#list"
										target="_blank" hidefocus="false">亚布力</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-11-哈尔滨','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E5%93%88%E5%B0%94%E6%BB%A8&amp;k=0#list"
										target="_blank" hidefocus="false">哈尔滨</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-12-内蒙古','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%86%85%E8%92%99%E5%8F%A4&amp;k=0#list"
										target="_blank" hidefocus="false">内蒙古</a>
								</dd>
							</dl>
							<dl>

								<dt>甜蜜情侣</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-13-三亚','PC国内游频道页导航');"
										href="http://zt.lvmama.com/subject/sanyajingpintehui-405"
										target="_blank" hidefocus="false">三亚</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-14-厦门','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E5%8E%A6%E9%97%A8&amp;k=0#list"
										target="_blank" hidefocus="false">厦门</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-15-云南','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E4%BA%91%E5%8D%97&amp;k=0#list"
										target="_blank" hidefocus="false">云南</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-16-青岛','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E9%9D%92%E5%B2%9B&amp;k=0#list"
										target="_blank" hidefocus="false">青岛</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-17-北海','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%8C%97%E6%B5%B7&amp;k=0#list"
										target="_blank" hidefocus="false">北海</a>
								</dd>
							</dl>
							<dl>

								<dt>摄影专线</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-18-张家界','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%BC%A0%E5%AE%B6%E7%95%8C&amp;k=0#list"
										target="_blank" hidefocus="false">张家界</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-19-九寨沟','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E4%B9%9D%E5%AF%A8%E6%B2%9F&amp;k=0#list"
										target="_blank" hidefocus="false">九寨沟</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-20-西藏','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E8%A5%BF%E8%97%8F&amp;k=0#list"
										target="_blank" hidefocus="false">西藏</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-21-青海湖','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E9%9D%92%E6%B5%B7%E6%B9%96&amp;k=0#list"
										target="_blank" hidefocus="false">青海湖</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-22-西双版纳','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E8%A5%BF%E5%8F%8C%E7%89%88%E7%BA%B3&amp;k=0#list"
										target="_blank" hidefocus="false">西双版纳</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-23-贵州','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E8%B4%B5%E5%B7%9E&amp;k=0#list"
										target="_blank" hidefocus="false">贵州</a>
								</dd>
							</dl>
							<dl>

								<dt>舌尖之旅</dt>
								<dd>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-24-成都','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E6%88%90%E9%83%BD&amp;k=0#list"
										target="_blank" hidefocus="false">成都</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-25-广东','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E5%B9%BF%E4%B8%9C&amp;k=0#list"
										target="_blank" hidefocus="false">广东</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-26-西安','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E8%A5%BF%E5%AE%89&amp;k=0#list"
										target="_blank" hidefocus="false">西安</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-27-贵州','PC国内游频道页导航');"
										href="http://s.lvmama.com/group/H9K320100?keyword=%E8%B4%B5%E5%B7%9E#list"
										target="_blank" hidefocus="false">贵州</a> <a
										onclick="onClickTag('国内游频道页-PC-上海-导航-06-精品特惠-28-重庆','PC国内游频道页导航');"
										href="http://s.lvmama.com/freetour/H9K320100?keyword=%E9%87%8D%E5%BA%86&amp;k=0#list"
										target="_blank" hidefocus="false">重庆</a>
								</dd>
							</dl>
						</div>

						<div class="channelNav-main-column"></div>
					</div>
					<!-- //channelNav-main -->
				</div>

				<!--华中结束-->

			</div>
			<!--//channelNav banner中的导航 End（菜单结束） -->

			<!-- banBox banner盒子 -->
			<!-- 最大的图片开始 -->
			<div class="banBox fr pr">
				<div class="banBox-btn banBox-btnL pa">
					<i class="channelIcon channelIcon-banL"></i>
				</div>
				<div class="banBox-btn banBox-btnR pa">
					<i class="channelIcon channelIcon-banR"></i>
				</div>
				<div class="banTab pa"></div>
				<!-- 最大的广告图 -->
				<ul class="banPic pa" id="js_allyes_1"
					style="width: 5478px; left: -913px;">
					<li><a href="http://ticket.lvmama.com/scenic-11352734"
						target="_blank"
						onclick="cmCreateElementTag('PC_广告系统_ONCLICK','5_6_79_1694')"><img
							src="image/122cf1bb-c4ac-4994-bfcc-4441341d9813.jpg" height="290"
							width="912"></a></li>
				</ul>
			</div>
			<!-- //banBox banner盒子 End-->
			<!-- banban-bottom（最大广告图下面的四个小广告图） -->
			<div class="ban-bottom fl">
				<a onclick="onClickTag('国内游频道页-PC-上海-专题-1-海南','PC国内游频道页BANNER');"
					href="http://s.lvmama.com/freetour/H9K310000?keyword=%E4%B8%89%E4%BA%9A&amp;tabType=route350#list"
					target="_blank"><img
					src="http://s1.lvjs.com.cn/uploads/pc/place2/2018-09-11/e441a525-ba06-4db6-968f-d967e6d2880f.jpg"
					width="227" height="105" alt=""></a> <a
					onclick="onClickTag('国内游频道页-PC-上海-专题-2-成都','PC国内游频道页BANNER');"
					href="http://s.lvmama.com/group/H9K330100?keyword=%E6%88%90%E9%83%BD&amp;k=0#list"
					target="_blank"><img
					src="http://s2.lvjs.com.cn/uploads/pc/place2/2018-09-11/6dceb0f3-dcbc-4f0b-81c5-5ca29b88d324.jpg"
					width="227" height="105" alt=""></a> <a
					onclick="onClickTag('国内游频道页-PC-上海-专题-3-周边跟团','PC国内游频道页BANNER');"
					href="http://www.lvmama.com/around/" target="_blank"><img
					src="http://s3.lvjs.com.cn/uploads/pc/place2/2017-02-16/b1c49ad4-7607-4a70-b4c5-99beecd6c594.jpg"
					width="227" height="105" alt=""></a> <a
					onclick="onClickTag('国内游频道页-PC-上海-专题-4-树蛙部落','PC国内游频道页BANNER');"
					href="http://dujia.lvmama.com/local/1652381" target="_blank"><img
					src="http://s1.lvjs.com.cn/uploads/pc/place2/180696/1537349317381.jpg"
					width="227" height="105" alt=""></a>

			</div>
			<!-- banban-bottom END-->

		</div>
		<!-- //w1200 -->
	</div>
	<!--//banWrap 首屏banner End -->

	<!--优惠促销-->
	<!-- 促销区域 -->
	<div class="specialOffer w1200 bc mt35">
		<!-- 促销标题 -->
		<div class="specialTit f22 yh tc JS_tab">
			<span class="active fl pr" onclick=""><em>优惠促销</em><i
				class="channelIcon channelIcon-special pa"></i></span> <span class="fl pr"
				onclick=""><em>爆款特卖</em><i
				class="channelIcon channelIcon-special pa"></i></span>
		</div>

		<div class="JS_content mt15">


			<!-- promotions 优惠促销 -->
			<div class="promotions">
				<!-- promotions-tab 异步tab -->
				<!--促销下面的小列表  -->
				<div class="promotions-tab ajaxTab clearfix JS_ajaxTab"
					id="promotions-tab">
					<a class="active" onclick="changeClass(this)">节后错峰</a> <a
						onclick="changeClass(this)">海南</a>
				</div>
				<!-- //promotions-tab -->

				<!-- promotions-content 异步请求content -->
				<!-- 促销里的景点信息 -->
				<div class="promotions-content JS_ajaxCon">
					<p class="proListTips"></p>
					<div class="channelPro">
						<ul class="proList proListFull clearfix" id="proList">
							<li><a onclick="" class="proList-img" title=""
								href="http://dujia.lvmama.com/group/1671178" target="_blank"><img
									width="285" height="190"
									src="image/5125a4c4-b299-4137-953f-470a953824a5_300_200.jpg">
									<!-- <span class="discount-tag"><em>6人报名立减2000元一单</em></span> --></a>
								<a class="proList-tit" onclick=""
								title="【冰天雪地内蒙古】满洲里、额尔古纳双飞6日跟团游([大兴安岭林、满洲里、额尔古纳、根河]2人起订，2-6人小团，纯白的雪，淳朴的牧民，零下30多度的冬天，带你见一个不一样的呼伦贝尔，赠送—1小时深度滑雪、哈达接机、温泉泡汤、泼水成冰，免费接送机，)"
								href="http://dujia.lvmama.com/group/1671178" target="_blank">

									<em class="proList-info-tag">跟团游<span class="pro-tag-line">|</span>
								</em> 【冰天雪地内蒙古】满洲里、额尔古纳双飞6日跟团游([大兴安岭林、...
							</a>
								<p class="proList-info">
									<span class="proList-info-price"><dfn>
											<i>&yen;</i>3290
										</dfn>起</span>
								</p></li>
						</ul>
					</div>
				</div>
				<!-- //promotions-content -->
			</div>
			<!-- //promotions -->
			<!--爆款特卖的隐藏  -->
			<div class="clearance" style="display: none">
				<div class="channelPro" id="channelProhide">
					<ul class="proList proListFull clearfix" id="proList2">
						<li><a
							onclick="onClickTag('国内游频道页-PC-上海-P1-02-11-【风漫黄山 偷闲徽州】黄山、画里宏村、篁岭晒秋4日当地游(12人精致小团，深度慢游不赶路，1晚宿宏村外精致民宿，宏村徽派老宅内品茶点，探徽州秘境，赏秋季梯田晒秋人家,赠送小米U型枕)','PC国内游频道页PART1');"
							class="proList-img"
							title="【风漫黄山 偷闲徽州】黄山、画里宏村、篁岭晒秋4日当地游(12人精致小团，深度慢游不赶路，1晚宿宏村外精致民宿，宏村徽派老宅内品茶点，探徽州秘境，赏秋季梯田晒秋人家,赠送小米U型枕)"
							href="http://dujia.lvmama.com/local/1670900" target="_blank"><img
								to="http://s1.lvjs.com.cn/pics//uploads/pc/place2/2018-09-28/5104f676-f9ce-4204-a867-bd36ee39032e_300_200.jpg"
								width="285" height="190" alt=""></a> <a
							onclick="onClickTag('国内游频道页-PC-上海-P1-02-11-【风漫黄山 偷闲徽州】黄山、画里宏村、篁岭晒秋4日当地游(12人精致小团，深度慢游不赶路，1晚宿宏村外精致民宿，宏村徽派老宅内品茶点，探徽州秘境，赏秋季梯田晒秋人家,赠送小米U型枕)','PC国内游频道页PART1');"
							class="proList-tit"
							title="【风漫黄山 偷闲徽州】黄山、画里宏村、篁岭晒秋4日当地游(12人精致小团，深度慢游不赶路，1晚宿宏村外精致民宿，宏村徽派老宅内品茶点，探徽州秘境，赏秋季梯田晒秋人家,赠送小米U型枕)"
							href="http://dujia.lvmama.com/local/1670900" target="_blank">

								<em class="proList-info-tag">当地游<span class="pro-tag-line">|</span>
							</em> 【风漫黄山 偷闲徽州】黄山、画里宏村、篁岭晒秋4日当地游(12人...
						</a>
							<p class="proList-info">
								<span class="proList-info-price"><dfn>
										<i>&yen;</i>1398
									</dfn>起</span>
							</p></li>
					</ul>
				</div>
				<!-- //channelPro -->
			</div>
		</div>
		<!-- //JS_content -->

	</div>
	<!-- 自由行&跟团游&底部广告&攻略&排行 -->
	<!-- 跟团游到自由行开始 -->
	<div class="w1200 bc mt20">
		<!-- 跟团游 -->
		<!-- 跟团游  -->
		<div class="channelGroup clearfix">
			<div class="modTit">
				<h3>跟团游</h3>
			</div>
			<!-- 侧边导航 -->
			<div class="channelSiderNav tc p30 mt10 yh fl pr">
				<div class="channelSiderNav-tit">
					<h4 class="f16 fn">热门目的地</h4>
				</div>
				<ul class="mt20 clearfix" id="mtclearfix">
					<li><a
						onclick="onClickTag('国内游频道页-PC-上海-P2-跟团游-目的地-11-三亚','PC国内游频道页PART2跟团游');"
						href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B8%89%E4%BA%9A&k=0#list"
						title="三亚" target="_blank">三亚</a></li>
				</ul>
				<div class="channelSiderNav-tit mt30">
					<h4 class="f16 fn">主题游玩</h4>
				</div>
				<ul class="mt20 clearfix" id="mtclearfix2">
					<li><a
						onclick="onClickTag('国内游频道页-PC-上海-P2-跟团游-主题游玩-11-三亚优惠','PC国内游频道页PART2跟团游');"
						href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B8%89%E4%BA%9A&k=0#list"
						title="三亚优惠" target="_blank">三亚优惠</a></li>
				</ul>
				<!--跟团游导航栏下面的图片  -->
				<img class="pa"
					src="http://s3.lvjs.com.cn/img/v6/channel/group_navbg.png"
					width="285" height="96" alt="跟团游">
			</div>
			<!-- //channelFree-nav -->

			<!-- 跟团游产品 -->
			<div class="channelGroup-pro channelPro fr mt10">
				<ul class="proList clearfix css3_liy-5 css3_run" id="proList3">
					<li><a
						onclick="onClickTag('国内游频道页-PC-上海-P2-跟团游-11-【雪国列车 特惠预售】开往雪国的梦幻列车6日5晚游([沈阳-松江河雪国列车往返住宿2晚加长白山度假区住宿3晚]冬季爆款 特惠预售  仅限一周，额外赠送：汉拿山雪地温泉、万达水乐园、长白山大剧院、雪地摩托体验等项目，尽享欢乐冰雪时光！)','PC国内游频道页PART2跟团游');"
						class="proList-img"
						title="【雪国列车 特惠预售】开往雪国的梦幻列车6日5晚游([沈阳-松江河雪国列车往返住宿2晚加长白山度假区住宿3晚]冬季爆款 特惠预售  仅限一周，额外赠送：汉拿山雪地温泉、万达水乐园、长白山大剧院、雪地摩托体验等项目，尽享欢乐冰雪时光！)"
						href="http://dujia.lvmama.com/group/1672465" target="_blank"><img
							width="285" height="190" alt=""
							src="image/6fe35230-1eb7-460a-b61d-0f611a4ea76a_300_200.jpg"></a>
						<p class="proList-info">
							<span class="proList-info-price fr"><dfn>
									<i>&yen;</i>2899
								</dfn>起</span> <a
								onclick="onClickTag('国内游频道页-PC-上海-P2-跟团游-11-【雪国列车 特惠预售】开往雪国的梦幻列车6日5晚游([沈阳-松江河雪国列车往返住宿2晚加长白山度假区住宿3晚]冬季爆款 特惠预售  仅限一周，额外赠送：汉拿山雪地温泉、万达水乐园、长白山大剧院、雪地摩托体验等项目，尽享欢乐冰雪时光！)','PC国内游频道页PART2跟团游');"
								class="proList-tit"
								title="【雪国列车 特惠预售】开往雪国的梦幻列车6日5晚游([沈阳-松江河雪国列车往返住宿2晚加长白山度假区住宿3晚]冬季爆款 特惠预售  仅限一周，额外赠送：汉拿山雪地温泉、万达水乐园、长白山大剧院、雪地摩托体验等项目，尽享欢乐冰雪时光！)"
								href="http://dujia.lvmama.com/group/1672465" target="_blank">【雪国列车
								特惠预售】开往雪国的梦幻列车6日5晚游([...</a>
						</p></li>
				</ul>
			</div>
			<!-- //channelGroup-pro -->
		</div>
		<!-- //channelGroup 跟团游结束-->
		<!-- // 跟团游 -->

		<!-- 自由行 -->
		<!-- 自由行 -->
		<div class="channelFree clearfix mt30">
			<div class="modTit">
				<h3>自由行</h3>
			</div>
			<!-- 侧边导航 -->
			<div class="channelFree-nav channelSiderNav tc p30 mt10 yh fl pr">
				<div class="channelSiderNav-tit mt30">
					<h4 class="f16 fn">热门目的地</h4>
				</div>
				<ul class="mt20 clearfix" id="ztclearfix">
					<li><a
						onclick="onClickTag('国内游频道页-PC-上海-P3-自由行-目的地-11-三亚','PC国内游频道页PART3自由行');"
						href="http://s.lvmama.com/freetour/H9K310000?keyword=%E4%B8%89%E4%BA%9A#list"
						title="三亚" target="_blank">三亚</a></li>
				</ul>
				<div class="channelSiderNav-tit mt30">
					<h4 class="f16 fn">主题游玩</h4>
				</div>
				<ul class="mt20 clearfix" id="ztclearfix2">
					<li><a
						onclick="onClickTag('国内游频道页-PC-上海-P3-自由行-主题-11-探秘滇藏','PC国内游频道页PART3自由行');"
						href="http://s.lvmama.com/freetour/H9K310000?keyword=%E6%9D%BE%E8%B5%9E&tabType=route#list"
						title="探秘滇藏" target="_blank">探秘滇藏</a></li>
				</ul>
				<img class="pa"
					src="http://s2.lvjs.com.cn/img/v6/channel/freeout_navbg.png"
					width="285" height="96" alt="自由行">
			</div>
			<!-- //channelFree-nav -->

			<!-- 自由行产品 -->
			<div class="channelFree-pro channelPro fr mt10">
				<ul class="proList clearfix css3_liy-5 css3_run" id="proList4">
					<li><a
						onclick="onClickTag('国内游频道页-PC-上海-P3-自由行-11-雪国列车第四季全国各地至沈阳双飞6日5晚([开往雪国的梦幻列车 特惠预售  仅限一周]沈阳-松江河雪国列车往返住宿2晚加长白山度假区住宿3晚，额外赠送：汉拿山雪地温泉、万达水乐园、长白山大剧院、雪地摩托体验等项目，尽享欢乐冰雪时光！)','PC国内游频道页PART3自由行');"
						class="proList-img"
						title="雪国列车第四季全国各地至沈阳双飞6日5晚([开往雪国的梦幻列车 特惠预售  仅限一周]沈阳-松江河雪国列车往返住宿2晚加长白山度假区住宿3晚，额外赠送：汉拿山雪地温泉、万达水乐园、长白山大剧院、雪地摩托体验等项目，尽享欢乐冰雪时光！)"
						href="http://dujia.lvmama.com/freetour/1672596" target="_blank"><img
							width="285" height="190" alt=""
							src="image/defc427c-3cc6-4320-bd71-667a2bac8d41_300_200.jpg"></a>
						<p class="proList-info">
							<span class="proList-info-price fr"><dfn>
									<i>&yen;</i>3859
								</dfn>起</span> <a
								onclick="onClickTag('国内游频道页-PC-上海-P3-自由行-11-雪国列车第四季全国各地至沈阳双飞6日5晚([开往雪国的梦幻列车 特惠预售  仅限一周]沈阳-松江河雪国列车往返住宿2晚加长白山度假区住宿3晚，额外赠送：汉拿山雪地温泉、万达水乐园、长白山大剧院、雪地摩托体验等项目，尽享欢乐冰雪时光！)','PC国内游频道页PART3自由行');"
								class="proList-tit"
								title="雪国列车第四季全国各地至沈阳双飞6日5晚([开往雪国的梦幻列车 特惠预售  仅限一周]沈阳-松江河雪国列车往返住宿2晚加长白山度假区住宿3晚，额外赠送：汉拿山雪地温泉、万达水乐园、长白山大剧院、雪地摩托体验等项目，尽享欢乐冰雪时光！)"
								href="http://dujia.lvmama.com/freetour/1672596" target="_blank">雪国列车第四季全国各地至沈阳双飞6日5晚([开往雪国的...</a>
						</p></li>
				</ul>
			</div>
			<!-- //channelFree-pro -->
		</div>
		<!-- //channelFree 自由行结束-->
		<!-- // 自由行 -->


	</div>
	<!-- //1200 bc -->
	<!-- // 自由行&跟团游&底部广告&攻略&排行 -->

	<!--大目的地-->
	<!-- 大目的地 bigDest -->
	<div class="bigDest mt30">
		<div class="bigDestBg">
			<div class="bigDest-wrap w1200 bc pt15">
				<div class="modTit">
					<h3>热门目的地</h3>
					<em class="modTit-tips pl10">错峰游</em>
				</div>

				<!-- 大目的地盒子 -->
				<div class="bigDest-box mt10 p10 clearfix">
					<!-- 大目的地tab -->
					<div class="bigDest-tab fl pr">
						<ul class="pa tc yh" id="patcyh">
						</ul>
					</div>
					<!-- //bigDest-tab -->

					<!-- 大目的地tab切换内容 -->
					<ul class="bigDest-content fr">
						<li><a
							onclick="onClickTag('国内游频道页-PC-上海-P4-热门目的地-1-11','PC国内游频道页PART4暖冬推荐');"
							href="http://s.lvmama.com/freetour/H9K310000?keyword=%E4%B8%89%E4%BA%9A&tabType=group#list"
							title="三亚" target="_blank"> <img
								src="image/3d59edcb-fafa-4709-acd4-fbe304d6d0e7.jpg" width="885"
								height="250" alt=""> <span class="bigDest-content-tips">
									<em>三亚</em>
									<p>海滨度假</p>
							</span>
						</a></li>
						<li><a
							onclick="onClickTag('国内游频道页-PC-上海-P4-热门目的地-1-11','PC国内游频道页PART4暖冬推荐');"
							href="http://s.lvmama.com/freetour/H9K310000?keyword=%E4%B8%89%E4%BA%9A&tabType=group#list"
							title="三亚" target="_blank"> <img
								src="image/3d59edcb-fafa-4709-acd4-fbe304d6d0e7.jpg" width="885"
								height="250" alt=""> <span class="bigDest-content-tips">
									<em>三亚2</em>
									<p>海滨度假</p>
							</span>
						</a></li>
						<li><a
							onclick="onClickTag('国内游频道页-PC-上海-P4-热门目的地-1-11','PC国内游频道页PART4暖冬推荐');"
							href="http://s.lvmama.com/freetour/H9K310000?keyword=%E4%B8%89%E4%BA%9A&tabType=group#list"
							title="三亚" target="_blank"> <img
								src="image/3d59edcb-fafa-4709-acd4-fbe304d6d0e7.jpg" width="885"
								height="250" alt=""> <span class="bigDest-content-tips">
									<em>三亚3</em>
									<p>海滨度假</p>
							</span>
						</a></li>
					</ul>
					<!-- //bigDest-content -->
				</div>
				<!-- //bigDest-box -->

				<!-- 主题活动 -->
				<div class="channelTheme">
					<div class="modTit">
						<!-- 月份请channelIcon-month? 后面跟的数字就是几月，开发在此配月份输出 -->
						<h3>主题活动</h3>
					</div>
					<div class="channelThem-wrap clearfix mt10">
						<div class="channelThem-main fl pr">
							<!-- 主题宣传页 -->
							<div class="channelThem-img pr f16 yh">
								<a
									onclick="onClickTag('国内游频道页-PC-上海-P5-主题活动-1-三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)','PC国内游频道页PART5主题活动');"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B8%89%E4%BA%9A&tabType=route350#list"
									title="三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)"
									target="_blank"><img
									src="image/2c229cc4-3395-436d-95c8-71d687f6e8aa.jpg"
									width="895" height="260"
									alt="三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)"></a>
								<a
									onclick="onClickTag('国内游频道页-PC-上海-P5-主题活动-1-三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)','PC国内游频道页PART5主题活动');"
									href="http://s.lvmama.com/group/H9K310000?keyword=%E4%B8%89%E4%BA%9A&tabType=route350#list"
									title="三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)"
									class="channelThem-tit pa " target="_blank"></a>
							</div>
							<!-- //channelThem-img -->
							<!-- 主题产品推荐 channelThem-pro -->
							<div class="channelThem-pro pa tc">
								<a class="channelThem-pro-img bc brd50 pr mt30"
									onclick="onClickTag('国内游频道页-PC-上海-P5-主题活动-1-三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)','PC国内游频道页PART5主题活动');"
									href="http://dujia.lvmama.com/group/636534"
									title="三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)"
									target="_blank"> <img class="brd50"
									src="image/36a6b404-5cbf-4f7a-9c7d-5dc764031c9d_300_200.jpg"
									width="149" height="149"
									alt="三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)">
									<em class="channelThem-pro-tips pa">特惠</em>
								</a> <a class="channelThem-proTit f14 yh pr bc"
									onclick="onClickTag('国内游频道页-PC-上海-P5-主题活动-1-三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)','PC国内游频道页PART5主题活动');"
									href="http://dujia.lvmama.com/group/636534"
									title="三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)"
									target="_blank">三亚蜈支洲、呀诺达、南山天涯双飞5日跟团游(4晚连住三亚湾红树林度假世界，0购物、嗨翻蜈支洲岛一天，餐标升级、享海南四大名菜，精挑亲子游)</a>
								<p class="proList-info-price pr">
									<dfn>
										<i>&yen;</i>2300
									</dfn>
									起
								</p>
								<span class="alphaBack pa w"></span>
							</div>
							<!-- //channelThem-pro -->
						</div>
						<!-- //channelThem-main -->

						<!-- 下月说预告 -->
						<div class="channelThem-next pr fr">
							<img
								onclick="onClickTag('国内游频道页-PC-上海-P5-主题活动-2-秋高气爽','PC国内游频道页PART5主题活动');"
								class="pa" src="image/6b59c3bd-fd9a-49bf-879a-73ad0aa4232b.jpg"
								width="285" height="260" alt="秋高气爽"> <a
								onclick="onClickTag('国内游频道页-PC-上海-P5-主题活动-2-秋高气爽','PC国内游频道页PART5主题活动');"
								class="channelThem-next-info pr tc yh"
								href="http://s.lvmama.com/group/H9K310000?keyword=%E6%96%B0%E5%93%81%E6%8E%A8%E8%8D%90&k=0#list"
								target="_blank" title="秋高气爽"> <strong class="f22 fn">下月预告</strong>
								<p class="f18">秋高气爽</p>
								<p class="f16">欢乐邂逅</p>
							</a> <span class="alphaBack w pa"></span>
						</div>
						<!-- //channelThem-next -->


					</div>
					<!-- //channelThem-box -->
				</div>
				<!-- //channelTheme 主题活动End -->
			</div>
			<!-- //bigDest-wrap -->

		</div>
		<!-- //bigDestBg 背景 -->
	</div>
	<!-- //bigDest 大目的地 End -->
	<div class="w1200 bc mt30">
		<!-- 底部广告 -->
		<!-- 底部广告AD -->
		<div class="channelAd mt35">
			<ul class="css3_liy-5 css3_run clearfix">
							<li><a onclick="onClickTag('国内游频道页-PC-上海-P5-专题-1-成都','PC国内游频道页PART5主题活动');" title="成都" href="http://s.lvmama.com/group/H9K310000?keyword=%E6%88%90%E9%83%BD&amp;k=0#list" target="_blank"><img width="285" height="114" alt="" to="http://s2.lvjs.com.cn/uploads/pc/place2/2017-11-10/b1318361-ffe0-4a1b-a1c9-1191e1e7e51c.jpg"></a></li>
				<li><a onclick="onClickTag('国内游频道页-PC-上海-P5-专题-2-厦门','PC国内游频道页PART5主题活动');" title="厦门" href="http://s.lvmama.com/freetour/H9K310000?keyword=%E5%8E%A6%E9%97%A8&amp;k=1#list" target="_blank"><img width="285" height="114" alt="" to="http://s3.lvjs.com.cn/uploads/pc/place2/2016-03-01/399e4dc3-2d1c-43f9-bf08-a58a1f8d238b.jpg"></a></li>
				<li><a onclick="onClickTag('国内游频道页-PC-上海-P5-专题-3-云南','PC国内游频道页PART5主题活动');" title="云南" href="http://s.lvmama.com/group/H9K310000?keyword=%E4%BA%91%E5%8D%97&amp;k=0#list" target="_blank"><img width="285" height="114" alt="" to="http://s1.lvjs.com.cn/uploads/pc/place2/2015-09-14/9f3173da-b6a2-411c-8c4c-182751e5bde2.jpg"></a></li>
				<li><a onclick="onClickTag('国内游频道页-PC-上海-P5-专题-4-青岛','PC国内游频道页PART5主题活动');" title="青岛" href="http://s.lvmama.com/group/H9K310000?keyword=%E9%9D%92%E5%B2%9B&amp;k=0#list" target="_blank"><img width="285" height="114" alt="" to="http://s2.lvjs.com.cn/uploads/pc/place2/2016-03-01/da3c0d37-07cd-495a-a44f-c30732032c5a.jpg"></a></li>
			</ul>
		</div>
		<!-- //channelAd End AD -->
		<!-- // 底部广告 -->

		<!-- 攻略&排行 -->
		<!-- 攻略和排行 -->
		<div class="channelGuide mt35 clearfix">
			<!-- 攻略开始 -->
			<div class="guideMain fl">
				<div class="modTit">
					<h3>游记攻略</h3>
				</div>
				<!-- 攻略产品 -->
				<div class="guideList pt5">
					<ul>
						<li><a
							onclick="onClickTag('国内游频道页-PC-上海-P6-游记攻略-11-【Dickies骑行侠】千古流韵月亮城','PC国内游频道页PART6游记攻略');"
							class="guidePic pr fl"
							href="http://www.lvmama.com/trip/show/95530"
							title="【Dickies骑行侠】千古流韵月亮城" target="_blank"> <img width="150"
								height="100" alt=""
								src="image/9f716b71-af54-4b7b-985f-5ebe99842869_300_200.jpg">
								<span class="triangle pa"></span>
						</a>
							<div class="guideInfo fr">
								<h4>
									<a
										onclick="onClickTag('国内游频道页-PC-上海-P6-游记攻略-11-【Dickies骑行侠】千古流韵月亮城','PC国内游频道页PART6游记攻略');"
										href="http://www.lvmama.com/trip/show/95530"
										title="【Dickies骑行侠】千古流韵月亮城" target="_blank">【Dickies骑行侠】千古流韵月亮城</a>
								</h4>
								<p class="guideInfo-user">
									<span class="channelIcon channelIcon-user"></span>樱殇之恋
								</p>
								<p class="guideInfo-upInfo">
									2016-08-24发布<span>|</span>1天<span>|</span>19张照片
								</p>
								<p class="guideInfo-route">
									<em>行程：</em> <a onclick=""
										href="http://www.lvmama.com/trip/show/95530" target="_blank">瘦西湖</a>
									<span>&gt;</span> <a onclick=""
										href="http://www.lvmama.com/trip/show/95530" target="_blank">东关街历史街区</a>
									<span>&gt;</span> <a onclick=""
										href="http://www.lvmama.com/trip/show/95530" target="_blank">个园</a>
									<span>&gt;</span> <a onclick=""
										href="http://www.lvmama.com/trip/show/95530" target="_blank">扬州古运河</a>
									<span>&gt;</span> <a onclick=""
										href="http://www.lvmama.com/trip/show/95530" target="_blank">何园</a>
									<span>&gt;</span> <a onclick=""
										href="http://www.lvmama.com/trip/show/95530" target="_blank">大明寺</a>
								</p>
							</div> <!-- //guideInfo --></li>
					</ul>
				</div>
				<!-- //guideList -->
			</div>
			<!-- //guideMain -->


			<!-- 排行 -->
			<div class="channelRanking fr">
				<div class="modTit">
					<h3>口碑排行榜</h3>
				</div>
				<ul class="tr">
					<!-- 排行样式根据class（rankingNo1）改变 -->
					<li><span class="rankingNo channelIcon rankingNo1"></span> <a
						onclick="onClickTag('国内游频道页-PC-上海-P6-游记攻略-推荐-1-【休闲泡汤】福州双飞3日2晚自由行(住福州旗山森林温泉度假村1晚、宿青云山御温泉酒店1晚、双人温泉票、双人丛林飞越体验、3天2晚自助午餐、晚餐、永泰云顶双人套票、每日双人早餐)','PC国内游频道页PART6游记攻略');"
						href="http://dujia.lvmama.com/freetour/1603438"
						title="【休闲泡汤】福州双飞3日2晚自由行(住福州旗山森林温泉度假村1晚、宿青云山御温泉酒店1晚、双人温泉票、双人丛林飞越体验、3天2晚自助午餐、晚餐、永泰云顶双人套票、每日双人早餐)"
						target="_blank">【休闲泡汤】福州双飞3日2晚自由行(住福州旗山森林温泉度假村1晚、宿青云山御温泉酒店1晚、双人温泉票、双人丛林飞越体验、3天2晚自助午餐、晚餐、永泰云顶双人套票、每日双人早餐)</a>
						<span class="proList-info-price"><dfn>
								<i>&yen;</i>1023
							</dfn>起</span></li>
				</ul>
			</div>
			<!-- //channelRanking 排行 -->
		</div>
		<!-- //channelGuide 攻略和排行结束 -->
		<!-- // 攻略&排行 -->
	</div>

	<!-- // 页面底部-->
	<div class="hh_cooperate">
		<!-- 友情链接 -->
		<p>
			<b>友情链接：</b> <span> <a target="_blank"
				href="http://scenic.fengjing.com/">国内旅游</a> <a target="_blank"
				href="http://www.ly.com/dujia/">自由行</a> <a target="_blank"
				href="http://www.9tour.cn/scene/">旅游目的地</a> <a target="_blank"
				href="http://www.examw.com/dy/">导游考试</a> <a target="_blank"
				href="http://www.21pw.com/">品味旅游网</a> <a target="_blank"
				href="http://lvyou.mangocity.com">芒果旅游网</a> <a target="_blank"
				href="http://www.028668.com">成都旅行社</a> <a target="_blank"
				href="http://ticket.lvmama.com/scenic-175649">上海迪士尼乐园</a> <a
				target="_blank"
				href="http://www.lvmama.com/lvyou/guide/2015-1208-199837.html"
				rel="nofollow">查看更多</a>
			</span>
		</p>
		<!-- // 友情链接 -->
	</div>


	<!-- 公用js-->

	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	<script src="js/lvSide.js" type="text/javascript"></script>
	<script src="js/destroute.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/channel.js"></script>
	<div class="complete_box" id="complete_box"
		style="background-color: rgb(204, 232, 207); width: 631px; left: 520.5px; top: 279px; display: none;">
		<ul class="complete_list"
			style="background-color: rgb(204, 232, 207);">
			<li class="js_match"><a href="#" data-place="深圳" title="深圳"><span>深圳222</span></a></li>
		</ul>
	</div>
</body>
</html>