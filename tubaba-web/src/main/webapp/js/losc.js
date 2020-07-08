/**
 *鏌ヨurl涓寚瀹氬弬鏁板悕鐨勫€�
 *@parm item 鍙傛暟鐨勫悕瀛�
 */
function QueryString(item){
     var sValue=(location.search+location.hash).match(new RegExp("[\?\&]"+item+"=([^\&]*)(\&?)","i"));
     return sValue?sValue[1]:sValue;
}

/**
 *鑾峰彇Cookie鐨勫€�
 *@parm objName Cookie鐨勫悕瀛�
 */
function getLOSCCookie(objName){   
	var arrStr = document.cookie.split("; "); 
	var temp;
	for(var i = 0,l=arrStr.length;i < l;i++){   
		if(objName=='uid'){
			temp = arrStr[i].replace('=',',').split(",");
		}else{
			temp=arrStr[i].split("=");  
		}
		if(temp[0] == objName) {
			return unescape(temp[1]);
		}
	}
	return '';
}

/**
 *鍐機ookie鐨勫€�
 *@parm objName Cookie鐨勫悕瀛�
 *@parm objValue Cookie鐨勫€�
 *@parm expire Cookie鐨勬湁鏁堝ぉ鏁�
 */
function writeCookie(objName, objValue, expire) {
	//鑾峰彇褰撳墠鏃堕棿
	var now = new Date();
	//灏哾ate璁剧疆涓�30澶╀互鍚庣殑鏃堕棿
	now.setDate(now.getDate() + expire);
	document.cookie = objName + "=" + escape (objValue) + ";path=/;domain=.lvmama.com;expires="+now.toGMTString();		
}
//杞藉叆涓€涓狫S鑴氭湰
function addScript(url,callback){
	var elt = document.createElement("script");
	elt.src = url;
	elt.anysc = true;
	if(elt.onload==null){
		elt.onload = function(){
			typeof callback=='function'&&callback();
		}
	}else{
		elt.onreadystatechange = function(){
			if(elt.readyState=="loaded" || elt.readyState=="complete"){
				typeof callback=='function'&&callback();
			}
		}
	}
	document.getElementsByTagName("head")[0].appendChild(elt);
}

/**
 * 鑾峰彇LOSC鎵€闇€瑕佺殑鏃ユ湡鏍煎紡(MMdd)
 */
function getLOSCDate(){
	var myDate = new Date();
	var month = myDate.getMonth() + "";
	if (month.length  == 1){
		month = "0" + month;
	}
	var day = myDate.getDate() + "";
	if (day.length == 1) {
		day = "0" + day;
	}
	return month + day;
}

/**
 * 鍒ゆ柇浼犲叆鐨凪Mdd鏄惁鍦ㄦ湁鏁堢殑3涓湀涔嬪唴
 */
function isValidLOSCDate(data) {
	var p1 = /^[0-9]{4}$/;
	if (!p1.test(data)) {
		return false;
	}
	var _month = parseInt(data.substr(0,2), 10);
	var _day = parseInt(data.substr(2,2), 10);
    
	var month = new Date().getMonth();
	var day = new Date().getDate();
    
	if (month - _month < 0) {
		month = month + 12;
	}   
	//alert("褰撳墠鏈堜唤鏄�" + month);
	//alert("鑾峰彇鏈堜唤鏄�" + _month);

	if (month - _month >= 0 && month - _month < 3) {
		return true;
	}
	if (month - _month >= 4) {
		return false;
	}
	if (month - _month == 3) {
		return day - _day <= 0;
	}
	return false;
}

/**
 * 鏇存柊绔欏唴璁㈠崟娓犻亾
 * @param value 闇€瑕佹柊澧炵殑绔欏唴娓犻亾
 */
function updateOrderInnerChannel(value) {
	var p1 = /^[0-9]{6}$/;
	if (!p1.test(value)) {
		return;
	}
    
	//榛樿涓虹珯浣嶆笭閬�
	var channelType = "oUC";
	var timeType = "oUT";
	//褰撳瓨鍦╥ct鐨勫弬鏁版椂锛屽垯涓哄唴閮ㄦ笭閬�
	if (QueryString('ict') != undefined) {
		channelType = "oIC";
		timeType = "oIT";
	}

    var currentOrderInnerChannel = getLOSCCookie(channelType);
	var currentOrderChannelTime = getLOSCCookie(timeType);
   
	if (currentOrderInnerChannel == undefined) {
		currentOrderInnerChannel = value;
	} else {
		currentOrderInnerChannel = currentOrderInnerChannel + value;
	}

	if (currentOrderChannelTime == undefined) {
		currentOrderChannelTime = getLOSCDate();
	} else {
		currentOrderChannelTime = currentOrderChannelTime + getLOSCDate();
	}

	//褰揷urrentOrderInnerChannel鐨勮褰曟暟涓巆urrentOrderChannelTime璁板綍鏁颁笉鍖归厤鏃讹紝杩涜鐗靛埗鍖归厤
	for (var i = 0; i < currentOrderInnerChannel.length / 6 - currentOrderChannelTime / 4 ; i++ ) {
		currentOrderChannelTime = currentOrderChannelTime + getLOSCDate();	
	}

	if (currentOrderInnerChannel.length > 24) {
		if (isValidLOSCDate(currentOrderChannelTime.substr(0,4))) {
			//浠庡ご寮€濮嬬殑6涓瓧绗︿唬琛ㄩ娆℃笭閬擄紝涓嶄細琚垹闄�
			//FIFO鍘熷垯浠庣浜屾笭閬擄紝鍗崇7浣嶅紑濮嬪垹闄�
			currentOrderInnerChannel = currentOrderInnerChannel.substr(0,6) + currentOrderInnerChannel.substr(currentOrderInnerChannel.length - 18, 18);
			currentOrderChannelTime = currentOrderChannelTime.substr(0,4) + currentOrderChannelTime.substr(currentOrderChannelTime.length - 12, 12);
		} else {
			currentOrderInnerChannel = currentOrderInnerChannel.substr(6, currentOrderInnerChannel.length - 6);
			currentOrderChannelTime = currentOrderChannelTime.substr(4, currentOrderChannelTime.length - 4);
		}	
	}

	writeCookie(channelType, currentOrderInnerChannel, 30);	
	writeCookie(timeType, currentOrderChannelTime, 30);
}

(function () {
	var length = document.getElementsByTagName('script').length,leng=0;
	for(var i=0;i<length;i++){
		if(/\/losc\.js$/.test(document.getElementsByTagName('script')[i].src)){
			leng=i;
		}
	}

    //<editor-fold desc="Google Analytics">
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-5493172-1', 'auto', {'legacyCookieDomain': 'lvmama.com'});
    ga('send', 'pageview');
    //</editor-fold>

    //<!-- 鍒ゆ柇losc浠ｇ爜寮€濮� -->
	var orderChannel = getLOSCCookie("oUC");
	var orderChannelTime = getLOSCCookie("oUT");
	while (orderChannelTime != undefined && orderChannelTime.substr(0,4) != "" && !isValidLOSCDate(orderChannelTime.substr(0,4))) {
		orderChannel = orderChannel.substr(6, orderChannel.length - 6);
		orderChannelTime = orderChannelTime.substr(4, orderChannelTime.length - 4);
	}
	orderChannel = getLOSCCookie("oIC");
	orderChannelTime = getLOSCCookie("oIT");
	while (orderChannelTime != undefined && orderChannelTime.substr(0,4) != "" && !isValidLOSCDate(orderChannelTime.substr(0,4))) {
		orderChannel = orderChannel.substr(6, orderChannel.length - 6);
		orderChannelTime = orderChannelTime.substr(4, orderChannelTime.length - 4);
	}

	//SEO鐨勬潵婧�
	var seoKeyWords = ["baidu", "google","sogou","soso","youdao","bing","hao123","etao","360","yahoo","haosou","sm","so"];
	//SEO鐨勪唬鐮�
	var seoChannelCode = ["018115", "018116", "018117", "018118","018119", "018128", "018122", "018123","018120","018121","042525","081691","081692"];

	//url涓殑losc鍊�
	var orderFromChannel = QueryString('losc');

	//娌℃湁鎸囧畾娓犻亾鐨勬儏鍐典笅锛岀粺璁eo鐨勬潵婧�
	if (orderFromChannel == undefined || orderFromChannel == null) {
		var ref = document.referrer;
		if (ref != "" && ref.indexOf("losc=") == -1) {
			var re = new RegExp('^(?:f|ht)tp(?:s)?\://([^/?#]+)', 'im');
			ref = ref.match(re)[1];
			for (var i = 0,l=seoKeyWords.length; i < l ; i++) {
				if (ref.indexOf(seoKeyWords[i]) != -1) {
					updateOrderInnerChannel(seoChannelCode[i]);
				}
			}
		}
	}

	//鎵ц瑕嗙洊鎿嶄綔
	if (orderFromChannel != undefined && orderFromChannel != null) {
		updateOrderInnerChannel(orderFromChannel);
	}

	//鐫垮箍鐨勪骇鍝佹帹鑽�
	var pr = QueryString('_pr');
	if (pr != undefined && pr != null) {
		updateOrderInnerChannel(pr);
	}
	//<!-- 鍒ゆ柇losc浠ｇ爜缁撴潫 -->

    })();

//绋嬭緣鎻愪緵鏂扮櫨搴︾粺璁′唬鐮�20150722//	
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?cb09ebb4692b521604e77f4bf0a61013";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
//绋嬭緣鎻愪緵鏂扮櫨搴︾粺璁′唬鐮�20150722 缁撴潫//

//360缃戠洘缁熻浠ｇ爜
var _mvq = window._mvq || []; 
window._mvq = _mvq;
_mvq.push(['$setAccount', 'm-193368-0']);
_mvq.push(['$logConversion']);
(function() {
	var mvl = document.createElement('script');
	mvl.type = 'text/javascript'; mvl.async = true;
	mvl.src = ('https:' == document.location.protocol ? 'https://static-ssl.mediav.com/mvl.js' : 'http://static.mediav.com/mvl.js');
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(mvl, s); 
})();

/*Axis钀ラ攢宸ュ叿浠ｇ爜*/
var _fxcmd=_fxcmd||[];
_fxcmd.sid='5f97534d550a22ed0b9ba7f419383409';
_fxcmd.trackAll=false;
// 鍙傛暟閰嶇疆(鍙€�)...
// 杩借釜閰嶇疆(鍙€�)...
(function () {
	var _pzfx=document['createElement']('script');
	_pzfx.type='text/javascript';
	_pzfx.async=true;
	_pzfx.src='//static.w3t.cn/fx/1/1/fx.js';
	var sc=document.getElementsByTagName('script')[0];
	sc.parentNode.insertBefore(_pzfx,sc);
})();

//region 鐧惧害鎺ㄩ€佷唬鐮�
(function(){
	var bp = document.createElement('script');
	var curProtocol = window.location.protocol.split(':')[0];
	if (curProtocol === 'https') {
		bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
	}
	else {
		bp.src = 'http://push.zhanzhang.baidu.com/push.js';
	}
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(bp, s);
})();
//endregion