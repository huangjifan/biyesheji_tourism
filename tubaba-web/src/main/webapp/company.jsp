<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>定制游</title>
<link rel="stylesheet" href="css/poplogin.css">
<link rel="stylesheet" href="css/style.3.2.0.css">
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />

</head>		
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

<jsp:include  page="head.jsp" flush="true"/>
<body class="custom_personal custom" >
	<!-- 导航标签渲染 -->
	
	<!-- <script type="text/javascript"
		src="http://www.lvmama.com/js/2017/jQuerySuperScript.js"></script> -->
	<!-- 引用导航 结束 -->
	<div id="box">
	<input type="hidden" id="username" value="${user}">
	<div class="comany-main clearfix" >
		<div class="custon-form-box fl">
			<ul class="form-tab js-from-tab clearfix" data-type="">
				<li class="active" data-type="person">个人定制</li>
<!-- 				 <li data-type="company"><a>企业定制</a></li>  -->
			</ul>
			<!-- 个人定制 -->
			<div class="form-content form-per-box" style="display: block">
				
				<ul class="form-content-list">
					<li>
						<div class="lv_s_city_all JS_start_address on" id="search_all_fromPlaces">
							<div class="lv_s_city_btn js_s_city_btn  on"  onclick="showCity()">
								<i class="lv_s_mark"></i> <b data-id="9" 
									class="around-data-search-from-place"></b> <input
									id="cityname" name="starting" value="上海" data-name="" >
								<i class="inquiry-common-icon down-icon"></i> <span>出发城市</span>
                            </div>
							<div class="lv_s_city js_all_city on" id="city"
								style="width: 460px; display: none;">
								<div class="search-station-hot" onblur='hideSearchBoxChangeCity()'>
									<h4>热门出发城市</h4>
									<div class="list clearfix">
										<a onclick="searchBoxChangeCity(35,'北京')">北京</a> 
										<a onclick="searchBoxChangeCity(37,'上海')">上海</a> 
										<a onclick="searchBoxChangeCity(11,'广州')">广州</a> 
										<a onclick="searchBoxChangeCity(124,'苏州')">苏州</a>
										<a onclick="searchBoxChangeCity(39,'佛山')">佛山</a>										
									</div> 
								</div>
								<div class="search-station-cities">
								<ul id="changecity" class="nav-tabs clearfix">
										<li onclick="findcity($('#changecity'),0)">ABCD<i></i></li>
										<li onclick="findcity($('#changecity'),1)">EFGH<i></i></li>
										<li onclick="findcity($('#changecity'),2)">JKLM<i></i></li>
										<li onclick="findcity($('#changecity'),3)">NOPQRS<i></i></li>
										<li onclick="findcity($('#changecity'),4)">TUVWX<i></i></li>
										<li onclick="findcity($('#changecity'),5)">YZ<i></i></li>
									</ul>
									<ul class="tab-contents">
										<li class="search-station-cities-pane"><dl
												class="clearfix">
												<dt>A</dt>
												<dd class="clearfix">
													<a class="city" data-id="380" data-name="安徽"
													onclick="searchBoxChangeCity(41,'安徽')"
														data-code="ALT">安徽</a><a class="city" data-id="338"
														onclick="searchBoxChangeCity(41,'安康')"
														data-name="安康" data-code="AK">安康</a><a class="city"
														data-id="41" onclick="searchBoxChangeCity(41,'中国澳门')" data-name="中国澳门"  data-code="AM">中国澳门</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>B</dt>
												<dd class="clearfix">
													<a class="city" onclick="searchBoxChangeCity(82,'蚌埠')" data-id="82" data-name="蚌埠" data-code="BB">蚌埠</a><a
														class="city" onclick="searchBoxChangeCity(94,'保定')" data-id="94" data-name="保定" data-code="BD">保定</a><a
														class="city" onclick="searchBoxChangeCity(332,'宝鸡')" data-id="332" data-name="宝鸡" data-code="BJ">宝鸡</a><a
														class="city" onclick="searchBoxChangeCity(112,'包头')" data-id="112" data-name="包头" data-code="BT">包头</a><a
														class="city"  onclick="searchBoxChangeCity(211,'北海')" data-id="211" data-name="北海" data-code="BH">北海</a><a
														class="city" onclick="searchBoxChangeCity(13,'北京')" data-id="13" data-name="北京" data-code="BJ">北京</a><a
														class="city" onclick="searchBoxChangeCity(189,'滨州')" data-id="189" data-name="滨州" data-code="BZ">滨州</a><a
														class="city" onclick="searchBoxChangeCity(3171,'博乐市')" data-id="3171" data-name="博乐市"
														data-code="BLS">博乐市</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>C</dt>
												<dd class="clearfix">
													<a class="city" onclick="searchBoxChangeCity(97,'沧州')" data-id="97" data-name="沧州" data-code="CZ">沧州</a><a
														class="city" onclick="searchBoxChangeCity(137,'长春')" data-id="137" data-name="长春" data-code="CC">长春</a><a
														class="city" onclick="searchBoxChangeCity(314,'常德')" data-id="314" data-name="常德" data-code="CD">常德</a><a
														class="city" onclick="searchBoxChangeCity(308,'长沙')" data-id="308" data-name="长沙" data-code="CS">长沙</a><a
														class="city" onclick="searchBoxChangeCity(59,'常州')" data-id="59" data-name="常州" data-code="CZ">常州</a><a
														class="city" onclick="searchBoxChangeCity(258,'成都')" data-id="258" data-name="成都" data-code="CD">成都</a><a
														class="city" onclick="searchBoxChangeCity(31,'重庆')" data-id="31" data-name="重庆" data-code="CQ">重庆</a><a
														class="city" onclick="searchBoxChangeCity(146,'滁州')" data-id="146" data-name="滁州" data-code="CZ">滁州</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>D</dt>
												<dd class="clearfix">
													<a class="city" onclick="searchBoxChangeCity(146,'大理')" data-id="245" data-name="大理" data-code="DL">大理</a><a
														class="city" onclick="searchBoxChangeCity(146,'大连')" data-id="124" data-name="大连" data-code="DL">大连</a><a
														class="city" onclick="searchBoxChangeCity(146,'大同')" data-id="101" data-name="大同" data-code="DT">大同</a><a
														class="city" onclick="searchBoxChangeCity(146,'达州')" data-id="272" data-name="达州" data-code="DZ">达州</a><a
														class="city" onclick="searchBoxChangeCity(146,'德州')" data-id="187" data-name="德州" data-code="DZ">德州</a><a
														class="city" onclick="searchBoxChangeCity(146,'东莞')" data-id="202" data-name="东莞" data-code="DG">东莞</a><a
														class="city" onclick="searchBoxChangeCity(146,'东营')" data-id="178" data-name="东营" data-code="DY">东营</a>
												</dd>
											</dl></li>
										<li class="search-station-cities-pane"><dl
												class="clearfix">
												<dt>F</dt>
												<dd class="clearfix">
													<a class="city" onclick="searchBoxChangeCity(146,'佛山')" data-id="327" data-name="佛山" data-code="FS">佛山</a><a
														class="city" onclick="searchBoxChangeCity(146,'阜阳')" data-id="147" data-name="阜阳" data-code="FY">阜阳</a><a
														class="city" onclick="searchBoxChangeCity(146,'抚州')" data-id="172" data-name="抚州" data-code="FZ">抚州</a><a
														class="city" onclick="searchBoxChangeCity(146,'福州')" data-id="154" data-name="福州" data-code="FZ">福州</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>G</dt>
												<dd class="clearfix">
													<a class="city" onclick="searchBoxChangeCity(146,'赣州')" data-id="169" data-name="赣州" data-code="GZ">赣州</a><a
														class="city" onclick="searchBoxChangeCity(146,'广元')" data-id="264" data-name="广元" data-code="GY">广元</a><a
														class="city"  onclick="searchBoxChangeCity(146,'广州')" data-id="322" data-name="广州" data-code="GZ">广州</a><a
														class="city" onclick="searchBoxChangeCity(146,'桂林')" data-id="209" data-name="桂林" data-code="GL">桂林</a><a
														class="city" onclick="searchBoxChangeCity(146,'贵阳')" data-id="224" data-name="贵阳" data-code="GY">贵阳</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>H</dt>
												<dd class="clearfix">
													<a class="city" data-id="43" data-name="哈尔滨"
													 onclick="searchBoxChangeCity(146,'哈尔滨')"
														data-code="HEB">哈尔滨</a><a class="city" data-id="221"
														onclick="searchBoxChangeCity(146,'海口')"
														data-name="海口" data-code="HK">海口</a><a class="city"
														 onclick="searchBoxChangeCity(146,'邯郸')"
														data-id="92" data-name="邯郸" data-code="HD">邯郸</a><a
														 onclick="searchBoxChangeCity(146,'杭州')"
														class="city" data-id="69" data-name="杭州" data-code="HZ">杭州</a><a
														 onclick="searchBoxChangeCity(146,'汉中')"
														class="city" data-id="336" data-name="汉中" data-code="HZ">汉中</a><a
														 onclick="searchBoxChangeCity(146,'合肥')"
														class="city" data-id="80" data-name="合肥" data-code="HF">合肥</a><a
														 onclick="searchBoxChangeCity(146,'鹤岗')"
														class="city" data-id="46" data-name="鹤岗" data-code="HG">鹤岗</a><a
														 onclick="searchBoxChangeCity(146,'衡水')"
														class="city" data-id="99" data-name="衡水" data-code="HS">衡水</a><a
														 onclick="searchBoxChangeCity(146,'衡阳')"
														class="city" data-id="311" data-name="衡阳" data-code="HY">衡阳</a><a
														 onclick="searchBoxChangeCity(146,'菏泽')"
														class="city" data-id="190" data-name="菏泽" data-code="HZ">菏泽</a><a
														 onclick="searchBoxChangeCity(146,'淮安')"
														class="city" data-id="63" data-name="淮安" data-code="HA">淮安</a><a
														 onclick="searchBoxChangeCity(146,'淮北')"
														class="city" data-id="85" data-name="淮北" data-code="HB">淮北</a><a
														 onclick="searchBoxChangeCity(146,'黄山市')"
														class="city" data-id="88" data-name="黄山市" data-code="HSS">黄山市</a><a
														 onclick="searchBoxChangeCity(146,'呼和浩特')"
														class="city" data-id="111" data-name="呼和浩特"
														data-code="HHHT">呼和浩特</a><a class="city" data-id="196"
														 onclick="searchBoxChangeCity(146,'惠州')"
														data-name="惠州" data-code="HZ">惠州</a><a class="city"
														 onclick="searchBoxChangeCity(146,'呼伦贝尔')"
														data-id="117" data-name="呼伦贝尔" data-code="HLBE">呼伦贝尔</a><a
														 onclick="searchBoxChangeCity(146,'湖州')"
														class="city" data-id="73" data-name="湖州" data-code="HZ">湖州</a>
												</dd>
											</dl></li>
										<li class="search-station-cities-pane"><dl
												class="clearfix">
												<dt>J</dt>
												<dd class="clearfix">
													<a class="city"	 onclick="searchBoxChangeCity(146,'吉安')"
													 data-id="170" data-name="吉安" data-code="JA">吉安</a><a
													  onclick="searchBoxChangeCity(146,'焦作')"
														class="city" data-id="280" data-name="焦作" data-code="JZ">焦作</a><a
														 onclick="searchBoxChangeCity(146,'嘉兴')"
														class="city" data-id="72" data-name="嘉兴" data-code="JX">嘉兴</a><a
														 onclick="searchBoxChangeCity(146,'嘉峪关')"
														class="city" data-id="341" data-name="嘉峪关" data-code="JYG">嘉峪关</a><a
														 onclick="searchBoxChangeCity(146,'吉林')"
														class="city" data-id="19" data-name="吉林" data-code="JL">吉林</a><a
														 onclick="searchBoxChangeCity(146,'济南')"
														class="city" data-id="174" data-name="济南" data-code="JN">济南</a><a
														 onclick="searchBoxChangeCity(146,'景德镇')"
														class="city" data-id="164" data-name="景德镇" data-code="JDZ">景德镇</a><a
														 onclick="searchBoxChangeCity(146,'金华')"
														class="city" data-id="75" data-name="金华" data-code="JH">金华</a><a
														 onclick="searchBoxChangeCity(146,'九江')"
														class="city" data-id="166" data-name="九江" data-code="JJ">九江</a><a
														 onclick="searchBoxChangeCity(146,'鸡西')"
														class="city" data-id="45" data-name="鸡西" data-code="JX">鸡西</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>K</dt>
												<dd class="clearfix">
													<a  onclick="searchBoxChangeCity(146,'昆明')"
													class="city" data-id="233" data-name="昆明" data-code="KM">昆明</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>L</dt>
												<dd class="clearfix">
													<a class="city" onclick="searchBoxChangeCity(146,'兰州')" data-id="340" data-name="兰州" data-code="LZ">兰州</a><a
													onclick="searchBoxChangeCity(146,'拉萨')" class="city" data-id="249" data-name="拉萨" data-code="LS">拉萨</a><a
													onclick="searchBoxChangeCity(146,'连云港')" class="city" data-id="62" data-name="连云港" data-code="LYG">连云港</a><a
													onclick="searchBoxChangeCity(146,'聊城')" class="city" data-id="188" data-name="聊城" data-code="LC">聊城</a><a
													onclick="searchBoxChangeCity(146,'丽江')" class="city" data-id="238" data-name="丽江" data-code="LJ">丽江</a><a
													onclick="searchBoxChangeCity(146,'临沂')" class="city" data-id="186" data-name="临沂" data-code="LY">临沂</a><a
													onclick="searchBoxChangeCity(146,'丽水')" class="city" data-id="79" data-name="丽水" data-code="LS">丽水</a><a
													onclick="searchBoxChangeCity(146,'六安')" class="city" data-id="150" data-name="六安" data-code="LA">六安</a><a
													onclick="searchBoxChangeCity(146,'娄底')" class="city" data-id="320" data-name="娄底" data-code="LD">娄底</a><a
													onclick="searchBoxChangeCity(146,'洛阳')" class="city" data-id="193" data-name="洛阳" data-code="LY">洛阳</a><a
													onclick="searchBoxChangeCity(146,'泸州')" class="city" data-id="261" data-name="泸州" data-code="LZ">泸州</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>M</dt>
												<dd class="clearfix">
													<a class="city" onclick="searchBoxChangeCity(146,'绵阳')" data-id="263" data-name="绵阳" data-code="MY">绵阳</a><a
														class="city" onclick="searchBoxChangeCity(146,'牡丹江')"  data-id="52" data-name="牡丹江" data-code="MDJ">牡丹江</a>
												</dd>
											</dl></li>
										<li class="search-station-cities-pane"><dl
												class="clearfix">
												<dt>N</dt>
												<dd class="clearfix">
													<a  onclick="searchBoxChangeCity(146,'南昌')" class="city" data-id="163" data-name="南昌" data-code="NC">南昌</a><a
														 onclick="searchBoxChangeCity(146,'南京')"class="city" data-id="56" data-name="南京" data-code="NJ">南京</a><a
														 onclick="searchBoxChangeCity(146,'南宁')"class="city" data-id="207" data-name="南宁" data-code="NN">南宁</a><a
														 onclick="searchBoxChangeCity(146,'南通')"class="city" data-id="61" data-name="南通" data-code="NT">南通</a><a
														 onclick="searchBoxChangeCity(146,'南阳')"class="city" data-id="285" data-name="南阳" data-code="NY">南阳</a><a
														 onclick="searchBoxChangeCity(146,'宁波')"class="city" data-id="70" data-name="宁波" data-code="NB">宁波</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>Q</dt>
												<dd class="clearfix">
													<a  onclick="searchBoxChangeCity(146,'青岛')" class="city" data-id="175" data-name="青岛" data-code="QD">青岛</a><a
														 onclick="searchBoxChangeCity(146,'清远')"class="city" data-id="201" data-name="清远" data-code="QY">清远</a><a
														 onclick="searchBoxChangeCity(146,'秦皇岛')"class="city" data-id="91" data-name="秦皇岛" data-code="QHD">秦皇岛</a><a
														 onclick="searchBoxChangeCity(146,'齐齐哈尔')"class="city" data-id="44" data-name="齐齐哈尔"
														data-code="QQHE">齐齐哈尔</a><a class="city" data-id="158"
														 onclick="searchBoxChangeCity(146,'泉州')"
														data-name="泉州" data-code="QZ">泉州</a><a class="city"
														 onclick="searchBoxChangeCity(146,'衢州')"
														data-id="76" data-name="衢州" data-code="QZ">衢州</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>R</dt>
												<dd class="clearfix">
													<a class="city"  onclick="searchBoxChangeCity(146,'日照')"
													 data-id="184" data-name="日照" data-code="RZ">日照</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>S</dt>
												<dd class="clearfix">
													<a onclick="searchBoxChangeCity(146,'三明')" class="city" data-id="157" data-name="三明" data-code="SM">三明</a><a
													onclick="searchBoxChangeCity(146,'三亚')"class="city" data-id="257" data-name="三亚" data-code="SY">三亚</a><a
														onclick="searchBoxChangeCity(146,'上海')"class="city" data-id="9" data-name="上海" data-code="SH">上海</a><a
														onclick="searchBoxChangeCity(146,'上饶')"class="city" data-id="173" data-name="上饶" data-code="SR">上饶</a><a
														onclick="searchBoxChangeCity(146,'汕头')"class="city" data-id="326" data-name="汕头" data-code="ST">汕头</a><a
														onclick="searchBoxChangeCity(146,'绍兴')"class="city" data-id="74" data-name="绍兴" data-code="SX">绍兴</a><a
														onclick="searchBoxChangeCity(146,'沈阳')"class="city" data-id="123" data-name="沈阳" data-code="SY">沈阳</a><a
														onclick="searchBoxChangeCity(146,'深圳')"class="city" data-id="324" data-name="深圳" data-code="SZ">深圳</a><a
														onclick="searchBoxChangeCity(146,'石家庄')"class="city" data-id="89" data-name="石家庄" data-code="SJZ">石家庄</a><a
														onclick="searchBoxChangeCity(146,'双鸭山')"class="city" data-id="47" data-name="双鸭山" data-code="SYS">双鸭山</a><a
														onclick="searchBoxChangeCity(146,'宿迁')"class="city" data-id="68" data-name="宿迁" data-code="SQ">宿迁</a><a
														onclick="searchBoxChangeCity(146,'苏州')"class="city" data-id="60" data-name="苏州" data-code="SZ">苏州</a>
												</dd>
											</dl></li>
										<li class="search-station-cities-pane"><dl
												class="clearfix">
												<dt>T</dt>
												<dd class="clearfix">
													<a onclick="searchBoxChangeCity(146,'泰安')" class="city" data-id="182" data-name="泰安" data-code="TA">泰安</a><a
														onclick="searchBoxChangeCity(146,'太原')"class="city" data-id="100" data-name="太原" data-code="TY">太原</a><a
														onclick="searchBoxChangeCity(146,'泰州')"class="city" data-id="67" data-name="泰州" data-code="TZ">泰州</a><a
														onclick="searchBoxChangeCity(146,'台州')"class="city" data-id="78" data-name="台州" data-code="TZ">台州</a><a
														onclick="searchBoxChangeCity(146,'唐山')"class="city" data-id="90" data-name="唐山" data-code="TS">唐山</a><a
														onclick="searchBoxChangeCity(146,'天津')"class="city" data-id="14" data-name="天津" data-code="TJ">天津</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>W</dt>
												<dd class="clearfix">
													<a onclick="searchBoxChangeCity(146,'潍坊')" class="city" data-id="180" data-name="潍坊" data-code="WF">潍坊</a><a
														onclick="searchBoxChangeCity(146,'温州')"class="city" data-id="71" data-name="温州" data-code="WZ">温州</a><a
														onclick="searchBoxChangeCity(146,'武汉')"class="city" data-id="291" data-name="武汉" data-code="WH">武汉</a><a
														onclick="searchBoxChangeCity(146,'芜湖')"class="city" data-id="81" data-name="芜湖" data-code="WH">芜湖</a><a
														onclick="searchBoxChangeCity(146,'乌鲁木齐')"class="city" data-id="367" data-name="乌鲁木齐"
														data-code="WLMQ">天津</a><a class="city" data-id="57"
														onclick="searchBoxChangeCity(146,'无锡')"
														data-name="无锡" data-code="WX">无锡</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>X</dt>
												<dd class="clearfix">
													<a onclick="searchBoxChangeCity(146,'厦门')" class="city" data-id="155" data-name="厦门" data-code="XM">厦门</a><a
														onclick="searchBoxChangeCity(146,'西安')"class="city" data-id="256" data-name="西安" data-code="XA">西安</a><a
														onclick="searchBoxChangeCity(146,'中国香港')"class="city" data-id="40" data-name="中国香港" data-code="XG">中国香港</a><a
														onclick="searchBoxChangeCity(146,'湘潭')"class="city" data-id="310" data-name="湘潭" data-code="XT">湘潭</a><a
														onclick="searchBoxChangeCity(146,'咸阳')"class="city" data-id="333" data-name="咸阳" data-code="XY">咸阳</a><a
														onclick="searchBoxChangeCity(146,'邢台')"class="city" data-id="93" data-name="邢台" data-code="XT">邢台</a><a
														onclick="searchBoxChangeCity(146,'西宁')"class="city" data-id="354" data-name="西宁" data-code="XN">西宁</a><a
														onclick="searchBoxChangeCity(146,'西双版纳')"class="city" data-id="244" data-name="西双版纳"
														data-code="XSBN">西双版纳</a>
												</dd>
											</dl></li>
										<li class="search-station-cities-pane"><dl
												class="clearfix">
												<dt>Y</dt>
												<dd class="clearfix">
													<a class="city" onclick="searchBoxChangeCity(146,'延安')" data-id="335" data-name="延安" data-code="YA">延安</a><a
														onclick="searchBoxChangeCity(146,'延边')"class="city" data-id="145" data-name="延边" data-code="YB">延边</a><a
														onclick="searchBoxChangeCity(146,'盐城')"class="city" data-id="64" data-name="盐城" data-code="YC">盐城</a><a
														onclick="searchBoxChangeCity(146,'扬州')"class="city" data-id="65" data-name="扬州" data-code="YZ">扬州</a><a
														onclick="searchBoxChangeCity(146,'烟台')"class="city" data-id="179" data-name="烟台" data-code="YT">烟台</a><a
														onclick="searchBoxChangeCity(146,'宜宾')"class="city" data-id="270" data-name="宜宾" data-code="YB">宜宾</a><a
														onclick="searchBoxChangeCity(146,'宜昌')"class="city" data-id="294" data-name="宜昌" data-code="YC">宜昌</a><a
														onclick="searchBoxChangeCity(146,'宜春')"class="city" data-id="171" data-name="宜春" data-code="YC">宜春</a><a
														onclick="searchBoxChangeCity(146,'银川')"class="city" data-id="362" data-name="银川" data-code="YC">银川</a><a
														onclick="searchBoxChangeCity(146,'营口')"class="city" data-id="130" data-name="营口" data-code="YK">营口</a><a
														onclick="searchBoxChangeCity(146,'鹰潭')"class="city" data-id="168" data-name="鹰潭" data-code="YT">鹰潭</a><a
														onclick="searchBoxChangeCity(146,'岳阳')"class="city" data-id="313" data-name="岳阳" data-code="YY">岳阳</a><a
														onclick="searchBoxChangeCity(146,'榆林')"class="city" data-id="337" data-name="榆林" data-code="YL">榆林</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>Z</dt>
												<dd class="clearfix">
													<a onclick="searchBoxChangeCity(146,'张家界')" class="city" data-id="315" data-name="张家界"
														data-code="ZJJ">张家界</a><a class="city" data-id="159"
														onclick="searchBoxChangeCity(146,'漳州')"
														data-name="漳州" data-code="ZZ">漳州</a><a class="city"
														onclick="searchBoxChangeCity(146,'郑州')"
														data-id="191" data-name="郑州" data-code="ZZ">郑州</a><a
														onclick="searchBoxChangeCity(146,'中山')"
														class="city" data-id="203" data-name="中山" data-code="ZS">中山</a><a
														onclick="searchBoxChangeCity(146,'舟山')"
														class="city" data-id="77" data-name="舟山" data-code="ZS">舟山</a><a
														onclick="searchBoxChangeCity(146,'珠海')"
														class="city" data-id="325" data-name="珠海" data-code="ZH">珠海</a><a
														onclick="searchBoxChangeCity(146,'株洲')"
														class="city" data-id="309" data-name="株洲" data-code="ZZ">株洲</a><a
														onclick="searchBoxChangeCity(146,'淄博')"
														class="city" data-id="176" data-name="淄博" data-code="ZB">淄博</a>
												</dd>
											</dl></li>
									</ul>
								</div>
							</div>
						</div>
						<p class="error-message">
							<em class="error-left-icon"></em><span class="error-message-con"><i
								class="nova-icon-xs nova-icon-warning"></i>请选择出发城市</span>
						</p>
					</li>
					<li class="js_s_city_btn on"><i
						class="inquiry-common-icon down-icon"></i> <span class="arr-city">到达城市</span>
						<div class="chosen-container chosen-container-multi"
							style="width: 100%;" title="" id="multiple_chosen">
							<ul class="chosen-choices">
								<li class="search-field">
					<input type="text" id="textdb" style="width: 250px;" onclick="toCity()"></li>
					<select id="multiple" 
						class="form-control form-control-chosen JS_end_address"
						data-placeholder=" " style="display: none" multiple="">	
					</select>
							</ul>							
							<div class="chosen-drop" id="addCity">
								<ul class="chosen-results" ></ul>
							</div>
						</div>

						<p class="error-message" id="cityerror">
							<em class="error-left-icon"></em><span class="error-message-con"><i
								class="nova-icon-xs nova-icon-warning"></i>请输入达到城市</span>
						</p></li>
					<li>
						<div class="hotelSeach-input startDate pr">
							<span class="inputTips">出发日期</span> 
							<input onblur="start()" type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',minDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:240px;">
						</div>
						<p class="error-message" id = "starterror">
							<span class="error-message-con"><i
								class="nova-icon-xs nova-icon-warning"></i>请选择出发日期</span>
						</p>
					</li>
					<li>
						<div class="hotelSeach-input startDate pr">
							<span class="inputTips">返回日期</span> 							
						<input onblur="end()" type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:240px;">	
						</div>
						<p class="error-message" id="enderror">
							<em class="error-left-icon"></em><span class="error-message-con"><i
								class="nova-icon-xs nova-icon-warning"></i>请选择返回日期</span>
						</p>
					</li>
					<li>
						<div class="form-day-warp clearfix">
							<div class="select-box fl select-day js-select on">
								游玩人数 <input type="text" id="people" value="1" name="peopleNumber"
									onblur="youwang()" class="select-input-val JS_Num_address"> 
								 	<ul class="drop-box js-drop" style="display: none;">									
								</ul>
								<p class="error-message" style="left: 11px; top: -48px;" id="peopleerror">
									<span class="error-message-con"><i
										class="nova-icon-xs nova-icon-warning"></i>游玩人数不为空！</span>
								</p>
							</div>
							<div class="per-input-box fl">
								人均预算 <input type="text"  onblur="yusuans()" class="per-input JS_per_address"
								id="yusuan"   name="travelBudget">
								<p class="error-message" style="left: 160px;" id="yusuanerror">
									<em class="error-left-icon"></em><span
										class="error-message-con"><i
										class="nova-icon-xs nova-icon-warning"></i>请填写人均预算</span>
								</p>
							</div>
						</div>
					</li>
				</ul>
				<div class="form-btn-box">
					<a href="javascript:;" class="js-free-per-btn" id="huoqu" onclick="showIdent()">免费获取定制方案</a>
				</div>
				<p class="hot-tel-box">
					个人定制热线<em> 400-1018-322</em>
				</p>
				<!-- 个人定制更多 -->
				<div class="more-form-box" id="more"  >
					<div class="inquiry-common-icon form-close" onclick="hidemore()"></div>
					<div class="more-form-content">
						<!-- <h3 class="title">更多需求（选填）</h3> -->
						<!-- <ul class="more-form-list">
							<li><label data-name="traffic">交通方式</label> <a
								href="javascript:;" class="btn js-btn active" data-value="none">不限</a>
								<a href="javascript:;" class="btn js-btn" data-value="bus">旅游巴士</a>
								<a href="javascript:;" class="btn js-btn" data-value="train">火车</a>
								<a href="javascript:;" class="btn js-btn" data-value="ship">轮船</a>
								<a href="javascript:;" class="btn js-btn" data-value="plane">飞机</a>
								<a href="javascript:;" class="btn js-btn" data-value="not">不用安排</a>
								<input type="hidden" name="traffic" class="traffic" value="none">
							</li>
							<li><label data-name="hotel">住宿标准</label> <a
								href="javascript:;" class="btn js-btn active" data-value="none">不限</a>
								<a href="javascript:;" class="btn js-btn" data-value="economic">经济型</a>
								<a href="javascript:;" class="btn js-btn" data-value="3star">三星级</a>
								<a href="javascript:;" class="btn js-btn" data-value="4star">四星级</a>
								<a href="javascript:;" class="btn js-btn" data-value="5star">五星级</a>
								<a href="javascript:;" class="btn js-btn" data-value="not">不用安排</a>
								<input type="hidden" name="hotel" class="hotel" value="none">
							</li>
							<li><label>更多需求</label> <textarea name="remark"
									class="textarea other-needs"
									placeholder="如：定制师何时联系？是否携带儿童？或未提及补充，驴妈妈将尽可能满足您的需求"></textarea>
							</li>
						</ul> -->
						<h3 class="title">联系人信息</h3>
						<ul class="more-form-list">
							<li><label>联系人员</label> <input type="text" id="manname"
							onblur="man()" class="input JS_non_empty" name="contacts"
								placeholder="请填写联系人姓名"> <span
								class="nova-tip-form error_text" id="nameerror"></span></li>
							<li><label>联系电话</label>
								<div class="select-box select-tel js-select on">
									<b>0086</b> <input name="areaCode" type="hidden" value="0086">
									<i class="inquiry-common-icon down-icon"></i>
								</div> - <input type="text " class="input w260 JS_mobile" name="phone" id="phone"
							onblur="phone()" placeholder="请填写联系人电话"> <span
								class="nova-tip-form error_text" id="phoneerror"></span></li>
							<li><label>邮箱<em>(必填)</em></label> <input type="text"
								class="input JS_email" name="email" id="email"
							onblur="email()" placeholder="请填写联系人邮箱，如：a@b.com"> <span
								class="nova-tip-form error_text" id="emailerror"></span></li>
						</ul>
						<button class="submit-btn js-submit-btn" onclick="submit()">提交定制需求</button>
						<span class="tips">现在提交，专业定制师将在2个小时内联系您</span>
					</div>
				</div>
			</div>
			<!-- 企业定制 -->
			<div class="form-content form-compay-box" style="display: none">
				<input type="hidden" name="customType" value="company"> <input
					type="hidden" name="subStation" value="上海">
				<ul class="form-content-list">
					<li>
						<div class="lv_s_city_all js-start JS_start_address1">
							<div class="lv_s_city_btn js_s_city_btn on">
								<i class="lv_s_mark"></i> <b data-id="9"
									class="around-data-search-from-place">上海</b> <input
									name="starting" value="上海" data-name="" type="hidden">
								<i class="inquiry-common-icon down-icon"></i> <span>出发城市</span>
							</div>
							<div class="lv_s_city js_all_city on"
								style="width: 460px; display: none;">
								<div class="search-station-hot">
									<h4>热门出发城市</h4>
									<!-- <div class="list clearfix">
										<a onclick="searchBoxChangeCity(37,'上海')">上海</a> 
										<a onclick="searchBoxChangeCity(124,'苏州')">苏州</a>
									</div> -->
								</div>
								<div class="search-station-cities">
									<!-- <ul id="searchBoxByLetterChangeCity" class="nav-tabs clearfix">
										<li onclick="changeSearchBoxByLetterChangeCity($('#searchBoxByLetterChangeCity'),0)">ABCD<i></i></li>
										<li onclick="changeSearchBoxByLetterChangeCity($('#searchBoxByLetterChangeCity'),1)">EFGH<i></i></li>
										<li onclick="changeSearchBoxByLetterChangeCity($('#searchBoxByLetterChangeCity'),2)">JKLM<i></i></li>
										<li onclick="changeSearchBoxByLetterChangeCity($('#searchBoxByLetterChangeCity'),3)">NOPQRS<i></i></li>
										<li onclick="changeSearchBoxByLetterChangeCity($('#searchBoxByLetterChangeCity'),4)">TUVWX<i></i></li>
										<li onclick="changeSearchBoxByLetterChangeCity($('#searchBoxByLetterChangeCity'),5)">YZ<i></i></li>
									</ul> -->
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
													<a class="city" data-id="245" data-name="大理" data-code="DL">大理</a><a
														class="city" data-id="124" data-name="大连" data-code="DL">大连</a><a
														class="city" data-id="101" data-name="大同" data-code="DT">大同</a><a
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
													<a class="city" data-id="327" data-name="佛山" data-code="FS">佛山</a><a
														class="city" data-id="147" data-name="阜阳" data-code="FY">阜阳</a><a
														class="city" data-id="172" data-name="抚州" data-code="FZ">抚州</a><a
														class="city" data-id="154" data-name="福州" data-code="FZ">福州</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>G</dt>
												<dd class="clearfix">
													<a class="city" data-id="169" data-name="赣州" data-code="GZ">赣州</a><a
														class="city" data-id="264" data-name="广元" data-code="GY">广元</a><a
														class="city" data-id="322" data-name="广州" data-code="GZ">广州</a><a
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
													<a class="city" data-id="170" data-name="吉安" data-code="JA">吉安</a><a
														class="city" data-id="280" data-name="焦作" data-code="JZ">焦作</a><a
														class="city" data-id="72" data-name="嘉兴" data-code="JX">嘉兴</a><a
														class="city" data-id="341" data-name="嘉峪关" data-code="JYG">嘉峪关</a><a
														class="city" data-id="19" data-name="吉林" data-code="JL">吉林</a><a
														class="city" data-id="174" data-name="济南" data-code="JN">济南</a><a
														class="city" data-id="164" data-name="景德镇" data-code="JDZ">景德镇</a><a
														class="city" data-id="75" data-name="金华" data-code="JH">金华</a><a
														class="city" data-id="166" data-name="九江" data-code="JJ">九江</a><a
														class="city" data-id="45" data-name="鸡西" data-code="JX">鸡西</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>K</dt>
												<dd class="clearfix">
													<a class="city" data-id="233" data-name="昆明" data-code="KM">昆明</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>L</dt>
												<dd class="clearfix">
													<a class="city" data-id="340" data-name="兰州" data-code="LZ">兰州</a><a
														class="city" data-id="249" data-name="拉萨" data-code="LS">拉萨</a><a
														class="city" data-id="62" data-name="连云港" data-code="LYG">连云港</a><a
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
													<a class="city" data-id="263" data-name="绵阳" data-code="MY">绵阳</a><a
														class="city" data-id="52" data-name="牡丹江" data-code="MDJ">牡丹江</a>
												</dd>
											</dl></li>
										<li class="search-station-cities-pane"><dl
												class="clearfix">
												<dt>N</dt>
												<dd class="clearfix">
													<a class="city" data-id="163" data-name="南昌" data-code="NC">南昌</a><a
														class="city" data-id="56" data-name="南京" data-code="NJ">南京</a><a
														class="city" data-id="207" data-name="南宁" data-code="NN">南宁</a><a
														class="city" data-id="61" data-name="南通" data-code="NT">南通</a><a
														class="city" data-id="285" data-name="南阳" data-code="NY">南阳</a><a
														class="city" data-id="70" data-name="宁波" data-code="NB">宁波</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>Q</dt>
												<dd class="clearfix">
													<a class="city" data-id="175" data-name="青岛" data-code="QD">青岛</a><a
														class="city" data-id="201" data-name="清远" data-code="QY">清远</a><a
														class="city" data-id="91" data-name="秦皇岛" data-code="QHD">秦皇岛</a><a
														class="city" data-id="44" data-name="齐齐哈尔"
														data-code="QQHE">齐齐哈尔</a><a class="city" data-id="158"
														data-name="泉州" data-code="QZ">泉州</a><a class="city"
														data-id="76" data-name="衢州" data-code="QZ">衢州</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>R</dt>
												<dd class="clearfix">
													<a class="city" data-id="184" data-name="日照" data-code="RZ">日照</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>S</dt>
												<dd class="clearfix">
													<a class="city" data-id="157" data-name="三明" data-code="SM">三明</a><a
														class="city" data-id="257" data-name="三亚" data-code="SY">三亚</a><a
														class="city" data-id="9" data-name="上海" data-code="SH">上海</a><a
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
													<a class="city" data-id="182" data-name="泰安" data-code="TA">泰安</a><a
														class="city" data-id="100" data-name="太原" data-code="TY">太原</a><a
														class="city" data-id="67" data-name="泰州" data-code="TZ">泰州</a><a
														class="city" data-id="78" data-name="台州" data-code="TZ">台州</a><a
														class="city" data-id="90" data-name="唐山" data-code="TS">唐山</a><a
														class="city" data-id="14" data-name="天津" data-code="TJ">天津</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>W</dt>
												<dd class="clearfix">
													<a class="city" data-id="180" data-name="潍坊" data-code="WF">潍坊</a><a
														class="city" data-id="71" data-name="温州" data-code="WZ">温州</a><a
														class="city" data-id="291" data-name="武汉" data-code="WH">武汉</a><a
														class="city" data-id="81" data-name="芜湖" data-code="WH">芜湖</a><a
														class="city" data-id="367" data-name="乌鲁木齐"
														data-code="WLMQ">乌鲁木齐</a><a class="city" data-id="57"
														data-name="无锡" data-code="WX">无锡</a>
												</dd>
											</dl>
											<dl class="clearfix">
												<dt>X</dt>
												<dd class="clearfix">
													<a class="city" data-id="155" data-name="厦门" data-code="XM">厦门</a><a
														class="city" data-id="256" data-name="西安" data-code="XA">西安</a><a
														class="city" data-id="40" data-name="中国香港" data-code="XG">中国香港</a><a
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
													<a class="city" data-id="335" data-name="延安" data-code="YA">延安</a><a
														class="city" data-id="145" data-name="延边" data-code="YB">延边</a><a
														class="city" data-id="64" data-name="盐城" data-code="YC">盐城</a><a
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
						</div>
						<p class="error-message">
							<em class="error-left-icon"></em><span class="error-message-con"><i
								class="nova-icon-xs nova-icon-warning"></i>请选择出发城市</span>
						</p>
					</li>
					<li class="js_s_city_btn on"><i
						class="inquiry-common-icon down-icon"></i> <span class="arr-city">到达城市</span>
						<select id="multiple"
						class="form-control form-control-chosen JS_end_address1"
						data-placeholder="" style="display: none" multiple="">
					</select>
					<div class="chosen-container chosen-container-multi"
							style="width: 100%;" title="" id="multiple_chosen">
							<ul class="chosen-choices">
								<li class="search-field"><input type="text" value=""
									class="default" autocomplete="off" style="width: 25px;"></li>
							</ul>
							<div class="chosen-drop">
								<ul class="chosen-results"></ul>
							</div>
						</div>
						<p class="error-message">
							<em class="error-left-icon"></em><span class="error-message-con"><i
								class="nova-icon-xs nova-icon-warning"></i>请输入达到城市，多个以空格分开</span>
						</p></li>
					<li>
						<div class="hotelSeach-input startDate pr">
							<span class="inputTips">出发日期</span> <input
								class="J_calendar1 JS_non_empty1" name="startTime" type="text"
								readonly="readonly" value="">
							<div class="timeInfo pa">
								<span class="inquiry-common-icon ico-calendar"></span>
							</div>
						</div>
						<p class="error-message">
							<span class="error-message-con"><i
								class="nova-icon-xs nova-icon-warning"></i>请选择出发日期</span>
						</p>
					</li>
					<li>
						<div class="hotelSeach-input startDate pr">
							<span class="inputTips">返回日期</span> <input
								class="J_calendar1 JS_non_empty1" name="endTime" type="text"
								readonly="readonly" value="">
							<div class="timeInfo pa">
								<span class="inquiry-common-icon ico-calendar"></span>
							</div>
						</div>
						<p class="error-message">
							<em class="error-left-icon"></em><span class="error-message-con"><i
								class="nova-icon-xs nova-icon-warning"></i>请选择返回日期</span>
						</p>
					</li>
					<li>
						<div class="form-day-warp clearfix">
							<div class="select-box fl select-day js-select on">
								游玩人数 <input type="text" value="1" name="peopleNumber"
									class="select-input-val JS_Num_address1"> <i
									class="inquiry-common-icon down-icon"></i>
								<ul class="drop-box js-drop" style="display: none;">
								<li>1</li>
									</ul>
								<p class="error-message" style="left: 11px; top: -48px;">
									<span class="error-message-con"><i
										class="nova-icon-xs nova-icon-warning"></i>游玩人数不为空！</span>
								</p>
							</div>
							<div class="per-input-box fl">
								人均预算 <input type="text" class="per-input JS_per_address1"
									name="travelBudget">
								<p class="error-message" style="left: 160px;">
									<em class="error-left-icon"></em><span
										class="error-message-con"><i
										class="nova-icon-xs nova-icon-warning"></i>请填写人均预算</span>
								</p>
							</div>
						</div>
					</li>
				</ul>
				<div class="form-btn-box">
					<a href="javascript:;" class="js-company-per-btn">免费获取定制方案</a>
				</div>
				<p class="hot-tel-box">
					企业定制热线<em> 400-1161-808</em>
				</p>
				<!-- 企业定制更多 -->
				<div class="more-form-box">
					<a href="javascript:;" class="inquiry-common-icon form-close"></a>
					<div class="more-form-content">
						<h3 class="title">更多需求（选填）</h3>
						<ul class="more-form-list">
							<li><label data-name="playTypes">游玩类型</label> <a
								href="javascript:;" class="btn js-btn active" data-value="none">不限</a>
								<a href="javascript:;" class="btn js-btn" data-value="visiting">奖励旅游</a>
								<a href="javascript:;" class="btn js-btn" data-value="meeting">会议会务</a>
								<a href="javascript:;" class="btn js-btn" data-value="kuozhan">团建培训</a>
								<a href="javascript:;" class="btn js-btn" data-value="business">企业差旅</a>
								<a href="javascript:;" class="btn js-btn" data-value="annual">企业年会</a>
								<a href="javascript:;" class="btn js-btn" data-value="other">其他</a>
								<input type="hidden" name="playTypes" class="playTypes"
								value="none"></li>
							<li><label data-name="traffic">交通方式</label> <a
								href="javascript:;" class="btn js-btn active" data-value="none">不限</a>
								<a href="javascript:;" class="btn js-btn" data-value="bus">旅游巴士</a>
								<a href="javascript:;" class="btn js-btn" data-value="train">火车</a>
								<a href="javascript:;" class="btn js-btn" data-value="ship">轮船</a>
								<a href="javascript:;" class="btn js-btn" data-value="plane">飞机</a>
								<a href="javascript:;" class="btn js-btn" data-value="not">不用安排</a>
								<input type="hidden" name="traffic" class="traffic" value="none">
							</li>
							<li><label data-name="hotel">住宿标准</label> <a
								href="javascript:;" class="btn js-btn active" data-value="none">不限</a>
								<a href="javascript:;" class="btn js-btn" data-value="economic">经济型</a>
								<a href="javascript:;" class="btn js-btn" data-value="3star">三星级</a>
								<a href="javascript:;" class="btn js-btn" data-value="4star">四星级</a>
								<a href="javascript:;" class="btn js-btn" data-value="5star">五星级</a>
								<a href="javascript:;" class="btn js-btn" data-value="not">不用安排</a>
								<input type="hidden" name="hotel" class="hotel" value="none">
							</li>
							<li><label data-name="dinner">用餐标准<span
									class="price">(元/人/餐)</span></label> <a href="javascript:;"
								class="btn js-btn active" data-value="none">不限</a> <a
								href="javascript:;" class="btn js-btn" data-value="20">20-30</a>
								<a href="javascript:;" class="btn js-btn" data-value="30">30-40</a>
								<a href="javascript:;" class="btn js-btn" data-value="40">40-50</a>
								<a href="javascript:;" class="btn js-btn" data-value="50">50以上</a>
								<a href="javascript:;" class="btn js-btn" data-value="not">不用安排</a>
								<input type="hidden" name="dinner" class="dinner" value="none">
							</li>
							<li><label>更多需求</label> <textarea name="remark"
									class="textarea other-needs"
									placeholder="如：定制师何时联系？是否携带儿童？或未提及补充，驴妈妈将尽可能满足您的需求"></textarea>
							</li>
						</ul>
						<h3 class="title">联系人信息</h3>
						<ul class="more-form-list">
							<li><label>联系人员</label> <input type="text"
								class="input JS_non_empty1" name="contacts"
								placeholder="请填写联系人姓名"> <span
								class="nova-tip-form error_text"></span></li>
							<li><label>联系电话</label>
								<div class="select-box select-tel js-select on">
									<b>0086</b> <input name="areaCode" type="hidden" value="0086">
									<i class="inquiry-common-icon down-icon"></i>
								</div> - <input type="text " class="input w260 JS_mobile1"
								name="phone" placeholder="请填写联系人电话"> <span
								class="nova-tip-form error_text"></span></li>
							<li><label>邮箱<em>(必填)</em></label> <input type="text"
								class="input JS_email1" name="email"
								placeholder="请填写联系人邮箱，如：a@b.com"> <span
								class="nova-tip-form error_text"></span></li>
							<li><label>公司名<em>(选填)</em></label> <input type="text"
								class="input" name="companyName" placeholder="请填写公司名称">
								<span class="nova-tip-form error_text"></span></li>
						</ul>
						<button class="submit-btn js-submit-btn1">提交定制需求</button>
						<span class="tips">现在提交，专业定制师将在2个小时内联系您</span>
					</div>
				</div>
			</div>
			<a href="queryUsername?username=${user}" class="my-custon-btn">我的定制</a>
		</div>
		<div class="custom-banner-box fl">
			<!-- banBox banner盒子 -->
			<div class="banBox"> 
				<div class="banTab">
					<span class="active"><i style=""></i></span>
				</div>
				<ul class="banPic" id="js_allyes_1"
					style="width: 4980px; left: -830px;">
					<li><a href="" title=""
						target="_blank"><img
							src="http://s2.lvjs.com.cn//uploads/pc/place2/2018-08-17/9147851d-7ee0-4ddc-81ee-2244ca3ff534.jpg"
							width="830" height="350"></a></li>
					<li class="active"
						onclick="cmCreateElementTag('定制游-PC-上海-BANNER-01-雪国列车','PC定制游');">
						<a href="scenicway/tourRouteProductShow/30" title=""
						target="_blank"><img width="830" height="350"
							src="imgupload/44fadf1c-18fe-401f-9061-ba9bb5346342.jpg"></a>
					</li>
				
				</ul>
			</div>
			<!-- //banBox banner盒子 End-->
			<div class="step-box"></div>
		</div>
	</div>
<!-- 品宣开始 开始-->



	<!-- 当季热门 开始-->

	<div class="hot-box-bg">
		<div class="comany-main">
			<h2 class="head-title">
				当季热门<span class="head-tips">玩点不一样，旅行的乐趣就在这里！</span>
			</h2>
			<ul class="hot-tab-box js-hot-tab clearfix">
				<li class="active" id="qinzi"
					onclick="cmCreateElementTag('亲子游学');">亲子游学</li>
				<!-- <li id="zangdi"
					onclick="cmCreateElementTag('藏地天堂');">藏地天堂</li> -->
			</ul>

			<div class="hot-list-warp clearfix">
				<div class="hot-product-box">
					<h3 class="title">正在定制</h3>
					<div class="hot-product-content">
						<ul class="hot-product-list js-hot-product-box"
							style="width: 2450px; left: -700px;">
							<li>
								<h4>**刚刚 定制了</h4>
								<p class="con">从苏州出发，目的地丽江，总行程40天， 一共2人，人均预算8000元。</p>
							</li>
							<li>
								<h4>**刚刚定制了</h4>
								<p class="con">从苏州出发，目的地丽江，总行程40天， 一共2人，人均预算8000元。</p>
							</li>
							<li>
								<h4>**刚刚定制了</h4>
								<p class="con">从苏州出发，目的地丽江，总行程40天， 一共2人，人均预算8000元。</p>
							</li>
							
						</ul>
					</div>
					<ul class="hot-num-box clearfix">
						<li class="active"></li>
					</ul>
				</div>

				<ul class="hot-list-box clearfix" id="tags" style="display: block">
					<li class="frist"
						onclick="">
						<div class="hot-bd-bg">
							<div class="hot-con-box">
								<h3 class="title">
									<a href="#">东方明珠</a>
								</h3>
								<p class="content">东方明珠1日游</p>
								<div class="price-box">
									<i>¥</i><em>1288</em>起
								</div>
								<a href="scenicway/tourRouteProductShow/30" class="view-btn">查看详情</a>
							</div>
						</div> <img
						src="imgupload/44fadf1c-18fe-401f-9061-ba9bb5346342.jpg"
						alt="" width="390" height="260">
					</li>
					 <li
						onclick="cmCreateElementTag('定制游-PC-上海-P1-当季热门-01-亲子游学-02-探文房四宝之源头','PC定制游');">
						<div class="hot-bd-bg">
							<div class="hot-con-box">
								<h3 class="title">
									<a href="#">凤凰古城3日游</a>
								</h3>
								<p class="content">品徽州古文化，访中华古城之底蕴</p>
								<div class="price-box">
									<i>¥</i><em>2188</em>起
								</div>
								<a href="scenicway/tourRouteProductShow/33" class="view-btn">查看详情</a>
							</div>
						</div> <img
						src="imgupload/8875b9a4-c330-4900-bf09-0a22b11dc906.jpg"
						alt="" width="390" height="260">
					</li>
				</ul>
				<ul class="hot-list-box clearfix" id="hot">
					<li class="frist"
						onclick="">
						<div class="hot-bd-bg">
							<div class="hot-con-box">
								<h3 class="title">
									<a href="#">穿越滇藏</a>
								</h3>
								<p class="content">满足你心中的西藏梦</p>
								<div class="price-box">
									<i>¥</i><em>4380</em>起
								</div>
								<a href="#" class="view-btn">查看详情</a>
							</div>
						</div> <img
						src="http://s2.lvjs.com.cn//uploads/pc/place2/2018-08-31/504cf2f9-24bb-489a-83a4-9b76ce886dd7.jpg"
						alt="" width="390" height="260">
					</li>
					<!-- <li
						onclick="cmCreateElementTag('定制游-PC-上海-P1-当季热门-03-藏地天堂-02-朝圣之旅','PC定制游');">
						<div class="hot-bd-bg">
							<div class="hot-con-box">
								<h3 class="title">
									<a href="#">朝圣之旅</a>
								</h3>
								<p class="content">川西小环线深度游</p>
								<div class="price-box">
									<i>¥</i><em>2980</em>起
								</div>
								<a href="http://dujia.lvmama.com/local/1615600" class="view-btn">查看详情</a>
							</div>
						</div> <img
						src="http://s3.lvjs.com.cn//uploads/pc/place2/2018-08-31/619a099f-5257-4052-ac24-fe94a80406f2.jpg"
						alt="" width="390" height="260">
					</li>
					<li
						onclick="cmCreateElementTag('定制游-PC-上海-P1-当季热门-03-藏地天堂-03-雪域高原','PC定制游');">
						<div class="hot-bd-bg">
							<div class="hot-con-box">
								<h3 class="title">
									<a href="#">雪域高原</a>
								</h3>
								<p class="content">西藏环线风光自驾14日深度游</p>
								<div class="price-box">
									<i>¥</i><em>10680</em>起
								</div>
								<a href="http://dujia.lvmama.com/local/1637737" class="view-btn">查看详情</a>
							</div>
						</div> <img
						src="http://s1.lvjs.com.cn//uploads/pc/place2/2018-08-31/3633d624-25cd-44dc-8ce9-c3428565ced9.jpg"
						alt="" width="390" height="260">
					</li>
					<li
						onclick="cmCreateElementTag('定制游-PC-上海-P1-当季热门-03-藏地天堂-04-藏地传奇','PC定制游');">
						<div class="hot-bd-bg">
							<div class="hot-con-box">
								<h3 class="title">
									<a href="#">藏地传奇</a>
								</h3>
								<p class="content">一步一菩提，寻找雪山深处的根</p>
								<div class="price-box">
									<i>¥</i><em>7280</em>起
								</div>
								<a href="http://dujia.lvmama.com/local/1637842" class="view-btn">查看详情</a>
							</div>
						</div> <img
						src="http://s2.lvjs.com.cn//uploads/pc/place2/2018-08-31/dd6119af-4eb6-4642-88ec-4106c50ce95d.jpg"
						alt="" width="390" height="260">
					</li>
					<li
						onclick="cmCreateElementTag('定制游-PC-上海-P1-当季热门-03-藏地天堂-05-人文信仰','PC定制游');">
						<div class="hot-bd-bg">
							<div class="hot-con-box">
								<h3 class="title">
									<a href="#">人文信仰</a>
								</h3>
								<p class="content">还原一段最真实而难忘的进藏之旅</p>
								<div class="price-box">
									<i>¥</i><em>6180</em>起
								</div>
								<a href="http://dujia.lvmama.com/local/1638879" class="view-btn">查看详情</a>
							</div>
						</div> <img
						src="http://s3.lvjs.com.cn//uploads/pc/place2/2018-08-31/62be908e-7844-4c0f-beea-b67bb8f32228.jpg"
						alt="" width="390" height="260">
					</li> -->
				</ul>

			</div>
		</div>
	</div>
	<!-- 当季热门 结束-->
	<!-- 热门定制师 开始-->
	<!-- 	<div class="comany-main">
		<h2 class="head-title">
			热门定制师<span class="head-tips">案例挑花眼？定制师来帮忙！</span>
		</h2>
		<div class="customer-per-box ">
			<ul class="customer-list clearfix js-customer-per-box"
				style="width: 5460px; left: 0px;">
				<a href="javascript:void(0);">
					<li><img
						src="http://s1.lvjs.com.cn//uploads/pc/place2/2018-07-30/5d658aad-a1da-4152-b362-5a0c8363282f_480_320.jpg"
						alt="" width="390" height="260">
						<div class="customr-bd">
							<h4 class="name">杨立斌</h4>
							<p>加拿大旅游专家 | 用心做事、服务至诚</p>
							<p>擅长：国内周边定制游、加拿大路线</p>
						</div></li>
				</a>
				<a href="javascript:void(0);">
					<li><img
						src="http://s2.lvjs.com.cn//uploads/pc/place2/2018-07-30/f3c43dc4-3ff3-4495-a19f-588b48a32d6e_480_320.jpg"
						alt="" width="390" height="260">
						<div class="customr-bd">
							<h4 class="name">王琰</h4>
							<p>从业2年 | 定制300+行程 | 好评99%+</p>
							<p>擅长：海南+云南+东北+西北路线</p>
						</div></li>
				</a>
				<a href="javascript:void(0);">
					<li><img
						src="http://s3.lvjs.com.cn//uploads/pc/place2/2018-07-30/b812aed7-59f7-4b3f-a87f-aa3f7d2a4b5d_480_320.jpg"
						alt="" width="390" height="260">
						<div class="customr-bd">
							<h4 class="name">刘皓</h4>
							<p>新西兰留学3年 | 熟悉澳新各处景点</p>
							<p>擅长：澳洲+新西兰路线、亲子、户外</p>
						</div></li>
				</a>
				<a href="javascript:void(0);">
					<li><img
						src="http://s1.lvjs.com.cn//uploads/pc/place2/2018-08-20/a61ba6d6-4c35-4ba3-a3b5-1b2f0513e6a7.jpg"
						alt="" width="390" height="260">
						<div class="customr-bd">
							<h4 class="name">彭玉良</h4>
							<p>行走的旅行诗人丨保持一颗童心</p>
							<p>擅长国内外亲子线路，儿童玩乐专家</p>
						</div></li>
				</a>
			</ul>
		</div>
		<ul class="customer-num-box clearfix">
			<li class="active"></li>
			<li class=""></li>
		</ul>
	</div> -->
	<!-- 热门定制师 结束-->


	<!-- 品宣开始 开始-->
	<div class="customer-band-bg">
		<div class="band-box"></div>
	</div>
	<!-- 右侧悬浮 -->
	<div class="right-float">
		<span class="custom-btn custom-btn-wx"> <i
			class="custom-icon custom-icon-wx"></i>
			<div class="float-discover-wx">
				<i class="custom-icon custom-icon-single"></i> <img
					src="http://s1.lvjs.com.cn/uploads/pc/place2/100650/1437976117319.jpg"
					width="138" height="139"> <span class="wx-sao">扫一扫</span> <span
					class="wx-guanzhu">关注驴妈妈微信</span>
			</div>
		</span> <span class="custom-btn custom-btn-phone"><i
			class="custom-icon custom-icon-phone"></i>
			<div class="float-discover-phone">
				<i class="custom-icon custom-icon-single"></i>
				<p>
					个人定制热线<em>400-1018-322</em>
				</p>
				 	<p>
					企业定制热线<em>400-1161-808</em>
				</p>
			</div> </span> <a class="custom-btn custom-btn-link lv_side_top"
			href="javascript:void(0);" title=""><i
			class="custom-icon custom-icon-link"></i>
			<div class="float-discover-write">
				<i class="custom-icon custom-icon-single"></i> 立即开始您的定制之旅
			</div> </a>

	</div>

	<!-- 公共底部  -->
	<!-- footer\ -->
	<div class="wrap" style="clear: both;">
		<a class="public_ft" href="http://www.lvmama.com/public/user_security"
			target="_blank"><ul class="public_ft_list">
				<li><i class="ft_ioc1"></i><strong>价格保证</strong>同类产品，保证低价</li>
				<li><i class="ft_ioc2"></i><strong>退订保障</strong>因特殊情况影响出行，保证退订</li>
				<li><i class="ft_ioc3"></i><strong>救援保障</strong>旅途中遇意外情况，保证援助</li>
				<li><i class="ft_ioc4"></i><strong>7x24小时服务</strong>快速响应，全年无休</li>
			</ul></a>
	</div>
	<!-- copyright\ -->
	<div class="lv-footer clearfix wrap" style="margin: 0 auto;">
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
	<!-- 依赖插件和脚本 -->
	<!-- <script
		src="http://s3.lvjs.com.cn/min/index.php?f=js/new_v/jquery-1.7.2.min.js,/js/channel/custom/v1/chosen.jquery.js"></script> -->

 <!-- 	<script
		src="
		/js/lv/dialog.js,/js/lv/validate.js,
		/js/v6/header_new.js,/js/public/side/lvSide.js,
		/js/lv/calendar.js,
		/js/channel/custom/v1/custom-v2.js"></script> -->
	<!-- <script
		src="http://s2.lvjs.com.cn/min/index.php?f=/js/v5/modules/pandora-select.js,/js/v5/modules/pandora-dialog.js,/js/common/poplogin.js"></script> -->

	<!-- 统计新代码-->
	<!-- <script
		src="http://s3.lvjs.com.cn/min/index.php?f=/js/v5/ibm/eluminate.js,/js/v5/ibm/coremetrics-initalize.js,/js/common/losc.js"></script> -->
	<!-- <script>
		cmCreatePageviewTag('个人定制游频道首页_<上海>', 'CustomTour', null, null,
				'-_--_--_--_--_-路径页面');
	</script> -->


	<div class="complete_box" style="display: none">
		<ul class="complete_list"></ul>
	</div>
	<div class="complete_box_hotel hotelDestBox" style="display: none"></div>
	<div class="complete_box_hotel hotelKeywordBox" style="display: none"></div>
	<div class="complete_error_tips" style="display: none;">
		<span>找不到目的地：</span><span class="word"></span><i>×</i>
	</div>
	<div id="right-bottom-tools">
		<a id="goTopBtn" target="_self" href="javascript:;" title="返回顶部"></a><a
			href="http://www.lvmama.com/userCenter/user/transItfeedBack.do"
			target="_blank" id="Feedback" title="意见反馈"></a>
	</div>
	<!-- <div class="lv_side" id="lv_side">
		<ul class="lv_side_nav">
			<li class="lv_side_app"><i class="lv_side_icon side_icon_app"></i>
				APP模块
				<div class="lv_side_app_box">
					<img class="lv_side_app_ewm"
						src="http://www.lvmama.com/zt/web/sider/index_sider_app.png"
						width="79" alt=""> <span class="side_login_arrow_r">◆</span>
				</div></li>
			<li id="side_login"><i class="lv_side_icon side_icon_my"></i></li>
			<li><a href="http://www.ctcnn.com/Research/pc_L.htm"
				target="_blank">
					<p>有奖问卷</p>
					<i class="lv_side_icon side_icon_questionnaire"></i>
			</a></li>
			<li><a
				href="http://www.lvmama.com/userCenter/user/transItfeedBack.do"
				target="_blank">
					<p>意见反馈</p>
					<i class="lv_side_icon side_icon_feedback"></i>
			</a></li>
			<li class="lv_side_top">
				<p>返回顶部</p>
				<i class="lv_side_icon side_icon_top"></i>
			</li>
		</ul>
		<div class="lv_side_login_box" style="display: none;">
			<dl class="lv_side_login_tab">
				<dd class="active">普通登录</dd>
				<dd>手机动态密码登录</dd>
				<dd style="display: none;">扫码登录</dd>
			</dl>
			普通登录
			<div class="lv_side_logintype" style="display: block;">
				<div class="lv_side_login_tip" id="login_user_tip"></div>
				<ul class="lv_side_login_list">
					<li><input class="login_input" id="login_user_username"
						type="text" placeholder="邮箱／手机号／用户名／会员卡"><i
						class="lv_side_icon side_icon_name"></i></li>
					<li><input class="login_input" id="login_user_pass"
						type="password" placeholder="请输入密码"><i
						class="lv_side_icon side_icon_pass"></i></li>
					<li style="display: none;"><input
						class="login_input login_input_min" id="login_user_imgcode"
						type="text" placeholder="请填写计算结果或验证码"><img
						class="img_code" id="user_img_code"
						src="http://login.lvmama.com/captcha/account/checkcode/login_web.htm"
						title="点击更换验证码" width="104" height="42"></li>
				</ul>
				<div class="lv_side_check lv_side_remember_pass"><a href="#">忘记密码？</a><label><span class="login_checkbox lv_side_icon "><input type="checkbox"></span>记住密码30天</label></div>
				<a class="lv_side_btn_login js_user_login">登 录</a>
				普通登录，滑动验证模块
				
				<div class="embed_captcha" id="user_embed_captcha">
					<div class="gt_holder gt_float" style="touch-action: none;">
						<div class="gt_widget gt_hide">
							<div class="gt_holder_top"></div>
							<div class="gt_box_holder" style="height: 116px;">
								<div class="gt_box">
									<div class="gt_loading">
										<div class="gt_loading_icon"></div>
										<div class="gt_loading_text">加载中...</div>
									</div>
									<a class="gt_bg gt_show" style="background-image: none;"><div
											class="gt_cut_bg gt_show">
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -157px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -145px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -265px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -277px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -181px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -169px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -241px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -253px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -109px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -97px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -289px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -301px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -85px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -73px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -25px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -37px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -13px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -1px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -121px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -133px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -61px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -49px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -217px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -229px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -205px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -193px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -145px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -157px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -277px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -265px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -169px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -181px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -253px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -241px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -97px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -109px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -301px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -289px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -73px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -85px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -37px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -25px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -1px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -13px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -133px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -121px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -49px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -61px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -229px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -217px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -193px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/bg/b176dd9f7.webp&quot;); background-position: -205px 0px;"></div>
										</div>
										<div class="gt_slice gt_show"
											style="left: 0px; background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/slice/b176dd9f7.png&quot;); width: 53px; height: 55px; top: 46px;"></div></a><a
										class="gt_fullbg gt_show"
										style="cursor: default; background-image: none;"><div
											class="gt_cut_fullbg gt_show">
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -157px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -145px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -265px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -277px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -181px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -169px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -241px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -253px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -109px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -97px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -289px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -301px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -85px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -73px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -25px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -37px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -13px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -1px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -121px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -133px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -61px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -49px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -217px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -229px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -205px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -193px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -145px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -157px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -277px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -265px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -169px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -181px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -253px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -241px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -97px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -109px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -301px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -289px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -73px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -85px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -37px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -25px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -1px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -13px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -133px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -121px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -49px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -61px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -229px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -217px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -193px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/fc064fc73/fc064fc73.webp&quot;); background-position: -205px 0px;"></div>
										</div>
										<div class="gt_flash" style="height: 94px;"></div>
										<div class="gt_ie_success"></div></a><a class="gt_curtain gt_hide"
										style="background-image: none;"><div
											class="gt_curtain_bg_wrap">
											<div class="gt_curtain_bg">
												<div class="gt_cut_curtain"></div>
											</div>
										</div>
										<div class="gt_curtain_button gt_hide"></div></a><a
										class="gt_box_tips" style="display: none;"></a>
								</div>
								<div class="gt_info">
									<div class="gt_info_tip">
										<div class="gt_info_icon"></div>
										<div class="gt_info_text"></div>
									</div>
								</div>
							</div>
							<div class="gt_bottom">
								<a class="gt_refresh_button"><div class="gt_refresh_tips">刷新验证</div></a><a
									class="gt_help_button"
									href="http://www.geetest.com/contact#report" target="_blank"><div
										class="gt_help_tips">帮助反馈</div></a><a class="gt_logo_button"
									href="http://www.geetest.com/first_page" target="_blank"></a>
							</div>
						</div>
						<div class="gt_input">
							<input class="geetest_challenge" type="hidden"
								name="geetest_challenge"><input class="geetest_validate"
								type="hidden" name="geetest_validate"><input
								class="geetest_seccode" type="hidden" name="geetest_seccode">
						</div>
						<div class="gt_slider">
							<div class="gt_guide_tip gt_show">按住左边滑块，拖动完成上方拼图</div>
							<div class="gt_slider_knob gt_show" style="left: 0px;"></div>
							<div class="gt_curtain_tip gt_hide">点击上图按钮并沿道路拖动到终点处</div>
							<div class="gt_curtain_knob gt_hide">移动到此开始验证</div>
							<div class="gt_ajax_tip gt_ready"></div>
						</div>
					</div>
				</div>
				<p class="lv_side_register_tip">
					还不是驴妈妈会员？<a
						href="https://login.lvmama.com/nsso/register/registering.do"
						target="_blank">免费注册,送180元新手礼包</a>
				</p>
			</div>
	<!-- 
			手机登录
			<div class="lv_side_logintype" style="display: none;">
				登录提示
				<div class="lv_side_login_tip" id="login_mobile_tip"></div>
				<ul class="lv_side_login_list">
					<li><input class="login_input" id="login_mobile" type="text"
						maxlength="11" placeholder="手机号"><i
						class="lv_side_icon side_icon_mobile"></i></li>
					<li style="display: none;"><input
						class="login_input login_input_min" id="login_mobile_imgcode"
						type="text" placeholder="请填写计算结果或验证码"><img
						class="img_code" id="mobile_img_code"
						src="http://login.lvmama.com/captcha/account/checkcode/rapidLogin.htm"
						title="点击更换验证码" width="104" height="42"></li>
					<li><input class="login_input login_input_min"
						id="login_mobile_code" type="text" placeholder="请输入动态密码"><span
						class="lv_side_btn_code">获取动态密码</span></li>
				</ul>
				<a class="lv_side_btn_login js_mobile_login">登 录</a>
				手机登录，滑动验证模块
				<div class="embed_captcha" id="mobile_embed_captcha">
					<div class="gt_holder gt_float" style="touch-action: none;">
						<div class="gt_widget gt_hide">
							<div class="gt_holder_top"></div>
							<div class="gt_box_holder" style="height: 116px;">
								<div class="gt_box">
									<div class="gt_loading">
										<div class="gt_loading_icon"></div>
										<div class="gt_loading_text">加载中...</div>
									</div>
									<a class="gt_bg gt_show" style="background-image: none;"><div
											class="gt_cut_bg gt_show">
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -157px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -145px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -265px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -277px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -181px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -169px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -241px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -253px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -109px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -97px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -289px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -301px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -85px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -73px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -25px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -37px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -13px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -1px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -121px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -133px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -61px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -49px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -217px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -229px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -205px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -193px -58px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -145px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -157px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -277px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -265px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -169px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -181px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -253px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -241px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -97px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -109px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -301px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -289px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -73px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -85px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -37px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -25px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -1px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -13px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -133px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -121px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -49px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -61px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -229px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -217px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -193px 0px;"></div>
											<div class="gt_cut_bg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/bg/87892b155.webp&quot;); background-position: -205px 0px;"></div>
										</div>
										<div class="gt_slice gt_show"
											style="left: 0px; background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/slice/87892b155.png&quot;); width: 55px; height: 56px; top: 27px;"></div></a><a
										class="gt_fullbg gt_show"
										style="cursor: default; background-image: none;"><div
											class="gt_cut_fullbg gt_show">
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -157px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -145px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -265px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -277px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -181px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -169px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -241px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -253px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -109px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -97px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -289px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -301px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -85px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -73px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -25px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -37px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -13px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -1px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -121px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -133px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -61px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -49px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -217px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -229px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -205px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -193px -58px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -145px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -157px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -277px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -265px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -169px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -181px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -253px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -241px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -97px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -109px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -301px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -289px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -73px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -85px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -37px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -25px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -1px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -13px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -133px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -121px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -49px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -61px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -229px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -217px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -193px 0px;"></div>
											<div class="gt_cut_fullbg_slice"
												style="background-image: url(&quot;http://static.geetest.com/pictures/gt/e11621516/e11621516.webp&quot;); background-position: -205px 0px;"></div>
										</div>
										<div class="gt_flash" style="height: 94px;"></div>
										<div class="gt_ie_success"></div></a><a class="gt_curtain gt_hide"
										style="background-image: none;"><div
											class="gt_curtain_bg_wrap">
											<div class="gt_curtain_bg">
												<div class="gt_cut_curtain"></div>
											</div>
										</div>
										<div class="gt_curtain_button gt_hide"></div></a><a
										class="gt_box_tips" style="display: none;"></a>
								</div>
								<div class="gt_info">
									<div class="gt_info_tip">
										<div class="gt_info_icon"></div>
										<div class="gt_info_text"></div>
									</div>
								</div>
							</div>
							<div class="gt_bottom">
								<a class="gt_refresh_button"><div class="gt_refresh_tips">刷新验证</div></a><a
									class="gt_help_button"
									href="http://www.geetest.com/contact#report" target="_blank"><div
										class="gt_help_tips">帮助反馈</div></a><a class="gt_logo_button"
									href="http://www.geetest.com/first_page" target="_blank"></a>
							</div>
						</div>
						<div class="gt_input">
							<input class="geetest_challenge" type="hidden"
								name="geetest_challenge"><input class="geetest_validate"
								type="hidden" name="geetest_validate"><input
								class="geetest_seccode" type="hidden" name="geetest_seccode">
						</div>
						<div class="gt_slider">
							<div class="gt_guide_tip gt_show">按住左边滑块，拖动完成上方拼图</div>
							<div class="gt_slider_knob gt_show" style="left: 0px;"></div>
							<div class="gt_curtain_tip gt_hide">点击上图按钮并沿道路拖动到终点处</div>
							<div class="gt_curtain_knob gt_hide">移动到此开始验证</div>
							<div class="gt_ajax_tip gt_ready"></div>
						</div>
					</div>
				</div>
				<div class="lv_side_check lv_side_contract">
					<label><span
						class="login_checkbox lv_side_icon login_checked"><input
							class="js_contract_checked" type="checkbox" checked=""></span>我已阅读并接受</label>
					<a href="http://login.lvmama.com/nsso/register/agreement.do"
						target="_blank">《驴妈妈旅游网会员服务条款》</a>
				</div>
				<p class="lv_side_tip">快捷注册:可使用手机快捷登录功能，通过动态密码完成快捷注册并登录。</p>
			</div>
			二维码登录
			<div class="lv_side_logintype" style="display: none;">
				<div class="ewm_login_tit">
					<i class="lv_side_icon lv_side_sao"></i>手机扫码，登录更安全
				</div>
				<div class="ewm_login_box">
					<img src="http://pic.lvmama.com/img/channel/tuangou/app.png"
						width="160" height="160" alt="">
					<div class="ewm_login_refresh">
						<p>二维码已过期</p>
						<span class="ewm_login_refresh_btn">刷新</span>
					</div>
				</div>
				<p class="ewm_login_tip">打开驴妈妈APP扫二维码登录</p>
			</div>
			第三方登录
			<div class="lv_side_login_third">
				<a class="lv_side_icon lv_side_qq"
					href="https://login.lvmama.com/nsso/cooperation/tencentQQUnionLogin.do"
					onclick="tipsWindow()" target="_blank" title="QQ登录"></a> <a
					class="lv_side_icon lv_side_wx"
					href="https://login.lvmama.com/nsso/cooperation/tencentWeiXinUnionLogin.do"
					onclick="tipsWindow()" target="_blank" title="微信登录"></a> <a
					class="lv_side_icon lv_side_wb"
					href="https://login.lvmama.com/nsso/cooperation/sinaUnionLogin.do"
					onclick="tipsWindow()" target="_blank" title="新浪微博登录"></a> <a
					class="lv_side_icon lv_side_zfb"
					href="https://login.lvmama.com/nsso/cooperation/alipayUnionLogin.do"
					onclick="tipsWindow()" target="_blank" title="支付宝登录"></a>
			</div>
			<span class="side_login_arrow_r">◆</span>
			手机登录滑动验证码值
			<input type="hidden" id="mobile_geetest_challenge"> <input
				type="hidden" id="mobile_geetest_validate"> <input
				type="hidden" id="mobile_geetest_seccode">
			普通登录滑动验证码值
			<input type="hidden" id="normal_geetest_challenge"> <input
				type="hidden" id="normal_geetest_validate"> <input
				type="hidden" id="normal_geetest_seccode">
		</div>-->
	</div>
	
	<div id="userdata_el" style="visibility: hidden; position: absolute;"></div>

</body>
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="js/company.js"></script>
</html>
