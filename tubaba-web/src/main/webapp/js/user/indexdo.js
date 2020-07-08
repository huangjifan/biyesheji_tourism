function grzx(index){
	//获取所有同级节点
	var all=$("#grzx"+index).nextAll();
	all.toggleClass('one');
	if ($("#down"+index).attr("class")=="downarr") {
		$("#down"+index).attr("class","downarr uparr");
	}
	else {
		$("#down"+index).attr("class","downarr");
	}
}
function plusXing(str, frontLen, endLen,cha) {
    var len = str.length - frontLen - endLen;
    var xing = '';
    for (var i = 0; i < len; i++) {
      xing += cha;
    }
    return str.substring(0, frontLen) + xing + str.substring(str.length - endLen);
  };
