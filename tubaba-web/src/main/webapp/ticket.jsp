<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="background-color: rgb(204, 232, 207);">

<head>
<meta charset="utf-8">
<meta name="mobile-agent" content="format=html5;">
<title>景点门票</title>
<link rel="canonical" href="http://ticket.lvmama.com/">
<link rel="stylesheet"
	href="http://pic.lvmama.com/min/index.php?f=/styles/v6/header_new.css,/styles/channel/ticket/v1/ticket.css,/styles/lv/buttons.css">
</head>

<body class="ticket" allyes_city="SZ"
	style="background-color: rgb(204, 232, 207);">
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<jsp:include page="head.jsp"></jsp:include>
	<!-- 首屏banner -->
	<div class="banWrap">
		<div class="wrap">
			<div class="lv_s_box">
				<div class="lv_s_l ticket_icon">
					<span class="cloud1 ticket_icon"></span> <span
						class="cloud2 ticket_icon"></span> <span
						class="cloud3 ticket_icon"></span>
				</div>
				<!--top搜索框  -->
				<div class="lv_s_all">
					<!--景点门票板块-->
					<div class="lv_s_input_box"
						style="background-color: rgb(204, 232, 207);">
						<!-- 搜索框定位 -->
						<div class="lv_s_td">
							<div class="lv_s_city_all">
								<div class="lv_s_city_btn js_station_city_btn"
									style="background-color: rgb(204, 232, 207);">
									<i class="lv_s_mark ticket_icon"></i> <b data-id="9">${city }</b><i
										class="lv_s_arrow ticket_icon"></i>
								</div>
								<div class="lv_city_list_box js_ticket_station_city"
									style="background-color: rgb(204, 232, 207);">
									<ul class="lv_city_list_tab">
										<li class="active">热门城市<i class="ticket_icon"></i></li>
										<li>ABCD<i class="ticket_icon"></i></li>
										<li>EFGH<i class="ticket_icon"></i></li>
										<li>JKLM<i class="ticket_icon"></i></li>
										<li>NOPQRS<i class="ticket_icon"></i></li>
										<li>TUVWX<i class="ticket_icon"></i></li>
										<li>YZ<i class="ticket_icon"></i></li>
									</ul>
									<ul class="lv_city_list">
										<li style="display:block;"><a href="javascript:;"
											destid="1" parentdestid="">北京</a> <a href="javascript:;"
											destid="79" parentdestid="">上海</a> <a href="javascript:;"
											destid="229" parentdestid="">广州</a> <a href="javascript:;"
											destid="231" parentdestid="">深圳</a> <a href="javascript:;"
											destid="279" parentdestid="">成都</a> <a href="javascript:;"
											destid="199" parentdestid="">武汉</a> <a href="javascript:;"
											destid="277" parentdestid="">重庆</a> <a href="javascript:;"
											destid="104" parentdestid="">宁波</a> <a href="javascript:;"
											destid="10047600" parentdestid="">黄山市</a> <a
											href="javascript:;" destid="82" parentdestid="">南京</a> <a
											href="javascript:;" destid="83" parentdestid="">无锡</a> <a
											href="javascript:;" destid="2" parentdestid="">天津</a> <a
											href="javascript:;" destid="87" parentdestid="">苏州</a> <a
											href="javascript:;" destid="16" parentdestid="">太原</a> <a
											href="javascript:;" destid="182" parentdestid="">洛阳</a> <a
											href="javascript:;" destid="340" parentdestid="">西安</a></li>

										<li><dl class="lv_city_list_dl">
												<dt>A</dt>
												<dd>
													<a href="javascript:;" destid="118" parentdestid="118">安徽</a><a
														href="javascript:;" destid="400" parentdestid="400">澳门</a><a
														href="javascript:;" destid="126" parentdestid="118">安庆</a><a
														href="javascript:;" destid="40" parentdestid="27">阿拉善盟</a><a
														href="javascript:;" destid="184" parentdestid="179">安阳</a><a
														href="javascript:;" destid="304" parentdestid="300">安顺</a><a
														href="javascript:;" destid="348" parentdestid="339">安康</a><a
														href="javascript:;" destid="396" parentdestid="3549">阿勒泰</a><a
														href="javascript:;" destid="44" parentdestid="41">鞍山</a><a
														href="javascript:;" destid="297" parentdestid="278">阿坝</a><a
														href="javascript:;" destid="337" parentdestid="331">阿里</a><a
														href="javascript:;" destid="390" parentdestid="3549">阿克苏</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>B</dt>
												<dd>
													<a href="javascript:;" destid="1" parentdestid="1">北京</a><a
														href="javascript:;" destid="121" parentdestid="118">蚌埠</a><a
														href="javascript:;" destid="3696" parentdestid="118">亳州</a><a
														href="javascript:;" destid="177" parentdestid="159">滨州</a><a
														href="javascript:;" destid="257" parentdestid="251">北海</a><a
														href="javascript:;" destid="262" parentdestid="251">百色</a><a
														href="javascript:;" destid="9" parentdestid="3">保定</a><a
														href="javascript:;" destid="29" parentdestid="27">包头</a><a
														href="javascript:;" destid="35" parentdestid="27">巴彦淖尔</a><a
														href="javascript:;" destid="295" parentdestid="278">巴中</a><a
														href="javascript:;" destid="307" parentdestid="300">毕节</a><a
														href="javascript:;" destid="318" parentdestid="312">保山</a><a
														href="javascript:;" destid="342" parentdestid="339">宝鸡</a><a
														href="javascript:;" destid="354" parentdestid="350">白银</a><a
														href="javascript:;" destid="64" parentdestid="56">白城</a><a
														href="javascript:;" destid="200141" parentdestid="58">白山</a><a
														href="javascript:;" destid="46" parentdestid="41">本溪</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>C</dt>
												<dd>
													<a href="javascript:;" destid="277" parentdestid="277">重庆</a><a
														href="javascript:;" destid="86" parentdestid="80">常州</a><a
														href="javascript:;" destid="129" parentdestid="118">滁州</a><a
														href="javascript:;" destid="133" parentdestid="118">池州</a><a
														href="javascript:;" destid="248" parentdestid="228">潮州</a><a
														href="javascript:;" destid="266" parentdestid="251">崇左</a><a
														href="javascript:;" destid="11" parentdestid="3">承德</a><a
														href="javascript:;" destid="12" parentdestid="3">沧州</a><a
														href="javascript:;" destid="19" parentdestid="15">长治</a><a
														href="javascript:;" destid="31" parentdestid="27">赤峰</a><a
														href="javascript:;" destid="213" parentdestid="212">长沙</a><a
														href="javascript:;" destid="220" parentdestid="212">常德</a><a
														href="javascript:;" destid="223" parentdestid="212">郴州</a><a
														href="javascript:;" destid="279" parentdestid="278">成都</a><a
														href="javascript:;" destid="323" parentdestid="312">楚雄</a><a
														href="javascript:;" destid="57" parentdestid="56">长春</a><a
														href="javascript:;" destid="54" parentdestid="41">朝阳</a><a
														href="javascript:;" destid="200370" parentdestid="3549">昌吉回族</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>D</dt>
												<dd>
													<a href="javascript:;" destid="164" parentdestid="159">东营</a><a
														href="javascript:;" destid="175" parentdestid="159">德州</a><a
														href="javascript:;" destid="246" parentdestid="228">东莞</a><a
														href="javascript:;" destid="17" parentdestid="15">大同</a><a
														href="javascript:;" destid="283" parentdestid="278">德阳</a><a
														href="javascript:;" destid="293" parentdestid="278">达州</a><a
														href="javascript:;" destid="327" parentdestid="312">大理</a><a
														href="javascript:;" destid="328" parentdestid="312">德宏</a><a
														href="javascript:;" destid="3889" parentdestid="312">迪庆</a><a
														href="javascript:;" destid="362" parentdestid="350">定西</a><a
														href="javascript:;" destid="43" parentdestid="41">大连</a><a
														href="javascript:;" destid="47" parentdestid="41">丹东</a><a
														href="javascript:;" destid="72" parentdestid="66">大庆</a><a
														href="javascript:;" destid="3887" parentdestid="66">大兴安岭</a>
												</dd>
											</dl></li>
										<li><dl class="lv_city_list_dl">
												<dt>E</dt>
												<dd>
													<a href="javascript:;" destid="33" parentdestid="27">鄂尔多斯</a><a
														href="javascript:;" destid="204" parentdestid="198">鄂州</a><a
														href="javascript:;" destid="211" parentdestid="198">恩施</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>F</dt>
												<dd>
													<a href="javascript:;" destid="135" parentdestid="135">福建</a><a
														href="javascript:;" destid="130" parentdestid="118">阜阳</a><a
														href="javascript:;" destid="136" parentdestid="135">福州</a><a
														href="javascript:;" destid="155" parentdestid="145">抚州</a><a
														href="javascript:;" destid="234" parentdestid="228">佛山</a><a
														href="javascript:;" destid="258" parentdestid="251">防城港</a><a
														href="javascript:;" destid="45" parentdestid="41">抚顺</a><a
														href="javascript:;" destid="50" parentdestid="41">阜新</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>G</dt>
												<dd>
													<a href="javascript:;" destid="228" parentdestid="228">广东</a><a
														href="javascript:;" destid="251" parentdestid="251">广西</a><a
														href="javascript:;" destid="350" parentdestid="350">甘肃</a><a
														href="javascript:;" destid="300" parentdestid="300">贵州</a><a
														href="javascript:;" destid="152" parentdestid="145">赣州</a><a
														href="javascript:;" destid="229" parentdestid="228">广州</a><a
														href="javascript:;" destid="254" parentdestid="251">桂林</a><a
														href="javascript:;" destid="260" parentdestid="251">贵港</a><a
														href="javascript:;" destid="285" parentdestid="278">广元</a><a
														href="javascript:;" destid="292" parentdestid="278">广安</a><a
														href="javascript:;" destid="301" parentdestid="300">贵阳</a><a
														href="javascript:;" destid="365" parentdestid="350">甘南</a><a
														href="javascript:;" destid="379" parentdestid="375">固原</a><a
														href="javascript:;" destid="298" parentdestid="278">甘孜</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>H</dt>
												<dd>
													<a href="javascript:;" destid="3" parentdestid="3">河北</a><a
														href="javascript:;" destid="179" parentdestid="179">河南</a><a
														href="javascript:;" destid="267" parentdestid="267">海南</a><a
														href="javascript:;" destid="198" parentdestid="198">湖北</a><a
														href="javascript:;" destid="212" parentdestid="212">湖南</a><a
														href="javascript:;" destid="66" parentdestid="66">黑龙江</a><a
														href="javascript:;" destid="90" parentdestid="80">淮安</a><a
														href="javascript:;" destid="100" parentdestid="96">杭州</a><a
														href="javascript:;" destid="109" parentdestid="96">湖州</a><a
														href="javascript:;" destid="119" parentdestid="118">合肥</a><a
														href="javascript:;" destid="122" parentdestid="118">淮南</a><a
														href="javascript:;" destid="124" parentdestid="118">淮北</a><a
														href="javascript:;" destid="178" parentdestid="159">菏泽</a><a
														href="javascript:;" destid="240" parentdestid="228">惠州</a><a
														href="javascript:;" destid="243" parentdestid="228">河源</a><a
														href="javascript:;" destid="263" parentdestid="251">贺州</a><a
														href="javascript:;" destid="264" parentdestid="251">河池</a><a
														href="javascript:;" destid="271" parentdestid="267">海口</a><a
														href="javascript:;" destid="7" parentdestid="3">邯郸</a><a
														href="javascript:;" destid="14" parentdestid="3">衡水</a><a
														href="javascript:;" destid="28" parentdestid="27">呼和浩特</a><a
														href="javascript:;" destid="34" parentdestid="27">呼伦贝尔</a><a
														href="javascript:;" destid="200" parentdestid="198">黄石</a><a
														href="javascript:;" destid="208" parentdestid="198">黄冈</a><a
														href="javascript:;" destid="185" parentdestid="179">鹤壁</a><a
														href="javascript:;" destid="217" parentdestid="212">衡阳</a><a
														href="javascript:;" destid="225" parentdestid="212">怀化</a><a
														href="javascript:;" destid="324" parentdestid="312">红河</a><a
														href="javascript:;" destid="346" parentdestid="339">汉中</a><a
														href="javascript:;" destid="369" parentdestid="366">海北</a><a
														href="javascript:;" destid="374" parentdestid="366">海西</a><a
														href="javascript:;" destid="55" parentdestid="41">葫芦岛</a><a
														href="javascript:;" destid="67" parentdestid="66">哈尔滨</a><a
														href="javascript:;" destid="70" parentdestid="66">鹤岗</a><a
														href="javascript:;" destid="77" parentdestid="66">黑河</a><a
														href="javascript:;" destid="371" parentdestid="366">海南藏族</a><a
														href="javascript:;" destid="10047600" parentdestid="118">黄山市</a><a
														href="javascript:;" destid="368" parentdestid="366">海东</a>
												</dd>
											</dl></li>
										<li><dl class="lv_city_list_dl">
												<dt>J</dt>
												<dd>
													<a href="javascript:;" destid="56" parentdestid="56">吉林</a><a
														href="javascript:;" destid="80" parentdestid="80">江苏</a><a
														href="javascript:;" destid="145" parentdestid="145">江西</a><a
														href="javascript:;" destid="108" parentdestid="96">嘉兴</a><a
														href="javascript:;" destid="112" parentdestid="96">金华</a><a
														href="javascript:;" destid="160" parentdestid="159">济南</a><a
														href="javascript:;" destid="168" parentdestid="159">济宁</a><a
														href="javascript:;" destid="147" parentdestid="145">景德镇</a><a
														href="javascript:;" destid="153" parentdestid="145">吉安</a><a
														href="javascript:;" destid="3891" parentdestid="145">九江</a><a
														href="javascript:;" destid="236" parentdestid="228">江门</a><a
														href="javascript:;" destid="249" parentdestid="228">揭阳</a><a
														href="javascript:;" destid="20" parentdestid="15">晋城</a><a
														href="javascript:;" destid="205" parentdestid="198">荆门</a><a
														href="javascript:;" destid="207" parentdestid="198">荆州</a><a
														href="javascript:;" destid="3874" parentdestid="15">晋中</a><a
														href="javascript:;" destid="200279" parentdestid="179">焦作</a><a
														href="javascript:;" destid="352" parentdestid="350">嘉峪关</a><a
														href="javascript:;" destid="353" parentdestid="350">金昌</a><a
														href="javascript:;" destid="359" parentdestid="350">酒泉</a><a
														href="javascript:;" destid="58" parentdestid="56">吉林市</a><a
														href="javascript:;" destid="48" parentdestid="41">锦州</a><a
														href="javascript:;" destid="69" parentdestid="66">鸡西</a><a
														href="javascript:;" destid="74" parentdestid="66">佳木斯</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>K</dt>
												<dd>
													<a href="javascript:;" destid="181" parentdestid="179">开封</a><a
														href="javascript:;" destid="315" parentdestid="312">昆明</a><a
														href="javascript:;" destid="383" parentdestid="3549">克拉玛依</a><a
														href="javascript:;" destid="200375" parentdestid="3549">喀什地区</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>L</dt>
												<dd>
													<a href="javascript:;" destid="41" parentdestid="41">辽宁</a><a
														href="javascript:;" destid="89" parentdestid="80">连云港</a><a
														href="javascript:;" destid="117" parentdestid="96">丽水</a><a
														href="javascript:;" destid="173" parentdestid="159">莱芜</a><a
														href="javascript:;" destid="174" parentdestid="159">临沂</a><a
														href="javascript:;" destid="176" parentdestid="159">聊城</a><a
														href="javascript:;" destid="143" parentdestid="135">龙岩</a><a
														href="javascript:;" destid="253" parentdestid="251">柳州</a><a
														href="javascript:;" destid="265" parentdestid="251">来宾</a><a
														href="javascript:;" destid="13" parentdestid="3">廊坊</a><a
														href="javascript:;" destid="25" parentdestid="15">临汾</a><a
														href="javascript:;" destid="26" parentdestid="15">吕梁</a><a
														href="javascript:;" destid="182" parentdestid="179">洛阳</a><a
														href="javascript:;" destid="191" parentdestid="179">漯河</a><a
														href="javascript:;" destid="226" parentdestid="212">娄底</a><a
														href="javascript:;" destid="282" parentdestid="278">泸州</a><a
														href="javascript:;" destid="288" parentdestid="278">乐山</a><a
														href="javascript:;" destid="320" parentdestid="312">丽江</a><a
														href="javascript:;" destid="332" parentdestid="331">拉萨</a><a
														href="javascript:;" destid="338" parentdestid="331">林芝</a><a
														href="javascript:;" destid="351" parentdestid="350">兰州</a><a
														href="javascript:;" destid="363" parentdestid="350">陇南</a><a
														href="javascript:;" destid="364" parentdestid="350">临夏</a><a
														href="javascript:;" destid="60" parentdestid="56">辽源</a><a
														href="javascript:;" destid="51" parentdestid="41">辽阳</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>M</dt>
												<dd>
													<a href="javascript:;" destid="123" parentdestid="118">马鞍山</a><a
														href="javascript:;" destid="238" parentdestid="228">茂名</a><a
														href="javascript:;" destid="241" parentdestid="228">梅州</a><a
														href="javascript:;" destid="284" parentdestid="278">绵阳</a><a
														href="javascript:;" destid="290" parentdestid="278">眉山</a><a
														href="javascript:;" destid="76" parentdestid="66">牡丹江</a>
												</dd>
											</dl></li>
										<li><dl class="lv_city_list_dl">
												<dt>N</dt>
												<dd>
													<a href="javascript:;" destid="27" parentdestid="27">内蒙古</a><a
														href="javascript:;" destid="375" parentdestid="375">宁夏</a><a
														href="javascript:;" destid="82" parentdestid="80">南京</a><a
														href="javascript:;" destid="88" parentdestid="80">南通</a><a
														href="javascript:;" destid="104" parentdestid="96">宁波</a><a
														href="javascript:;" destid="142" parentdestid="135">南平</a><a
														href="javascript:;" destid="144" parentdestid="135">宁德</a><a
														href="javascript:;" destid="146" parentdestid="145">南昌</a><a
														href="javascript:;" destid="252" parentdestid="251">南宁</a><a
														href="javascript:;" destid="193" parentdestid="179">南阳</a><a
														href="javascript:;" destid="287" parentdestid="278">内江</a><a
														href="javascript:;" destid="289" parentdestid="278">南充</a><a
														href="javascript:;" destid="336" parentdestid="331">那曲</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>P</dt>
												<dd>
													<a href="javascript:;" destid="138" parentdestid="135">莆田</a><a
														href="javascript:;" destid="148" parentdestid="145">萍乡</a><a
														href="javascript:;" destid="183" parentdestid="179">平顶山</a><a
														href="javascript:;" destid="189" parentdestid="179">濮阳</a><a
														href="javascript:;" destid="281" parentdestid="278">攀枝花</a><a
														href="javascript:;" destid="321" parentdestid="312">普洱</a><a
														href="javascript:;" destid="358" parentdestid="350">平凉</a><a
														href="javascript:;" destid="52" parentdestid="41">盘锦</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>Q</dt>
												<dd>
													<a href="javascript:;" destid="366" parentdestid="366">青海</a><a
														href="javascript:;" destid="113" parentdestid="96">衢州</a><a
														href="javascript:;" destid="161" parentdestid="159">青岛</a><a
														href="javascript:;" destid="140" parentdestid="135">泉州</a><a
														href="javascript:;" destid="245" parentdestid="228">清远</a><a
														href="javascript:;" destid="259" parentdestid="251">钦州</a><a
														href="javascript:;" destid="6" parentdestid="3">秦皇岛</a><a
														href="javascript:;" destid="200304" parentdestid="198">潜江</a><a
														href="javascript:;" destid="306" parentdestid="300">黔西南</a><a
														href="javascript:;" destid="308" parentdestid="300">黔东南</a><a
														href="javascript:;" destid="310" parentdestid="300">黔南</a><a
														href="javascript:;" destid="316" parentdestid="312">曲靖</a><a
														href="javascript:;" destid="361" parentdestid="350">庆阳</a><a
														href="javascript:;" destid="68" parentdestid="66">齐齐哈尔</a><a
														href="javascript:;" destid="75" parentdestid="66">七台河</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>R</dt>
												<dd>
													<a href="javascript:;" destid="172" parentdestid="159">日照</a><a
														href="javascript:;" destid="335" parentdestid="331">日喀则</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>S</dt>
												<dd>
													<a href="javascript:;" destid="79" parentdestid="79">上海</a><a
														href="javascript:;" destid="278" parentdestid="278">四川</a><a
														href="javascript:;" destid="159" parentdestid="159">山东</a><a
														href="javascript:;" destid="15" parentdestid="15">山西</a><a
														href="javascript:;" destid="339" parentdestid="339">陕西</a><a
														href="javascript:;" destid="95" parentdestid="80">宿迁</a><a
														href="javascript:;" destid="87" parentdestid="80">苏州</a><a
														href="javascript:;" destid="111" parentdestid="96">绍兴</a><a
														href="javascript:;" destid="200147" parentdestid="118">宿州</a><a
														href="javascript:;" destid="139" parentdestid="135">三明</a><a
														href="javascript:;" destid="156" parentdestid="145">上饶</a><a
														href="javascript:;" destid="230" parentdestid="228">韶关</a><a
														href="javascript:;" destid="231" parentdestid="228">深圳</a><a
														href="javascript:;" destid="233" parentdestid="228">汕头</a><a
														href="javascript:;" destid="242" parentdestid="228">汕尾</a><a
														href="javascript:;" destid="272" parentdestid="267">三亚</a><a
														href="javascript:;" destid="4" parentdestid="3">石家庄</a><a
														href="javascript:;" destid="21" parentdestid="15">朔州</a><a
														href="javascript:;" destid="201" parentdestid="198">十堰</a><a
														href="javascript:;" destid="210" parentdestid="198">随州</a><a
														href="javascript:;" destid="3668" parentdestid="198">神农架</a><a
														href="javascript:;" destid="192" parentdestid="179">三门峡</a><a
														href="javascript:;" destid="194" parentdestid="179">商丘</a><a
														href="javascript:;" destid="218" parentdestid="212">邵阳</a><a
														href="javascript:;" destid="286" parentdestid="278">遂宁</a><a
														href="javascript:;" destid="349" parentdestid="339">商洛</a><a
														href="javascript:;" destid="59" parentdestid="56">四平</a><a
														href="javascript:;" destid="63" parentdestid="56">松原</a><a
														href="javascript:;" destid="377" parentdestid="375">石嘴山</a><a
														href="javascript:;" destid="42" parentdestid="41">沈阳</a><a
														href="javascript:;" destid="71" parentdestid="66">双鸭山</a><a
														href="javascript:;" destid="78" parentdestid="66">绥化</a><a
														href="javascript:;" destid="334" parentdestid="331">山南</a>
												</dd>
											</dl></li>
										<li><dl class="lv_city_list_dl">
												<dt>T</dt>
												<dd>
													<a href="javascript:;" destid="401" parentdestid="401">台湾</a><a
														href="javascript:;" destid="2" parentdestid="2">天津</a><a
														href="javascript:;" destid="94" parentdestid="80">泰州</a><a
														href="javascript:;" destid="115" parentdestid="96">台州</a><a
														href="javascript:;" destid="125" parentdestid="118">铜陵</a><a
														href="javascript:;" destid="200181" parentdestid="159">泰安</a><a
														href="javascript:;" destid="5" parentdestid="3">唐山</a><a
														href="javascript:;" destid="16" parentdestid="15">太原</a><a
														href="javascript:;" destid="32" parentdestid="27">通辽</a><a
														href="javascript:;" destid="200305" parentdestid="198">天门</a><a
														href="javascript:;" destid="305" parentdestid="300">铜仁</a><a
														href="javascript:;" destid="341" parentdestid="339">铜川</a><a
														href="javascript:;" destid="355" parentdestid="350">天水</a><a
														href="javascript:;" destid="61" parentdestid="56">通化</a><a
														href="javascript:;" destid="53" parentdestid="41">铁岭</a><a
														href="javascript:;" destid="402" parentdestid="401">台北</a><a
														href="javascript:;" destid="403" parentdestid="401">台中</a><a
														href="javascript:;" destid="405" parentdestid="401">台南</a><a
														href="javascript:;" destid="384" parentdestid="3549">吐鲁番</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>W</dt>
												<dd>
													<a href="javascript:;" destid="83" parentdestid="80">无锡</a><a
														href="javascript:;" destid="107" parentdestid="96">温州</a><a
														href="javascript:;" destid="120" parentdestid="118">芜湖</a><a
														href="javascript:;" destid="167" parentdestid="159">潍坊</a><a
														href="javascript:;" destid="171" parentdestid="159">威海</a><a
														href="javascript:;" destid="256" parentdestid="251">梧州</a><a
														href="javascript:;" destid="30" parentdestid="27">乌海</a><a
														href="javascript:;" destid="36" parentdestid="27">乌兰察布</a><a
														href="javascript:;" destid="199" parentdestid="198">武汉</a><a
														href="javascript:;" destid="325" parentdestid="312">文山</a><a
														href="javascript:;" destid="200333" parentdestid="339">渭南</a><a
														href="javascript:;" destid="356" parentdestid="350">武威</a><a
														href="javascript:;" destid="382" parentdestid="3549">乌鲁木齐</a><a
														href="javascript:;" destid="378" parentdestid="375">吴忠</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>X</dt>
												<dd>
													<a href="javascript:;" destid="3549" parentdestid="3549">新疆</a><a
														href="javascript:;" destid="331" parentdestid="331">西藏</a><a
														href="javascript:;" destid="398" parentdestid="398">香港</a><a
														href="javascript:;" destid="85" parentdestid="80">徐州</a><a
														href="javascript:;" destid="134" parentdestid="118">宣城</a><a
														href="javascript:;" destid="137" parentdestid="135">厦门</a><a
														href="javascript:;" destid="150" parentdestid="145">新余</a><a
														href="javascript:;" destid="8" parentdestid="3">邢台</a><a
														href="javascript:;" destid="24" parentdestid="15">忻州</a><a
														href="javascript:;" destid="38" parentdestid="27">兴安盟</a><a
														href="javascript:;" destid="39" parentdestid="27">锡林郭勒盟</a><a
														href="javascript:;" destid="206" parentdestid="198">孝感</a><a
														href="javascript:;" destid="209" parentdestid="198">咸宁</a><a
														href="javascript:;" destid="200294" parentdestid="198">襄阳</a><a
														href="javascript:;" destid="200303" parentdestid="198">仙桃</a><a
														href="javascript:;" destid="186" parentdestid="179">新乡</a><a
														href="javascript:;" destid="190" parentdestid="179">许昌</a><a
														href="javascript:;" destid="195" parentdestid="179">信阳</a><a
														href="javascript:;" destid="215" parentdestid="212">湘潭</a><a
														href="javascript:;" destid="227" parentdestid="212">湘西</a><a
														href="javascript:;" destid="326" parentdestid="312">西双版纳</a><a
														href="javascript:;" destid="340" parentdestid="339">西安</a><a
														href="javascript:;" destid="343" parentdestid="339">咸阳</a><a
														href="javascript:;" destid="367" parentdestid="366">西宁</a>
												</dd>
											</dl></li>
										<li><dl class="lv_city_list_dl">
												<dt>Y</dt>
												<dd>
													<a href="javascript:;" destid="312" parentdestid="312">云南</a><a
														href="javascript:;" destid="92" parentdestid="80">扬州</a><a
														href="javascript:;" destid="91" parentdestid="80">盐城</a><a
														href="javascript:;" destid="165" parentdestid="159">烟台</a><a
														href="javascript:;" destid="151" parentdestid="145">鹰潭</a><a
														href="javascript:;" destid="154" parentdestid="145">宜春</a><a
														href="javascript:;" destid="244" parentdestid="228">阳江</a><a
														href="javascript:;" destid="250" parentdestid="228">云浮</a><a
														href="javascript:;" destid="261" parentdestid="251">玉林</a><a
														href="javascript:;" destid="18" parentdestid="15">阳泉</a><a
														href="javascript:;" destid="23" parentdestid="15">运城</a><a
														href="javascript:;" destid="202" parentdestid="198">宜昌</a><a
														href="javascript:;" destid="219" parentdestid="212">岳阳</a><a
														href="javascript:;" destid="222" parentdestid="212">益阳</a><a
														href="javascript:;" destid="224" parentdestid="212">永州</a><a
														href="javascript:;" destid="291" parentdestid="278">宜宾</a><a
														href="javascript:;" destid="294" parentdestid="278">雅安</a><a
														href="javascript:;" destid="317" parentdestid="312">玉溪</a><a
														href="javascript:;" destid="345" parentdestid="339">延安</a><a
														href="javascript:;" destid="347" parentdestid="339">榆林</a><a
														href="javascript:;" destid="394" parentdestid="3549">伊犁</a><a
														href="javascript:;" destid="376" parentdestid="375">银川</a><a
														href="javascript:;" destid="3882" parentdestid="56">延边</a><a
														href="javascript:;" destid="49" parentdestid="41">营口</a><a
														href="javascript:;" destid="73" parentdestid="66">伊春</a><a
														href="javascript:;" destid="373" parentdestid="366">玉树</a>
												</dd>
											</dl>
											<dl class="lv_city_list_dl">
												<dt>Z</dt>
												<dd>
													<a href="javascript:;" destid="96" parentdestid="96">浙江</a><a
														href="javascript:;" destid="93" parentdestid="80">镇江</a><a
														href="javascript:;" destid="114" parentdestid="96">舟山</a><a
														href="javascript:;" destid="162" parentdestid="159">淄博</a><a
														href="javascript:;" destid="163" parentdestid="159">枣庄</a><a
														href="javascript:;" destid="141" parentdestid="135">漳州</a><a
														href="javascript:;" destid="232" parentdestid="228">珠海</a><a
														href="javascript:;" destid="237" parentdestid="228">湛江</a><a
														href="javascript:;" destid="239" parentdestid="228">肇庆</a><a
														href="javascript:;" destid="247" parentdestid="228">中山</a><a
														href="javascript:;" destid="10" parentdestid="3">张家口</a><a
														href="javascript:;" destid="180" parentdestid="179">郑州</a><a
														href="javascript:;" destid="196" parentdestid="179">周口</a><a
														href="javascript:;" destid="197" parentdestid="179">驻马店</a><a
														href="javascript:;" destid="214" parentdestid="212">株洲</a><a
														href="javascript:;" destid="221" parentdestid="212">张家界</a><a
														href="javascript:;" destid="280" parentdestid="278">自贡</a><a
														href="javascript:;" destid="296" parentdestid="278">资阳</a><a
														href="javascript:;" destid="303" parentdestid="300">遵义</a><a
														href="javascript:;" destid="319" parentdestid="312">昭通</a><a
														href="javascript:;" destid="357" parentdestid="350">张掖</a><a
														href="javascript:;" destid="380" parentdestid="375">中卫</a>
												</dd>
											</dl></li>
									</ul>
								</div>
							</div>
						</div>

						<input class="lv_s_input js_ticket_input" data-type="TICKET"
							data-searchbtn="js_ticket_search" value="请输入目的地、主题或景区名"
							type="text" autocomplete="off" num="0"
							style="background-color: rgb(204, 232, 207);">

						<div class="lv_s_input_hot js_s_input_hot" id="js_s_input_hot">
							<a href="http://ticket.lvmama.com/scenic-105140" target="_blank"
								title="世界之窗"
								onclick="cmcTag('门票频道页-PC-站点-P5-搜索框热词-001-世界之窗','PC门票频道页搜索框热词');"
								style="background-color: rgb(204, 232, 207);">世界之窗</a>
						</div>
					</div>
					<!--输入框上面覆盖的关键字  开始-->
					<div class="lv_s_input_hot js_s_input_hot"></div>
					<!--关键字  结束-->



					<!--搜索按钮  开始-->
					<span class="lv_s_search_btn" id="js_ticket_search"><i></i>搜索</span>
					<!--搜索按钮  结束-->
				</div>
			</div>

			<div class="main_top_box">
				<div class="main_top_l_all"
					style="background-color: rgb(204, 232, 207);">
					<div class="main_top_l">
						<!-- 当季热推 -->
						<div class="main_top_type">
							<h4>当季热推</h4>
							<div class="top_type_hot h44" id="top_type_hot1">
								<div class="ticket_icon top_type_arrow"></div>
							</div>
						</div>

						<!-- 热销排行 -->
						<div class="main_top_type">
							<h4>热销排行</h4>
							<div class="top_type_hot h44 hot_text_hidden"
								id="top_type_hot h44 hot_text_hidden">
								<div class="ticket_icon top_type_arrow"></div>
								<a onclick="" href="" target="_blank" title="白云山风景名胜区"><span
									class="hot_num1">1</span>白云山风景名胜区</a>
							</div>
						</div>

						<!-- 热销排行 -->
						<div class="main_top_type">
							<h4>精选主题</h4>
							<div class="top_type_hot h22" id="top_type_hot_h22">
								<div class="ticket_icon top_type_arrow"></div>
							</div>
						</div>

						<!-- 附近周边 -->
						<div class="main_top_type">
							<h4>周边附近</h4>
							<div class="top_type_hot h22" id="top_type_hot_h22_2">
								<a onclick="" target="_blank"
									href="http://dujia.lvmama.com/tour/changlong3941">长隆</a>
							</div>
						</div>

					</div>
					<div class="top_type_show"
						style="background-color: rgb(204, 232, 207); display: none;">
						<!-- 当季热推 右侧展开 -->
						<div class="top_type_list" style="display: none;">
							<div class="top_type_list1" id="top_type_list1">
								<a onclick="" target="_blank" href="#">深圳欢乐谷</a>

							</div>
						</div>

						<!-- 热销排行 右侧展开 -->
						<div class="top_type_list" style="display: none;">
							<div class="top_type_list1" id="top_type_list2">
								<!-- 从第五条开始显示-->
								<a
									onclick="cmcTag('门票频道页-PC-站点-导航-02-热销排行-展开-001-正佳极地海洋世界','PC门票频道页热销排行展开');"
									href="http://ticket.lvmama.com/scenic-10676970" target="_blank"
									title="正佳极地海洋世界"><span>5</span>正佳极地海洋世界</a>
							</div>
						</div>

						<!-- 精选主题 右侧展开 -->
						<div class="top_type_list" style="display: block;" id="dllist">
							<dl class="top_type_list2">
								<dt>主题乐园</dt>
								<dd>

									<a
										onclick="cmcTag('门票频道页-PC-站点-导航-03-精选主题-展开001-主题乐园-0001-东部华侨城','PC门票频道页精选主题展开001');"
										target="_blank"
										href="http://ticket.lvmama.com/scenic-122400?losc=067559&amp;ict=i">东部华侨城</a>
									<a
										onclick="cmcTag('门票频道页-PC-站点-导航-03-精选主题-展开001-主题乐园-0002-欢乐谷','PC门票频道页精选主题展开001');"
										target="_blank" href="http://ticket.lvmama.com/scenic-104960">欢乐谷</a>
									<a
										onclick="cmcTag('门票频道页-PC-站点-导航-03-精选主题-展开001-主题乐园-0003-珠海长隆海洋王国','PC门票频道页精选主题展开001');"
										target="_blank" href="http://ticket.lvmama.com/scenic-159567">珠海长隆海洋王国</a>
								</dd>
							</dl>
						</div>
					</div>
				</div>

				<!-- 焦点图模块 -->
				<!--最大的广告图  -->
				<div class="top_banner_all js_banner">
					<div class="banner_list_box">
						<ins id="ads_10_13_231"></ins>
						<!--最大的广告图轮换列表  -->
						<ul class="banner_list">
							<li style="display: none;"><a
								href="http://ticket.lvmama.com/scenic-120604" target="_blank"
								onclick="cmCreateElementTag()"><img
									src="http://pic.lvmama.com/uploads/pc/place2/2018-11-08/c4c22aa8-b322-4416-a7f8-3558753e0816.jpg"
									height="340" width="900"></a></li>
							<li style="display: none;"><a
								href="http://ticket.lvmama.com/scenic-10676970" target="_blank"
								onclick="cmCreateElementTag()"><img
									src="http://pic.lvmama.com/uploads/pc/place2/2018-10-16/f25d7204-ed1f-4751-afa4-6b4ac2425f25.jpg"
									height="340" width="900"></a></li>
							<li style="display: none;"><a
								href="http://ticket.lvmama.com/scenic-10701732" target="_blank"
								onclick="cmCreateElementTag('PC_广告系统_ONCLICK','10_13_229_345')"><img
									src="http://pic.lvmama.com/uploads/pc/place2/2018-11-08/7d392b03-063d-4d6c-b1dc-f0190c7841ad.jpg"
									height="340" width="900"></a></li>
							<li style="display: none;"><a
								href="http://ticket.lvmama.com/scenic-156211" target="_blank"
								onclick="cmCreateElementTag('PC_广告系统_ONCLICK','10_13_229_360')"><img
									src="http://pic.lvmama.com/uploads/pc/place2/2018-11-06/cb1d382c-54df-4eb8-ad9b-10768251dade.jpg"
									height="340" width="900"></a></li>
							<li style="display: list-item;"><a
								href="http://ticket.lvmama.com/scenic-152470" target="_blank"
								onclick="cmCreateElementTag('PC_广告系统_ONCLICK','10_13_229_372')"><img
									src="http://pic.lvmama.com/uploads/pc/place2/2018-10-08/c38077ac-3b88-41f7-8dcd-fa2f785a7742.jpg"
									height="340" width="900"></a></li>
							<li style="display: none;"><a
								href="http://ticket.lvmama.com/scenic-11352806" target="_blank"
								onclick="cmCreateElementTag('PC_广告系统_ONCLICK','10_13_229_374')"><img
									src="http://pic.lvmama.com/uploads/pc/place2/2018-10-29/76eaad83-18dd-42bf-aad7-2bc8b07ec23e.jpg"
									height="340" width="900"></a></li>
							<li style="display: none;"><a
								href="http://ticket.lvmama.com/scenic-11352617" target="_blank"
								onclick="cmCreateElementTag('PC_广告系统_ONCLICK','10_13_229_383')"><img
									src="http://pic.lvmama.com/uploads/pc/place2/2018-09-25/4e1c5957-04c8-4f93-8175-baa8076b2278.jpg"
									height="340" width="900"></a></li>
							<li style="display: none;"><a
								href="http://ticket.lvmama.com/scenic-11345294" target="_blank"
								onclick="cmCreateElementTag('PC_广告系统_ONCLICK','10_13_229_384')"><img
									src="http://pic.lvmama.com/uploads/pc/place2/2018-10-16/995130ee-8410-4185-9478-7d2a5831e5ff.jpg"
									height="340" width="900"></a></li>
							<li style="display: none;"><a
								href="http://ticket.lvmama.com/scenic-120603" target="_blank"
								onclick="cmCreateElementTag('PC_广告系统_ONCLICK','10_13_229_385')"><img
									src="http://pic.lvmama.com/uploads/pc/place2/2018-11-07/5036c539-160d-4e0a-9a24-3a90c776d1eb.jpg"
									height="340" width="900"></a></li>[10$
							<li style="display: none;"><a
								href="http://ticket.lvmama.com/scenic-11321609" target="_blank"
								onclick="cmCreateElementTag('PC_广告系统_ONCLICK','10_13_229_386')"><img
									src="http://pic.lvmama.com/uploads/pc/place2/2018-10-31/a12c58f3-9775-4283-abdf-407c378b84af.jpg"
									height="340" width="900"></a></li>
						</ul>
					</div>
					<!--表示广告图下标的小圆圈  -->
					<div class="banner_list_tab">
						<span class=""></span> <span class=""
							style="background-color: rgb(204, 232, 207);"></span> <span
							class="" style="background-color: rgb(204, 232, 207);"></span> <span
							class="" style="background-color: rgb(204, 232, 207);"></span> <span
							class="" style="background-color: rgb(204, 232, 207);"></span> <span
							class="" style="background-color: rgb(204, 232, 207);"></span> <span
							class="" style="background-color: rgb(204, 232, 207);"></span> <span
							class="active" style="background-color: rgb(204, 232, 207);"></span>
						<span class="" style="background-color: rgb(204, 232, 207);"></span>
						<span class="" style="background-color: rgb(204, 232, 207);"></span>
					</div>

					<div class="banBox-btn btnL pa">
						<i class="ticket_icon tIcon-banL"></i>
					</div>
					<div class="banBox-btn btnR pa">
						<i class="ticket_icon tIcon-banR"></i>
					</div>

				</div>

			</div>
		</div>

	</div>
	<!--//banWrap 首屏banner End -->

	<!--搜索框为空点击时显示的热搜等内容  -->
	<div class="ticket_search_hot"
		style="background-color: rgb(204, 232, 207); display: none; left: 500.5px; top: 254px;">
		<dl>
			<dt>热搜景点</dt>
			<dd style="height: 58px;" id="hotdd">
				<a href="#" onclick="cmcTag();">上海迪士尼乐园</a>
			</dd>
		</dl>
		<dl>
			<dt>热搜目的地</dt>
			<dd id="hotdd2">
				<a href="#" target="_blank" onclick="cmcTag();">天目湖</a>
			</dd>
		</dl>
	</div>
	<!-- 大促活动 开始 -->
	<div class="promotion_big_box"
		style="background-image: url(http://pic.lvmama.com/uploads/pc/place2/2018-10-29/3bf4c9a7-c446-4ab3-8f80-1302672977ff.jpg)">
		<div class="wrap">
			<h3 class="main_tit">双十一大促</h3>
			<ul class="promotion_list clearfix" id="huodongqu">
				<!-- 双十一产品 -->
				<li style="background-color: rgb(204, 232, 207);"><a
					href="http://ticket.lvmama.com/scenic-105140" target="_blank"
					onclick="">
						<div class="promotion_img_box">
							<img
								src="http://pic.lvmama.com/pics//uploads/pc/place2/2018-10-09/57d32fcb-d3ce-465e-bfa5-78f47034e478.jpg"
								width="222" height="150" alt="">
							<p class="promotion_comment ticket_icon">95.6% 好评</p>
						</div>
						<div class="promotion_footer">
							<h5 title="世界之窗">世界之窗</h5>
							<span class="btn btn-big btn-orange"
								href="http://ticket.lvmama.com/scenic-105140" target="_blank">抢购</span>
							<p>
								<span>¥<dfn>29.9</dfn></span>
								<samp>起</samp>
							</p>
						</div>
				</a></li>
			</ul>
			<a class="promotion_detail"
				href="http://zt.lvmama.com/subject/hn12-2256" target="_blank"
				onclick="cmcTag('门票频道页-PC-站点-P1-双十一大促-查看活动详情','PC门票频道页双十一大促详情');">查看活动详情&gt;</a>

		</div>
	</div>
	<!-- 大促活动 结束 -->

	<!-- 主体内容 -->
	<div class="wrap">
		<!-- 周末促销  开始 -->
		<!-- 周末促销  结束 -->
		<!-- 会员促销  开始 -->
		<!-- 会员促销  结束 -->
		<!-- 景点推荐 开始 -->
		<div class="main_box">
			<h3 class="main_tit">
				景点推荐<!-- <a id="smartShelfUrl" href="javascript:void(0);">查看更多<span>&gt;</span></a> -->
			</h3>
			<div class="main_content_box main_recommend clearfix" id="tuijiandiv">
				<!-- 景点推荐列表 -->
				<ul class="recommend_tab_t" id="recommend_tab_t">
				</ul>

				<!-- 城市列表 -->
				<!--几个城市就有几个这个div  -->
				<!-- <div class="recommend_list_content" style="display: block;">
					<div class="main_content_l ticket_icon">
						<ul class="recommend_tab_l">
						</ul>
					</div>
					几个主题就有几个这个ul
					<ul class="promotion_list clearfix" style="display: block;">
						<li style="background-color: rgb(204, 232, 207);"><a
							href="http://ticket.lvmama.com/scenic-122400" target="_blank"
							onclick="cmcTag('门票频道页-PC-站点-P4-景点推荐-深圳主题乐园-001-东部华侨城','PC门票频道页景点推荐');">
								<div class="promotion_img_box">
									<img
										src="http://pic.lvmama.com/uploads/pc/place2/2016-12-13/419ec9d6-2738-45d3-8f8f-e36c94b30e27.jpg"
										width="222" height="150" alt="">
								</div>
								<div class="promotion_footer">
									<h5 title="东部华侨城">东部华侨城</h5>
									<span class="promotion_comment_b">95.8% 好评</span>
									<p>
										<span>¥<dfn>100.0</dfn></span>
										<samp>起</samp>
									</p>
								</div>
						</a></li>
					</ul>
				</div> -->
			</div>
		</div>
		<!-- 景点推荐  结束 -->
		<!-- APP专享 -->
		<!-- APP专享 结束-->
		<!-- 专题活动 -->
		<div class="main_box">
			<h3 class="main_tit">官方旗舰店</h3>
			<div class="main_content_box main_zhuanti">
				<ul class="zhuanti_list clearfix">
					<li><a href="http://www.lvmama.com/zt/promo/hygy/"
						target="_blank"
						onclick="cmcTag('门票频道页-PC-站点-P5-专题活动-001-','PC门票频道页专题活动');">
							<h4></h4> <img
							src="http://pic.lvmama.com/uploads/pc/place2/2017-05-19/21a448d2-b897-4b6b-855b-77b9be131bae.jpg"
							width="283" height="120" alt="">
					</a></li>
					<li><a href="http://www.lvmama.com/zt/promo/2018gzhcldjq/ "
						target="_blank"
						onclick="cmcTag('门票频道页-PC-站点-P5-专题活动-002-','PC门票频道页专题活动');">
							<h4></h4> <img
							src="http://pic.lvmama.com/uploads/pc/place2/2017-05-19/8250b6b1-2e92-4d4d-ba3d-5a8678f3828d.jpg"
							width="283" height="120" alt="">
					</a></li>
					<li><a href="http://www.lvmama.com/zt/promo/hongkongdisney/"
						target="_blank"
						onclick="cmcTag('门票频道页-PC-站点-P5-专题活动-003-','PC门票频道页专题活动');">
							<h4></h4> <img
							src="http://pic.lvmama.com/uploads/pc/place2/2017-05-23/0871d930-5371-4016-9ea8-e90ee4f2e4c8.jpg"
							width="283" height="120" alt="">
					</a></li>
					<li><a href="http://www.lvmama.com/zt/u/wanda" target="_blank"
						onclick="cmcTag('门票频道页-PC-站点-P5-专题活动-004-','PC门票频道页专题活动');">
							<h4></h4> <img
							src="http://pic.lvmama.com/uploads/pc/place2/2018-03-08/688270fa-9d13-405d-bd4d-08142dfdd184.jpg"
							width="283" height="120" alt="">
					</a></li>
				</ul>
			</div>
		</div>
		<!-- 专题活动 结束-->
	</div>
	<div id="allmap"></div>
	<!-- 底部-->
	<script src="js/footer.js"></script>
	<!-- 公共底部结束  -->
	<!-- 	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ruZ3dRuxAk7IeNHdODBVHD1Gr2O7sRq9"></script>
 -->
	
	<script src="js/ticket.js"></script>
	<div class="hh_cooperate">
		<!-- 友情链接 -->
		<p>
			<b>友情链接：</b> <span> <a target="_blank"
				href="http://ticket.lvmama.com/scenic-10822149">合肥万达门票</a> <a
				target="_blank" href="http://ticket.lvmama.com/scenic-10690393">扬州乐园门票</a>
				<a target="_blank" href="http://shanghai.gongjiao.com">上海公交</a> <a
				target="_blank" href="http://www.16fan.com/">十六番</a> <a
				target="_blank" href="http://www.myvacation.cn">小众旅游</a> <a
				target="_blank" href="http://shenzhen.tianqi.com/">深圳天气</a> <a
				target="_blank" href="http://www.xaoyo.com">天气预报查询</a> <a
				target="_blank" href="http://huoche.mipang.com">火车票网上订票</a> <a
				target="_blank" href="http://www.itrip.com/">欧洲自由行</a> <a
				target="_blank" href="http://www.qimaren.com/">成都中国青年旅行社</a> <a
				target="_blank" href="http://www.92rank.com">中国猕猴桃网</a> <a
				target="_blank" href="http://www.jutuw.com/">峨眉山旅游</a> <a
				target="_blank" href="http://www.yousc.com/">四川旅游网</a> <a
				target="_blank" href="http://www.xishiqu.com/">上海演唱会门票</a> <a
				target="_blank" href="http://down.znds.com/">智能电视软件</a> <a
				target="_blank" href="http://www.zhcpic.com/">哲狐旅行问答</a> <a
				target="_blank" href="http://ticket.lvmama.com/scenic-121304">大宁郁金香公园</a>
				<a target="_blank" href="http://ticket.lvmama.com/scenic-10812324">上海中心大厦</a>
				<a target="_blank"
				href="http://flight.lvmama.com/booking/PEK-SHA.html">北京到上海机票</a> <a
				target="_blank" href="http://flight.lvmama.com/booking/SHA-PEK.html">上海到北京机票</a>
				<a target="_blank" href="http://www.cct.cn/">康辉旅游</a> <a
				target="_blank" href="http://ticket.lvmama.com/scenic-159996">云台山门票</a>
				<a target="_blank" href="http://ticket.lvmama.com/scenic-456">峨眉山门票</a>
				<a target="_blank" href="http://ticket.lvmama.com/scenic-127">黄山门票</a>
				<a target="_blank" href="http://ticket.lvmama.com/scenic-344">华山门票</a>
				<a target="_blank" href="http://ticket.lvmama.com/scenic-3577">长白山门票</a>
				<a target="_blank" href="http://ticket.lvmama.com/scenic-105307">织金洞门票</a>
				<a target="_blank" href="http://www.kanzhun.com">查工资</a> <a
				target="_blank" href="http://www.yjldp.com">长岛渔家乐</a> <a
				target="_blank" href="http://www.zxart.cn/">艺术网</a> <a
				target="_blank" href="http://www.syoits.com">金运之旅</a> <a
				target="_blank" href="http://ticket.lvmama.com/scenic-102901">乔家大院门票</a>
				<a target="_blank" href="http://ticket.lvmama.com/scenic-162087">平遥古城门票</a>
				<a target="_blank" href="http://ticket.lvmama.com/scenic-485">五台山门票</a>
				<a target="_blank" href="http://ticket.lvmama.com/scenic-175649">上海迪士尼门票</a>
				<a target="_blank"
				href="http://www.lvmama.com/lvyou/guide/2015-1208-199837.html"
				rel="nofollow">查看更多</a>
			</span>
		</p>
		<!-- // 友情链接 -->
		<!-- 热门精选 -->

		<!-- <script
			src="http://pic.lvmama.com/min/index.php?f=/js/new_v/jquery-1.7.2.min.js,
			/js/v6/header_new.js,
			/js/channel/ticket/v1/ticket.js"></script> -->
		<!-- http://pic.lvmama.com/min/index.php?f=/js/v5/ibm/eluminate.js,
/js/v5/ibm/coremetrics-initalize.js,
/js/common/losc.js -->
		<script>
			$(function() {
				nearbyCity();
				selectedTopics();
				hotActivity("双十一大促");
				$("#smartShelfUrl").click(
					function() {
						var destUrl = $(".recommend_tab_t").find(
							"li.active").attr("data2");
						var index = $(".recommend_tab_t li").index(
							$(".recommend_tab_t li.active"));
						var subjectid = $(".recommend_tab_l").find(
							"li.active").eq(index).attr("data");
						var cityName = $(".recommend_tab_t").find(
							"li.active").html();
		
					/* 	if (destUrl == "") {
							window.open("http://s.lvmama.com/ticket/T"
								+ subjectid + "?keyword=" + cityName
								+ "#list");
						} else {
							window.open("http://" + destUrl);
						} */
					});
		
				//景点推荐上面的切换
				$(document).on(
					'mouseover',
					'.recommend_tab_t li',
					function(e) {
						var num = $(this).index();
						$(this).addClass('active').siblings().removeClass(
							'active');
						var subjectDiv = $('.recommend_list_content').eq(
							num);
						var destId = $(this).attr("data");
						if (subjectDiv.find('ul').length == 0) {
						}
						subjectDiv.show().siblings(
							'.recommend_list_content').hide();
					});
		
				//景点推荐左侧的切换
				$(document).on(
					'mouseover',
					'.recommend_tab_l li',
					function(e) {
						var num = $(this).index();
						$(this).addClass('active').siblings().removeClass(
							'active');
						var prodUl = $(this).parents('.main_content_l')
							.siblings('.promotion_list').eq(num);
						if (prodUl.find('li').length == 0) {
							var subjectId = $(this).attr("data");
							var destId = $("ul.recommend_tab_t").find(
								"li.active").attr("data");
						}
						prodUl.show().siblings('.promotion_list').hide();
					});
				//查询热门主题
				function selectedTopics() {
					$.ajax({
						url : 'topics',
						type : 'get',
						success : function(data) {
							var str = "";
							for (var i = 0; i < data.length && i < 10; i++) {
								if (i == 0) {
									str += '<li class="subject_js active">' + data[i].type + '<i '
										+ 'class="ticket_icon"></i></li>';
								} else {
									str += '<li class="subject_js">' + data[i].type + '<i '
										+ 'class="ticket_icon"></i></li>';
								}
							}
							$(".recommend_tab_l").append(str);
							str = '';
							for (var i = 0; i < data.length && i < 10; i++) {
								if (i == 0) {
									str += '<ul class="promotion_list clearfix" style="display: block;">'
										+ '</ul>';
								} else {
									str += '<ul class="promotion_list clearfix" style="display: none;">'
										+ '</ul>';
								}
							}
							$(".recommend_list_content").append(str);
							//添加完主题后添加景点
							var titles = $(".recommend_tab_l li");
							var paths = $("#recommend_tab_t li");
							for (var i = 0; i < paths.length; i++) {
								for (var j = 0; j < titles.length; j++) {
									findScenic(titles.eq(j).text(), paths.eq(i).text(), j, i)
								}
							}
						}
					});
				}
				;
				//根据主题和地址查询景点
				function findScenic(title, path, titleIndex, pathIndex) {
					$.ajax({
						url : 'findScenic',
						type : 'post',
						data : {
							theme : title,
							scope : path
						},
						success : function(data) {
							//console.log(data);
							var str = '';
							for (var i = 0; i < data.length; i++) {
								str = '<li style="background-color: rgb(204, 232, 207);"><a '
									+ 'href="scenic?id=' + data[i].id + '&pageIndex=' + 0 +'" target="_blank" '
									+ '>'
									+ '<div class="promotion_img_box">'
									+ '<img '
									+ 'src="'+data[i].coverImage+'"'
									+ 'width="222" height="150" alt="">'
									+ '</div>'
									+ '<div class="promotion_footer">'
									+ '<h5 title="'+data[i].scenicname+'">'+data[i].scenicname+'</h5>'
									+ '<span class="promotion_comment_b">'+data[i].praise+'% 好评</span>'
									+ '<p>'
									+ '<span>¥<dfn>'+data[i].floor_price+'</dfn></span>'
									+ '<samp>起</samp>'
									+ '</p>'
									+ '</div>'
									+ '</a></li>';
							}
							$($(".recommend_list_content").children()[titleIndex + 1]).append(str);
						}
					});
				}
				//查询同省的城市
				function nearbyCity() {
					$.ajax({
						url : 'nearbyCity',
						type : 'post',
						data : {
							scope : $(".lv_s_city_btn b").html()
						},
						success : function(data) {
							var str = "";
							for (var i = 0; i < data.length; i++) {
								if (i == 0) {
									str += '<li class="city_js active">' + data[i].city + '</li>';
								} else {
									str += '<li class="city_js">' + data[i].city + '</li>';
								}
							}
							$("#recommend_tab_t").append(str);
							str = '';
							for (var i = 0; i < data.length; i++) {
								str += '<div class="recommend_list_content" style="display: block;">'
									+ '<div class="main_content_l ticket_icon">'
									+ '<ul class="recommend_tab_l">'
									+ '</ul>'
									+ '</div>'
									+ '</div>'
							}
							$("#tuijiandiv").append(str);
							str = '';
							for (var i = 0; i < data.length && i < 4; i++) {
								str += '<a target="_blank" href="scenic?id=' + data[i].id + '&pageIndex=' + 0 +'">' + data[i].city + '</a>'
							}
							$("#top_type_hot_h22_2").append(str);
						}
					});
				}
				//双十一活动
				function hotActivity(value) {
					$.ajax({
						url : 'hot/activity/scenic',
						type : 'post',
						data : {
							activityName : value
						},
						success : function(data) {
							var str = '';
							if (data[0].praise!=0) {
								for (var i = 0; i < data.length && i < 4; i++) {
									str += '<li style="background-color: rgb(204, 232, 207);"><a '
										+ 'href="scenic?id=' + data[i].id + '&pageIndex=' + 0 +'" target="_blank" '
										+ '>'
										+ '<div class="promotion_img_box">'
										+ '<img '
										+ 'src="' + data[i].coverImage + '" '
										+ 'width="222" height="150" alt="">'
										+ '<p class="promotion_comment ticket_icon">' + data[i].praise + '%好评</p>'
										+ '</div>'
										+ '<div class="promotion_footer">'
										+ '<h5 title="' + data[i].scenicname + '">' + data[i].scenicname + '</h5>'
										+ '<span class="btn btn-big btn-orange"'
										+ 'href="scenic?id=' + data[i].id + '&pageIndex=' + 0 +'" target="_blank">抢购</span>'
										+ '<p>'
										+ '<span>¥<dfn>' + data[i].floor_price + '</dfn></span>'
										+ '<samp>起</samp>'
										+ '</p>'
										+ '</div>'
										+ '</a></li>';
								}
								$("#huodongqu").html(str);
							}
						}
					});
				}
				inSeasonHotSale();
				//当季热推
				function inSeasonHotSale() {
					$.ajax({
						url : 'hot/sale/scenic',
						type : 'get',
						data : {
							scope : $(".lv_s_city_btn b").html()
						},
						success : function(data) { 
							var str="";
							if(data[0]!='0'){
								for(var i=0;i<data.length&&i<4;i++){
									str+='<a target="_blank" href="scenic?id=' + data[i].id + '&pageIndex=' + 0 +'">'+data[i].scenicname+'</a>';
								}
								$("#top_type_hot1").append(str);
								str='';
								for(var i=4;i<data.length;i++){
									str+='<a target="_blank" '
										+'href="scenic?id=' + data[i].id + '&pageIndex=' + 0 +'">'+data[i].scenicname+'</a>';
								}
								$("#top_type_list1").append(str);
							}
						}
					});
				}
				hotPath();
				//热销排行
				function hotPath() {
					$.ajax({
						url : 'hot/path/scenic',
						type : 'post',
						data : {
							frompath : $(".lv_s_city_btn b").html()
						},
						success : function(data) {
							str = '';
							for (var i = 0; i < data.length && i < 4; i++) {
								str += '<a href="scenic?id=' + data[i].id + '&pageIndex=' + 0 +'" target="_blank" title="' + data[i].scenicname + '"><span '
									+ 'class="hot_num' + (i + 1) + '">' + (i + 1) + '</span>' + data[i].scenicname + '</a>';
							}
							$("#top_type_hot h44 hot_text_hidden").append(str);
							str = '';
							for (var i = 4; i < data.length; i++) {
								str += '<a '
									+ 'href="scenic?id=' + data[i].id + '&pageIndex=' + 0 +'" target="_blank"'
									+ 'title="' + data[i].scenicname + '"><span>' + (i + 1) + '</span>' + data[i].scenicname + '</a>';
							}
							$("#top_type_list2").append(str);
							str = '';
							for (var i = 0; i < data.length && i < 3; i++) {
								str += '<a href="scenic?id=' + data[i].id + '&pageIndex=' + 0 +'" target="_blank" '
									+ 'title="' + data[i].scenicname + '" '
									+ 'style="background-color: rgb(204, 232, 207);">' + data[i].scenicname + '</a> ';
							}
							$("#js_s_input_hot").append(str);
							str = '';
							for (var i = 0; i < data.length && i < 10; i++) {
								str += '<a href="scenic?id=' + data[i].id + '&pageIndex=' + 0 +'" target="_blank">' + data[i].scenicname + '</a>';
							}
							$("#hotdd2").append(str);
						}
					});
				}
				selectedTopics2();
				//精选主题
				function selectedTopics2() {
					$.ajax({
						url : 'topics',
						type : 'get',
						success : function(data) {
							var str = "";
							for (var i = 0; i < data.length && i < 4; i++) {
								str += '<a target="_blank" href="scenic?id=' + data[i].id + '&pageIndex=' + 0 + '">' + data[i].type + '</a>';
								findScenic2(data[i].type);
							}
							$("#top_type_hot_h22").append(str);
						}
					});
				}
				//根据主题和地址查询景点
				function findScenic2(title) {
					$.ajax({
						url : 'findScenic',
						type : 'post',
						data : {
							theme : title,
							scope : $(".lv_s_city_btn b").html()
						},
						success : function(data) {
							 //console.log(data);
							var str = '<dl class="top_type_list2">'
								+ '<dt>'
								+ title
								+ '</dt>';
							for (var i = 0; i < data.length; i++) {
								str += '<dd>'
									+ '<a target="_blank" href="scenic?id=' + data[i].id + '&pageIndex=' + 0 + '">' + data[i].scenicname + '</a>'
									+ '</dd>'
									+ '</dl>';
							}
							$("#dllist").append(str);
						}
					});
				}
				//热搜景点
				queryHotBotScenic();
				function queryHotBotScenic() {
					$.ajax({
						url : 'scenic/queryHotBotScenic',
						type : 'get',
						success : function(data) {
							var str = '';
							for (var i = 0; i < data.data.length; i++) {
								str += '<a href="scenic?id=' + data.data[i].id + '&pageIndex=' + 0 + '">' + data.data[i].scenicname + '</a>';
							}
							$("#hotdd").append(str);
						}
					});
				};
				$("#js_ticket_search").click(function() {
					var value=$(".lv_s_input.js_ticket_input").val();
					if(value.trim()=='请输入目的地、主题或景区名'||value.trim()==''){
						alert("请输入");
					}else{
						location.href='querySce?secenicbody='+value+'&pageIndex=1';
					}
				})
		
			});
		</script>

	</div>
	<div id="right-bottom-tools">
		<a id="goTopBtn" target="_self" href="javascript:;" title="返回顶部"></a><a
			href="http://www.lvmama.com/userCenter/user/transItfeedBack.do"
			target="_blank" id="Feedback" title="意见反馈"></a>
	</div>
	<div class="s_complete_box"
		style="background-color: rgb(204, 232, 207);"></div>

</body>
</html>