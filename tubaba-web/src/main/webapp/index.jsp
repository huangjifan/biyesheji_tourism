<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>兔爸爸旅游网</title>
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
<link rel="stylesheet" href="css/index_02.css">
<style id="tsbrowser_video_independent_player_style" type="text/css">
.lv_s_all {
   position: absolute;
   left: 50%;
   margin-left: -595px;
   top: 20px;
   width: 561px;
   min-height: 360px;
   z-index: 9;
   background-color: #455769\9;
   background-color: rgba(60,87,105,0.8);
}
</style>

<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
</head>
<body class="home">
<!-- 头部页面 开始 -->
<jsp:include page="head.jsp"></jsp:include>
<!-- 头部页面 结束 -->

<!-- 首屏 banner 及导航 -->
<div class="lv-ban">
	<input id="searchScope" type="hidden" value="0"/>
	<div class="lv_s_all">
		<ul class="lv_s_tab">
			<li class="active" data-type="TICKET" onclick="changeTravelClassify(this,$('.lv_s_list'))">景点门票</li>
			<li data-type="GROUP" onclick="changeTravelClassify(this,$('.lv_s_list'))">跟团游</li>
	    	<li data-type="LOCAL" onclick="changeTravelClassify(this,$('.lv_s_list'))">当地游</li>
	    </ul>
	    <div class="lv_s_r">
	    	<!--景点门票板块-->
	        <div id="entranceTicketsPlate" class="lv_s_list" style="display:block;">
	        	<ul class="lv_s_ipt_tab">
	        		<li class="active" data-type="TICKET" onclick="changeEntranceTicketsSubClassify(0)">景点门票<i class="lv_s_tab_arrow"></i></li>
	            </ul>
	        	<ul class="lv_s_ipt mt20">
	            	<li style="display:block;">
	            		<span class="searchScope" style="display:none;">1</span>
	            		<input class="lv_s_input js_s_input w_419" value="请输入目的地、主题、或景区名" type="text" autocomplete="off" style="color: rgb(187, 187, 187);" onfocus="searchBoxOnFocus(this,'请输入目的地、主题、或景区名',1)" onblur="searchBoxOnBlur(this,'请输入目的地、主题、或景区名',1)" onkeyup="findTravelPlanBySearchVal(1,this)">
	            	</li>
	            	<li>
	            		<span class="searchScope" style="display:none;">2</span>
	            		<input class="lv_s_input js_s_input w_419" value="请输入目的地、主题、或关键词" type="text" autocomplete="off" style="color: rgb(187, 187, 187);" onfocus="searchBoxOnFocus(this,'请输入目的地、主题、或关键词',2)" onblur="searchBoxOnBlur(this,'请输入目的地、主题、或关键词',2)" onkeyup="findTravelPlanBySearchVal(2,this)">
	            	</li>
	            </ul>
	            <!--搜索按钮--开始-->
	            <div class="lv_s_search">
	            	<span class="lv_s_search_btn" onclick="entranceTicketsSearchBoxSearch()" style="display:block;">搜索</span>
	            </div>
	            <!--搜索按钮--结束-->
	            <!--热门模块--景点门票--开始-->
               	<div class="lv_s_hot" style="display:block;">
	            	<div class="lv_s_hot_list hasRecom" style="display:block;">
		            	<dl>
		                	<dt>热搜景点</dt>
		                    <dd>
		                    </dd>
		                </dl>
	            	</div>
	            	<!-- 推荐位 开始 -->
					<!-- 
					<a onclick="" href="" target="_blank" class="lv_s_pic" style="display:block;">
						<img src="image/d4c8e716-bde2-4253-8c62-cdf3a8c5cbaa.jpg" width="440" height="65" alt="常州恐龙园">
					</a> -->
					<!-- 推荐位 结束 -->
	            </div>
	            <!--热门模块--景点门票--结束-->
				<!--热门模块--结束-->
				
	        </div>
	        <!--景点门票板块-->
	        
	        <!--跟团游板块 -->
	    	<div id="packageTourPlate" class="lv_s_list lv_s_group">
	        	<!--出发地和搜索框-->
	            <ul class="lv_s_ipt">
	            	<li style="display:block;">
	                    <div class="lv_s_table clearfix">
	                        <div class="lv_s_td">
	                            <div class="lv_s_t">出发地</div>
	                            <div class="lv_s_city_all" tabindex="0" onblur="hidePackageTourPlateChangeCity()">
	                                <div class="lv_s_city_btn js_s_city_btn" onclick="showPackageTourPlateChangeCity()">
	                                    <b class="searchCurrentCity" cid="38">上海</b><i class="lv_s_arrow"></i>
	                                </div>
									<div class="lv_s_city js_all_city">
										<div class="search-station-hot">
											<h4>热门出发城市</h4>
											<div class="list clearfix">
												<a onclick="packageTourPlatesearchBoxChangeCity(37,'上海')">上海</a> 
												<a onclick="packageTourPlatesearchBoxChangeCity(124,'苏州')">苏州</a>
											</div>
										</div>
										<div class="search-station-cities">
											<ul id="packageTourPlanLetter" class="nav-tabs clearfix">
												<li class="active" onclick="changeSearchBoxByLetterChangeCity($('#packageTourPlanLetter'),0)">ABCD<i></i></li>
												<li onclick="changeSearchBoxByLetterChangeCity($('#packageTourPlanLetter'),1)">EFGH<i></i></li>
												<li onclick="changeSearchBoxByLetterChangeCity($('#packageTourPlanLetter'),2)">JKLM<i></i></li>
												<li onclick="changeSearchBoxByLetterChangeCity($('#packageTourPlanLetter'),3)">NOPQRS<i></i></li>
												<li onclick="changeSearchBoxByLetterChangeCity($('#packageTourPlanLetter'),4)">TUVWX<i></i></li>
												<li onclick="changeSearchBoxByLetterChangeCity($('#packageTourPlanLetter'),5)">YZ<i></i></li>
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
															<a class="city" data-id="82" data-name="蚌埠"
																data-code="BB">蚌埠</a><a class="city" data-id="94"
																data-name="保定" data-code="BD">保定</a><a class="city"
																data-id="332" data-name="宝鸡" data-code="BJ">宝鸡</a><a
																class="city" data-id="112" data-name="包头"
																data-code="BT">包头</a><a class="city" data-id="211"
																data-name="北海" data-code="BH">北海</a><a class="city"
																data-id="13" data-name="北京" data-code="BJ">北京</a><a
																class="city" data-id="189" data-name="滨州"
																data-code="BZ">滨州</a><a class="city" data-id="3171"
																data-name="博乐市" data-code="BLS">博乐市</a>
														</dd>
													</dl>
													<dl class="clearfix">
														<dt>C</dt>
														<dd class="clearfix">
															<a class="city" data-id="97" data-name="沧州"
																data-code="CZ">沧州</a><a class="city" data-id="137"
																data-name="长春" data-code="CC">长春</a><a class="city"
																data-id="314" data-name="常德" data-code="CD">常德</a><a
																class="city" data-id="308" data-name="长沙"
																data-code="CS">长沙</a><a class="city" data-id="59"
																data-name="常州" data-code="CZ">常州</a><a class="city"
																data-id="258" data-name="成都" data-code="CD">成都</a><a
																class="city" data-id="31" data-name="重庆" data-code="CQ">重庆</a><a
																class="city" data-id="146" data-name="滁州"
																data-code="CZ">滁州</a>
														</dd>
													</dl>
													<dl class="clearfix">
														<dt>D</dt>
														<dd class="clearfix">
															<a class="city" data-id="245" data-name="大理"
																data-code="DL">大理</a><a class="city" data-id="124"
																data-name="大连" data-code="DL">大连</a><a class="city"
																data-id="101" data-name="大同" data-code="DT">大同</a><a
																class="city" data-id="272" data-name="达州"
																data-code="DZ">达州</a><a class="city" data-id="187"
																data-name="德州" data-code="DZ">德州</a><a class="city"
																data-id="202" data-name="东莞" data-code="DG">东莞</a><a
																class="city" data-id="178" data-name="东营"
																data-code="DY">东营</a>
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
																class="city" data-id="154" data-name="福州"
																data-code="FZ">福州</a>
														</dd>
													</dl>
													<dl class="clearfix">
														<dt>G</dt>
														<dd class="clearfix">
															<a class="city" data-id="169" data-name="赣州"
																data-code="GZ">赣州</a><a class="city" data-id="264"
																data-name="广元" data-code="GY">广元</a><a class="city"
																data-id="322" data-name="广州" data-code="GZ">广州</a><a
																class="city" data-id="209" data-name="桂林"
																data-code="GL">桂林</a><a class="city" data-id="224"
																data-name="贵阳" data-code="GY">贵阳</a>
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
																class="city" data-id="336" data-name="汉中"
																data-code="HZ">汉中</a><a class="city" data-id="80"
																data-name="合肥" data-code="HF">合肥</a><a class="city"
																data-id="46" data-name="鹤岗" data-code="HG">鹤岗</a><a
																class="city" data-id="99" data-name="衡水" data-code="HS">衡水</a><a
																class="city" data-id="311" data-name="衡阳"
																data-code="HY">衡阳</a><a class="city" data-id="190"
																data-name="菏泽" data-code="HZ">菏泽</a><a class="city"
																data-id="63" data-name="淮安" data-code="HA">淮安</a><a
																class="city" data-id="85" data-name="淮北" data-code="HB">淮北</a><a
																class="city" data-id="88" data-name="黄山市"
																data-code="HSS">黄山市</a><a class="city" data-id="111"
																data-name="呼和浩特" data-code="HHHT">呼和浩特</a><a
																class="city" data-id="196" data-name="惠州"
																data-code="HZ">惠州</a><a class="city" data-id="117"
																data-name="呼伦贝尔" data-code="HLBE">呼伦贝尔</a><a
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
																class="city" data-id="188" data-name="聊城"
																data-code="LC">聊城</a><a class="city" data-id="238"
																data-name="丽江" data-code="LJ">丽江</a><a class="city"
																data-id="186" data-name="临沂" data-code="LY">临沂</a><a
																class="city" data-id="79" data-name="丽水" data-code="LS">丽水</a><a
																class="city" data-id="150" data-name="六安"
																data-code="LA">六安</a><a class="city" data-id="320"
																data-name="娄底" data-code="LD">娄底</a><a class="city"
																data-id="193" data-name="洛阳" data-code="LY">洛阳</a><a
																class="city" data-id="261" data-name="泸州"
																data-code="LZ">泸州</a>
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
																class="city" data-id="285" data-name="南阳"
																data-code="NY">南阳</a><a class="city" data-id="70"
																data-name="宁波" data-code="NB">宁波</a>
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
																class="city" data-id="173" data-name="上饶"
																data-code="SR">上饶</a><a class="city" data-id="326"
																data-name="汕头" data-code="ST">汕头</a><a class="city"
																data-id="74" data-name="绍兴" data-code="SX">绍兴</a><a
																class="city" data-id="123" data-name="沈阳"
																data-code="SY">沈阳</a><a class="city" data-id="324"
																data-name="深圳" data-code="SZ">深圳</a><a class="city"
																data-id="89" data-name="石家庄" data-code="SJZ">石家庄</a><a
																class="city" data-id="47" data-name="双鸭山"
																data-code="SYS">双鸭山</a><a class="city" data-id="68"
																data-name="宿迁" data-code="SQ">宿迁</a><a class="city"
																data-id="60" data-name="苏州" data-code="SZ">苏州</a>
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
																class="city" data-id="310" data-name="湘潭"
																data-code="XT">湘潭</a><a class="city" data-id="333"
																data-name="咸阳" data-code="XY">咸阳</a><a class="city"
																data-id="93" data-name="邢台" data-code="XT">邢台</a><a
																class="city" data-id="354" data-name="西宁"
																data-code="XN">西宁</a><a class="city" data-id="244"
																data-name="西双版纳" data-code="XSBN">西双版纳</a>
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
																class="city" data-id="179" data-name="烟台"
																data-code="YT">烟台</a><a class="city" data-id="270"
																data-name="宜宾" data-code="YB">宜宾</a><a class="city"
																data-id="294" data-name="宜昌" data-code="YC">宜昌</a><a
																class="city" data-id="171" data-name="宜春"
																data-code="YC">宜春</a><a class="city" data-id="362"
																data-name="银川" data-code="YC">银川</a><a class="city"
																data-id="130" data-name="营口" data-code="YK">营口</a><a
																class="city" data-id="168" data-name="鹰潭"
																data-code="YT">鹰潭</a><a class="city" data-id="313"
																data-name="岳阳" data-code="YY">岳阳</a><a class="city"
																data-id="337" data-name="榆林" data-code="YL">榆林</a>
														</dd>
													</dl>
													<dl class="clearfix">
														<dt>Z</dt>
														<dd class="clearfix">
															<a class="city" data-id="315" data-name="张家界"
																data-code="ZJJ">张家界</a><a class="city" data-id="159"
																data-name="漳州" data-code="ZZ">漳州</a><a class="city"
																data-id="191" data-name="郑州" data-code="ZZ">郑州</a><a
																class="city" data-id="203" data-name="中山"
																data-code="ZS">中山</a><a class="city" data-id="77"
																data-name="舟山" data-code="ZS">舟山</a><a class="city"
																data-id="325" data-name="珠海" data-code="ZH">珠海</a><a
																class="city" data-id="309" data-name="株洲"
																data-code="ZZ">株洲</a><a class="city" data-id="176"
																data-name="淄博" data-code="ZB">淄博</a>
														</dd>
													</dl></li>
											</ul>
										</div>
									</div>
								</div>
	                        </div>
	                        <div class="lv_s_td ml10">
	                            <div class="lv_s_t">目的地</div>
	                            <input class="lv_s_input js_s_input w_310" value="请输入目的地、主题、或关键词" type="text" autocomplete="off" style="color: rgb(187, 187, 187);" onfocus="searchBoxOnFocus(this,'请输入目的地、主题、或关键词',3)" onblur="searchBoxOnBlur(this,'请输入目的地、主题、或关键词',3)" onkeyup="findTravelPlanBySearchVal(3,this)">
	                        </div>
	                    </div>
	                </li>
	            </ul>
	        	
	            
	            <!--搜索按钮--开始-->
	            <div class="lv_s_search lv_s_search_quality_box">
	                <span class="lv_s_search_btn" onclick="packageTourPlateSearchBoxSearch()">搜索</span>
	            </div>
	            <!--搜索按钮--结束-->
	            
	            <!--热门模块--开始-->
	            <div class="lv_s_hot" style="display:block;">
					<div class="lv_s_hot_list">
            	
		            	<dl>
		                	<dt>国内热门</dt>
		                    <dd>
		                    </dd>
		                </dl>
		            	<dl class="recomHide">
		                	<dt>周边热门</dt>
		                    <dd>
		                    </dd>
		                </dl>
					</div>
		            <!-- 推荐位 开始 -->
					<!-- 推荐位 结束 -->

	            </div>
	            <!--热门模块--结束-->
	        </div>
			<!-- 跟团游模块 结束 -->

	        <!--当地游板块 -->
	    	<div id="wxclubPlate" class="lv_s_list lv_s_local">
	        	<ul class="lv_s_ipt mt15">
		        	<li style="display:block;"><input type="text" autocomplete="off" value="请输入目的地、主题、或关键词" class="lv_s_input js_s_input w_419" style="color: rgb(187, 187, 187);" onfocus="searchBoxOnFocus(this,'请输入目的地、主题、或关键词',6)" onblur="searchBoxOnBlur(this,'请输入目的地、主题、或关键词',6)" onkeyup="findTravelPlanBySearchVal(6,this)"></li>
		        </ul>
            
	            <!--搜索按钮--开始-->
	            <div class="lv_s_search lv_s_search_quality_box">
	                <span class="lv_s_search_btn" onclick="wxclubPlatePlateSearchBoxSearch()">搜索</span>
	            </div>
	            <!--搜索按钮--结束-->
	            
	            <!--热门模块--开始-->
	            <div class="lv_s_hot" style="display:block;">
               		<div class="lv_s_hot_list hasRecom">
		            	<dl>
		                	<dt>热门推荐</dt>
		                    <dd>
		                    </dd>
		                </dl>
	                </div>
	                <!-- 推荐位 开始 -->
					<!-- <a onclick="cmcTag(&#39;首页-PC-上海-左侧导航-04-当地游-松赞&#39;,&#39;PC首页左侧导航&#39;);" href="http://zt.lvmama.com/subject/songtsam-1565" target="_blank" class="lv_s_pic" style="display:block;"><img src="image/1521611480204.jpg" width="440" height="65" alt="松赞"></a> -->
					<!-- 推荐位 结束 -->
	            </div>
	            <!--热门模块--结束-->
	        </div>
	    </div>
	</div>	
	<!-- 广告图片 开始 -->
	<div id="pushSealingAdvertising" class="lv-ban-wrap-all">
		<div class="lv-ban-wrap">
            <div id="index_banner">
            	<ul class="lv-ban-imgs" id="js_allyes_1">
            	</ul>
            </div>
			<!-- ban交互状态按钮 开始 -->
			<ul class="lv-ban-tab">
				<li class="active" onmouseover="changePushSealingAdvertisingImage(0)"></li>
				<li onmouseover="changePushSealingAdvertisingImage(1)"></li>
				<li onmouseover="changePushSealingAdvertisingImage(2)"></li>
				<li onmouseover="changePushSealingAdvertisingImage(3)"></li>
				<li onmouseover="changePushSealingAdvertisingImage(4)"></li>
			</ul>
			<!-- ban交互状态按钮 结果 -->
		</div>
	</div>
	<!-- 广告图片结束 -->
</div>


<div class="wrap">
	<!-- 国内游 开始 -->
	<div id="domesticTourismPlan" class="public clearfix count-first guonei" data-count-first="国内游">
	   	<div class="public-tit">
	       	<h3 class="fl"><strong>国内游</strong></h3>
	        <!-- 热门城市 -->
	        <ul class="JS_publicTab public-sub">
	        </ul>
	        <!-- 热门城市更多内容 -->
	        <div class="public-tit-more fr">
			</div>
	    </div>
	
		<div class="public-box clearfix">
			<div class="public-aside fl">
				<div class="asideNav">
					<h3>热门线路玩法</h3>
					<div class="asideNav-list">
					</div>
				</div>
				<span class="syicon asideRaido"></span>
				<span class="syicon asideRaido r"></span>
				<!-- <a onclick="cmcTag(&#39;首页-PC-上海-P4-国内游-云南&#39;,&#39;PC首页PART4国内游&#39;);" href="http://s.lvmama.com/group/H9K310000?keyword=%E4%BA%91%E5%8D%97&amp;tabType=route350#list" target="_blank" class="asideLink"><img src="image/1535680831368.jpg" width="222" height="265"></a> -->
			</div>
			<!-- 热门城市的景点路线 -->
			<div class="pro fl js_pro">
				
			</div>
		</div>
	</div>
	<!-- 国内游 结束 -->
	
	<!-- 周边游 开始 -->
	<div id="gettingAroundPlan" class="public clearfix count-first zhoubian" data-count-first="周边游">
	   	<div class="public-tit">
	    	<h3 class="fl"><strong>周边游</strong></h3>
	    	<!-- 热门城市 -->
	        <ul class="JS_publicTab public-sub">
	        </ul>
	        <!-- 热门城市更多内容 -->
            <div class="public-tit-more fr">
         	</div>
		</div>
	
	    <div class="public-box clearfix">
	       	
	       	<div class="public-aside fl">
				<div class="asideNav">
					<h3>热门线路玩法</h3>
					<div class="asideNav-list">
					</div>
				</div>
				<span class="syicon asideRaido"></span>
				<span class="syicon asideRaido r"></span>
				<!-- <a onclick="cmcTag(&#39;首页-PC-上海-P5-周边游-目的地-上海&#39;,&#39;PC首页PART5周边游&#39;);" href="http://s.lvmama.com/scenictour/K320100?keyword=%E4%B8%8A%E6%B5%B7&amp;k=0#list" target="_blank" class="asideLink"><img src="image/8199a1d8-558a-4480-a07d-ba3a27fc9b82.jpg" width="222" height="265"></a> -->
			</div>
			<!-- 热门城市的景点路线 -->
			<div class="pro fl js_pro">
				
			</div>
	       </div>
	</div>	
	<!-- 周边游 结束 -->
	
	<!-- 旅游局合作开始 -->
	<div class="footLink">
		<div class="public-tit">
		   <h3 class="fl"><strong>官方合作</strong></h3>
		</div>
		<div class="footLink-scroll">
			<ul>
		    <li><a href="http://www.lvmama.com/zt/promo/songjiang/" target="_blank" title="松江旅游局旗舰店"><img src="image/05a5de1b-f2ad-485f-bbb8-eb169da35a7f.jpg" alt="松江旅游局旗舰店" width="110" height="44"></a></li>
		    <li><a href="http://www.lvmama.com/zt/promo/hongkongdisney/" target="_blank" title="香港迪士尼"><img src="image/1494494247200.jpg" alt="香港迪士尼" width="110" height="44"></a></li>
		    <li><a href="http://www.lvmama.com/zt/promo/2018gzhcldjq/" target="_blank" title="长隆度假"><img src="image/1494494275922.jpg" alt="长隆度假" width="110" height="44"></a></li>
		    <li><a href="http://www.lvmama.com/zt/promo/luomeng/" target="_blank" title="罗蒙环球乐园"><img src="image/c9cf8fac-5db7-4112-95fc-94209407b230.jpg" alt="罗蒙环球乐园" width="110" height="44"></a></li>
		    <li><a href="http://www.lvmama.com/zt/u/wanda" target="_blank" title="万达乐园"><img src="image/eef1cede-5699-4706-bcb6-e93984daba46.jpg" alt="万达乐园" width="110" height="44"></a></li>
		    <li><a href="http://www.lvmama.com/zt/promo/liuzhou/" target="_blank" title="柳州旅游局旗舰店"><img src="image/1514346546373.jpg" alt="柳州旅游局旗舰店" width="110" height="44"></a></li>
		    <li><a href="http://www.lvmama.com/zt/promo/2018rjqjd/" target="_blank" title="瑞金旗舰店"><img src="image/ed60b017-37b6-49df-8473-9121393a6d42.jpg" alt="瑞金旗舰店" width="110" height="44"></a></li>
		   </ul>
		</div>
	</div>
	<!-- 旅游局合作结束-->
	
</div>
<!-- //wrap -->

<!-- 搜索框的自动搜索结果展示 开始 -->
<div id="searchResult" class="complete_box" style="display: none;" onmouseover="$('#searchResultFlag').html('true')" onmouseout="$('#searchResultFlag').html('false')">
	<span id="searchResultFlag" style="display: none;">false</span>
	<ul class="complete_list">
		<!-- 单个搜索的结果
		<li class="js_match"><a
			href="http://s.lvmama.com/ticket/K130100?keyword=%E4%B8%8A%E6%B5%B7&amp;k=1#list"
			data-place="上海" title="上海"><span>上海</span></a></li>
		<li class="js_match"><a
			href="http://s.lvmama.com/ticket/K130100?keyword=%E4%B8%8A%E6%B5%B7%E8%BF%AA%E5%A3%AB%E5%B0%BC%E4%B9%90%E5%9B%AD&amp;k=1#list"
			data-place="上海迪士尼乐园" title="上海迪士尼乐园"><span>上海</span>迪士尼乐园</a></li>
		<li class="js_match"><a
			href="http://s.lvmama.com/ticket/K130100?keyword=%E4%B8%8A%E6%B5%B7%E6%B5%B7%E6%B4%8B%E6%B0%B4%E6%97%8F%E9%A6%86&amp;k=1#list"
			data-place="上海海洋水族馆" title="上海海洋水族馆"><span>上海</span>海洋水族馆</a></li> -->
		<!-- 全部搜索的结果
		<li class="item" data-search-value="北京的全部旅游产品"
			data-url="http://s.lvmama.com/route/H100?keyword=%E5%8C%97%E4%BA%AC"
			data-generate-id="as0dc-2ga3vt2h-1-4-01"><div class="result">约501个结果</div>
			<div class="blank">
				<i class="icon-product"></i>
			</div>
			<div class="complete_title">
				北京的全部旅游产品 <span class="complete_tips"> </span>
			</div>
		</li>
		<li class="item item-sub" data-search-value="北京自由行"
			data-url="http://s.lvmama.com/freetour/H100?keyword=%E5%8C%97%E4%BA%AC"
			data-generate-id="as0dc-2ga3vt2h-1-4-01-01"><div class="result">约307个结果</div>
			<div class="blank"></div>北京自由行<span class="complete_tips"> </span>
		</li>
		<li class="item item-sub" data-search-value="北京跟团游"
			data-url="http://s.lvmama.com/group/H100?keyword=%E5%8C%97%E4%BA%AC"
			data-generate-id="as0dc-2ga3vt2h-1-4-01-02"><div class="result">约101个结果</div>
			<div class="blank"></div>北京跟团游<span class="complete_tips"> </span>
		</li>
		<li class="item item-sub" data-search-value="北京酒店+景点"
			data-url="http://s.lvmama.com/scenictour/H100?keyword=%E5%8C%97%E4%BA%AC"
			data-generate-id="as0dc-2ga3vt2h-1-4-01-03"><div class="result">约255个结果</div>
			<div class="blank"></div>北京酒店+景点<span class="complete_tips">
			</span>
		</li>
		<li class="item item-sub" data-search-value="北京当地游"
			data-url="http://s.lvmama.com/local/H100?keyword=%E5%8C%97%E4%BA%AC"
			data-generate-id="as0dc-2ga3vt2h-1-4-01-04"><div class="result">约168个结果</div>
			<div class="blank"></div>北京当地游<span class="complete_tips"> </span>
		</li>
		<li class="item" data-search-value="北京的门票"
			data-url="http://s.lvmama.com/ticket/H100?keyword=%E5%8C%97%E4%BA%AC"
			data-generate-id="as0dc-2ga3vt2h-1-4-03"><div class="result">约228个结果</div>
			<div class="blank">
				<i class="icon-ticket"></i>
			</div>
			<div class="complete_title">
				北京的门票 <span class="complete_tips"> </span>
			</div>
		</li>
		<li class="item" data-search-value="北京欢乐谷"
			data-url="http://www.lvmama.com/tuangou/deal-172316"
			data-generate-id="as0dc-2ga3vt2h-1-4-04"><div class="result">
				<dfn>￥30</dfn>
				起
			</div>
			<div class="blank">
				<i class="icon-view"></i>
			</div>
			<div class="complete_title">
				北京欢乐谷 <span class="complete_tips"> 北京</span>
			</div>
		</li>
		<li class="item" data-search-value="顺景温泉"
			data-url="http://ticket.lvmama.com/scenic-151645"
			data-generate-id="as0dc-2ga3vt2h-1-4-05"><div class="result">
				<dfn>￥340</dfn>
				起
			</div>
			<div class="blank">
				<i class="icon-view"></i>
			</div>
			<div class="complete_title">
				顺景温泉 <span class="complete_tips"> 北京</span>
			</div>
		</li>
		<li class="item" data-search-value="北京野生动物园"
			data-url="http://ticket.lvmama.com/scenic-108252"
			data-generate-id="as0dc-2ga3vt2h-1-4-06"><div class="result">
				<dfn>￥110</dfn>
				起
			</div>
			<div class="blank">
				<i class="icon-view"></i>
			</div>
			<div class="complete_title">
				北京野生动物园 <span class="complete_tips"> 北京</span>
			</div>
		</li>
		<li class="item" data-search-value="故宫"
			data-url="http://ticket.lvmama.com/scenic-100441"
			data-generate-id="as0dc-2ga3vt2h-1-4-07"><div class="result">
				<dfn>￥26</dfn>
				起
			</div>
			<div class="blank">
				<i class="icon-view"></i>
			</div>
			<div class="complete_title">
				故宫 <span class="complete_tips"> 北京</span>
			</div>
		</li>
		<li class="item" data-search-value="慕田峪长城"
			data-url="http://ticket.lvmama.com/scenic-100533"
			data-generate-id="as0dc-2ga3vt2h-1-4-08"><div class="result">
				<dfn>￥18</dfn>
				起
			</div>
			<div class="blank">
				<i class="icon-view"></i>
			</div>
			<div class="complete_title">
				慕田峪长城 <span class="complete_tips"> 北京</span>
			</div>
		</li>
		<li class="item" data-search-value="长滩岛"
			data-url="http://s.lvmama.com/route/H100?keyword=%E9%95%BF%E6%BB%A9%E5%B2%9B"
			data-generate-id="as0dc-2ga3vt2h-1-4-09"><div class="result"></div>
			<div class="blank">
				<i class="icon-point"></i>
			</div>
			<div class="complete_title">
				长滩岛 <span class="complete_tips"> </span>
			</div>
		</li>
		<li class="item" data-search-value="巴厘岛"
			data-url="http://s.lvmama.com/route/H100?keyword=%E5%B7%B4%E5%8E%98%E5%B2%9B"
			data-generate-id="as0dc-2ga3vt2h-1-4-10"><div class="result"></div>
			<div class="blank">
				<i class="icon-point"></i>
			</div>
			<div class="complete_title">
				巴厘岛 <span class="complete_tips"> </span>
			</div>
		</li> 
		-->
	</ul>
</div>
<!-- 搜索框的自动搜索结果展示 结束 -->

<!-- 底部页面 开始 -->
<jsp:include page="floor.jsp"></jsp:include>
<!-- 底部页面 结束 -->
<script type="text/javascript" src="js/index.js"></script>
</body>
</html>